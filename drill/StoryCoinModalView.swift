//
//  StoryCoinModalView.swift
//  it
//
//  Created by Apple on 2024/11/17.
//

import SwiftUI

struct Treasure: Codable {
    let coinImage: String
    let coinTitle: String
    let reward: Int
}

struct StoryCoinModalView: View {
    @ObservedObject var authManager = AuthManager()
    @ObservedObject var audioManager = AudioManager()
    let coin: Int
    @Binding var isPresented: Bool
    @State var toggle = false
    @State private var text: String = ""
    @State private var coinImage: String = ""
    @State private var coinTitle: String = ""
    @State private var rewardAmount: Int = 0
    @State private var isMovingUp = false
    @State private var appearAnimation = false
    @State private var coinRotation: Double = 0
    @State private var sparkleOpacity: Double = 0
    @State private var countUpValue: Int = 0
    
    let treasures: [Int: Treasure] = [
        1: Treasure(coinImage: "コイン1", coinTitle: "100コインゲット！！", reward: 100),
        2: Treasure(coinImage: "コイン1", coinTitle: "100コインゲット！！", reward: 100),
        3: Treasure(coinImage: "コイン1", coinTitle: "100コインゲット！！", reward: 100),
        4: Treasure(coinImage: "コイン3", coinTitle: "300コインゲット！！", reward: 300),
        5: Treasure(coinImage: "コイン2", coinTitle: "200コインゲット！！", reward: 200),
        6: Treasure(coinImage: "コイン3", coinTitle: "300コインゲット！！", reward: 300),
        7: Treasure(coinImage: "コイン2", coinTitle: "200コインゲット！！", reward: 200),
        8: Treasure(coinImage: "コイン5", coinTitle: "500コインゲット！！", reward: 500),
        9: Treasure(coinImage: "コイン4", coinTitle: "400コインゲット！！", reward: 400),
        10: Treasure(coinImage: "コイン4", coinTitle: "400コインゲット！！", reward: 400),
        11: Treasure(coinImage: "コイン4", coinTitle: "400コインゲット！！", reward: 400),
        12: Treasure(coinImage: "コイン4", coinTitle: "400コインゲット！！", reward: 400),
        13: Treasure(coinImage: "コイン7", coinTitle: "800コインゲット！！", reward: 800),
        14: Treasure(coinImage: "コイン6", coinTitle: "600コインゲット！！", reward: 600),
        15: Treasure(coinImage: "コイン6", coinTitle: "600コインゲット！！", reward: 600),
        16: Treasure(coinImage: "コイン7", coinTitle: "800コインゲット！！", reward: 800),
        17: Treasure(coinImage: "コイン6", coinTitle: "600コインゲット！！", reward: 600),
        18: Treasure(coinImage: "コイン7", coinTitle: "800コインゲット！！", reward: 800),
        19: Treasure(coinImage: "コイン8", coinTitle: "800コインゲット！！", reward: 800),
    ]
    
    var body: some View {
        ZStack {
            // 背景オーバーレイ
            Color.black.opacity(appearAnimation ? 0.7 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissModal()
                }
            
            // キラキラパーティクル
            ForEach(0..<12, id: \.self) { index in
                SparkleParticle(index: index)
                    .opacity(sparkleOpacity)
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
                
                // TREASURE ラベル
                Text("TREASURE")
                    .font(.system(size: 14, weight: .bold))
                    .tracking(4)
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.4).opacity(0.8))
                    .padding(.top, 8)
                
                // コイン画像
                ZStack {
                    // グロー効果
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.4),
                                    Color(red: 1.0, green: 0.7, blue: 0.2).opacity(0.1),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: 140
                            )
                        )
                        .frame(width: 280, height: 280)
                        .scaleEffect(isMovingUp ? 1.1 : 0.95)
                    
                    // 光線エフェクト
                    ForEach(0..<8, id: \.self) { index in
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 1.0, green: 0.9, blue: 0.5).opacity(0.3),
                                        Color.clear
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 3, height: 100)
                            .offset(y: -80)
                            .rotationEffect(.degrees(Double(index) * 45))
                            .opacity(sparkleOpacity * 0.5)
                    }
                    
                    Image(coinImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 160)
                        .offset(y: isMovingUp ? -10 : 10)
                        .shadow(color: Color(red: 1.0, green: 0.8, blue: 0.3).opacity(0.6), radius: 30, x: 0, y: 10)
                }
                .padding(.top, -20)
                
                // コイン獲得テキスト
                VStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.4))
                        
                        Text("\(countUpValue)")
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .contentTransition(.numericText())
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.4))
                    }
                    
                    Text("コインゲット！")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 8)
                
                // OKボタン
                Button(action: {
                    generateHapticFeedback()
                    dismissModal()
                }) {
                    Text("OK")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.2, green: 0.15, blue: 0.1))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.9, blue: 0.5),
                                    Color(red: 1.0, green: 0.75, blue: 0.3)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .shadow(color: Color(red: 1.0, green: 0.8, blue: 0.3).opacity(0.5), radius: 12, x: 0, y: 6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                .padding(.bottom, 28)
            }
            .frame(width: min(UIScreen.main.bounds.width - 48, 320))
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
                                    Color(red: 0.15, green: 0.12, blue: 0.08).opacity(0.92),
                                    Color(red: 0.1, green: 0.08, blue: 0.05).opacity(0.96)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                    // 装飾ボーダー
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.9, blue: 0.5).opacity(0.4),
                                    Color(red: 1.0, green: 0.8, blue: 0.3).opacity(0.1)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                }
            )
            .scaleEffect(appearAnimation ? 1 : 0.8)
            .opacity(appearAnimation ? 1 : 0)
            .shadow(color: .black.opacity(0.4), radius: 40, x: 0, y: 20)
        }
        .onAppear {
            setTreasureParameters(coin: coin)
            
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                appearAnimation = true
            }
            
            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                isMovingUp = true
            }
            
            withAnimation(.easeIn(duration: 0.5).delay(0.3)) {
                sparkleOpacity = 1
            }
            
            // カウントアップアニメーション
            animateCountUp()
        }
    }
    
    private func animateCountUp() {
        let duration: Double = 0.8
        let steps = 20
        let stepDuration = duration / Double(steps)
        
        for step in 0...steps {
            DispatchQueue.main.asyncAfter(deadline: .now() + stepDuration * Double(step)) {
                withAnimation(.easeOut(duration: 0.05)) {
                    countUpValue = Int(Double(rewardAmount) * Double(step) / Double(steps))
                }
            }
        }
    }
    
    private func dismissModal() {
        audioManager.playCancelSound()
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            appearAnimation = false
            sparkleOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
        }
    }
    
    private func setTreasureParameters(coin: Int) {
        if let treasure = treasures[coin] {
            coinImage = treasure.coinImage
            coinTitle = treasure.coinTitle
            rewardAmount = treasure.reward
            AuthManager.shared.addMoney(amount: treasure.reward)
        } else {
            print("未知の宝物")
        }
    }
}

// MARK: - キラキラパーティクル
struct SparkleParticle: View {
    let index: Int
    @State private var offset: CGFloat = 0
    @State private var opacity: Double = 0
    
    var body: some View {
        Image(systemName: "sparkle")
            .font(.system(size: CGFloat.random(in: 8...16)))
            .foregroundColor(Color(red: 1.0, green: 0.9, blue: 0.5))
            .offset(
                x: CGFloat.random(in: -120...120),
                y: offset + CGFloat.random(in: -80...80)
            )
            .opacity(opacity)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 1.5...2.5))
                    .repeatForever(autoreverses: true)
                    .delay(Double(index) * 0.1)
                ) {
                    offset = CGFloat.random(in: -30...30)
                    opacity = Double.random(in: 0.4...1.0)
                }
            }
    }
}

#Preview {
    StoryCoinModalView(coin: 8, isPresented: .constant(true))
}
