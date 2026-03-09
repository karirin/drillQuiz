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

    let monsters: [Int: Monster] = [
        1: Monster(name: "モンスター1", playerExperience: 30, playerMoney: 30, monsterHP: 160, monsterUnderHP: 160, monsterAttack: 30),
        2: Monster(name: "モンスター2", playerExperience: 20, playerMoney: 20, monsterHP: 100, monsterUnderHP: 100, monsterAttack: 10),
        3: Monster(name: "モンスター3", playerExperience: 15, playerMoney: 15, monsterHP: 120, monsterUnderHP: 120, monsterAttack: 15),
        4: Monster(name: "モンスター4", playerExperience: 25, playerMoney: 25, monsterHP: 110, monsterUnderHP: 110, monsterAttack: 12),
        5: Monster(name: "モンスター5", playerExperience: 22, playerMoney: 22, monsterHP: 115, monsterUnderHP: 115, monsterAttack: 14),
        6: Monster(name: "モンスター6", playerExperience: 28, playerMoney: 28, monsterHP: 125, monsterUnderHP: 125, monsterAttack: 18),
        7: Monster(name: "モンスター7", playerExperience: 35, playerMoney: 35, monsterHP: 150, monsterUnderHP: 150, monsterAttack: 25),
        8: Monster(name: "モンスター8", playerExperience: 18, playerMoney: 18, monsterHP: 95, monsterUnderHP: 95, monsterAttack: 9),
        9: Monster(name: "モンスター9", playerExperience: 40, playerMoney: 40, monsterHP: 160, monsterUnderHP: 160, monsterAttack: 28),
        10: Monster(name: "モンスター10", playerExperience: 45, playerMoney: 45, monsterHP: 170, monsterUnderHP: 170, monsterAttack: 30),
        11: Monster(name: "モンスター11", playerExperience: 50, playerMoney: 50, monsterHP: 180, monsterUnderHP: 180, monsterAttack: 32),
        12: Monster(name: "モンスター12", playerExperience: 55, playerMoney: 55, monsterHP: 190, monsterUnderHP: 190, monsterAttack: 35),
        13: Monster(name: "モンスター13", playerExperience: 60, playerMoney: 60, monsterHP: 200, monsterUnderHP: 200, monsterAttack: 38),
        14: Monster(name: "モンスター14", playerExperience: 65, playerMoney: 65, monsterHP: 210, monsterUnderHP: 210, monsterAttack: 40),
        15: Monster(name: "ボス15", playerExperience: 500, playerMoney: 1000, monsterHP: 3000, monsterUnderHP: 3000, monsterAttack: 500),
        16: Monster(name: "ボス16", playerExperience: 200, playerMoney: 300, monsterHP: 500, monsterUnderHP: 500, monsterAttack: 200),
        17: Monster(name: "モンスター17", playerExperience: 80, playerMoney: 80, monsterHP: 240, monsterUnderHP: 240, monsterAttack: 48),
        18: Monster(name: "モンスター18", playerExperience: 85, playerMoney: 85, monsterHP: 250, monsterUnderHP: 250, monsterAttack: 50),
        19: Monster(name: "モンスター19", playerExperience: 90, playerMoney: 90, monsterHP: 260, monsterUnderHP: 260, monsterAttack: 52),
        20: Monster(name: "モンスター20", playerExperience: 95, playerMoney: 95, monsterHP: 270, monsterUnderHP: 270, monsterAttack: 55),
        21: Monster(name: "モンスター21", playerExperience: 100, playerMoney: 100, monsterHP: 280, monsterUnderHP: 280, monsterAttack: 58),
        22: Monster(name: "モンスター22", playerExperience: 105, playerMoney: 105, monsterHP: 290, monsterUnderHP: 290, monsterAttack: 60),
        23: Monster(name: "モンスター23", playerExperience: 110, playerMoney: 110, monsterHP: 300, monsterUnderHP: 300, monsterAttack: 62),
        24: Monster(name: "モンスター24", playerExperience: 115, playerMoney: 115, monsterHP: 310, monsterUnderHP: 310, monsterAttack: 65),
        25: Monster(name: "モンスター25", playerExperience: 120, playerMoney: 120, monsterHP: 320, monsterUnderHP: 320, monsterAttack: 68),
        26: Monster(name: "モンスター26", playerExperience: 125, playerMoney: 125, monsterHP: 330, monsterUnderHP: 330, monsterAttack: 70),
        27: Monster(name: "モンスター27", playerExperience: 130, playerMoney: 130, monsterHP: 340, monsterUnderHP: 340, monsterAttack: 72),
        28: Monster(name: "モンスター28", playerExperience: 135, playerMoney: 135, monsterHP: 350, monsterUnderHP: 350, monsterAttack: 75),
        29: Monster(name: "モンスター29", playerExperience: 140, playerMoney: 140, monsterHP: 360, monsterUnderHP: 360, monsterAttack: 78),
        30: Monster(name: "モンスター30", playerExperience: 145, playerMoney: 145, monsterHP: 370, monsterUnderHP: 370, monsterAttack: 80),
        31: Monster(name: "モンスター31", playerExperience: 150, playerMoney: 150, monsterHP: 380, monsterUnderHP: 380, monsterAttack: 82),
        32: Monster(name: "モンスター32", playerExperience: 155, playerMoney: 155, monsterHP: 390, monsterUnderHP: 390, monsterAttack: 85)
    ]

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
        switch viewModel.userPosition {
        case 1...4, 9...14, 40...50:
            quizTitle = "算数"
        case 5...8, 15...19:
            quizTitle = "国語"
        case 20...24, 29...34:
            quizTitle = "理科"
        case 25...28, 35...39:
            quizTitle = "社会"
        default:
            quizTitle = "算数"
        }
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
