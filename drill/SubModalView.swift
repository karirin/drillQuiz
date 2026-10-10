//
//  SubModalView.swift
//  drill
//
//  Created by Apple on 2024/02/26.
//

import SwiftUI
import StoreKit

struct SubModalView: View {
    @Binding var isSoundOn: Bool
    @Binding var isPresented: Bool
    @Binding var isPresenting: Bool
    @ObservedObject var audioManager: AudioManager
    @Binding var showHomeModal: Bool
    var pauseTimer: () -> Void
    var resumeTimer: () -> Void
    @Binding var userFlag: Int

    @StateObject private var viewModel = SubscriptionViewModel()
    @State private var selectedProduct: Product?
    @State private var animateGlow = false

    private let benefits: [(icon: String, title: String, color: Color)] = [
        ("rectangle.badge.xmark.fill", "広告がすべて非表示", Color(hex: "FF5E62")),
        ("arrow.counterclockwise.circle.fill", "まちがえた問題を復習", Color(hex: "A56BFF")),
        ("chart.bar.fill", "成績をグラフで確認", Color(hex: "3D9BFF")),
        ("person.2.fill", "フレンド上限が30人に", Color(hex: "2FC28A"))
    ]

    var body: some View {
        ZStack {
            Color.black.opacity(0.72)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                header

                VStack(spacing: 8) {
                    ForEach(benefits, id: \.title) { benefit in
                        benefitRow(icon: benefit.icon, text: benefit.title, color: benefit.color)
                    }
                }

                planArea

                trustRow

                HStack(spacing: 10) {
                    Button("購入を復元") {
                        restorePurchases()
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.75))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Capsule().fill(Color.white.opacity(0.12)))

                    Spacer()

                    Button("閉じる") {
                        dismiss()
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().fill(Color.white.opacity(0.08)))
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [PremiumPalette.backdropTop, PremiumPalette.backdropMid, PremiumPalette.backdropBottom],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(PremiumPalette.gold.opacity(0.35), lineWidth: 1.2)
            )
            .shadow(color: Color(hex: "FFC83D").opacity(0.18), radius: 20, x: 0, y: 8)
            .padding(.horizontal, 20)
            .alert(item: $viewModel.notice) { notice in
                Alert(
                    title: Text(notice.title),
                    message: Text(notice.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .onAppear {
            pauseTimer()

            if userFlag == 0 {
                isSoundOn = true
            } else {
                isSoundOn = false
            }

            withAnimation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) {
                animateGlow = true
            }

            loadProducts()
        }
    }

    // MARK: - Sections

    private var header: some View {
        VStack(spacing: 8) {
            HStack(spacing: 5) {
                Image(systemName: "crown.fill")
                    .font(.system(size: 11))
                Text("プレミアムプラン")
                    .font(.system(size: 12, weight: .black))
            }
            .foregroundColor(PremiumPalette.ink)
            .padding(.horizontal, 12)
            .padding(.vertical, 5)
            .background(Capsule().fill(PremiumPalette.goldGradient))

            Text("広告なしで、学習に集中しよう")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            Text("復習・グラフなど、学習を支える機能もまとめて使えます。")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white.opacity(0.72))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    @ViewBuilder
    private var planArea: some View {
        if viewModel.isLoadingProducts && viewModel.products.isEmpty {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding(.vertical, 20)
        } else if !viewModel.products.isEmpty {
            VStack(spacing: 9) {
                ForEach(viewModel.products, id: \.id) { product in
                    compactPlanButton(for: product)
                }

                Text("タップするとApp Storeの購入画面が開きます・いつでも解約OK")
                    .font(.system(size: 10))
                    .foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 2)
            }
        } else {
            VStack(spacing: 12) {
                Text(viewModel.productLoadErrorMessage ?? "商品情報を取得できませんでした。")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white.opacity(0.78))
                    .multilineTextAlignment(.center)

                Button("再読み込み") {
                    loadProducts()
                }
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(PremiumPalette.ink)
                .padding(.horizontal, 18)
                .padding(.vertical, 10)
                .background(Capsule().fill(Color.white))
            }
            .padding(.vertical, 10)
        }
    }

    private var trustRow: some View {
        HStack(spacing: 6) {
            trustChip(icon: "checkmark.shield.fill", text: "いつでも解約OK")
            trustChip(icon: "applelogo", text: "App Store決済")
        }
    }

    private func trustChip(icon: String, text: String) -> some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 9, weight: .bold))
            Text(text)
                .font(.system(size: 10, weight: .bold))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .foregroundColor(.white.opacity(0.75))
        .padding(.horizontal, 9)
        .padding(.vertical, 6)
        .background(Capsule().fill(Color.white.opacity(0.09)))
    }

    private func benefitRow(icon: String, text: String, color: Color) -> some View {
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 9, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [color.opacity(0.95), color.opacity(0.55)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 30, height: 30)

                Image(systemName: icon)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }

            Text(text)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 15))
                .foregroundColor(PremiumPalette.gold)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.07))
        )
    }

    private func compactPlanButton(for product: Product) -> some View {
        let isRecommended = premiumPeriodUnit(for: product) == .month
        let metadata = planMetadata(for: product)

        return Button(action: {
            generateHapticFeedback()
            selectedProduct = product
            purchaseSelectedProduct(product)
        }) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 5) {
                        Text(metadata.title)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)

                        if let badge = metadata.badge {
                            Text(badge)
                                .font(.system(size: 9, weight: .black))
                                .foregroundColor(PremiumPalette.ink)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Capsule().fill(PremiumPalette.goldGradient))
                        }
                    }

                    Text(metadata.caption)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.65))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(metadata.price)
                    .font(.system(size: 19, weight: .black))
                    .foregroundColor(isRecommended ? PremiumPalette.ink : .white)
                    .fixedSize()
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 13)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(
                        isRecommended
                            ? AnyShapeStyle(PremiumPalette.goldGradient)
                            : AnyShapeStyle(Color.white.opacity(0.08))
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(
                        isRecommended ? Color.white.opacity(0.5) : Color.white.opacity(0.14),
                        lineWidth: 1
                    )
            )
            .shadow(
                color: isRecommended ? Color(hex: "FFB020").opacity(animateGlow ? 0.5 : 0.25) : .clear,
                radius: isRecommended ? (animateGlow ? 14 : 8) : 0,
                x: 0,
                y: 4
            )
        }
        .buttonStyle(.plain)
        .disabled(viewModel.isProcessing)
        .opacity(viewModel.isProcessing ? 0.6 : 1)
    }

    // MARK: - Helpers

    private func planMetadata(for product: Product) -> (title: String, caption: String, price: String, badge: String?) {
        let weekly = viewModel.products.first { premiumPeriodUnit(for: $0) == .week }
        let monthly = viewModel.products.first { premiumPeriodUnit(for: $0) == .month }

        switch premiumPeriodUnit(for: product) {
        case .week:
            return ("週間プラン", "まずは1週間おためし", product.displayPrice, nil)
        case .month:
            if let trial = viewModel.freeTrialText(for: product) {
                return (
                    "月額プラン",
                    "\(trial)・その後\(product.displayPrice)/月",
                    product.displayPrice,
                    "無料体験"
                )
            }
            if let percent = discountPercent(for: product, comparedTo: weekly) {
                return ("月額プラン", "週間プランより約\(percent)%お得", product.displayPrice, "人気")
            }
            return ("月額プラン", "毎月自動更新でずっと快適", product.displayPrice, "人気")
        case .year:
            if let trial = viewModel.freeTrialText(for: product) {
                return (
                    "年額プラン",
                    "\(trial)・その後\(product.displayPrice)/年",
                    product.displayPrice,
                    "無料体験"
                )
            }
            let caption: String
            if let monthlyEq = monthlyEquivalent(for: product) {
                caption = "月あたり約\(Decimal(monthlyEq).formatted(product.priceFormatStyle))"
            } else {
                caption = "1年分をまとめてお得に"
            }
            if let percent = discountPercent(for: product, comparedTo: monthly) {
                return ("年額プラン", caption, product.displayPrice, "\(percent)%お得")
            }
            return ("年額プラン", caption, product.displayPrice, "最もお得")
        default:
            return (product.displayName, "プレミアムプラン", product.displayPrice, nil)
        }
    }

    private func monthlyEquivalent(for product: Product) -> Double? {
        guard let unit = premiumPeriodUnit(for: product) else { return nil }
        let price = NSDecimalNumber(decimal: product.price).doubleValue
        let count = Double(premiumPeriodValue(for: product))

        switch unit {
        case .day: return price * 30.0 / count
        case .week: return price * 52.0 / 12.0 / count
        case .month: return price / count
        case .year: return price / (12.0 * count)
        default: return nil
        }
    }

    private func discountPercent(for product: Product, comparedTo base: Product?) -> Int? {
        guard let base,
              let target = monthlyEquivalent(for: product),
              let baseline = monthlyEquivalent(for: base),
              baseline > 0,
              target < baseline else { return nil }

        let percent = Int(((baseline - target) / baseline * 100).rounded())
        return percent > 0 ? percent : nil
    }

    private func purchaseSelectedProduct(_ product: Product) {
        Task { @MainActor in
            await viewModel.purchaseProduct(product, source: "quiz_pause_modal")
        }
    }

    private func restorePurchases() {
        Task {
            await viewModel.restorePurchases(source: "quiz_pause_modal")
        }
    }

    private func loadProducts() {
        Task {
            await viewModel.loadProducts()
            await MainActor.run {
                syncSelectedProduct()
            }
        }
    }

    private func syncSelectedProduct() {
        guard !viewModel.products.isEmpty else {
            selectedProduct = nil
            return
        }

        if let selectedProduct,
           viewModel.products.contains(where: { $0.id == selectedProduct.id }) {
            return
        }

        selectedProduct = viewModel.products.first(where: {
            premiumPeriodUnit(for: $0) == .month
        }) ?? viewModel.products.first
    }

    private var selectedFreeTrialText: String? {
        guard let selectedProduct else { return nil }
        return viewModel.freeTrialText(for: selectedProduct)
    }

    private func dismiss() {
        generateHapticFeedback()
        isPresented = false
        resumeTimer()
        audioManager.playCancelSound()
    }
}
