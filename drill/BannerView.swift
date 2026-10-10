//
//  Banner.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/30.
//

import GoogleMobileAds
import SwiftUI

struct BannerAdView: View {
    @ObservedObject private var appState = AppState.shared

    var body: some View {
        if appState.shouldShowAds {
            AdaptiveBannerAdView(
                productionAdUnitID: "ca-app-pub-4898800212808837/2226175914",
                placement: .homeBanner
            )
        }
    }
}

struct BannerStortyView: View {
    @ObservedObject private var appState = AppState.shared

    var body: some View {
        if appState.shouldShowAds {
            AdaptiveBannerAdView(
                productionAdUnitID: "ca-app-pub-4898800212808837/8004927226",
                placement: .storyBanner
            )
        }
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
    let placement: AdPlacement

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
                    placement: placement,
                    width: availableWidth
                ) { newHeight in
                    guard abs(adHeight - newHeight) > 0.5 else { return }
                    adHeight = newHeight
                }
                .frame(width: availableWidth, height: adHeight)
                // 広告クリエイティブがバナーの宣言サイズより大きく描画されることがあり、
                // そのままだと画面外へはみ出すため枠で切り取る。
                .clipped()
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
        // 背景画像が safe area を無視して広がる画面（ダンジョンなど）では、
        // 親から画面幅より大きい幅が提案されることがある。
        // そのまま使うとバナーが画面外へはみ出すため、画面幅で頭打ちにする。
        let maxWidth = UIScreen.main.bounds.width
        let roundedWidth = min(floor(width), maxWidth)
        guard roundedWidth > 0, abs(availableWidth - roundedWidth) > 0.5 else { return }
        availableWidth = roundedWidth
    }
}

private struct AdaptiveBannerContainer: UIViewRepresentable {
    let adUnitID: String
    let placement: AdPlacement
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
        AdTelemetry.record("banner_load_started", placement: placement)
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
        AdTelemetry.record("banner_load_started", placement: placement)
        bannerView.load(AppAdConfiguration.makeRequest())
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(placement: placement)
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
        let placement: AdPlacement
        var loadedWidth: CGFloat = 0

        init(placement: AdPlacement) {
            self.placement = placement
        }

        func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            AdTelemetry.record("banner_loaded", placement: placement)
        }

        func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            AdTelemetry.record("banner_load_failed", placement: placement, error: error)
        }
    }
}
