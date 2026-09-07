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
    @Published var isPresenting = false
    
    var interstitialAd: InterstitialAd?
    private var isLoadingInterstitial = false
    private var loadCompletions: [((Bool) -> Void)] = []
    
    func loadInterstitial(completion: ((Bool) -> Void)? = nil) {
        if interstitialAd != nil {
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
//      GADInterstitialAd.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910", request: GADRequest()) { (ad, error) in //テスト
        InterstitialAd.load(with: "ca-app-pub-4898800212808837/7363748686", request: AppAdConfiguration.makeRequest()) { (ad, error) in
        DispatchQueue.main.async {
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
        loadInterstitial()
        return print("Ad root view controller wasn't ready")
      }
      guard let fullScreenAd = interstitialAd else {
        loadInterstitial()
        return print("Ad wasn't ready")
      }

      isPresenting = true
      interstitialAdLoaded = false
      interstitialAd = nil
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
    }

    // 表示通知
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を表示しました")
//        self.interstitialAdLoaded = false // 広告表示時に false に設定
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を閉じました")
        self.isPresenting = false
        self.interstitialAdLoaded = false // 広告閉じた時に false に設定
        self.wasAdDismissed = true
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
