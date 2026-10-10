//
//  AppState.swift
//  drill
//
//  Created by hashimo ryoya on 2023/10/22.
//

import SwiftUI
import StoreKit
import FirebaseAnalytics

enum SubscriptionRuntime {
    static var isTesting: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.arguments.contains("-StoryAdventurePreview")
            || ProcessInfo.processInfo.arguments.contains("-WeaknessReviewPreview")
            || NSClassFromString("XCTestCase") != nil
            || ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        #else
        return false
        #endif
    }
}

@MainActor
final class SubscriptionEnvironmentContext {
    private(set) var environment = "unknown"
    private(set) var source = "unavailable"
    private var isResolving = false

    func resolve(using lookup: () async throws -> String?) async {
        guard environment == "unknown", !isResolving else { return }
        isResolving = true
        defer { isResolving = false }
        do {
            if let value = try await lookup(), !value.isEmpty {
                environment = value
                source = "app_transaction"
            }
        } catch {
            // Telemetry must not prevent purchases or trigger an authentication prompt.
        }
    }

    func addingContext(to parameters: [String: Any], buildType: String) -> [String: Any] {
        var values = parameters
        if values["environment"] == nil {
            values["environment"] = environment
            values["environment_source"] = source
        } else {
            // A verified purchase transaction is more specific than the app transaction.
            values["environment_source"] = "transaction"
        }
        values["build_type"] = buildType
        return values
    }
}

@MainActor
enum SubscriptionAnalytics {
    private static let context = SubscriptionEnvironmentContext()

    static func prepareEnvironment() {
        guard !SubscriptionRuntime.isTesting else { return }
        // Do not await this network-capable lookup in the purchase/restore path.
        Task {
            await context.resolve {
                guard case .verified(let transaction) = try await AppTransaction.shared else { return nil }
                return transaction.environment.rawValue
            }
        }
    }

    static func log(_ name: String, parameters: [String: Any]) {
        guard !SubscriptionRuntime.isTesting else { return }
        #if DEBUG
        let buildType = "debug"
        #else
        let buildType = "release"
        #endif
        let values = context.addingContext(to: parameters, buildType: buildType)
        Analytics.logEvent(name, parameters: values)
    }
}

@MainActor
final class AppState: ObservableObject {
    static let shared = AppState()

    @Published private(set) var isSubscribed = false
    @Published private(set) var hasResolvedSubscription = false

    // An unresolved entitlement is not evidence that the customer is on the free plan.
    var shouldShowAds: Bool { hasResolvedSubscription && !isSubscribed }
    var isBannerVisible: Bool { shouldShowAds }

    private var transactionListenerTask: Task<Void, Never>?
    private let premiumSync: ((Bool) -> Void)?
    private let transactionDefaults: UserDefaults
    private let subscriptionStatusProvider: (() async throws -> Bool)?
    private var entitlementRevision = 0

    init(startAutomatically: Bool = !SubscriptionRuntime.isTesting,
         premiumSync: ((Bool) -> Void)? = nil,
         transactionDefaults: UserDefaults = .standard,
         subscriptionStatusProvider: (() async throws -> Bool)? = nil) {
        self.premiumSync = premiumSync
        self.transactionDefaults = transactionDefaults
        self.subscriptionStatusProvider = subscriptionStatusProvider
        if startAutomatically {
            SubscriptionAnalytics.prepareEnvironment()
            startTransactionListener()
            Task { await refreshSubscriptionState() }
        }
    }

    func startTransactionListener() {
        guard transactionListenerTask == nil else { return }
        transactionListenerTask = observeTransactionUpdates { [weak self] transaction in
            guard let self else { return }
            if self.isActivePurchase(transaction) {
                await self.completeSubscriptionPurchase(transaction, source: "transaction_update")
            } else {
                await self.refreshSubscriptionState()
                await transaction.finish()
            }
        }
    }

    deinit {
        transactionListenerTask?.cancel()
    }

    @discardableResult
    func refreshSubscriptionState() async -> Bool? {
        entitlementRevision += 1
        let revision = entitlementRevision
        do {
            let subscribed: Bool
            if let subscriptionStatusProvider {
                subscribed = try await subscriptionStatusProvider()
            } else {
                subscribed = try await hasActiveSubscription()
            }
            // A purchase or newer refresh may have completed while StoreKit was suspended.
            guard revision == entitlementRevision else { return isSubscribed }
            isSubscribed = subscribed
            hasResolvedSubscription = true
            syncPremiumFlag(isSubscribed: subscribed)
            return subscribed
        } catch {
            print("サブスクリプションの確認中にエラー: \(error)")
            return nil
        }
    }

    func checkCurrentSubscription() async {
        await refreshSubscriptionState()
    }

    func updateSubscriptionState(transaction: StoreKit.Transaction) {
        entitlementRevision += 1
        let isActiveSubscription = isActivePurchase(transaction)

        isSubscribed = isActiveSubscription
        hasResolvedSubscription = true
        syncPremiumFlag(isSubscribed: isActiveSubscription)
    }

    private func isActivePurchase(_ transaction: StoreKit.Transaction) -> Bool {
        transaction.productType == .autoRenewable
            && transaction.revocationDate == nil
            && !transaction.isUpgraded
            && (transaction.expirationDate ?? .distantPast) > Date()
    }

    @discardableResult
    func completeSubscriptionPurchase(_ transaction: StoreKit.Transaction, source: String) async -> Bool {
        // The caller has verified the signed transaction. Do not make unlocking
        // depend on a second subscription-status network request.
        guard isActivePurchase(transaction) else {
            await refreshSubscriptionState()
            await transaction.finish()
            return isSubscribed
        }
        updateSubscriptionState(transaction: transaction)

        let key = "premium.reportedTransaction.\(transaction.environment.rawValue).\(transaction.productID)"
        if transactionDefaults.string(forKey: key) != String(transaction.id) {
            transactionDefaults.set(String(transaction.id), forKey: key)
            var parameters: [String: Any] = [
                "source": source,
                "product_id": transaction.productID,
                "environment": transaction.environment.rawValue
            ]
            if #available(iOS 17.2, *) {
                parameters["offer_type"] = transaction.offer?.type.rawValue ?? 0
                parameters["payment_mode"] = transaction.offer?.paymentMode?.rawValue ?? "none"
            }
            var event = "premium_purchase_success"
            if #available(iOS 17.0, *), transaction.reason == .renewal {
                event = "premium_subscription_renewal"
            }
            SubscriptionAnalytics.log(event, parameters: parameters)
        }
        await transaction.finish()
        return true
    }

    func checkSubscription() {
        Task {
            await refreshSubscriptionState()
        }
    }

    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case let .unverified(_, verificationError):
            throw verificationError
        case let .verified(safe):
            return safe
        }
    }

    func getSubscriptionRenewalState(groupID: String) async throws -> [StoreKit.Product.SubscriptionInfo.RenewalState] {
        var results: [StoreKit.Product.SubscriptionInfo.RenewalState] = []
        let statuses = try await Product.SubscriptionInfo.status(for: groupID)

        for status in statuses {
            guard case .verified = status.renewalInfo,
                  case .verified = status.transaction else {
                continue
            }

            results.append(status.state)
        }

        return results
    }

    func hasActiveSubscription() async throws -> Bool {
        var hasUnverifiedSubscription = false
        for await result in Transaction.currentEntitlements {
            switch result {
            case .verified(let transaction):
                // StoreKit includes both subscribed and billing-grace-period
                // entitlements here, and excludes expired/revoked purchases.
                if transaction.productType == .autoRenewable,
                   transaction.revocationDate == nil, !transaction.isUpgraded {
                    return true
                }
            case .unverified(let transaction, _):
                hasUnverifiedSubscription = hasUnverifiedSubscription || transaction.productType == .autoRenewable
            }
        }
        if hasUnverifiedSubscription { throw SubscribeError.failedVerification }
        return false
    }

    private func syncPremiumFlag(isSubscribed: Bool) {
        if let premiumSync {
            premiumSync(isSubscribed)
            return
        }
        guard !SubscriptionRuntime.isTesting else { return }
        guard let userId = AuthManager.shared.currentUserId else { return }

        AuthManager.shared.updatePreFlag(
            userId: userId,
            userPreFlag: isSubscribed ? 1 : 0
        ) { _ in }
    }
}

enum SubscribeError: LocalizedError {
    case userCancelled
    case pending
    case productUnavailable
    case purchaseNotAllowed
    case failedVerification
    case otherError
    case presentationUnavailable
    case storeKit(Error)

    static func classify(_ error: Error) -> SubscribeError {
        if let error = error as? SubscribeError { return error }
        switch error {
        case Product.PurchaseError.purchaseNotAllowed:
            return .purchaseNotAllowed
        case Product.PurchaseError.productUnavailable, StoreKitError.notAvailableInStorefront:
            return .productUnavailable
        case StoreKitError.userCancelled:
            return .userCancelled
        case let error as SKError where error.code == .paymentCancelled:
            return .userCancelled
        case let error as SKError where error.code == .paymentNotAllowed:
            return .purchaseNotAllowed
        default:
            return .storeKit(error)
        }
    }

    var reasonCode: String {
        switch self {
        case .userCancelled: return "cancelled"
        case .pending: return "pending"
        case .productUnavailable: return "product_unavailable"
        case .purchaseNotAllowed: return "purchase_not_allowed"
        case .failedVerification: return "verification_failed"
        case .presentationUnavailable: return "presentation_unavailable"
        case .otherError: return "unknown"
        case .storeKit(let error):
            if case StoreKitError.networkError = error { return "network_error" }
            if error is URLError { return "network_error" }
            return "storekit_error"
        }
    }

    var diagnosticParameters: [String: Any] {
        var values: [String: Any] = ["error_reason": reasonCode]
        if case .storeKit(let error) = self {
            let underlying: Error
            switch error {
            case StoreKitError.systemError(let nested): underlying = nested
            case StoreKitError.networkError(let nested): underlying = nested
            default: underlying = error
            }
            let nsError = underlying as NSError
            // Keep codes, not error descriptions/userInfo which may contain account data.
            values["error_domain"] = nsError.domain
            values["error_code"] = nsError.code
        }
        return values
    }

    var errorDescription: String? {
        switch self {
        case .userCancelled: return "購入をキャンセルしました。"
        case .pending: return "保護者の承認などを待っています。承認されるとプレミアム機能が有効になります。もう一度購入する必要はありません。"
        case .purchaseNotAllowed: return "この端末ではアプリ内購入が制限されています。保護者の方に確認してください。学校や組織の端末では、管理者の設定により購入できない場合があります。"
        case .productUnavailable: return "このプランは現在購入できません。時間を置いて商品情報を再読み込みしてください。"
        case .failedVerification: return "購入情報を確認できませんでした。再購入せず、時間を置いて「購入を復元」をお試しください。"
        case .presentationUnavailable: return "購入画面を表示できませんでした。アプリを前面に戻してから、もう一度お試しください。"
        case .storeKit where reasonCode == "network_error": return "App Storeに接続できませんでした。通信状態を確認して、もう一度お試しください。"
        default: return "購入を完了できませんでした。時間を置いてお試しください。請求済みの場合は再購入せず「購入を復元」をお試しください。"
        }
    }
}

struct SubscriptionNotice: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

@MainActor
final class SubscriptionViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published private(set) var freeTrialEligibleProductIDs: Set<Product.ID> = []
    @Published var isPrivilegeEnabled = false
    @Published var isLoadingProducts = false
    @Published var productLoadErrorMessage: String?
    @Published private(set) var isProcessing = false
    @Published var notice: SubscriptionNotice?
    private let appState: AppState

    init(appState: AppState? = nil) {
        self.appState = appState ?? .shared
    }

    let productIdList = [
        "drill_premium_weekly_480",
        "drill_premium_monthly_980",
        "drill_premium_yearly_9800"
    ]

    func loadProducts() async {
        guard !isLoadingProducts else { return }
        SubscriptionAnalytics.prepareEnvironment()
        isLoadingProducts = true
        productLoadErrorMessage = nil

        do {
            print("Loading subscription products for IDs: \(productIdList)")
            let fetchedProducts = try await Product.products(for: productIdList)
            let order: [Product.SubscriptionPeriod.Unit: Int] = [
                .week: 0,
                .month: 1,
                .year: 2
            ]

            let sortedProducts = fetchedProducts.sorted { product1, product2 in
                let unit1 = premiumPeriodUnit(for: product1)
                let unit2 = premiumPeriodUnit(for: product2)

                let priority1 = order[unit1 ?? .day] ?? Int.max
                let priority2 = order[unit2 ?? .day] ?? Int.max

                return priority1 < priority2
            }

            products = sortedProducts
            freeTrialEligibleProductIDs = await eligibleFreeTrialProductIDs(in: sortedProducts)
            SubscriptionAnalytics.log("premium_products_loaded", parameters: ["product_count": sortedProducts.count])

            if sortedProducts.isEmpty {
                productLoadErrorMessage = productLoadHelpMessage()
                SubscriptionAnalytics.log("premium_products_failure", parameters: ["error_reason": "empty_products"])
                print("Failed to load products: 商品情報が0件でした ids=\(productIdList)")
            }
        } catch {
            products = []
            freeTrialEligibleProductIDs = []
            productLoadErrorMessage = productLoadHelpMessage(error: error)
            SubscriptionAnalytics.log("premium_products_failure", parameters: SubscribeError.classify(error).diagnosticParameters)
            print("Failed to load products: \(error)")
        }

        isLoadingProducts = false
    }

    func freeTrialText(for product: Product) -> String? {
        guard freeTrialEligibleProductIDs.contains(product.id),
              let offer = product.subscription?.introductoryOffer,
              offer.paymentMode == .freeTrial else {
            return nil
        }

        return "\(offer.period.japaneseDescription)無料体験"
    }

    func renewalText(for product: Product) -> String {
        let period: String
        switch product.subscription?.subscriptionPeriod.unit {
        case .week:
            period = "週"
        case .month:
            period = "月"
        case .year:
            period = "年"
        default:
            period = "期間"
        }

        return "体験終了後は\(product.displayPrice)/\(period)で自動更新・いつでも解約できます"
    }

    private func eligibleFreeTrialProductIDs(in products: [Product]) async -> Set<Product.ID> {
        var result: Set<Product.ID> = []

        for product in products {
            guard let subscription = product.subscription,
                  subscription.introductoryOffer?.paymentMode == .freeTrial,
                  await subscription.isEligibleForIntroOffer else {
                continue
            }

            result.insert(product.id)
        }

        return result
    }

    func enablePrivilege(productId: String) {
        isPrivilegeEnabled = true
        print("Privilege enabled: \(productId)")
    }

    func disablePrivilege() {
        isPrivilegeEnabled = false
        print("Privilege disabled")
    }

    func purchaseProduct(_ product: Product, source: String, scene: UIWindowScene? = nil) async {
        guard !isProcessing else { return }
        SubscriptionAnalytics.prepareEnvironment()
        isProcessing = true
        notice = nil
        defer { isProcessing = false }
        let parameters: [String: Any] = [
            "source": source, "product_id": product.id,
            "can_make_payments": AppStore.canMakePayments ? 1 : 0
        ]
        SubscriptionAnalytics.log("premium_purchase_start", parameters: parameters)
        do {
            let transaction = try await purchase(product: product, scene: scene)
            guard await appState.completeSubscriptionPurchase(transaction, source: source) else {
                throw SubscribeError.failedVerification
            }
            notice = SubscriptionNotice(title: "プレミアムプランが有効になりました", message: "プレミアム機能をご利用いただけます。契約内容はApp Storeのサブスクリプション管理画面で確認できます。")
        } catch {
            let issue = SubscribeError.classify(error)
            let event: String
            switch issue {
            case .userCancelled: event = "premium_purchase_cancel"
            case .pending: event = "premium_purchase_pending"
            default: event = "premium_purchase_failure"
            }
            SubscriptionAnalytics.log(event, parameters: parameters.merging(issue.diagnosticParameters) { _, new in new })
            if case .userCancelled = issue { return }
            let title = issue.reasonCode == "pending" ? "購入の承認待ちです" : "購入を完了できませんでした"
            notice = SubscriptionNotice(title: title, message: issue.localizedDescription)
        }
    }

    func restorePurchases(source: String) async {
        guard !isProcessing else { return }
        SubscriptionAnalytics.prepareEnvironment()
        isProcessing = true
        notice = nil
        defer { isProcessing = false }
        SubscriptionAnalytics.log("premium_restore_start", parameters: ["source": source])
        do {
            try await AppStore.sync()
            guard let active = await appState.refreshSubscriptionState() else {
                throw SubscribeError.failedVerification
            }
            SubscriptionAnalytics.log(active ? "premium_restore_success" : "premium_restore_empty", parameters: ["source": source])
            notice = SubscriptionNotice(
                title: active ? "購入を復元しました" : "有効な契約が見つかりませんでした",
                message: active ? "プレミアム機能をご利用いただけます。" : "購入時と同じApple AccountでApp Storeにサインインしているか確認してください。承認待ちの場合は、承認後に反映されます。"
            )
        } catch {
            let issue = SubscribeError.classify(error)
            SubscriptionAnalytics.log("premium_restore_failure", parameters: ["source": source].merging(issue.diagnosticParameters) { _, new in new })
            notice = SubscriptionNotice(title: "購入を復元できませんでした", message: issue.localizedDescription)
        }
    }

    private func productLoadHelpMessage(error: Error? = nil) -> String {
        #if DEBUG
        let baseMessage = "開発環境で商品を取得できませんでした。Xcode から drill Scheme でアプリを起動し、Edit Scheme > Run > Options > StoreKit Configuration に StoreKit.storekit が設定されているか確認してから再読み込みしてください。ホーム画面から直接起動したアプリではローカル StoreKit は使えません。"
        #else
        let baseMessage = "商品情報を取得できませんでした。時間を置いて再読み込みしてください。"
        #endif

        guard let error else {
            return baseMessage
        }

        #if DEBUG
        let description = error.localizedDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        if description.isEmpty || description == "(null)" {
            return baseMessage
        }

        return "\(baseMessage)\n\(description)"
        #else
        return baseMessage
        #endif
    }
}

private extension Product.SubscriptionPeriod {
    var japaneseDescription: String {
        switch unit {
        case .day:
            return "\(value)日間"
        case .week:
            return "\(value)週間"
        case .month:
            return "\(value)か月間"
        case .year:
            return "\(value)年間"
        @unknown default:
            return "\(value)日間"
        }
    }
}

private func getErrorMessage(error: Error) -> String {
    switch error {
    case SubscribeError.userCancelled:
        return "ユーザーによって購入がキャンセルされました"
    case SubscribeError.pending:
        return "購入が保留されています"
    case SubscribeError.productUnavailable:
        return "指定した商品が無効です"
    case SubscribeError.purchaseNotAllowed:
        return "OSの支払い機能が無効化されています"
    case SubscribeError.failedVerification:
        return "トランザクションデータの署名が不正です"
    default:
        return "不明なエラーが発生しました"
    }
}

func updateSubscriptionStatus() async {
    for await verificationResult in Transaction.currentEntitlements {
        if case .verified(let transaction) = verificationResult,
           transaction.productType == .autoRenewable,
           !transaction.isUpgraded {
            print("Active subscription: \(transaction.productID)")
        }
    }
}

@MainActor
func purchase(product: Product, scene: UIWindowScene? = nil) async throws -> StoreKit.Transaction {
    guard AppStore.canMakePayments else { throw SubscribeError.purchaseNotAllowed }
    let purchaseResult: Product.PurchaseResult

    do {
        if #available(iOS 17.0, *) {
            let foregroundScenes = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .filter { $0.activationState == .foregroundActive }
            // Prefer the scene with the key window, but do not block the purchase
            // when a transient overlay (alert, ad window) momentarily holds key status.
            let activeScene = scene
                ?? foregroundScenes.first { $0.windows.contains(where: \.isKeyWindow) }
                ?? foregroundScenes.first
            guard let activeScene, activeScene.activationState == .foregroundActive else {
                throw SubscribeError.presentationUnavailable
            }
            purchaseResult = try await product.purchase(confirmIn: activeScene)
        } else {
            purchaseResult = try await product.purchase()
        }
    } catch {
        throw SubscribeError.classify(error)
    }

    let verificationResult: VerificationResult<StoreKit.Transaction>

    switch purchaseResult {
    case .success(let result):
        verificationResult = result
    case .userCancelled:
        throw SubscribeError.userCancelled
    case .pending:
        throw SubscribeError.pending
    @unknown default:
        throw SubscribeError.otherError
    }

    switch verificationResult {
    case .verified(let transaction):
        return transaction
    case .unverified:
        throw SubscribeError.failedVerification
    }
}

func observeTransactionUpdates(onSubscription: @escaping @MainActor (StoreKit.Transaction) async -> Void) -> Task<Void, Never> {
    // Not .background: approvals (Ask to Buy), renewals and refunds arrive only here, and a
    // background-QoS listener was observed applying an approval ~27 s late (StoreKit Testing, iOS 18.3).
    Task {
        for await verificationResult in Transaction.updates {
            guard case .verified(let transaction) = verificationResult else {
                continue
            }

            switch transaction.productType {
            case .consumable:
                guard await fulfillCoinPurchase(transaction) else { continue }
                await transaction.finish()
            case .autoRenewable:
                await onSubscription(transaction)
            default:
                await transaction.finish()
            }
        }
    }
}

struct SubscriptionView: View {
    @ObservedObject var audioManager: AudioManager

    var body: some View {
        PreView(audioManager: audioManager)
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView(audioManager: AudioManager())
    }
}
