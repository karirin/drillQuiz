//
//  GachaManagerView.swift
//  drill
//
//  ガチャ一覧。見た目は itQuiz のガチャ一覧（漆黒×金, GachaTheme）に揃えている。
//

import SwiftUI
import AVFoundation

struct GachaManagerView: View {
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode

    @State private var appearAnimation: Bool = false
    @State private var selectedGacha: Int? = nil

    @State private var isPresentingNormal: Bool = false
    @State private var isPresentingHero: Bool = false
    @State private var isPresentingConstellation: Bool = false
    @State private var isPresentingRuins: Bool = false

    struct GachaCardInfo {
        let mode: GachaMode
        let title: String
        let description: String
        /// 一覧で見せるテーマ別のおとも。高レアの排出キャラはここに指定しない。
        let mascotImageName: String
        /// 各ガチャのテーマ色（サムネのグローに使う）。
        let themeColors: [Color]
        let cost: Int
    }

    let gachaList: [GachaCardInfo] = [
        GachaCardInfo(
            mode: .normal,
            title: "レギュラーガチャ",
            description: "基本のガチャ！毎日挑戦しよう",
            mascotImageName: "defaultIcon",
            themeColors: [Color(hex: "4ECDC4"), Color(hex: "44A08D")],
            cost: 300
        ),
        GachaCardInfo(
            mode: .hero,
            title: "英雄ガチャ",
            description: "伝説の英雄たちが登場！",
            mascotImageName: "ヒールスライム",
            themeColors: [Color(hex: "7B2FBE"), Color(hex: "4A0E8F")],
            cost: 600
        ),
        GachaCardInfo(
            mode: .constellation,
            title: "星座ガチャ",
            description: "ゴッドレア入り！星のおともが登場",
            mascotImageName: "ほしうさ",
            themeColors: [Color(hex: "6A2CFF"), Color(hex: "1A1A5E")],
            cost: 1000
        ),
        GachaCardInfo(
            mode: .ruins,
            title: "知恵の遺跡ガチャ",
            description: "最高レアは0.006%！古代の知識を守るおとも",
            mascotImageName: "RuinsCompanion01",
            themeColors: [Color(hex: "D08A32"), Color(hex: "3C2415")],
            cost: 1200
        )
    ]

    /// 一覧の先頭に PICK UP として出すガチャ（gachaList の添字）。ここだけ変えれば切り替わる。
    private let pickupIndex = 3

    var body: some View {
        ZStack {
            backgroundView

            VStack(spacing: 0) {
                headerView

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 12) {
                        let pickup = gachaList[pickupIndex]
                        GachaPickupHeroCard(
                            title: pickup.title,
                            description: pickup.description,
                            cost: pickup.cost,
                            imageName: pickup.mascotImageName,
                            isSelected: selectedGacha == pickupIndex
                        ) {
                            openGacha(pickupIndex)
                        }
                        .modifier(GachaAppearModifier(isVisible: appearAnimation, order: 0))

                        sectionHeading
                            .padding(.top, 14)
                            .modifier(GachaAppearModifier(isVisible: appearAnimation, order: 1))

                        ForEach(Array(regularIndices.enumerated()), id: \.element) { order, index in
                            let item = gachaList[index]
                            GachaCardView(
                                title: item.title,
                                description: item.description,
                                cost: item.cost,
                                themeColor: item.themeColors.first ?? GachaTheme.gold,
                                thumbnailImageName: item.mascotImageName,
                                isSelected: selectedGacha == index
                            ) {
                                openGacha(index)
                            }
                            .modifier(GachaAppearModifier(isVisible: appearAnimation, order: order + 2))
                        }
                    }
                    .frame(maxWidth: 560)
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 100)
                    .frame(maxWidth: .infinity)
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
            NavigationLink(
                "",
                destination: GachaView(mode: .ruins).navigationBarBackButtonHidden(true),
                isActive: $isPresentingRuins
            )
        }
        .onAppear {
            withAnimation {
                appearAnimation = true
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
        .onChange(of: isPresentingRuins) { newValue in
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

    private var regularIndices: [Int] {
        gachaList.indices.filter { $0 != pickupIndex }
    }

    private func openGacha(_ index: Int) {
        generateHapticFeedback()
        audioManager.playSound()
        withAnimation(.spring(response: 0.3)) {
            selectedGacha = index
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            switch gachaList[index].mode {
            case .normal: isPresentingNormal = true
            case .hero: isPresentingHero = true
            case .constellation: isPresentingConstellation = true
            case .ruins: isPresentingRuins = true
            case .rare, .meka, .god: break
            }
        }
    }

    // MARK: - Background
    private var backgroundView: some View {
        ZStack(alignment: .top) {
            GachaTheme.background

            GachaDiagonalPattern()

            GachaRadialGlow(opacity: 0.16, radius: 320)
                .frame(height: 400)
                .offset(y: -120)
        }
        .ignoresSafeArea()
    }

    // MARK: - Header
    private var headerView: some View {
        ZStack {
            HStack(spacing: 10) {
                GachaGoldRule(width: 18)
                Text("ガチャ")
                    .font(GachaFont.display(22, relativeTo: .title2))
                    .tracking(GachaFont.tracking(22))
                    .foregroundColor(GachaTheme.goldLight)
                    .lineLimit(1)
                    .accessibilityAddTraits(.isHeader)
                GachaGoldRule(width: 18)
            }

            HStack {
                GachaBackPill {
                    generateHapticFeedback()
                    audioManager.playCancelSound()
                    presentationMode.wrappedValue.dismiss()
                }

                Spacer()

                GachaCoinPill(amount: authManager.money)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 4)
        .padding(.bottom, 6)
    }

    private var sectionHeading: some View {
        HStack(spacing: 10) {
            Text("ガチャ")
                .font(GachaFont.display(15, relativeTo: .headline))
                .tracking(GachaFont.tracking(15))
                .foregroundColor(GachaTheme.goldLight)
                .accessibilityAddTraits(.isHeader)

            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [GachaTheme.gold.opacity(0.6), GachaTheme.gold.opacity(0)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1)
                .accessibilityHidden(true)
        }
    }
}

/// 表示時に時間差で下からフェードイン（Reduce Motion のときはフェードのみ）。
private struct GachaAppearModifier: ViewModifier {
    let isVisible: Bool
    let order: Int

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        content
            .offset(y: isVisible || reduceMotion ? 0 : 50)
            .opacity(isVisible ? 1 : 0)
            .animation(
                reduceMotion
                    ? .easeOut(duration: 0.2)
                    : .spring(response: 0.6, dampingFraction: 0.8).delay(Double(order) * 0.1),
                value: isVisible
            )
    }
}

// MARK: - Pickup Hero Card
struct GachaPickupHeroCard: View {
    let title: String
    let description: String
    let cost: Int
    let imageName: String
    var isSelected: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                GachaTheme.heroGradient

                GachaRadialGlow(opacity: 0.3, radius: 150)
                    .offset(x: 90)
                    .frame(maxWidth: .infinity, alignment: .trailing)

                // キャラ画像
                HStack {
                    Spacer(minLength: 0)
                    companionArtworkImage(named: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 210)
                        .shadow(color: GachaTheme.gold.opacity(0.35), radius: 16, x: 0, y: 6)
                        .gachaFloating(amplitude: 5, period: 4)
                        .offset(x: 18)
                        .accessibilityHidden(true)
                }

                // テキスト
                VStack(alignment: .leading, spacing: 8) {
                    GachaTag(text: "PICK UP")

                    Text(title)
                        .font(GachaFont.display(36, relativeTo: .largeTitle))
                        .tracking(GachaFont.tracking(36))
                        .foregroundColor(GachaTheme.goldHighlight)
                        .lineLimit(1)
                        .minimumScaleFactor(0.55)
                        .gachaGoldTextGlow()

                    Text(description)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(GachaTheme.text.opacity(0.85))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer(minLength: 0)

                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        GachaCoinIcon(size: 20)
                            .alignmentGuide(.firstTextBaseline) { $0[VerticalAlignment.center] + 6 }
                        Text(cost.formatted())
                            .font(.system(size: 20, weight: .bold))
                            .monospacedDigit()
                            .foregroundColor(GachaTheme.goldLight)
                        Text("/ 1回")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(GachaTheme.textMuted)
                    }
                }
                .padding(.leading, 20)
                .padding(.vertical, 20)
                .frame(maxWidth: 210, maxHeight: .infinity, alignment: .topLeading)

                GachaShineSweep(period: 3.6, intensity: 0.12)
            }
            .frame(height: 236)
            .clipShape(RoundedRectangle(cornerRadius: GachaTheme.cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .stroke(GachaTheme.gold, lineWidth: 1)
            )
            .overlay(
                GachaCornerBrackets(length: 14)
                    .stroke(GachaTheme.goldLight, style: StrokeStyle(lineWidth: 2, lineCap: .square))
                    .padding(6)
            )
            // 外側に 4pt 空けた細枠
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius + 4)
                    .stroke(GachaTheme.line, lineWidth: 1)
            )
            .shadow(color: GachaTheme.glow, radius: 20, x: 0, y: 8)
            .contentShape(Rectangle())
        }
        .buttonStyle(GachaButtonStyle())
        .scaleEffect(isSelected ? 0.97 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("ピックアップ \(title)、\(description)、1回\(cost)コイン")
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - Gacha Card View
/// ガチャ一覧の行カード。
struct GachaCardView: View {
    let title: String
    let description: String
    let cost: Int
    let themeColor: Color
    let thumbnailImageName: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                thumbnail

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(GachaFont.display(17, relativeTo: .headline))
                        .tracking(GachaFont.tracking(17))
                        .foregroundColor(GachaTheme.text)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)

                    Text(description)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(GachaTheme.textMuted)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer(minLength: 4)

                HStack(spacing: 4) {
                    GachaCoinIcon(size: 16)
                    Text(cost.formatted())
                        .font(.system(size: 15, weight: .bold))
                        .monospacedDigit()
                        .foregroundColor(GachaTheme.goldLight)
                }
                .fixedSize()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(GachaTheme.gold.opacity(0.7))
            }
            .padding(.horizontal, 10)
            .padding(.trailing, 4)
            .frame(maxWidth: .infinity)
            .frame(height: 84)
            .background(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .fill(GachaTheme.surface)
            )
            .overlay(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .stroke(GachaTheme.gold.opacity(isSelected ? 0.8 : 0.28), lineWidth: 1)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(GachaButtonStyle())
        .scaleEffect(isSelected ? 0.97 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(title)、\(description)、1回\(cost)コイン")
        .accessibilityAddTraits(.isButton)
    }

    private var thumbnail: some View {
        ZStack {
            RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                .fill(GachaTheme.background)

            RadialGradient(
                colors: [themeColor.opacity(0.55), themeColor.opacity(0)],
                center: .center,
                startRadius: 0,
                endRadius: 36
            )

            companionArtworkImage(named: thumbnailImageName)
                .resizable()
                .scaledToFit()
                .padding(4)
        }
        .frame(width: 64, height: 64)
        .clipShape(RoundedRectangle(cornerRadius: GachaTheme.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                .stroke(themeColor.opacity(0.6), lineWidth: 1)
        )
    }
}

// MARK: - Button Style
struct GachaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

struct GachaManagerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GachaManagerView()
        }
        .previewDisplayName("ガチャ一覧")

        NavigationView {
            GachaManagerView()
        }
        .previewDevice("iPhone SE (3rd generation)")
        .previewDisplayName("ガチャ一覧（375pt）")
    }
}
