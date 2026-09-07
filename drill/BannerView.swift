//
//  Banner.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/30.
//

import GoogleMobileAds
import SwiftUI

struct BannerAdView: View {
    var body: some View {
        AdaptiveBannerAdView(
            productionAdUnitID: "ca-app-pub-4898800212808837/2226175914",
            placementName: "ホーム"
        )
    }
}

struct BannerStortyView: View {
    var body: some View {
        AdaptiveBannerAdView(
            productionAdUnitID: "ca-app-pub-4898800212808837/8004927226",
            placementName: "ストーリー"
        )
    }
}

/// 画面幅いっぱいのアンカー型アダプティブバナー。
/// 固定 320x50 より単価が高く、SDK 13 系では currentOrientationAnchoredAdaptiveBanner が
/// 非推奨になりこの形式が推奨されている。
private func anchoredAdaptiveAdSize(for width: CGFloat) -> AdSize {
    largeAnchoredAdaptiveBanner(width: width)
}

private struct AdaptiveBannerAdView: View {
    let productionAdUnitID: String
    let placementName: String

    @State private var availableWidth: CGFloat = 0
    @State private var adHeight: CGFloat = 0

    private var adUnitID: String {
#if DEBUG
        return AdTestUnitID.banner
#else
        return productionAdUnitID
#endif
    }

    var body: some View {
        Group {
            if availableWidth > 0 {
                AdaptiveBannerContainer(
                    adUnitID: adUnitID,
                    placementName: placementName,
                    width: availableWidth
                ) { newHeight in
                    guard abs(adHeight - newHeight) > 0.5 else { return }
                    adHeight = newHeight
                }
                .frame(width: availableWidth, height: adHeight)
            } else {
                Color.clear
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: adHeight)
        .background {
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        updateWidth(geometry.size.width)
                    }
                    .onChange(of: geometry.size.width) { newWidth in
                        updateWidth(newWidth)
                    }
            }
        }
    }

    private func updateWidth(_ width: CGFloat) {
        let roundedWidth = floor(width)
        guard roundedWidth > 0, abs(availableWidth - roundedWidth) > 0.5 else { return }
        availableWidth = roundedWidth
    }
}

private struct AdaptiveBannerContainer: UIViewRepresentable {
    let adUnitID: String
    let placementName: String
    let width: CGFloat
    let onHeightChange: (CGFloat) -> Void

    func makeUIView(context: Context) -> BannerView {
        let adSize = anchoredAdaptiveAdSize(for: width)
        let bannerView = BannerView(adSize: adSize)
        bannerView.adUnitID = adUnitID
        bannerView.delegate = context.coordinator
        bannerView.rootViewController = rootViewController()

        context.coordinator.loadedWidth = width
        notifyHeight(for: adSize)
        bannerView.load(AppAdConfiguration.makeRequest())

        return bannerView
    }

    func updateUIView(_ bannerView: BannerView, context: Context) {
        bannerView.rootViewController = rootViewController()

        guard abs(context.coordinator.loadedWidth - width) > 0.5 else { return }

        let adSize = anchoredAdaptiveAdSize(for: width)
        context.coordinator.loadedWidth = width
        bannerView.adSize = adSize
        notifyHeight(for: adSize)
        bannerView.load(AppAdConfiguration.makeRequest())
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(placementName: placementName)
    }

    private func notifyHeight(for adSize: AdSize) {
        let height = cgSize(for: adSize).height
        DispatchQueue.main.async {
            onHeightChange(height)
        }
    }

    private func rootViewController() -> UIViewController? {
        let activeScene = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first { $0.activationState == .foregroundActive }

        let window = activeScene?.windows.first { $0.isKeyWindow }
            ?? activeScene?.windows.first

        return window?.rootViewController
    }

    final class Coordinator: NSObject, BannerViewDelegate {
        let placementName: String
        var loadedWidth: CGFloat = 0

        init(placementName: String) {
            self.placementName = placementName
        }

        func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            print("\(placementName)アダプティブ広告の読み込み成功")
        }

        func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            print("\(placementName)アダプティブ広告の読み込み失敗: \(error.localizedDescription)")
        }
    }
}
