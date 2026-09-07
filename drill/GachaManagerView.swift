//
//  GachaManagerView.swift
//  drill
//

import SwiftUI
import AVFoundation

struct GachaManagerView: View {
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode

    @State private var appearAnimation: Bool = false
    @State private var selectedGacha: Int? = nil
    @State private var shimmerOffset: CGFloat = -200

    @State private var isPresentingNormal: Bool = false
    @State private var isPresentingHero: Bool = false
    @State private var isPresentingConstellation: Bool = false

    struct GachaCardInfo {
        let mode: GachaMode
        let title: String
        let description: String
        let gradientColors: [Color]
        let cost: Int
    }

    let gachaList: [GachaCardInfo] = [
        GachaCardInfo(
            mode: .normal,
            title: "レギュラーガチャ",
            description: "基本のガチャ！毎日挑戦しよう",
            gradientColors: [Color(hex: "4ECDC4"), Color(hex: "44A08D")],
            cost: 300
        ),
        GachaCardInfo(
            mode: .hero,
            title: "英雄ガチャ",
            description: "伝説の英雄たちが登場！",
            gradientColors: [Color(hex: "7B2FBE"), Color(hex: "4A0E8F")],
            cost: 600
        ),
        GachaCardInfo(
            mode: .constellation,
            title: "星座ガチャ",
            description: "ゴッドレア入り！星のおともが登場",
            gradientColors: [Color(hex: "1A1A5E"), Color(hex: "6A2CFF"), Color(hex: "FFD700")],
            cost: 1000
        )
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: "1a1a2e"),
                    Color(hex: "16213e"),
                    Color(hex: "0f3460")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            GeometryReader { geometry in
                ForEach(0..<20, id: \.self) { i in
                    Circle()
                        .fill(Color.white.opacity(0.05))
                        .frame(width: CGFloat([4, 6, 8, 10, 12][i % 5]))
                        .position(
                            x: CGFloat([50, 120, 200, 280, 340, 80, 160, 250, 310, 40,
                                        100, 180, 260, 330, 70, 140, 220, 290, 360, 30][i % 20]),
                            y: CGFloat([80, 150, 220, 300, 400, 500, 600, 100, 250, 450,
                                        350, 180, 130, 480, 550, 380, 50, 430, 320, 200][i % 20])
                        )
                        .blur(radius: 1)
                }
            }

            VStack(spacing: 0) {
                headerView

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(Array(gachaList.enumerated()), id: \.offset) { index, item in
                            GachaManagerCardView(
                                title: item.title,
                                description: item.description,
                                cost: item.cost,
                                gradientColors: item.gradientColors,
                                isSelected: selectedGacha == index,
                                shimmerOffset: shimmerOffset,
                                action: {
                                    generateHapticFeedback()
                                    audioManager.playSound()
                                    withAnimation(.spring(response: 0.3)) {
                                        selectedGacha = index
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                        switch index {
                                        case 0: isPresentingNormal = true
                                        case 1: isPresentingHero = true
                                        case 2: isPresentingConstellation = true
                                        default: break
                                        }
                                    }
                                }
                            )
                            .offset(y: appearAnimation ? 0 : 50)
                            .opacity(appearAnimation ? 1 : 0)
                            .animation(
                                .spring(response: 0.6, dampingFraction: 0.8)
                                    .delay(Double(index) * 0.15),
                                value: appearAnimation
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    .padding(.bottom, 100)
                }
            }

            NavigationLink(
                "",
                destination: GachaView(mode: .normal).navigationBarBackButtonHidden(true),
                isActive: $isPresentingNormal
            )
            NavigationLink(
                "",
                destination: GachaView(mode: .hero).navigationBarBackButtonHidden(true),
                isActive: $isPresentingHero
            )
            NavigationLink(
                "",
                destination: GachaView(mode: .constellation).navigationBarBackButtonHidden(true),
                isActive: $isPresentingConstellation
            )
        }
        .onAppear {
            withAnimation {
                appearAnimation = true
            }
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                shimmerOffset = 200
            }
        }
        .onChange(of: isPresentingNormal) { newValue in
            if !newValue { selectedGacha = nil }
        }
        .onChange(of: isPresentingHero) { newValue in
            if !newValue { selectedGacha = nil }
        }
        .onChange(of: isPresentingConstellation) { newValue in
            if !newValue { selectedGacha = nil }
        }
        .gesture(
            DragGesture().onEnded { value in
                if value.translation.width > 80 {
                    audioManager.playCancelSound()
                    presentationMode.wrappedValue.dismiss()
                }
            }
        )
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var headerView: some View {
        HStack {
            Button(action: {
                generateHapticFeedback()
                audioManager.playCancelSound()
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                    Text("戻る")
                        .font(.system(size: 16, weight: .medium))
                }
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.15))
                .cornerRadius(20)
            }

            Spacer()

            Text("ガチャ")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)

            Spacer()

            HStack(spacing: 6) {
                Image(systemName: "dollarsign.circle.fill")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "FFD700"))
                Text("\(authManager.money)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                Text("コイン")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color.white.opacity(0.1))
            .cornerRadius(16)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

// MARK: - Gacha Manager Card View
struct GachaManagerCardView: View {
    let title: String
    let description: String
    let cost: Int
    let gradientColors: [Color]
    let isSelected: Bool
    let shimmerOffset: CGFloat
    let action: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // メインタップエリア（ガチャへ遷移）
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: gradientColors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                // シマーエフェクト
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0),
                                Color.white.opacity(0.25),
                                Color.white.opacity(0)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .offset(x: shimmerOffset)
                    .mask(RoundedRectangle(cornerRadius: 16))

                VStack(spacing: 8) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white.opacity(0.9))
                    Text(title)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 24)
            }
            .frame(height: 120)
            .contentShape(Rectangle())
            .onTapGesture { action() }

            // ボトムバー（説明・図鑑・コスト）
            HStack(spacing: 8) {
                Text(description)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.85))
                    .lineLimit(1)

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "FFD700"))
                    Text("\(cost)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Capsule().fill(Color.black.opacity(0.3)))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.black.opacity(0.2))
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.3), Color.white.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
        .shadow(color: gradientColors[0].opacity(0.4), radius: 15, x: 0, y: 8)
        .scaleEffect(isSelected ? 0.95 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}


struct GachaManagerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GachaManagerView()
        }
    }
}
