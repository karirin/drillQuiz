//
//  GachaAnimationView.swift
//  drill
//
//  itQuiz と同じ召喚演出（召喚陣 → 宝珠落下 → ひび割れ・予告 → 光の柱 → 登場）。
//

import SwiftUI

// MARK: - Animation View
/// 召喚演出（約4.8秒）。暗転・召喚陣 → 宝珠落下 → ひび割れ・予告 → 光の柱 → 登場。
struct GachaAnimationView: View {
    let rarity: GachaRarity?
    /// 登場させるおとも。省略時はレア度だけを表示する。
    var item: GachaManager.Item? = nil
    let onFinished: () -> Void

    /// 演出の段階。
    enum SummonPhase: Int {
        case idle
        case circle      // 0.0s 暗転・召喚陣
        case orbDrop     // 0.8s 宝珠落下
        case crack       // 1.8s ひび割れ・レア度の予告
        case pillar      // 2.8s 光の柱・ホワイトアウト
        case reveal      // 3.6s 登場
        case done
    }

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var phase: SummonPhase = .idle
    @State private var sequence: Task<Void, Never>?
    @State private var didFinish = false

    // 召喚陣
    @State private var circleScale: CGFloat = 0.2
    @State private var circleOpacity: Double = 0
    // 宝珠
    @State private var orbOffset: CGFloat = -560
    @State private var orbOpacity: Double = 0
    @State private var orbScale: CGFloat = 1
    @State private var trailOpacity: Double = 0
    @State private var isShaking = false
    @State private var crackProgress: CGFloat = 0
    @State private var hintColor: Color = GachaTheme.goldLight
    @State private var hintGlow: Double = 0
    @State private var isRainbow = false
    @State private var rainbowSpin = false
    // 光の柱・白飛び
    @State private var pillarScale: CGFloat = 0
    @State private var pillarOpacity: Double = 0
    @State private var flashOpacity: Double = 0
    // 登場
    @State private var revealOpacity: Double = 0
    @State private var raysRotation: Double = 0
    @State private var avatarScale: CGFloat = 0.6
    @State private var bannerOffset: CGFloat = -600
    @State private var bannerOpacity: Double = 0

    private static let rainbowColors: [Color] = [
        Color(hex: "FF5A5A"), Color(hex: "FFB347"), Color(hex: "FFF07A"),
        Color(hex: "6BFF8E"), Color(hex: "5AD8FF"), Color(hex: "7A7BFF"),
        Color(hex: "E07BFF"), Color(hex: "FF5A5A")
    ]

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let floorY = size.height * 0.64
            let orbRestY = floorY - 46
            let revealY = size.height * 0.42

            ZStack {
                Color.black

                // 5. 登場
                revealLayer(size: size, centerY: revealY)
                    .opacity(revealOpacity)

                // 1. 召喚陣（床に寝かせた楕円）
                ZStack {
                    Ellipse()
                        .fill(
                            RadialGradient(
                                colors: [hintColor.opacity(0.35 + hintGlow * 0.3), .clear],
                                center: .center,
                                startRadius: 0,
                                endRadius: 170
                            )
                        )
                        .frame(width: 340, height: 130)

                    GachaSummoningCircle(size: 300, color: GachaTheme.gold)
                        .scaleEffect(x: 1, y: 0.36)
                }
                .scaleEffect(circleScale)
                .opacity(circleOpacity)
                .position(x: size.width / 2, y: floorY)

                // 2〜3. 宝珠
                orbLayer
                    .offset(y: orbOffset)
                    .opacity(orbOpacity)
                    .position(x: size.width / 2, y: orbRestY)

                // 4. 光の柱
                LinearGradient(
                    colors: [.clear, pillarColor.opacity(0.9), .white, pillarColor.opacity(0.9), .clear],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 150)
                .scaleEffect(x: pillarScale, y: 1)
                .opacity(pillarOpacity)
                .blur(radius: 6)
                .frame(maxHeight: .infinity)
                .position(x: size.width / 2, y: size.height / 2)
                .allowsHitTesting(false)

                Color.white
                    .opacity(flashOpacity)
                    .allowsHitTesting(false)
            }
            .frame(width: size.width, height: size.height)
        }
        .ignoresSafeArea()
        .overlay(alignment: .topTrailing) {
            skipButton
        }
        .onAppear {
            guard sequence == nil else { return }
            sequence = Task { @MainActor in
                if reduceMotion {
                    await runReducedSequence()
                } else {
                    await runSequence()
                }
            }
        }
        .onDisappear {
            sequence?.cancel()
        }
    }

    // MARK: Layers
    private var pillarColor: Color {
        isRainbow ? GachaTheme.goldHighlight : hintColor
    }

    private var orbLayer: some View {
        ZStack {
            // 落下時の光の尾
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [GachaTheme.goldLight.opacity(0), GachaTheme.goldLight.opacity(0.85)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 26, height: 240)
                .offset(y: -130)
                .blur(radius: 4)
                .opacity(trailOpacity)

            // 漏れる光
            Group {
                if isRainbow {
                    Circle()
                        .fill(AngularGradient(colors: Self.rainbowColors, center: .center))
                        .hueRotation(.degrees(rainbowSpin ? 360 : 0))
                } else {
                    Circle().fill(hintColor)
                }
            }
            .frame(width: 150, height: 150)
            .blur(radius: 28)
            .opacity(hintGlow)

            // 宝珠本体
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.white, GachaTheme.goldLight, GachaTheme.gold, Color(hex: "8C5F10")],
                        center: UnitPoint(x: 0.38, y: 0.32),
                        startRadius: 0,
                        endRadius: 44
                    )
                )
                .frame(width: 70, height: 70)
                .overlay(
                    GachaOrbCrackShape()
                        .trim(from: 0, to: crackProgress)
                        .stroke(isRainbow ? Color.white : hintColor, style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                        .shadow(color: isRainbow ? .white : hintColor, radius: 4)
                )
                .shadow(color: GachaTheme.gold.opacity(0.8), radius: 16)
        }
        .scaleEffect(orbScale)
        .rotationEffect(.degrees(phase == .crack ? (isShaking ? 3 : -3) : 0))
    }

    private func revealLayer(size: CGSize, centerY: CGFloat) -> some View {
        let diameter = max(size.width, size.height) * 1.6

        return ZStack {
            GachaSunburst(opacity: 0.16)
                .frame(width: diameter, height: diameter)
                .rotationEffect(.degrees(raysRotation))
                .position(x: size.width / 2, y: centerY)

            GachaRadialGlow(opacity: 0.35, radius: 220)
                .position(x: size.width / 2, y: centerY)

            avatarImage
                .frame(width: 250, height: 250)
                .shadow(color: GachaTheme.gold.opacity(0.5), radius: 24)
                .scaleEffect(avatarScale)
                .position(x: size.width / 2, y: centerY)

            nameBanner
                .offset(x: bannerOffset)
                .opacity(bannerOpacity)
                .position(x: size.width / 2, y: centerY + 170)
        }
    }

    @ViewBuilder
    private var avatarImage: some View {
        if let item, UIImage(named: item.name) != nil {
            Image(item.name)
                .resizable()
                .scaledToFit()
                .accessibilityLabel(item.name)
        } else {
            Image(systemName: "sparkles")
                .resizable()
                .scaledToFit()
                .padding(60)
                .foregroundColor(GachaTheme.goldLight)
                .accessibilityHidden(true)
        }
    }

    private var nameBanner: some View {
        HStack(spacing: 10) {
            if let rarity {
                GachaTag(text: rarity.displayString, useLabelFont: false, size: 12)
            }
            Text(item?.name ?? rarity?.displayString ?? "")
                .font(GachaFont.display(22, relativeTo: .title2))
                .tracking(GachaFont.tracking(22))
                .foregroundColor(GachaTheme.goldHighlight)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .gachaGoldTextGlow()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color.black.opacity(0.85))
        .overlay(alignment: .top) {
            Rectangle().fill(GachaTheme.gold).frame(height: 1)
        }
        .overlay(alignment: .bottom) {
            Rectangle().fill(GachaTheme.gold).frame(height: 1)
        }
        .accessibilityElement(children: .combine)
    }

    private var skipButton: some View {
        Button(action: finish) {
            HStack(spacing: 4) {
                Text("スキップ")
                    .font(.system(size: 13, weight: .bold))
                Image(systemName: "forward.end.fill")
                    .font(.system(size: 11, weight: .bold))
            }
            .foregroundColor(GachaTheme.goldLight)
            .padding(.horizontal, 14)
            .frame(minWidth: 44, minHeight: 44)
            .background(
                Capsule()
                    .fill(Color.black.opacity(0.5))
                    .overlay(Capsule().stroke(GachaTheme.line, lineWidth: 1))
            )
            .contentShape(Capsule())
        }
        .buttonStyle(ScaleButtonStyle())
        .padding(.trailing, 16)
        .padding(.top, 8)
        .accessibilityLabel("演出をスキップ")
    }

    // MARK: Sequence
    private func runSequence() async {
        // 1. 0.0s 暗転・召喚陣
        phase = .circle
        withAnimation(.easeOut(duration: 0.8)) {
            circleScale = 1
            circleOpacity = 1
        }
        guard await pause(0.8) else { return }

        // 2. 0.8s 宝珠が降ってくる
        phase = .orbDrop
        orbOpacity = 1
        trailOpacity = 1
        withAnimation(.easeIn(duration: 0.55)) {
            orbOffset = 0
        }
        guard await pause(0.55) else { return }
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        orbScale = 0.86
        withAnimation(.easeOut(duration: 0.35)) {
            trailOpacity = 0
        }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.45)) {
            orbScale = 1
        }
        guard await pause(0.45) else { return }

        // 3. 1.8s ひび割れ・レア度の予告
        phase = .crack
        withAnimation(.easeInOut(duration: 0.05).repeatForever(autoreverses: true)) {
            isShaking = true
        }
        withAnimation(.easeIn(duration: 1.0)) {
            orbScale = 1.4
            crackProgress = 1
        }
        let stages = rarity?.summonHint.stages ?? []
        if stages.isEmpty {
            // ノーマルは色が上がらない
            withAnimation(.easeIn(duration: 0.6)) { hintGlow = 0.35 }
            guard await pause(1.0) else { return }
        } else {
            let step = 1.0 / Double(stages.count)
            for (index, stage) in stages.enumerated() {
                withAnimation(.easeInOut(duration: min(0.25, step))) {
                    hintColor = stage.color ?? GachaTheme.goldLight
                    hintGlow = 0.45 + 0.45 * Double(index + 1) / Double(stages.count)
                    isRainbow = stage == .rainbow
                }
                if stage == .rainbow {
                    withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                        rainbowSpin = true
                    }
                }
                guard await pause(step) else { return }
            }
        }

        // 4. 2.8s 光の柱・ホワイトアウト
        phase = .pillar
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        withAnimation(.linear(duration: 0.01)) { isShaking = false }
        withAnimation(.easeOut(duration: 0.2)) {
            orbOpacity = 0
            orbScale = 1.8
            pillarScale = 1
            pillarOpacity = 1
        }
        withAnimation(.easeIn(duration: 0.1)) { flashOpacity = 1 }
        guard await pause(0.2) else { return }
        withAnimation(.easeOut(duration: 0.5)) { flashOpacity = 0 }
        guard await pause(0.6) else { return }

        // 5. 3.6s 登場
        phase = .reveal
        withAnimation(.easeOut(duration: 0.4)) {
            pillarOpacity = 0
            circleOpacity = 0
            revealOpacity = 1
        }
        withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
            raysRotation = 360
        }
        withAnimation(.easeOut(duration: 0.22)) { avatarScale = 1.08 }
        guard await pause(0.22) else { return }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) { avatarScale = 1 }
        guard await pause(0.13) else { return }
        withAnimation(.spring(response: 0.45, dampingFraction: 0.85)) {
            bannerOffset = 0
            bannerOpacity = 1
        }
        guard await pause(0.85) else { return }
        finish()
    }

    /// Reduce Motion 用：回転・発光のループは使わず、短いフェードだけでつなぐ。
    private func runReducedSequence() async {
        phase = .circle
        circleScale = 1
        orbOffset = 0
        hintColor = rarity?.summonHintColor ?? GachaTheme.goldLight
        hintGlow = rarity?.summonHint == GachaSummonHint.none ? 0.3 : 0.7
        crackProgress = 1
        withAnimation(.easeOut(duration: 0.25)) {
            circleOpacity = 1
            orbOpacity = 1
        }
        guard await pause(0.7) else { return }

        phase = .reveal
        avatarScale = 1
        bannerOffset = 0
        withAnimation(.easeInOut(duration: 0.3)) {
            circleOpacity = 0
            orbOpacity = 0
            revealOpacity = 1
            bannerOpacity = 1
        }
        guard await pause(1.0) else { return }
        finish()
    }

    /// 指定秒待つ。キャンセル・スキップされたら false。
    private func pause(_ seconds: Double) async -> Bool {
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        return !Task.isCancelled && !didFinish
    }

    private func finish() {
        guard !didFinish else { return }
        didFinish = true
        phase = .done
        sequence?.cancel()
        onFinished()
    }
}

/// 宝珠のひび（中心から外へ伸びる折れ線）。
struct GachaOrbCrackShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        // (角度, 半径に対する割合)
        let branches: [[(Double, CGFloat)]] = [
            [(-80, 0.05), (-68, 0.35), (-95, 0.62), (-82, 0.98)],
            [(15, 0.05), (32, 0.4), (8, 0.7), (24, 0.98)],
            [(150, 0.05), (138, 0.45), (166, 0.75), (152, 0.98)],
            [(235, 0.05), (250, 0.5), (226, 0.95)],
            [(-30, 0.4), (-42, 0.75)]
        ]
        var path = Path()
        for branch in branches {
            for (index, point) in branch.enumerated() {
                let angle = point.0 * .pi / 180
                let p = CGPoint(
                    x: center.x + radius * point.1 * CGFloat(cos(angle)),
                    y: center.y + radius * point.1 * CGFloat(sin(angle))
                )
                if index == 0 { path.move(to: p) } else { path.addLine(to: p) }
            }
        }
        return path
    }
}
