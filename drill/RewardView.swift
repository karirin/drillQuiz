//
//  RewardView.swift
//  it
//
//  Created by hashimo ryoya on 2023/10/30.
//

import SwiftUI
import GoogleMobileAds
import UIKit

private extension UIApplication {
    var activeKeyWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }
    }

    func topMostViewController(from base: UIViewController? = nil) -> UIViewController? {
        let base = base ?? activeKeyWindow?.rootViewController

        if let navigationController = base as? UINavigationController {
            return topMostViewController(from: navigationController.visibleViewController)
        }

        if let tabBarController = base as? UITabBarController {
            return topMostViewController(from: tabBarController.selectedViewController)
        }

        if let presentedViewController = base?.presentedViewController {
            return topMostViewController(from: presentedViewController)
        }

        return base
    }
}

class Reward: NSObject, FullScreenContentDelegate, ObservableObject {
    @Published var rewardLoaded: Bool = false
    @Published var rewardEarned: Bool = false // この行を追加
    @Published var isPresentingReward: Bool = false
    var rewardedAd: RewardedAd?
    private var isLoadingReward = false
    private var loadedAdUnitID: String?
    private var currentAdUnitID = RewardAdUnit.standard
    private var retryAttempt = 0
    private let maxAutomaticRetryCount = 2
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

    override init() {
        super.init()
//        LoadReward() // 初期化時に広告をロード
    }

    // リワード広告の読み込み
    func LoadReward() {
        loadReward(adUnitID: RewardAdUnit.standard)
    }
    
    func LoadStoryReward() {
        loadReward(adUnitID: RewardAdUnit.story)
    }

    private func loadReward(adUnitID: String) {
        if rewardedAd != nil, loadedAdUnitID == adUnitID { return }
        guard !isLoadingReward, !isPresentingReward else { return }

        currentAdUnitID = adUnitID
        rewardLoaded = false
        rewardedAd = nil
        loadedAdUnitID = nil
        isLoadingReward = true
        RewardedAd.load(with: adUnitID, request: AppAdConfiguration.makeRequest()) { ad, error in
            DispatchQueue.main.async {
                self.isLoadingReward = false

                if let error {
                    print("リワード広告の読み込みに失敗しました: \(error.localizedDescription)")
                    self.rewardLoaded = false
                    self.rewardedAd = nil
                    self.loadedAdUnitID = nil
                    self.scheduleRetry(adUnitID: adUnitID)
                    return
                }

                print("リワード広告の読み込みに成功しました")
                self.retryAttempt = 0
                self.rewardLoaded = true
                self.rewardedAd = ad
                self.loadedAdUnitID = adUnitID
                self.rewardedAd?.fullScreenContentDelegate = self
            }
        }
    }

    /// 一時的な失敗で「読み込み中...」のまま固まらないように、数回だけ自動で読み直す。
    private func scheduleRetry(adUnitID: String) {
        guard retryAttempt < maxAutomaticRetryCount else { return }
        retryAttempt += 1

        let delay = TimeInterval(5 * (1 << (retryAttempt - 1)))
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self, self.rewardedAd == nil, !self.isPresentingReward else { return }
            self.loadReward(adUnitID: adUnitID)
        }
    }

    private func presentLoadedReward(onEarned: @escaping () -> Void) {
        guard !isPresentingReward else { return }
        guard let root = UIApplication.shared.topMostViewController(), let ad = rewardedAd else {
            print("広告の準備ができていませんでした")
            loadReward(adUnitID: currentAdUnitID)
            return
        }

        isPresentingReward = true
        retryAttempt = 0
        rewardLoaded = false
        rewardedAd = nil
        loadedAdUnitID = nil
        ad.present(from: root, userDidEarnRewardHandler: onEarned)
    }

    // リワード広告の表示
    func ShowReward() {
        presentLoadedReward {
            print("報酬を獲得しました")
            self.authManager.addMoney(amount: 300) { success in
                self.rewardEarned = success
            }
        }
    }
    
    func ShowSutaminaReward() {
        presentLoadedReward {
            print("報酬を獲得しました")
            self.viewModel.recoverStamina(by: 30) { success in
                self.rewardEarned = success
            }
        }
    }
    
    // リワード広告の表示
    func ExAndMoReward() {
        presentLoadedReward {
            print("ExAndMoReward 報酬を獲得しました")
            self.authManager.activateOneHourBoost { success in
                self.rewardEarned = success
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
        print("広告が閉じられました。新しい広告をロードします。")
        isPresentingReward = false
        self.rewardLoaded = false // 必要に応じて、UIの更新をトリガする
        loadReward(adUnitID: currentAdUnitID)
    }

    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("リワード広告の表示に失敗しました: \(error.localizedDescription)")
        isPresentingReward = false
        rewardLoaded = false
        rewardedAd = nil
        loadedAdUnitID = nil
        loadReward(adUnitID: currentAdUnitID)
    }
}

struct RewardView: View {
    @StateObject var reward = Reward()
    var body: some View {
        Button(action: {
                                generateHapticFeedback()
            generateHapticFeedback()
            reward.ShowReward()
        }) {
            Text(reward.rewardLoaded ? "リワード広告表示" : "読み込み中...")
        }
        .onAppear() {
            reward.LoadReward()
        }
        .disabled(!reward.rewardLoaded)
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
final class QuizResultRewardAd: NSObject, FullScreenContentDelegate, ObservableObject {
    @Published private(set) var isLoaded = false
    @Published private(set) var isLoading = false
    @Published private(set) var isPresenting = false
    @Published private(set) var loadFailed = false

    private var rewardedAd: RewardedAd?
    private var didEarnCurrentReward = false

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
        guard rewardedAd == nil, !isLoading, !isPresenting else { return }

        isLoading = true
        loadFailed = false

        RewardedAd.load(with: adUnitID, request: AppAdConfiguration.makeRequest()) { [weak self] ad, error in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false

                guard let ad, error == nil else {
                    print("QuizResultRewardAd 😭: 読み込みに失敗しました: \(error?.localizedDescription ?? "unknown")")
                    self.isLoaded = false
                    self.loadFailed = true
                    return
                }

                print("QuizResultRewardAd 😍: 読み込みに成功しました")
                self.rewardedAd = ad
                self.rewardedAd?.fullScreenContentDelegate = self
                self.isLoaded = true
            }
        }
    }

    @discardableResult
    func present(onReward: @escaping () -> Void) -> Bool {
        guard !isPresenting,
              let rewardedAd,
              let root = UIApplication.shared.topMostViewController() else {
            preloadIfNeeded()
            return false
        }

        isPresenting = true
        isLoaded = false
        didEarnCurrentReward = false

        rewardedAd.present(from: root) { [weak self] in
            guard let self, !self.didEarnCurrentReward else { return }

            self.didEarnCurrentReward = true
            onReward()
        }

        return true
    }

    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("QuizResultRewardAd 😭: 表示に失敗しました: \(error.localizedDescription)")
        isPresenting = false
        isLoaded = false
        rewardedAd = nil
        preloadIfNeeded()
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        let shouldReload = !didEarnCurrentReward
        isPresenting = false
        isLoaded = false
        rewardedAd = nil

        if shouldReload {
            preloadIfNeeded()
        }
    }
}
