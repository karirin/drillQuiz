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
    @ObservedObject private var appState = AppState.shared
    @State private var showAlert = false
    @State private var selectedProduct: Product?

    var body: some View {
        ZStack {
            Color.black.opacity(0.72)
                .ignoresSafeArea()

            VStack(spacing: 18) {
                HStack {
                    Spacer()
                    Text("プレミアムプラン")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }

                Text("広告なしで学習を進めながら、\nグラフ確認や復習機能も使えるようになります。")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white.opacity(0.84))
                    .multilineTextAlignment(.center)

                VStack(alignment: .leading, spacing: 12) {
                    featureRow(icon: "rectangle.badge.xmark.fill", text: "広告非表示")
                    featureRow(icon: "chart.bar.fill", text: "グラフ機能")
                    featureRow(icon: "arrow.counterclockwise.circle.fill", text: "復習機能")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                if viewModel.isLoadingProducts && viewModel.products.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(.vertical, 20)
                } else if !viewModel.products.isEmpty {
                    VStack(spacing: 10) {
                        ForEach(viewModel.products, id: \.id) { product in
                            compactPlanButton(for: product)
                        }
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
                        .foregroundColor(Color(hex: "2D1F14"))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .clipShape(Capsule())
                    }
                    .padding(.vertical, 10)
                }

                Text("※プレミアムプランはいつでも解約できます")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white.opacity(0.68))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 10) {
                    Button("購入を復元") {
                        Task {
                            do {
                                try await AppStore.sync()
                                await appState.refreshSubscriptionState()
                            } catch {
                                print("購入復元中にエラーが発生しました: \(error)")
                            }
                        }
                    }
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.16))
                    .clipShape(Capsule())

                    Spacer()

                    Button("閉じる") {
                        dismiss()
                    }
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(Color(hex: "2D1F14"))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "FFE082"), Color(hex: "FFB300")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(Capsule())
                }
            }
            .padding(22)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: "1A1A2E"), Color(hex: "16213E")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
            )
            .padding(.horizontal, 24)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("プレミアムプラン登録ありがとうございます！"),
                    message: Text("広告非表示の反映に少しお時間がかかる場合がございます。"),
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

            loadProducts()
        }
    }

    private func featureRow(icon: String, text: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.yellow)

            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
        }
    }

    private func compactPlanButton(for product: Product) -> some View {
        let isSelected = selectedProduct?.id == product.id
        let metadata = planMetadata(for: product)

        return Button(action: {
            generateHapticFeedback()
            selectedProduct = product
            purchaseSelectedProduct(product)
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(metadata.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)

                    Text(metadata.caption)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white.opacity(0.72))
                }

                Spacer()

                Text(metadata.price)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: isSelected
                                ? [Color(hex: "4B3524"), Color(hex: "23170F")]
                                : [Color.white.opacity(0.1), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? Color.yellow.opacity(0.9) : Color.white.opacity(0.12),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
        }
        .buttonStyle(.plain)
    }

    private func planMetadata(for product: Product) -> (title: String, caption: String, price: String) {
        switch product.subscription?.subscriptionPeriod.unit {
        case .week:
            return ("週額プラン", "まずは1週間から", "¥480")
        case .month:
            return ("月額プラン", "定番のおすすめプラン", "¥980")
        case .year:
            return ("年額プラン", "長く使うならいちばんお得", "¥9,800")
        default:
            return (product.displayName, "プレミアムプラン", product.displayPrice)
        }
    }

    private func purchaseSelectedProduct(_ product: Product) {
        Task {
            do {
                try await AppStore.sync()
                try await viewModel.purchaseProduct(product, showAlert: $showAlert)
            } catch SubscribeError.userCancelled {
                print("ユーザーによって購入がキャンセルされました")
            } catch {
                print("購入処理中にエラーが発生しました: \(error)")
            }
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
            $0.subscription?.subscriptionPeriod.unit == .week
        }) ?? viewModel.products.first
    }

    private func dismiss() {
        generateHapticFeedback()
        isPresented = false
        resumeTimer()
        audioManager.playCancelSound()
    }
}
