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
    @StateObject var reward = Reward()
    @State private var showAlert: Bool = false
    
    let subjects: [(name: String, theme: SubjectTheme)] = [
        ("算数", .sansu),
        ("国語", .kokugo),
        ("社会", .shakai),
        ("理科", .rika)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Dynamic Background
                SubjectBackgroundView(theme: subjects[selectedTab].theme)
                
                VStack(spacing: 0) {
                    // Modern Tab Bar
                    ModernTabBar(
                        tabs: subjects.map { $0.name },
                        themes: subjects.map { $0.theme },
                        selectedTab: $selectedTab
                    )
                    .padding(.top, 8)
                    
                    // Content
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if showsBackButton {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            generateHapticFeedback()
                            presentationMode.wrappedValue.dismiss()
                            audioManager.playCancelSound()
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 14, weight: .semibold))
                                Text("戻る")
                                    .font(.system(size: 16))
                            }
                            .foregroundColor(Color("fontGray"))
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("問題一覧")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("fontGray"))
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear {
            reward.LoadReward()
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
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.8))
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
        )
        .padding(.horizontal)
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
                    .font(.system(size: isIPad() ? 18 : 14, weight: isSelected ? .bold : .medium))
                    .foregroundColor(isSelected ? theme.primaryColor : .gray)
                
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
    
    var body: some View {
        Button(action: {
            generateHapticFeedback()
            reward.ExAndMoReward()
        }) {
            ZStack {
                // Glow Effect
                if reward.rewardLoaded {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.yellow.opacity(0.4),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 30,
                                endRadius: 60
                            )
                        )
                        .frame(width: 120, height: 120)
                }
                
                // Button
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: reward.rewardLoaded ?
                                    [Color.yellow, Color.orange] :
                                    [Color.gray.opacity(0.4), Color.gray.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 90, height: 90)
                        .shadow(color: reward.rewardLoaded ? Color.orange.opacity(0.4) : Color.clear, radius: 10, x: 0, y: 4)
                    
                    VStack(spacing: 2) {
                        Text("動画視聴で")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text("経験値とコインが")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                        Text("2倍に")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
            }
        }
        .disabled(!reward.rewardLoaded)
        .onChange(of: reward.rewardEarned) { rewardEarned in
            showAlert = rewardEarned
        }
    }
}

#Preview {
    ManagerView()
}
