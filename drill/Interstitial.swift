//
//  Interstitial.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/28.
//

import SwiftUI
import GoogleMobileAds
import UIKit

extension UIApplication {
    var activeInterstitialKeyWindow: UIWindow? {
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }
    }

    func interstitialTopMostViewController(from base: UIViewController? = nil) -> UIViewController? {
        let baseViewController = base ?? activeInterstitialKeyWindow?.rootViewController

        if let presentedViewController = baseViewController?.presentedViewController,
           !presentedViewController.isBeingDismissed {
            return interstitialTopMostViewController(from: presentedViewController)
        }

        if let navigationController = baseViewController as? UINavigationController {
            return interstitialTopMostViewController(from: navigationController.visibleViewController)
        }

        if let tabBarController = baseViewController as? UITabBarController {
            return interstitialTopMostViewController(from: tabBarController.selectedViewController)
        }

        if let splitViewController = baseViewController as? UISplitViewController,
           let visibleViewController = splitViewController.viewControllers.last {
            return interstitialTopMostViewController(from: visibleViewController)
        }

        return baseViewController
    }
}

class Interstitial: NSObject, FullScreenContentDelegate, ObservableObject {
    @Published var interstitialAdLoaded: Bool = false
    @Published var flag: Bool = false
    @Published var wasAdDismissed = false
    @Published private(set) var isPresenting = false

    /// 本番で使う広告ユニット。プレースメントごとに分けると AdMob 側の最適化が効きやすい。
    private let productionAdUnitID: String

    var interstitialAd: InterstitialAd?
    private var isLoadingInterstitial = false
    private var loadCompletions: [((Bool) -> Void)] = []
    private var loadedAt: Date?
    /// AdMob のインタースティシャルは1時間で失効するため、それより手前で読み直す。
    private let maxCacheAge: TimeInterval = 55 * 60

    init(adUnitID: String = "ca-app-pub-4898800212808837/7363748686") {
        self.productionAdUnitID = adUnitID
        super.init()
    }

    private var adUnitID: String {
#if DEBUG
        return AdTestUnitID.interstitial
#else
        return productionAdUnitID
#endif
    }

    private var hasValidInterstitial: Bool {
        guard !isPresenting,
              interstitialAd != nil,
              let loadedAt else {
            return false
        }

        return Date().timeIntervalSince(loadedAt) < maxCacheAge
    }

    func loadInterstitial(completion: ((Bool) -> Void)? = nil) {
        preloadIfNeeded(completion: completion)
    }

    /// クイズ開始時などに先読みしておくためのエントリポイント。
    /// 表示直前にロードすると読み込み待ちで表示機会を落とすため、必ず事前に呼ぶ。
    func preloadIfNeeded(completion: ((Bool) -> Void)? = nil) {
        if hasValidInterstitial {
            interstitialAdLoaded = true
            completion?(true)
            return
        }

        guard !isPresenting else {
            completion?(false)
            return
        }

        if let completion {
            loadCompletions.append(completion)
        }

        guard !isLoadingInterstitial else { return }

        isLoadingInterstitial = true
        interstitialAdLoaded = false
        interstitialAd = nil
        loadedAt = nil

        InterstitialAd.load(with: adUnitID, request: AppAdConfiguration.makeRequest()) { [weak self] ad, error in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoadingInterstitial = false

                if let error {
                    print("loadInterstitial 😭: 読み込みに失敗しました")
                    print("loadInterstitial 広告の読み込みに失敗しました: \(error.localizedDescription)")
                    self.interstitialAdLoaded = false
                    self.interstitialAd = nil
                    self.finishLoad(success: false)
                    return
                }

                print("loadInterstitial 😍: 読み込みに成功しましたああ")
                self.interstitialAdLoaded = true
                self.interstitialAd = ad
                self.loadedAt = Date()
                self.wasAdDismissed = false
                self.interstitialAd?.fullScreenContentDelegate = self
                self.finishLoad(success: true)
            }
        }
    }

    private func finishLoad(success: Bool) {
        let completions = loadCompletions
        loadCompletions.removeAll()
        completions.forEach { $0(success) }
    }

    func presentInterstitial() {
      guard !isPresenting else { return }
      guard let rootViewController = UIApplication.shared.interstitialTopMostViewController(),
            rootViewController.viewIfLoaded?.window != nil else {
        preloadIfNeeded()
        return print("Ad root view controller wasn't ready")
      }
      guard hasValidInterstitial, let fullScreenAd = interstitialAd else {
        preloadIfNeeded()
        return print("Ad wasn't ready")
      }

      isPresenting = true
      interstitialAdLoaded = false
      interstitialAd = nil
      loadedAt = nil
      fullScreenAd.present(from: rootViewController)
    }
    
    func adDidRecordImpression(_ ad: FullScreenPresentingAd) {
      print("\(#function) called")
    }

    func adDidRecordClick(_ ad: FullScreenPresentingAd) {
      print("\(#function) called")
    }
    
    // 失敗通知
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("インタースティシャル広告の表示に失敗しました")
        self.isPresenting = false
        self.interstitialAdLoaded = false
        self.interstitialAd = nil
        self.loadedAt = nil
    }

    // 表示通知
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を表示しました")
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を閉じました")
        self.isPresenting = false
        self.interstitialAdLoaded = false
        self.wasAdDismissed = true
        // 次のクイズに備えて即座に読み直す。
        self.preloadIfNeeded()
    }
}

struct Interstitial1: View {
    @StateObject private var interstitial = Interstitial()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .onAppear {
            interstitial.loadInterstitial { isLoaded in
                guard isLoaded else { return }
                interstitial.presentInterstitial()
            }
        }
    }
}

#Preview {
    Interstitial1()
}
