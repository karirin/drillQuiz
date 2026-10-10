//
//  StoryMonsterModalView.swift
//  it
//
//  Created by Apple on 2024/11/30.
//

import SwiftUI

struct StoryMonsterModalView: View {
    @ObservedObject var authManager = AuthManager()
    @ObservedObject var viewModel: PositionViewModel
    @Binding var monster: Int
    @Binding var isPresented: Bool
    @Binding var showQuizList: Bool
    @State var toggle = false
    @State private var text: String = ""
    @State private var coinImage: String = ""
    @State private var coinTitle: String = ""
    @State private var isMovingUp = false
    @State private var monsterName: String = ""
    @State private var monsterHP: Int = 100
    @State private var monsterAttack: Int = 10
    @State private var quizTitle: String = ""
    @State private var slideOut = false
    @State private var appearAnimation = false
    @State private var pulseAnimation = false
    @ObservedObject var audioManager: AudioManager

    let monsters = storyMonstersById

    var body: some View {
        ZStack {
            // 背景オーバーレイ
            Color.black.opacity(appearAnimation ? 0.7 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissModal()
                }
            
            // メインモーダル
            VStack(spacing: 0) {
                // 閉じるボタン
                HStack {
                    Spacer()
                    Button(action: {
                        generateHapticFeedback()
                        dismissModal()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white.opacity(0.8))
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                
                // モンスター画像
                ZStack {
                    // グロー効果
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color.red.opacity(0.3), Color.clear],
                                center: .center,
                                startRadius: 20,
                                endRadius: 120
                            )
                        )
                        .frame(width: 240, height: 240)
                        .scaleEffect(pulseAnimation ? 1.1 : 0.9)
                    
                    Image(monsterName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                        .offset(y: isMovingUp ? -8 : 8)
                        .shadow(color: .black.opacity(0.5), radius: 20, x: 0, y: 10)
                }
                .padding(.top, -20)
                
                // ステータスカード
                HStack(spacing: 16) {
                    // HP
                    StatBadge(
                        icon: "heart.fill",
                        value: monsterHP,
                        color: Color(red: 0.9, green: 0.3, blue: 0.3),
                        label: "HP"
                    )
                    
                    // 攻撃力
                    StatBadge(
                        icon: "flame.fill",
                        value: monsterAttack,
                        color: Color(red: 1.0, green: 0.6, blue: 0.2),
                        label: "ATK"
                    )
                }
                .padding(.top, 8)
                
                // クイズ情報
                VStack(spacing: 8) {
                    Text("BATTLE QUIZ")
                        .font(.system(size: 12, weight: .bold))
                        .tracking(3)
                        .foregroundColor(.white.opacity(0.5))
                    
                    Text(quizTitle)
                        .font(.system(size: isSmallDevice() ? 24 : 28, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                
                // たたかうボタン
                Button(action: {
                    generateHapticFeedback()
                    isPresented = false
                    showQuizList = true
                    audioManager.playKetteiSound()
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "bolt.fill")
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("たたかう")
                            .font(.system(size: 20, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        LinearGradient(
                            colors: [
                                Color(red: 0.9, green: 0.3, blue: 0.2),
                                Color(red: 0.8, green: 0.2, blue: 0.3)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color(red: 0.9, green: 0.3, blue: 0.2).opacity(0.5), radius: 16, x: 0, y: 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 28)
            }
            .frame(width: min(UIScreen.main.bounds.width - 48, 340))
            .background(
                ZStack {
                    // グラスモーフィズム背景
                    RoundedRectangle(cornerRadius: 28)
                        .fill(.ultraThinMaterial)
                    
                    // グラデーションオーバーレイ
                    RoundedRectangle(cornerRadius: 28)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.15, green: 0.1, blue: 0.2).opacity(0.9),
                                    Color(red: 0.1, green: 0.05, blue: 0.15).opacity(0.95)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    // 装飾パターン
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.3),
                                    Color.white.opacity(0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                }
            )
            .scaleEffect(appearAnimation ? 1 : 0.8)
            .opacity(appearAnimation ? 1 : 0)
            .shadow(color: .black.opacity(0.4), radius: 40, x: 0, y: 20)
        }
        .onAppear {
            setMonsterParameters(monster: monster)
            setQuizTitle()
            
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                appearAnimation = true
            }
            
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                isMovingUp = true
            }
            
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                pulseAnimation = true
            }
        }
    }
    
    private func dismissModal() {
        audioManager.playCancelSound()
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            appearAnimation = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
        }
    }
    
    private func setQuizTitle() {
        let targetFloor = DungeonTheme.clampedFloor(viewModel.userPosition + 1)
        quizTitle = DungeonQuizSubject.subject(for: targetFloor).title
    }
    
    private func setMonsterParameters(monster: Int) {
        if let monsterData = monsters[monster] {
            monsterName = monsterData.name
            monsterHP = monsterData.monsterHP
            monsterAttack = monsterData.monsterAttack
        } else {
            print("未知のモンスター")
        }
    }
    
    func isSmallDevice() -> Bool {
        return UIScreen.main.bounds.width < 390
    }
}

// MARK: - ステータスバッジコンポーネント
struct StatBadge: View {
    let icon: String
    let value: Int
    let color: Color
    let label: String
    
    var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(color)
                
                Text("\(value)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
            
            Text(label)
                .font(.system(size: 11, weight: .semibold))
                .tracking(1)
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(width: 110, height: 70)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(color.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

#Preview {
    StoryMonsterModalView(
        viewModel: PositionViewModel.shared,
        monster: .constant(3),
        isPresented: .constant(true),
        showQuizList: .constant(false),
        audioManager: AudioManager()
    )
}
