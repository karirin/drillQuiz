//
//  Interstitial.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/28.
//

import SwiftUI
import GoogleMobileAds
import UIKit

class InterstitialStory: NSObject, FullScreenContentDelegate, ObservableObject {
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
        InterstitialAd.load(with: "ca-app-pub-4898800212808837/2544453652", request: AppAdConfiguration.makeRequest()) { (ad, error) in
        DispatchQueue.main.async {
            self.isLoadingInterstitial = false

            if let error {
              print("loadInterstitial 😭: 読み込みに失敗しました　ストーリー")
              print("loadInterstitial 広告の読み込みに失敗しました　ストーリー: \(error.localizedDescription)")
              self.interstitialAdLoaded = false
              self.interstitialAd = nil
              self.finishLoad(success: false)
              return
            }
            print("loadInterstitial 😍: 読み込みに成功しましたああ　ストーリー")
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
        return print("Ad root view controller wasn't ready　ストーリー")
      }
      guard let fullScreenAd = interstitialAd else {
        loadInterstitial()
        return print("Ad wasn't ready　ストーリー")
      }

      isPresenting = true
      interstitialAdLoaded = false
      interstitialAd = nil
      fullScreenAd.present(from: rootViewController)
    }
    
    func adDidRecordImpression(_ ad: FullScreenPresentingAd) {
      print("\(#function) called　ストーリー")
    }

    func adDidRecordClick(_ ad: FullScreenPresentingAd) {
      print("\(#function) called　ストーリー")
    }
    
    // 失敗通知
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("インタースティシャル広告の表示に失敗しました　ストーリー")
        self.isPresenting = false
        self.interstitialAdLoaded = false
        self.interstitialAd = nil
    }

    // 表示通知
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を表示しました　ストーリー")
//        self.interstitialAdLoaded = false // 広告表示時に false に設定
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("インタースティシャル広告を閉じました　ストーリー")
        self.isPresenting = false
        self.interstitialAdLoaded = false // 広告閉じた時に false に設定
        self.wasAdDismissed = true
    }
}

struct Interstitial1Story: View {
    @StateObject private var interstitial = InterstitialStory()
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
    Interstitial1Story()
}
