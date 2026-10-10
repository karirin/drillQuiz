//
//  RewardView.swift
//  it
//
//  Created by hashimo ryoya on 2023/10/30.
//

import SwiftUI
import GoogleMobileAds
import FirebaseAnalytics
import UIKit

enum AdPlacement: String {
    case gacha = "gacha"
    case boost = "boost"
    case stamina = "stamina"
    case quizResult = "quiz_result"
    case storyResult = "story_result"
    case standardInterstitial = "quiz_interstitial"
    case storyInterstitial = "story_interstitial"
    case homeBanner = "home_banner"
    case storyBanner = "story_banner"
    case unknown = "unknown"
}

enum AdTelemetry {
    static func record(_ event: String, placement: AdPlacement, error: Error? = nil, failure: RewardGrantFailure? = nil) {
        guard !SubscriptionRuntime.isTesting else { return }
#if DEBUG
        let buildType = "debug"
#else
        let buildType = "release"
#endif
        var parameters: [String: Any] = [
            "placement": placement.rawValue,
            "build_type": buildType
        ]
        if let failure {
            parameters["failure_reason"] = failure.reason.rawValue
        }
        if let error = (failure?.error ?? error) as NSError? {
            parameters["error_domain"] = error.domain
            parameters["error_code"] = error.code
        }
        Analytics.logEvent(event, parameters: parameters)
    }
}

@MainActor
final class FullScreenAdCoordinator {
    static let shared = FullScreenAdCoordinator()
    private var currentPresentation: UUID?

    func begin() -> UUID? {
        guard currentPresentation == nil else { return nil }
        let token = UUID()
        currentPresentation = token
        return token
    }

    func end(_ token: UUID?) {
        guard let token, currentPresentation == token else { return }
        currentPresentation = nil
    }
}

private extension UIApplication {
    var activeKeyWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .flatMap(\.windows)
            .first { $0.isKeyWindow && !$0.isHidden }
    }

    func topMostViewController(from base: UIViewController? = nil) -> UIViewController? {
        let base = base ?? activeKeyWindow?.rootViewController

        if let presentedViewController = base?.presentedViewController {
            guard !presentedViewController.isBeingDismissed,
                  !(presentedViewController is UIAlertController) else { return nil }
            return topMostViewController(from: presentedViewController)
        }

        if let navigationController = base as? UINavigationController {
            return topMostViewController(from: navigationController.visibleViewController)
        }

        if let tabBarController = base as? UITabBarController {
            return topMostViewController(from: tabBarController.selectedViewController)
        }

        if let splitViewController = base as? UISplitViewController,
           let visibleViewController = splitViewController.viewControllers.last {
            return topMostViewController(from: visibleViewController)
        }

        guard let base, base.viewIfLoaded?.window != nil,
              !base.isBeingDismissed, !base.isBeingPresented else { return nil }
        return base
    }
}

@MainActor
class Reward: NSObject, FullScreenContentDelegate, ObservableObject {
    @Published var rewardLoaded: Bool = false
    @Published var rewardEarned: Bool = false // この行を追加
    @Published var isPresentingReward: Bool = false
    @Published private(set) var rewardLoadFailed = false
    @Published private(set) var rewardGrantFailed = false
    var rewardedAd: RewardedAd?
    private var isLoadingReward = false
    private var loadedAdUnitID: String?
    private var loadedAt: Date?
    private var currentAdUnitID = RewardAdUnit.standard
    private var isScreenActive = false
    private var retryAttempt = 0
    private let maxAutomaticRetryCount = 2
    private let maxCacheAge: TimeInterval = 55 * 60
    private var presentationToken: UUID?
    private var pendingCoinGrantID: String?
    private var pendingCoinUserID: String?
    private let placement: AdPlacement
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var viewModel: PositionViewModel = PositionViewModel.shared

    /// 本番で使うリワードのユニット。DEBUG ではテスト用に差し替える。
    enum RewardAdUnit {
        static var standard: String { resolve("ca-app-pub-4898800212808837/4737585345") }
        static var story: String { resolve("ca-app-pub-4898800212808837/7450393451") }

        private static func resolve(_ productionAdUnitID: String) -> String {
#if DEBUG
            return AdTestUnitID.rewarded
#else
            return productionAdUnitID
#endif
        }
    }

    init(placement: AdPlacement = .unknown) {
        self.placement = placement
        super.init()
//        LoadReward() // 初期化時に広告をロード
    }

    // リワード広告の読み込み
    func LoadReward() {
        isScreenActive = true
        loadReward(adUnitID: RewardAdUnit.standard)
    }
    
    func LoadStoryReward() {
        isScreenActive = true
        loadReward(adUnitID: RewardAdUnit.story)
    }

    func stopPreloading() {
        isScreenActive = false
    }

    func retryLoading() {
        isScreenActive = true
        retryAttempt = 0
        loadReward(adUnitID: currentAdUnitID)
    }

    func retryPendingCoinReward() {
        guard rewardGrantFailed else { return }
        grantPendingCoinReward()
    }

    private var hasValidReward: Bool {
        rewardedAd != nil && loadedAt.map { Date().timeIntervalSince($0) < maxCacheAge } == true
    }

    private func loadReward(adUnitID: String) {
        if hasValidReward, loadedAdUnitID == adUnitID { return }
        guard !isLoadingReward, !isPresentingReward else { return }

        currentAdUnitID = adUnitID
        rewardLoaded = false
        rewardLoadFailed = false
        rewardedAd = nil
        loadedAdUnitID = nil
        loadedAt = nil
        isLoadingReward = true
        AdTelemetry.record("reward_ad_load_started", placement: placement)
        RewardedAd.load(with: adUnitID, request: AppAdConfiguration.makeRequest()) { ad, error in
            DispatchQueue.main.async {
                self.isLoadingReward = false

                guard let ad, error == nil else {
                    AdTelemetry.record("reward_ad_load_failed", placement: self.placement, error: error)
                    self.rewardLoaded = false
                    self.rewardedAd = nil
                    self.loadedAdUnitID = nil
                    self.scheduleRetry(adUnitID: adUnitID)
                    return
                }

                AdTelemetry.record("reward_ad_loaded", placement: self.placement)
                self.retryAttempt = 0
                self.rewardLoaded = true
                self.rewardedAd = ad
                self.loadedAdUnitID = adUnitID
                self.loadedAt = Date()
                self.rewardedAd?.fullScreenContentDelegate = self
            }
        }
    }

    /// 一時的な失敗で「読み込み中...」のまま固まらないように、数回だけ自動で読み直す。
    private func scheduleRetry(adUnitID: String) {
        guard isScreenActive else { return }
        guard retryAttempt < maxAutomaticRetryCount else {
            rewardLoadFailed = true
            return
        }
        retryAttempt += 1

        let delay = TimeInterval(5 * (1 << (retryAttempt - 1)))
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self, self.isScreenActive,
                  self.rewardedAd == nil, !self.isPresentingReward else { return }
            self.loadReward(adUnitID: adUnitID)
        }
    }

    private func presentLoadedReward(onEarned: @escaping () -> Void) {
        AdTelemetry.record("reward_ad_tapped", placement: placement)
        guard !isPresentingReward else { return }
        guard hasValidReward, let ad = rewardedAd else {
            AdTelemetry.record("reward_ad_unavailable", placement: placement)
            loadReward(adUnitID: currentAdUnitID)
            return
        }
        guard let root = UIApplication.shared.topMostViewController(),
              let token = FullScreenAdCoordinator.shared.begin() else {
            AdTelemetry.record("reward_ad_present_blocked", placement: placement)
            return
        }

        presentationToken = token
        isPresentingReward = true
        retryAttempt = 0
        rewardLoaded = false
        rewardedAd = nil
        loadedAdUnitID = nil
        loadedAt = nil
        ad.present(from: root, userDidEarnRewardHandler: onEarned)
    }

    // リワード広告の表示
    func ShowReward() {
        guard pendingCoinGrantID == nil,
              let userID = authManager.currentUserId else { return }
        presentLoadedReward {
            AdTelemetry.record("reward_ad_earned", placement: self.placement)
            self.pendingCoinGrantID = "rewarded-coin-\(UUID().uuidString)"
            self.pendingCoinUserID = userID
            self.grantPendingCoinReward()
        }
    }

    private func grantPendingCoinReward() {
        guard let pendingCoinGrantID, let pendingCoinUserID else { return }
        rewardGrantFailed = false
        AdTelemetry.record("reward_grant_started", placement: placement)
        authManager.grantEarnedAdCoins(idempotencyKey: pendingCoinGrantID, amount: 300, userID: pendingCoinUserID, placement: placement) { success, failure in
            self.rewardEarned = success
            self.rewardGrantFailed = !success
            AdTelemetry.record(success ? "reward_grant_succeeded" : "reward_grant_failed", placement: self.placement, failure: failure)
            if success {
                self.pendingCoinGrantID = nil
                self.pendingCoinUserID = nil
                if self.isScreenActive && !self.isPresentingReward {
                    self.loadReward(adUnitID: self.currentAdUnitID)
                }
            }
        }
    }
    
    func ShowSutaminaReward() {
        presentLoadedReward {
            AdTelemetry.record("reward_ad_earned", placement: self.placement)
            self.viewModel.recoverStamina(by: 30) { success in
                self.rewardEarned = success
                AdTelemetry.record(success ? "reward_grant_succeeded" : "reward_grant_failed", placement: self.placement)
            }
        }
    }
    
    // リワード広告の表示
    func ExAndMoReward() {
        presentLoadedReward {
            AdTelemetry.record("reward_ad_earned", placement: self.placement)
            self.authManager.activateOneHourBoost { success in
                self.rewardEarned = success
                AdTelemetry.record(success ? "reward_grant_succeeded" : "reward_grant_failed", placement: self.placement)
            }
        }
    }
    
    func checkRewardReset() {
        if let rewardDate = UserDefaults.standard.object(forKey: "rewardAcquiredDate") as? Date {
            if Date().timeIntervalSince(rewardDate) >= 3600, let userId = self.authManager.currentUserId {
                self.authManager.updateRewardFlag(userId: userId, userFlag: 1)
            }
        }
    }
    
    func resetupdateRewardFlag() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3600) { // 3600秒（1時間）後
            self.authManager.updateRewardFlag(userId: self.authManager.currentUserId!, userFlag: 1)
            print("💰: Moneyが0にリセットされました")
        }
    }
    
    // 広告が閉じられたときに呼ばれるデリゲートメソッド
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        AdTelemetry.record("reward_ad_dismissed", placement: placement)
        FullScreenAdCoordinator.shared.end(presentationToken)
        presentationToken = nil
        isPresentingReward = false
        rewardLoaded = false
        if isScreenActive && pendingCoinGrantID == nil {
            loadReward(adUnitID: currentAdUnitID)
        } else if !isScreenActive {
            rewardLoadFailed = true
        }
    }

    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        AdTelemetry.record("reward_ad_present_failed", placement: placement, error: error)
        FullScreenAdCoordinator.shared.end(presentationToken)
        presentationToken = nil
        isPresentingReward = false
        rewardLoaded = false
        rewardedAd = nil
        loadedAdUnitID = nil
        loadedAt = nil
        if isScreenActive {
            loadReward(adUnitID: currentAdUnitID)
        } else {
            rewardLoadFailed = true
        }
    }

    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        AdTelemetry.record("reward_ad_presented", placement: placement)
    }
}

struct RewardView: View {
    @StateObject var reward = Reward()
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            if reward.rewardGrantFailed {
                reward.retryPendingCoinReward()
            } else if reward.rewardLoadFailed {
                reward.retryLoading()
            } else {
                reward.ShowReward()
            }
        }) {
            Text(reward.rewardGrantFailed ? "コインの受け取りを再試行" : reward.rewardLoaded ? "リワード広告表示" : reward.rewardLoadFailed ? "広告を再読み込み" : "読み込み中...")
        }
        .onAppear() {
            reward.LoadReward()
        }
        .onDisappear { reward.stopPreloading() }
        .disabled(!reward.rewardLoaded && !reward.rewardLoadFailed && !reward.rewardGrantFailed)
    }
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}

/// クイズ結果画面の「広告を見てコイン2倍」用のリワード広告。
///
/// 結果画面はユーザーの滞在時間が長く、報酬の価値が伝わりやすいので
/// リワード動画（最も単価の高いフォーマット）を置く価値が大きい。
/// 汎用の `Reward` とは別インスタンスにして、インタースティシャルと
/// ロードが競合しないようにしている。
@MainActor
final class QuizResultRewardAd: NSObject, FullScreenContentDelegate, ObservableObject {
    @Published private(set) var isLoaded = false
    @Published private(set) var isLoading = false
    @Published private(set) var isPresenting = false
    @Published private(set) var loadFailed = false

    private var rewardedAd: RewardedAd?
    private var didEarnCurrentReward = false
    private var loadedAt: Date?
    private let maxCacheAge: TimeInterval = 55 * 60
    private var presentationToken: UUID?
    private let placement: AdPlacement

    init(placement: AdPlacement = .quizResult) {
        self.placement = placement
        super.init()
    }

    private var adUnitID: String {
#if DEBUG
        return AdTestUnitID.rewarded
#else
        // TODO: AdMobで結果画面専用のリワードユニットを作成して差し替える。
        // プレースメントを分けると AdMob 側で個別に単価が最適化される。
        return "ca-app-pub-4898800212808837/4737585345"
#endif
    }

    func preloadIfNeeded() {
        guard AppState.shared.shouldShowAds else { return }
        if rewardedAd != nil,
           loadedAt.map({ Date().timeIntervalSince($0) < maxCacheAge }) == true { return }
        guard !isLoading, !isPresenting else { return }

        isLoading = true
        loadFailed = false
        isLoaded = false
        rewardedAd = nil
        loadedAt = nil
        AdTelemetry.record("reward_ad_load_started", placement: placement)

        RewardedAd.load(with: adUnitID, request: AppAdConfiguration.makeRequest()) { [weak self] ad, error in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false

                guard let ad, error == nil else {
                    AdTelemetry.record("reward_ad_load_failed", placement: self.placement, error: error)
                    self.isLoaded = false
                    self.loadFailed = true
                    return
                }

                guard AppState.shared.shouldShowAds else { return }
                AdTelemetry.record("reward_ad_loaded", placement: self.placement)
                self.rewardedAd = ad
                self.rewardedAd?.fullScreenContentDelegate = self
                self.isLoaded = true
                self.loadedAt = Date()
            }
        }
    }

    @discardableResult
    func present(onReward: @escaping () -> Void) -> Bool {
        AdTelemetry.record("reward_ad_tapped", placement: placement)
        guard AppState.shared.shouldShowAds else { return false }
        guard !isPresenting,
              loadedAt.map({ Date().timeIntervalSince($0) < maxCacheAge }) == true,
              let rewardedAd,
              let root = UIApplication.shared.topMostViewController() else {
            AdTelemetry.record("reward_ad_unavailable", placement: placement)
            preloadIfNeeded()
            return false
        }
        guard let token = FullScreenAdCoordinator.shared.begin() else {
            AdTelemetry.record("reward_ad_present_blocked", placement: placement)
            return false
        }

        presentationToken = token
        isPresenting = true
        isLoaded = false
        didEarnCurrentReward = false
        loadedAt = nil

        rewardedAd.present(from: root) { [weak self] in
            guard let self, !self.didEarnCurrentReward else { return }

            self.didEarnCurrentReward = true
            AdTelemetry.record("reward_ad_earned", placement: self.placement)
            onReward()
        }

        return true
    }

    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        AdTelemetry.record("reward_ad_present_failed", placement: placement, error: error)
        FullScreenAdCoordinator.shared.end(presentationToken)
        presentationToken = nil
        isPresenting = false
        isLoaded = false
        rewardedAd = nil
        loadedAt = nil
        preloadIfNeeded()
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        AdTelemetry.record("reward_ad_dismissed", placement: placement)
        FullScreenAdCoordinator.shared.end(presentationToken)
        presentationToken = nil
        let shouldReload = !didEarnCurrentReward
        isPresenting = false
        isLoaded = false
        rewardedAd = nil
        loadedAt = nil

        if shouldReload {
            preloadIfNeeded()
        }
    }

    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        AdTelemetry.record("reward_ad_presented", placement: placement)
    }
}

@MainActor
final class RewardedCoinClaim: ObservableObject {
    enum State: Equatable {
        case ready, granting, failed, granted
    }

    typealias Grant = (_ idempotencyKey: String, _ amount: Int, _ completion: @escaping (Bool, RewardGrantFailure?) -> Void) -> Void

    @Published private(set) var state: State = .ready
    @Published private(set) var amount: Int?
    private let idempotencyKey = "rewarded-coin-\(UUID().uuidString)"
    private let placement: AdPlacement

    init(placement: AdPlacement) {
        self.placement = placement
    }

    func earned(amount: Int, grant: @escaping Grant) {
        guard state == .ready, amount > 0 else { return }
        self.amount = amount
        attemptGrant(grant)
    }

    func retry(grant: @escaping Grant) {
        guard state == .failed, amount != nil else { return }
        attemptGrant(grant)
    }

    private func attemptGrant(_ grant: @escaping Grant) {
        guard let amount else { return }
        state = .granting
        AdTelemetry.record("reward_grant_started", placement: placement)
        grant(idempotencyKey, amount) { [weak self] success, failure in
            DispatchQueue.main.async {
                guard let self else { return }
                self.state = success ? .granted : .failed
                AdTelemetry.record(success ? "reward_grant_succeeded" : "reward_grant_failed", placement: self.placement, failure: failure)
            }
        }
    }
}
