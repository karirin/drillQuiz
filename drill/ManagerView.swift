//
//  ManagerTabView.swift
//  it
//
//  Created by Apple on 2024/03/22.
//  Updated with Modern UI/UX
//

import SwiftUI

struct ManagerView: View {
    @Environment(\.presentationMode) var presentationMode
    var showsBackButton: Bool = true
    @State private var selectedTab: Int = 0
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var audioManager = AudioManager.shared
    @StateObject var reward = Reward(placement: .boost)
    @State private var showAlert: Bool = false
    @State private var isPresentingWeaknessReview = false
    
    let subjects: [(name: String, theme: SubjectTheme)] = [
        ("算数", .sansu),
        ("国語", .kokugo),
        ("社会", .shakai),
        ("理科", .rika)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LearningModeGlassBackground()

                VStack(spacing: 0) {
                    navigationBar

                    ModernTabBar(
                        tabs: subjects.map { $0.name },
                        themes: subjects.map { $0.theme },
                        selectedTab: $selectedTab
                    )
                    .padding(.top, 12)

                    Button {
                        generateHapticFeedback()
                        audioManager.playSound()
                        isPresentingWeaknessReview = true
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.clockwise")
                            Text("苦手分野克服")
                            Spacer()
                            Text("復習・集中特訓").font(.caption)
                            Image(systemName: "chevron.right")
                        }
                        .font(.subheadline.bold())
                        .foregroundStyle(Color(hex: "185ca8"))
                        .padding(14)
                        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .accessibilityIdentifier("learning.weaknessReview")

                    TabView(selection: $selectedTab) {
                        SansuListView(isPresenting: .constant(false))
                            .tag(0)
                        KokugoListView(isPresenting: .constant(false))
                            .tag(1)
                        ShakaiListView(isPresenting: .constant(false))
                            .tag(2)
                        RikaListView(isPresenting: .constant(false))
                            .tag(3)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }

                // Floating Reward Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        RewardFloatingButton(reward: reward, showAlert: $showAlert)
                            .padding(.trailing, 20)
                            .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .interactiveSwipeBackEnabled()
        .onAppear {
            reward.LoadReward()
        }
        .onDisappear { reward.stopPreloading() }
        .fullScreenCover(isPresented: $isPresentingWeaknessReview) {
            SpacedReviewHomeView(isPresenting: $isPresentingWeaknessReview)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("報酬獲得！"),
                message: Text("1時間だけ獲得した経験値とコインが2倍"),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                    reward.rewardEarned = false
                }
            )
        }
    }

    // MARK: - Navigation Bar
    private var navigationBar: some View {
        HStack {
            if showsBackButton {
                Button(action: {
                    generateHapticFeedback()
                    audioManager.playCancelSound()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    backLabel
                        .foregroundColor(Color(hex: "11998e"))
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                backLabel.opacity(0)
            }

            Spacer()

            Text("問題一覧")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.primary)

            Spacer()

            // バランス用
            backLabel.opacity(0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
    }

    private var backLabel: some View {
        HStack(spacing: 6) {
            Image(systemName: "chevron.left")
                .font(.system(size: 16, weight: .semibold))
            Text("戻る")
                .font(.system(size: 16, weight: .medium))
        }
    }
}

// MARK: - Modern Tab Bar
struct ModernTabBar: View {
    let tabs: [String]
    let themes: [SubjectTheme]
    @Binding var selectedTab: Int
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<tabs.count, id: \.self) { index in
                TabButton(
                    title: tabs[index],
                    theme: themes[index],
                    isSelected: selectedTab == index,
                    animation: animation
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                    generateHapticFeedback()
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .learningModeGlassSurface(gradient: LinearGradient(
            colors: themes[selectedTab].gradientColors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .padding(.horizontal, 16)
    }
}

struct TabButton: View {
    let title: String
    let theme: SubjectTheme
    let isSelected: Bool
    let animation: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(title)
                    .font(.system(size: isIPad() ? 18 : 15, weight: isSelected ? .bold : .semibold))
                    .foregroundColor(isSelected ? theme.primaryColor : .secondary)
                
                // Indicator
                if isSelected {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(
                            LinearGradient(
                                colors: theme.gradientColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "indicator", in: animation)
                } else {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.clear)
                        .frame(height: 3)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func isIPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}

// MARK: - Floating Reward Button
struct RewardFloatingButton: View {
    @ObservedObject var reward: Reward
    @Binding var showAlert: Bool
    @State private var rewardAnimating = false
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            if reward.rewardLoadFailed {
                reward.retryLoading()
            } else {
                reward.ExAndMoReward()
            }
        }) {
            ZStack {
                // Outer glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "ffd700").opacity(0.4),
                                Color(hex: "ffd700").opacity(0)
                            ],
                            center: .center,
                            startRadius: 30,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                    .scaleEffect(rewardAnimating ? 1.2 : 1.0)
                    .opacity(reward.rewardLoaded ? 1 : 0)
                
                // Main button
                ZStack {
                    Circle()
                        .fill(
                            reward.rewardLoaded ?
                            LinearGradient(
                                colors: [Color(hex: "ffd700"), Color(hex: "ff8c00")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ) :
                            LinearGradient(
                                colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 90, height: 90)
                        .shadow(color: reward.rewardLoaded ? Color(hex: "ffd700").opacity(0.5) : .clear, radius: 10)
                    
                    VStack(spacing: 2) {
                        Text("動画視聴で")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text("経験値とコインが")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                        Text(reward.rewardLoadFailed ? "再読み込み" : "2倍に")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
            }
        }
        .frame(height: 90)
        .buttonStyle(PlainButtonStyle())
        .disabled(!reward.rewardLoaded && !reward.rewardLoadFailed)
        .onChange(of: reward.rewardEarned) { rewardEarned in
            showAlert = rewardEarned
        }
        .onAppear { startPulseIfLoaded(reward.rewardLoaded) }
        .onChange(of: reward.rewardLoaded) { loaded in startPulseIfLoaded(loaded) }
    }

    private func startPulseIfLoaded(_ loaded: Bool) {
        guard loaded, !rewardAnimating else { return }
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            rewardAnimating = true
        }
    }
}

#Preview {
    ManagerView()
}
