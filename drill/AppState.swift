//
//  AppState.swift
//  drill
//
//  Created by hashimo ryoya on 2023/10/22.
//

import SwiftUI
import StoreKit

@MainActor
final class AppState: ObservableObject {
    static let shared = AppState()

    @Published var isBannerVisible = true
    @Published var isSubscribed = false

    private var transactionListenerTask: Task<Void, Never>?

    init() {
        transactionListenerTask = observeTransactionUpdates()

        Task {
            await refreshSubscriptionState()
        }
    }

    deinit {
        transactionListenerTask?.cancel()
    }

    func refreshSubscriptionState() async {
        do {
            let subscribed = try await hasActiveSubscription()
            isSubscribed = subscribed
            isBannerVisible = !subscribed
            syncPremiumFlag(isSubscribed: subscribed)
        } catch {
            print("サブスクリプションの確認中にエラー: \(error)")
        }
    }

    func checkCurrentSubscription() async {
        await refreshSubscriptionState()
    }

    func updateSubscriptionState(transaction: StoreKit.Transaction) {
        let isActiveSubscription = transaction.productType == .autoRenewable
            && transaction.revocationDate == nil
            && (transaction.expirationDate ?? .distantFuture) > Date()

        isSubscribed = isActiveSubscription
        isBannerVisible = !isActiveSubscription
        syncPremiumFlag(isSubscribed: isActiveSubscription)
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
        var subscriptionGroupIds: [String] = []

        for await result in Transaction.currentEntitlements {
            let transaction = try checkVerified(result)
            guard let groupId = transaction.subscriptionGroupID else { continue }
            subscriptionGroupIds.append(groupId)
        }

        for groupId in subscriptionGroupIds {
            let renewalStates = try await getSubscriptionRenewalState(groupID: groupId)
            for state in renewalStates {
                switch state {
                case .subscribed, .inGracePeriod:
                    return true
                default:
                    break
                }
            }
        }

        return false
    }

    private func syncPremiumFlag(isSubscribed: Bool) {
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
}

@MainActor
final class SubscriptionViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isPrivilegeEnabled = false
    @Published var isLoadingProducts = false
    @Published var productLoadErrorMessage: String?

    let authManager = AuthManager.shared

    let productIdList = [
        "drill_premium_weekly_480",
        "drill_premium_monthly_980",
        "drill_premium_yearly_9800"
    ]

    func loadProducts() async {
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
                let unit1 = product1.subscription?.subscriptionPeriod.unit
                let unit2 = product2.subscription?.subscriptionPeriod.unit

                let priority1 = order[unit1 ?? .day] ?? Int.max
                let priority2 = order[unit2 ?? .day] ?? Int.max

                return priority1 < priority2
            }

            products = sortedProducts

            if sortedProducts.isEmpty {
                productLoadErrorMessage = productLoadHelpMessage()
                print("Failed to load products: 商品情報が0件でした ids=\(productIdList)")
            }
        } catch {
            products = []
            productLoadErrorMessage = productLoadHelpMessage(error: error)
            print("Failed to load products: \(error)")
        }

        isLoadingProducts = false
    }

    func enablePrivilege(productId: String) {
        isPrivilegeEnabled = true
        print("Privilege enabled: \(productId)")
    }

    func disablePrivilege() {
        isPrivilegeEnabled = false
        print("Privilege disabled")
    }

    func purchaseProduct(_ product: Product, showAlert: Binding<Bool>) async throws {
        let transaction = try await purchase(product: product)

        if let userId = authManager.currentUserId {
            authManager.updatePreFlag(userId: userId, userPreFlag: 1) { _ in }
        }

        await AppState.shared.refreshSubscriptionState()
        await transaction.finish()
        showAlert.wrappedValue = true

        print("購入が完了しました: \(transaction)")
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

func purchase(product: Product) async throws -> StoreKit.Transaction {
    let purchaseResult: Product.PurchaseResult

    do {
        purchaseResult = try await product.purchase()
    } catch Product.PurchaseError.productUnavailable {
        throw SubscribeError.productUnavailable
    } catch Product.PurchaseError.purchaseNotAllowed {
        throw SubscribeError.purchaseNotAllowed
    } catch {
        throw SubscribeError.otherError
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

func observeTransactionUpdates() -> Task<Void, Never> {
    Task(priority: .background) {
        for await verificationResult in Transaction.updates {
            guard case .verified(let transaction) = verificationResult else {
                continue
            }

            switch transaction.productType {
            case .consumable:
                guard await fulfillCoinPurchase(transaction) else { continue }
                await transaction.finish()
            case .autoRenewable:
                await AppState.shared.refreshSubscriptionState()
                await transaction.finish()
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
