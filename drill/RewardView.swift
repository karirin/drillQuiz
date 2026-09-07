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
    private var currentAdUnitID = "ca-app-pub-4898800212808837/4737585345"
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var viewModel: PositionViewModel = PositionViewModel.shared

    override init() {
        super.init()
//        LoadReward() // 初期化時に広告をロード
    }

    // リワード広告の読み込み
    func LoadReward() {
        loadReward(adUnitID: "ca-app-pub-4898800212808837/4737585345")
    }
    
    func LoadStoryReward() {
        loadReward(adUnitID: "ca-app-pub-4898800212808837/7450393451")
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
                    return
                }

                print("リワード広告の読み込みに成功しました")
                self.rewardLoaded = true
                self.rewardedAd = ad
                self.loadedAdUnitID = adUnitID
                self.rewardedAd?.fullScreenContentDelegate = self
            }
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
