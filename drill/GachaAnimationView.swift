//
//  GachaAnimationView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/18.
//

import SwiftUI
import AVKit
import AVFoundation

struct AVPlayerViewControllerRepresentable: UIViewControllerRepresentable {
    @Binding var player: AVPlayer?
    @Binding var showAnimation: Bool

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if uiViewController.player == nil {
          uiViewController.player = player
        }
        if showAnimation {
          uiViewController.player?.play()
        } else {
          uiViewController.player?.pause()
        }
    }
}

// MARK: - Animation View
struct GachaAnimationView: View {
    let rarity: GachaRarity?
    let onFinished: () -> Void
    
    @State private var scale: CGFloat = 0.3
    @State private var rotation: Double = 0
    @State private var opacity: Double = 0
    @State private var showRays: Bool = false
    @State private var particleOpacity: Double = 0
    @State private var pulseScale: CGFloat = 1.0
    @State private var ringScale: CGFloat = 0.3
    @State private var showText: Bool = false
    @State private var shimmerOffset: CGFloat = -300
    @State private var hexagonRotation: Double = 0
    @State private var starBurst: Bool = false
    @State private var energyWave: CGFloat = 0
    
    var rarityColors: [Color] {
        rarity?.gradientColors ?? [.gray, .gray]
    }
    
    var body: some View {
        ZStack {
            // 背景グラデーション（アニメーション付き）
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: rarityColors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // 動的グラデーションオーバーレイ
                RadialGradient(
                    colors: [
                        rarityColors[0].opacity(0.6),
                        Color.clear
                    ],
                    center: .center,
                    startRadius: 0,
                    endRadius: 400
                )
                .scaleEffect(pulseScale)
                .opacity(opacity * 0.5)
            }
            
            // エネルギーウェーブ（複数層）
            ForEach(0..<3) { index in
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                    .scaleEffect(energyWave + CGFloat(index) * 0.3)
                    .opacity(1 - energyWave)
            }
            
            // 六角形の回転エフェクト
            ForEach(0..<6) { index in
                HexagonShape()
                    .stroke(
                        LinearGradient(
                            colors: [.white.opacity(0.6), rarityColors[0].opacity(0.8), .white.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
                    .frame(width: CGFloat(180 + index * 40), height: CGFloat(180 + index * 40))
                    .rotationEffect(.degrees(hexagonRotation + Double(index * 20)))
                    .scaleEffect(ringScale)
                    .opacity(opacity * (0.8 - Double(index) * 0.1))
            }
            
            // スターバーストエフェクト
            if starBurst {
                ForEach(0..<16) { index in
                    DiamondShape()
                        .fill(
                            LinearGradient(
                                colors: [.white, rarityColors[1].opacity(0.6), .clear],
                                startPoint: .center,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 200, height: 8)
                        .offset(x: 100)
                        .rotationEffect(.degrees(Double(index) * 22.5 + rotation * 2))
                        .opacity(opacity * 0.9)
                        .blur(radius: 0.5)
                }
            }
            
            // 光線エフェクト（改良版）
            if showRays {
                // メインの光線（太め）
                ForEach(0..<12) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: [
                                    .white.opacity(0.9),
                                    rarityColors[0].opacity(0.7),
                                    .clear
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 600, height: 16)
                        .offset(x: 300)
                        .rotationEffect(.degrees(Double(index) * 30 + rotation))
                        .opacity(opacity * 0.85)
                        .blur(radius: 1)
                }
                
                // サブ光線（細め、逆回転）
                ForEach(0..<24) { index in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.white.opacity(0.6), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 400, height: 4)
                        .offset(x: 200)
                        .rotationEffect(.degrees(Double(index) * 15 - rotation * 1.8))
                        .opacity(opacity * 0.6)
                }
            }
            
            // 改良されたパーティクルシステム
            ForEach(0..<80, id: \.self) { index in
                let angle = Double(index) * (360.0 / 80.0)
                let radius = CGFloat.random(in: 120...300)
                let size = CGFloat.random(in: 2...6)
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.white, rarityColors[1].opacity(0.8), .clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: size / 2
                        )
                    )
                    .frame(width: size, height: size)
                    .position(
                        x: UIScreen.main.bounds.width / 2 + cos(angle * .pi / 180) * radius,
                        y: UIScreen.main.bounds.height / 2 + sin(angle * .pi / 180) * radius
                    )
                    .opacity(particleOpacity * Double.random(in: 0.5...1.0))
                    .blur(radius: 0.5)
            }
            
            // 中央のメインエフェクト
            ZStack {
                // 最外側の爆発エフェクト
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                .white.opacity(0.95),
                                rarityColors[0].opacity(0.7),
                                rarityColors[1].opacity(0.4),
                                .clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 220
                        )
                    )
                    .frame(width: 440, height: 440)
                    .scaleEffect(pulseScale)
                    .opacity(opacity * 0.9)
                    .blur(radius: 8)
                
                // 中間のグロー
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                .white.opacity(1.0),
                                rarityColors[1].opacity(0.8),
                                rarityColors[0].opacity(0.4)
                            ],
                            center: .center,
                            startRadius: 30,
                            endRadius: 140
                        )
                    )
                    .frame(width: 280, height: 280)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .blur(radius: 3)
                
                // メインの光球
                ZStack {
                    // アウターリング
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.white, rarityColors[0].opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 6
                        )
                        .frame(width: 200, height: 200)
                        .shadow(color: .white.opacity(0.8), radius: 15)
                    
                    // インナーグロー
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    .white.opacity(0.9),
                                    rarityColors[1].opacity(0.6),
                                    rarityColors[0].opacity(0.3)
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 90
                            )
                        )
                        .frame(width: 180, height: 180)
                }
                .scaleEffect(scale)
                .opacity(opacity)
                .shadow(color: rarityColors[0].opacity(0.9), radius: 30)
                
            }
        }
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        // フェーズ1: 初期爆発 (0-0.5秒)
        withAnimation(.easeOut(duration: 0.5)) {
            opacity = 1.0
            scale = 1.1
            ringScale = 1.0
        }
        
        // エネルギーウェーブ
        withAnimation(.easeOut(duration: 1.2)) {
            energyWave = 2.0
        }
        
        // パルスエフェクト
        withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
            pulseScale = 1.15
        }
        
        // フェーズ2: スターバースト (0.15秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            starBurst = true
        }
        
        // フェーズ3: 光線表示 (0.25秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            showRays = true
            // 回転アニメーション
            withAnimation(.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            // 六角形回転
            withAnimation(.linear(duration: 6.0).repeatForever(autoreverses: false)) {
                hexagonRotation = -360
            }
        }
        
        // フェーズ4: パーティクル爆発 (0.35秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            withAnimation(.easeOut(duration: 0.5)) {
                particleOpacity = 1.0
            }
        }
        
        // フェーズ5: スケール調整 (0.6秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                scale = 1.0
            }
        }
        
        // フェーズ6: テキスト登場 (0.9秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.65)) {
                showText = true
            }
            
            // シマーエフェクト
            withAnimation(.easeInOut(duration: 1.2)) {
                shimmerOffset = 350
            }
        }
        
        // フェーズ7: 強調バウンス (1.4秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5).repeatCount(3, autoreverses: true)) {
                scale = 1.12
            }
        }
        
        // フェーズ8: フェードアウト開始 (2.8秒後)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            withAnimation(.easeOut(duration: 0.5)) {
                opacity = 0
                scale = 1.4
                particleOpacity = 0
            }
            
            // 完全終了
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                onFinished()
            }
        }
    }
}
