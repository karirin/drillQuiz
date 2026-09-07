//
//  RootView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/17.
//

import SwiftUI
import StoreKit

struct RootView: View {
    @ObservedObject var authManager: AuthManager
    @AppStorage("hasOptedOutOfStartupPromotion") private var hasOptedOutOfStartupPromotion = false
    @State static private var showExperienceModalPreview = false
    @State private var isUserExists: Bool? = nil
    @State private var hasPresentedStartupPromotion = false
    @State private var showStartupPromotion = false
    @Environment(\.requestReview) var requestReview
    @State private var selectedAvatar: Avatar?
    @State var isActive = false

    var body: some View {
        Group {
            if !isActive {
                SplashScreenView()
            } else if showStartupPromotion {
                StartupPromotionRootOverlay(apps: [.chugakuQuest, .koukouQuest]) { shouldHidePermanently in
                    if shouldHidePermanently {
                        hasOptedOutOfStartupPromotion = true
                    }
                    showStartupPromotion = false
                }
            } else if isUserExists == false || isUserExists == nil {
                TopView()
            } else {
                TopView()
            }
        }
        .onAppear {
            if let userId = authManager.currentUserId {
                authManager.checkIfUserIdExists(userId: userId) { exists in
                    self.isUserExists = exists
                }
            } else {
                self.isUserExists = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .onChange(of: isActive) { active in
            guard active else { return }
            presentStartupPromotionIfNeeded()
        }
    }

    private func presentStartupPromotionIfNeeded() {
        guard !hasPresentedStartupPromotion,
              !hasOptedOutOfStartupPromotion else { return }

        hasPresentedStartupPromotion = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            showStartupPromotion = true
        }
    }
}

private struct StartupPromotionRootOverlay: View {
    let apps: [OtherApp]
    let onDismiss: (Bool) -> Void

    @Environment(\.openURL) private var openURL
    @State private var shouldHidePermanently = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.black.opacity(0.55),
                    Color.black.opacity(0.82)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 16) {
                    HStack {
                        Spacer()

                        Button(action: dismiss) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 28))
                                .foregroundStyle(Color.black.opacity(0.35))
                        }
                    }

                    VStack(spacing: 8) {
                        Text("おすすめ学習アプリ")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.orange)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.orange.opacity(0.14))
                            )

                        Text("クエスト形式で楽しく続けられるシリーズ")
                            .font(.system(size: 20, weight: .heavy))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }

                    VStack(spacing: 10) {
                        ForEach(apps) { app in
                            StartupPromotionAppCard(app: app) {
                                openAppStore(app)
                            }
                        }
                    }

                    Toggle("今後は表示しない", isOn: $shouldHidePermanently)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.black.opacity(0.68))
                        .tint(.orange)

                    Button("閉じる", action: dismiss)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(Color.black.opacity(0.55))
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                .padding(.bottom, 24)
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    .white,
                                    Color(red: 1.0, green: 0.97, blue: 0.9)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.25), radius: 24, x: 0, y: 18)
                .padding(.horizontal, 20)

                Spacer()
            }
        }
    }

    private func openAppStore(_ app: OtherApp) {
        guard let url = URL(string: app.appStoreLink) else { return }
        openURL(url)
        dismiss()
    }

    private func dismiss() {
        onDismiss(shouldHidePermanently)
    }
}

private struct StartupPromotionAppCard: View {
    let app: OtherApp
    let onOpen: () -> Void

    var body: some View {
        Button(action: onOpen) {
            HStack(spacing: 12) {
                StartupPromotionAppIcon(appName: app.name)

                VStack(alignment: .leading, spacing: 5) {
                    Text(app.name)
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundColor(.black)
                        .lineLimit(1)

                    Text(app.description2)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color.black.opacity(0.68))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: "arrow.down.circle.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.orange)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white.opacity(0.9))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.orange.opacity(0.16), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

private struct StartupPromotionAppIcon: View {
    let appName: String

    var body: some View {
        Group {
            if appName == OtherApp.chugakuQuest.name || appName == OtherApp.koukouQuest.name {
                Image(appName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                LinearGradient(
                    colors: [
                        Color(red: 0.18, green: 0.45, blue: 0.93),
                        Color(red: 0.12, green: 0.72, blue: 0.64)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .overlay(
                    Image(systemName: "graduationcap.fill")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                )
            }
        }
        .frame(width: 62, height: 62)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: Color.orange.opacity(0.16), radius: 10, x: 0, y: 6)
    }
}
