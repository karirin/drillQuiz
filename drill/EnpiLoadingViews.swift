import SwiftUI

// えんぴ君のローディング（起動スプラッシュと同じ世界観）。ITクエストのスライム版ローディングに合わせている。

/// えんぴ君系ローディングで共有する色・フォント・定数。
enum EnpiLoadingTheme {
    // MARK: Colors

    /// 画面の背景（ミント）。
    static let background = Color(hex: "EAF7F1")
    /// 本文・見出しの文字。
    static let ink = Color(hex: "1F5E4A")
    /// 補助の文字。
    static let subInk = Color(hex: "46705F")
    /// 枠線。
    static let border = Color(hex: "CBEBDD")
    /// 薄い面（カードの地など）。
    static let surface = Color(hex: "F2FAF6")
    /// 進捗の塗り・アクセント。
    static let accent = Color(hex: "2F9E78")
    /// 金色のアクセント（豆知識の電球など）。
    static let flag = Color(hex: "F2B33D")

    // MARK: Enpi

    /// 起動スプラッシュと同じマスコット画像。
    static let enpiImageName = "えんぴ君"
    /// 拡大縮小の基準点（画像内の足元）。えんぴ君は画像の下端まで体がある。
    static let footAnchor = UnitPoint(x: 0.5, y: 0.99)

    // MARK: Fonts

    /// 見出し用（Dela Gothic One）。
    static func heading(_ size: CGFloat) -> Font {
        .custom("DelaGothicOne-Regular", size: size)
    }

    /// 本文用（SF Rounded）。
    static func body(_ size: CGFloat, weight: Font.Weight = .bold) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}

/// 0...1 を往復する滑らかな波（0 → 1 → 0）。`phase` は周期に対する位置。
func enpiWave(_ phase: Double) -> Double {
    0.5 - 0.5 * cos(phase * 2 * .pi)
}

/// `TimelineView` の時刻から、指定した周期内での位置（0..<1）を返す。
func enpiCyclePhase(_ date: Date, period: Double, delay: Double = 0) -> Double {
    let time = date.timeIntervalSinceReferenceDate - delay
    let phase = time.truncatingRemainder(dividingBy: period) / period
    return phase < 0 ? phase + 1 : phase
}

// MARK: - 跳ねるえんぴ君

/// えんぴ君がその場で跳ね続ける共通部品。
/// デプロイメントターゲットが iOS 16 のため keyframeAnimator は使わず、
/// TimelineView の時刻から1周期（0.9秒）内の姿勢を計算して描く。
struct EnpiHopView: View {
    /// えんぴ君画像（正方形）の一辺。
    let size: CGFloat
    /// 跳ねる高さ（最高点での上方向の移動量）。
    let height: CGFloat
    var period: Double = 0.9

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        TimelineView(.animation(minimumInterval: nil, paused: reduceMotion)) { context in
            let pose = reduceMotion
                ? EnpiHopPose.rest
                : EnpiHopPose.at(enpiCyclePhase(context.date, period: period))
            hop(pose)
        }
        // 跳ねる分の高さもレイアウトに含め、上の要素に重ならないようにする。
        .frame(width: size, height: size + height)
        .accessibilityHidden(true)
    }

    private func hop(_ pose: EnpiHopPose) -> some View {
        let footAnchor = EnpiLoadingTheme.footAnchor
        let feetY = height + size * footAnchor.y

        return ZStack(alignment: .top) {
            Ellipse()
                .fill(EnpiLoadingTheme.ink.opacity(0.16))
                .frame(width: size * 0.46, height: size * 0.09)
                .scaleEffect(1 - 0.4 * pose.lift)
                .opacity(1 - 0.5 * pose.lift)
                .position(x: size / 2, y: feetY)

            Image(EnpiLoadingTheme.enpiImageName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .scaleEffect(x: pose.scaleX, y: pose.scaleY, anchor: footAnchor)
                .offset(y: height - height * pose.lift)
        }
        .frame(width: size, height: size + height, alignment: .top)
    }
}

/// 跳ねる1周期のある瞬間の姿勢。
struct EnpiHopPose {
    var scaleX: CGFloat
    var scaleY: CGFloat
    /// 0 = 接地、1 = 最高点。
    var lift: CGFloat

    static let rest = EnpiHopPose(scaleX: 1, scaleY: 1, lift: 0)

    /// 伸び縮みのキーフレーム（周期に対する位置, scaleX, scaleY）。
    private static let scaleKeyframes: [(time: Double, x: CGFloat, y: CGFloat)] = [
        (0, 1.15, 0.85),     // つぶれ
        (0.15, 0.92, 1.1),   // 伸び
        (0.5, 0.98, 1.03),   // 最高点
        (0.85, 0.95, 1.06),  // 着地前
        (1, 1.15, 0.85)      // つぶれに戻る
    ]

    static func at(_ phase: Double) -> EnpiHopPose {
        var scaleX: CGFloat = 1
        var scaleY: CGFloat = 1
        for (from, to) in zip(scaleKeyframes, scaleKeyframes.dropFirst()) where phase <= to.time {
            let progress = (phase - from.time) / (to.time - from.time)
            let eased = CGFloat(progress * progress * (3 - 2 * progress))
            scaleX = from.x + (to.x - from.x) * eased
            scaleY = from.y + (to.y - from.y) * eased
            break
        }

        // 上りは減速、下りは加速する放物線。
        let lift: Double
        if phase < 0.5 {
            let progress = phase / 0.5
            lift = 1 - (1 - progress) * (1 - progress)
        } else {
            let progress = (phase - 0.5) / 0.5
            lift = 1 - progress * progress
        }

        return EnpiHopPose(scaleX: scaleX, scaleY: scaleY, lift: CGFloat(lift))
    }
}

// MARK: - 全画面

/// 全画面のローディング。跳ねるえんぴ君＋文言＋まめちしきカード。
struct EnpiFullScreenLoadingView: View {
    var message: String = "よみこみ中"

    var body: some View {
        ZStack {
            EnpiLoadingTheme.background.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer(minLength: 24)

                VStack(spacing: 20) {
                    EnpiHopView(size: 170, height: 46)
                    EnpiLoadingMessage(message: message)
                }

                Spacer(minLength: 24)

                EnpiTipCard()
                    .padding(.horizontal, 24)
                    .padding(.bottom, 64)
            }
        }
    }
}

/// 「よみこみ中...」の文言。点は3つが0.2秒ずつずれて明滅する。
struct EnpiLoadingMessage: View {
    let message: String
    var font: Font = EnpiLoadingTheme.body(17)

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        HStack(spacing: 0) {
            Text(message)
            TimelineView(.animation(minimumInterval: nil, paused: reduceMotion)) { context in
                HStack(spacing: 0) {
                    ForEach(0..<3, id: \.self) { index in
                        Text(".")
                            .opacity(dotOpacity(index: index, date: context.date))
                    }
                }
            }
        }
        .font(font)
        .foregroundStyle(EnpiLoadingTheme.ink)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(message)
    }

    private func dotOpacity(index: Int, date: Date) -> Double {
        guard !reduceMotion else { return 1 }
        let wave = enpiWave(enpiCyclePhase(date, period: 1.2, delay: Double(index) * 0.2))
        return 0.25 + 0.75 * wave
    }
}

/// 下部の「まめちしき」カード。4秒ごとに切り替える。
struct EnpiTipCard: View {
    @State private var tips = EnpiLoadingTips.pick()
    @State private var index = 0

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: "lightbulb")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(EnpiLoadingTheme.flag)
                    .accessibilityHidden(true)
                Text("まめちしき")
                    .font(EnpiLoadingTheme.heading(14))
                    .foregroundStyle(EnpiLoadingTheme.ink)
                    .accessibilityAddTraits(.isHeader)
            }

            ZStack(alignment: .topLeading) {
                Text(tips[index])
                    .font(EnpiLoadingTheme.body(14, weight: .medium))
                    .foregroundStyle(EnpiLoadingTheme.subInk)
                    .lineSpacing(4)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .id(index)
                    .transition(tipTransition)
            }
            .frame(minHeight: 66, alignment: .topLeading)

            HStack(spacing: 6) {
                ForEach(tips.indices, id: \.self) { dot in
                    Capsule()
                        .fill(dot == index ? EnpiLoadingTheme.accent : EnpiLoadingTheme.border)
                        .frame(width: dot == index ? 18 : 6, height: 6)
                }
            }
            .frame(maxWidth: .infinity)
            .accessibilityHidden(true)
        }
        .padding(18)
        .background(Color.white, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(EnpiLoadingTheme.border, lineWidth: 2)
        )
        .accessibilityElement(children: .combine)
        .task {
            guard tips.count > 1 else { return }
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                guard !Task.isCancelled else { return }
                withAnimation(.easeInOut(duration: 0.35)) {
                    index = (index + 1) % tips.count
                }
            }
        }
    }

    private var tipTransition: AnyTransition {
        if reduceMotion {
            return .opacity
        }
        return .asymmetric(
            insertion: .opacity.combined(with: .offset(y: 6)),
            removal: .opacity
        )
    }
}

/// ローディング中に出す小学生向けのまめちしき。
enum EnpiLoadingTips {
    static let all = [
        "日本でいちばん高い山は富士山（ふじさん）。高さは3776mだよ。",
        "日本でいちばん長い川は信濃川（しなのがわ）だよ。",
        "日本の都道府県は47。いちばん広いのは北海道だよ。",
        "こん虫の足は6本。クモは足が8本だから、こん虫のなかまじゃないよ。",
        "月は自分では光らないよ。太陽の光をはね返してかがやいているんだ。",
        "地球が1日に1回まわっているから、朝と夜がくるんだよ。",
        "「山」や「川」は、ものの形からできた漢字だよ。",
        "1mは100cm、1cmは10mm。ものさしでたしかめてみよう。",
        "1年はふつう365日。4年に1回くらい、366日の「うるう年」があるよ。",
        "水を冷やして0℃になると、こおりになりはじめるよ。"
    ]

    static func pick(count: Int = 5) -> [String] {
        Array(all.shuffled().prefix(count))
    }
}

// MARK: - カードの中

/// カードの中で使うローディング。跳ねるえんぴ君＋文言。
struct EnpiCardLoadingView: View {
    let message: String

    var body: some View {
        VStack(spacing: 10) {
            EnpiHopView(size: 70, height: 18)
            Text(message)
                .font(EnpiLoadingTheme.body(15))
                .foregroundStyle(EnpiLoadingTheme.ink)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 168)
        .background(EnpiLoadingTheme.surface, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(EnpiLoadingTheme.border, lineWidth: 1.5)
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(message)
    }
}

// MARK: - Previews

#Preview("全画面") {
    EnpiFullScreenLoadingView()
}

#Preview("カード") {
    EnpiCardLoadingView(message: "学習記録を読み込み中")
        .padding(20)
        .background(Color.white)
}

#Preview("EnpiHopView") {
    HStack(alignment: .bottom, spacing: 32) {
        EnpiHopView(size: 170, height: 46)
        EnpiHopView(size: 70, height: 18)
    }
    .padding(32)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(EnpiLoadingTheme.background)
}
