//
//  InterstitialStory.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/28.
//

import SwiftUI
import GoogleMobileAds

extension Interstitial {
    /// ストーリー（冒険）用のインタースティシャル。
    ///
    /// 本編クイズとは別の AdMob ユニットを使う。プレースメントを分けておくと
    /// AdMob 側でそれぞれに最適な単価で配信が最適化される。
    static func story() -> Interstitial {
        Interstitial(adUnitID: "ca-app-pub-4898800212808837/2544453652")
    }
}
