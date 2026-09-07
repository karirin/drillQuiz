//
//  ContentView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/16.
//

import SwiftUI
import AVFoundation

struct ViewPositionKey: PreferenceKey {
    static var defaultValue: [CGRect] = []
    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct ModernUserNameBar: View {
    let userName: String
    let onTapRegister: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 32, height: 32)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                )

            if userName.isEmpty {
                Button(action: onTapRegister) {
                    HStack(spacing: 4) {
                        Text("名前を登録")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        LinearGradient(
                            colors: [Color.orange, Color.red.opacity(0.8)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                }
            } else {
                Text(userName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("fontGray"))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .layoutPriority(1)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: 220, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

struct ModernCoinBar: View {
    let coins: Int
    @State private var isAnimating = false
    
    var body: some View {
        HStack(spacing: 6) {
            // コインアイコン
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.yellow, Color.orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 24, height: 24)
                    .shadow(color: .orange.opacity(0.5), radius: 3, x: 0, y: 2)
                
                Text("¢")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
            }
            .scaleEffect(isAnimating ? 1.1 : 1.0)
            
            Text("\(coins)")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(Color("fontGray"))
                .contentTransition(.numericText())
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .strokeBorder(
                            LinearGradient(
                                colors: [Color.yellow.opacity(0.5), Color.orange.opacity(0.3)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1.5
                        )
                )
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
        )
        .onChange(of: coins) { _ in
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isAnimating = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isAnimating = false
            }
        }
    }
}

struct ModernLevelBar: View {
    let level: Int
    let experience: Int
    let maxExperience: Int
    
    private var progress: CGFloat {
        guard maxExperience > 0 else { return 0 }
        return CGFloat(experience) / CGFloat(maxExperience)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            // レベルバッジ
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.purple, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                    .shadow(color: .purple.opacity(0.4), radius: 4, x: 0, y: 2)
                
                VStack(spacing: -2) {
                    Text("Lv")
                        .font(.system(size: 9, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                    Text("\(level)")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            
            // 経験値バー
            ProgressExpBar(level: level, experience: experience)
//            VStack(alignment: .leading, spacing: 4) {
//                HStack {
//                    Text("経験値")
//                        .font(.system(size: 11, weight: .medium))
//                        .foregroundColor(.secondary)
//                    Spacer()
//                    Text("\(experience) / \(maxExperience)")
//                        .font(.system(size: 11, weight: .semibold, design: .rounded))
//                        .foregroundColor(Color("fontGray"))
//                }
//
//                GeometryReader { geometry in
//                    ZStack(alignment: .leading) {
//                        // 背景
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(Color.gray.opacity(0.2))
//
//                        // プログレス
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(
//                                LinearGradient(
//                                    colors: [Color.blue, Color.purple],
//                                    startPoint: .leading,
//                                    endPoint: .trailing
//                                )
//                            )
//                            .frame(width: geometry.size.width * progress)
//                            .animation(.spring(response: 0.5, dampingFraction: 0.8), value: progress)
//
//                        // シャイン効果
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(
//                                LinearGradient(
//                                    colors: [.white.opacity(0.3), .clear],
//                                    startPoint: .top,
//                                    endPoint: .center
//                                )
//                            )
//                            .frame(width: geometry.size.width * progress)
//                    }
//                }
//                .frame(height: 12)
//            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
        )
    }
}

struct ModernStatusCard: View {
    let avatarName: String
    let baseHp: Int
    let bonusHp: Int
    let baseAttack: Int
    let bonusAttack: Int

    private var displayAvatarName: String {
        avatarName.isEmpty ? "defaultIcon" : avatarName
    }

    private var totalHp: Int {
        baseHp + bonusHp
    }

    private var totalAttack: Int {
        baseAttack + bonusAttack
    }

    private var totalAttackText: String {
        PositionViewModel.isDeveloperMode ? "∞" : "\(totalAttack)"
    }

    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: isSmallDevice() ? 0 : -20) {
                ZStack {
                    Image(displayAvatarName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isSmallDevice() ? 150 : 200)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: 0)
                }
                .padding(.trailing, 20)

                VStack {
                    VStack(spacing: 0) {
                        ZStack {
                            Image("ハートバー")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("\(totalHp)")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20))
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .padding(.leading, 45)
                                .padding(.top, 10)
                        }

                        ZStack {
                            Image("上昇バー１")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            HStack(spacing: 0) {
                                Text("＋\(bonusHp)")
                                    .padding(.top, 3)
                                    .font(.system(size: 18))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.7)
                                Image(displayAvatarName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: isSmallDevice() ? 30 : 40)
                                    .padding(.top, 8)
                            }
                            .padding(.leading, 40)
                            .frame(minWidth: isSmallDevice() ? 92 : 108, alignment: .leading)
                        }
                        .padding(.leading, 40)
                    }

                    VStack(spacing: 0) {
                        ZStack {
                            Image("攻撃バー")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text(totalAttackText)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 45)
                                .padding(.top, 8)
                                .font(.system(size: 20))
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                        }

                        ZStack {
                            Image("上昇バー２")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            HStack(spacing: 0) {
                                Text("＋\(bonusAttack)")
                                    .padding(.top, 3)
                                    .font(.system(size: 18))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.7)
                                Image(displayAvatarName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: isSmallDevice() ? 30 : 40)
                                    .padding(.top, 8)
                            }
                            .padding(.leading, 40)
                            .frame(minWidth: isSmallDevice() ? 92 : 108, alignment: .leading)
                        }
                        .padding(.leading, 40)
                    }
                }
                .padding(.top, isSmallDevice() ? 10 : 0)
            }
        }
    }
}

// MARK: - Compact Home (itQuizと同じデザイン言語のホーム画面コンポーネント)

// 画面地・面・文字は共通トークン(SocialPalette)へ集約済み。
// canvas → SocialPalette.canvas / card → SocialPalette.cardOpaque /
// primaryText・secondaryText → SocialPalette.* / divider → SocialPalette.hairline /
// shadow → SocialPalette.cardShadow

private enum CompactHomeIcon {
    case asset(String)
    case symbol(String)
}

private struct CompactHomeSectionHeader: View {
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(SocialPalette.primaryText)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background {
                    Capsule()
                        .fill(.thinMaterial)
                        .overlay {
                            Capsule()
                                .fill(Color.white.opacity(0.48))
                        }
                }
                .overlay {
                    Capsule()
                        .strokeBorder(Color.white.opacity(0.88), lineWidth: 0.8)
                }
                .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 2)

            Rectangle()
                .fill(Color.white.opacity(0.82))
                .frame(height: 1)
                .shadow(color: Color.black.opacity(0.16), radius: 1, x: 0, y: 1)
        }
        .accessibilityAddTraits(.isHeader)
    }
}

struct PressedEffectStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

private struct CompactHomeFeatureCard: View {
    let title: String
    let subtitle: String
    let icon: CompactHomeIcon
    let accent: Color
    var badge: Int = 0
    var progress: Double? = nil
    var progressLabel: String? = nil
    var artworkName: String? = nil
    var artworkIsSquare: Bool = false
    var artworkIsWide: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            if let artworkName {
                artworkView(artworkName)
                    .overlay(alignment: .topTrailing) {
                        notificationBadge
                            .padding(10)
                    }
            } else {
                HStack(spacing: 10) {
                    iconView
                        .overlay(alignment: .topTrailing) {
                            notificationBadge
                                .offset(x: 4, y: -4)
                        }

                    VStack(alignment: .leading, spacing: 3) {
                        Text(title)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(SocialPalette.primaryText)
                            .lineLimit(1)

                        if let progress {
                            HStack(spacing: 6) {
                                GeometryReader { proxy in
                                    ZStack(alignment: .leading) {
                                        Capsule().fill(Color(uiColor: .systemGray5))
                                        Capsule()
                                            .fill(accent)
                                            .frame(width: proxy.size.width * min(max(progress, 0), 1))
                                    }
                                }
                                .frame(height: 5)

                                if let progressLabel {
                                    Text(progressLabel)
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundStyle(accent)
                                        .lineLimit(1)
                                }
                            }
                        } else {
                            Text(subtitle)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(SocialPalette.secondaryText)
                                .lineLimit(1)
                        }
                    }

                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, minHeight: 66, alignment: .leading)
                .background {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .overlay {
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.34),
                                            Color.white.opacity(0.12)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.72), lineWidth: 0.8)
                }
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
                .contentShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
        }
        .buttonStyle(PressedEffectStyle())
        .accessibilityLabel(
            badge > 0
                ? "\(title)、\(subtitle)、新着\(badge)件"
                : "\(title)、\(subtitle)"
        )
    }

    @ViewBuilder
    private func artworkView(_ name: String) -> some View {
        if artworkIsSquare {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.34),
                                        Color.white.opacity(0.12)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }

                GeometryReader { proxy in
                    Image(name)
                        .resizable()
                        .interpolation(.high)
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .clipped()
                }
                .padding(8)
            }
            .aspectRatio(1.22, contentMode: .fit)
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(Color.white.opacity(0.72), lineWidth: 0.8)
            }
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
            .contentShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        } else if artworkIsWide {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.34),
                                        Color.white.opacity(0.12)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }

                GeometryReader { proxy in
                    Image(name)
                        .resizable()
                        .interpolation(.high)
                        .scaledToFit()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
                .padding(6)
            }
            .aspectRatio(3.65, contentMode: .fit)
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(Color.white.opacity(0.72), lineWidth: 0.8)
            }
            .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
            .contentShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        } else {
            Image(name)
                .resizable()
                .interpolation(.high)
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 66)
                .contentShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
    }

    @ViewBuilder
    private var notificationBadge: some View {
        if badge > 0 {
            Text("\(min(badge, 99))")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .padding(.horizontal, 6)
                .frame(minWidth: 19, minHeight: 19)
                .background(Color(red: 0.96, green: 0.32, blue: 0.43), in: Capsule())
                .accessibilityLabel("通知\(badge)件")
        }
    }

    @ViewBuilder
    private var iconView: some View {
        switch icon {
        case .asset(let name):
            Image(name)
                .resizable()
                .interpolation(.high)
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .accessibilityHidden(true)
        case .symbol(let name):
            Image(systemName: name)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(accent, in: RoundedRectangle(cornerRadius: 9, style: .continuous))
        }
    }
}

private struct CompactHomeProfileCard: View {
    let userName: String
    let avatarName: String
    let coins: Int
    let level: Int
    let experience: Int
    let maxExperience: Int
    let hp: Int
    let hpBonus: Int
    let attack: Int
    let attackBonus: Int
    let registerName: () -> Void

    private var progress: Double {
        guard maxExperience > 0 else { return 0 }
        return min(max(Double(experience) / Double(maxExperience), 0), 1)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Color.clear
                .frame(width: 72, height: 82)
                .overlay(
                    Image(avatarName.isEmpty ? "defaultIcon" : avatarName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 108, height: 123)
                )
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 7) {
                HStack(spacing: 6) {
                    Text(userName.isEmpty ? "ゲスト" : userName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(SocialPalette.primaryText)
                        .lineLimit(1)

                    if userName.isEmpty {
                        Button(action: registerName) {
                            Label("名前を登録", systemImage: "pencil")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(Color.pink)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 4)
                                .background(Color.pink.opacity(0.1), in: Capsule())
                        }
                        .buttonStyle(.plain)
                    }

                    Spacer(minLength: 4)

                    Label("\(coins)", systemImage: "dollarsign.circle.fill")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundStyle(Color(red: 0.64, green: 0.43, blue: 0.04))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.yellow.opacity(0.2), in: Capsule())
                }

                HStack(spacing: 8) {
                    Text("Lv.\(level)")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(Color.indigo)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.indigo.opacity(0.1), in: Capsule())

                    GeometryReader { proxy in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color(uiColor: .systemGray5))
                            Capsule()
                                .fill(LinearGradient(colors: [.indigo, .purple], startPoint: .leading, endPoint: .trailing))
                                .frame(width: proxy.size.width * progress)
                        }
                    }
                    .frame(height: 7)

                    Text("\(experience) / \(maxExperience)")
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .foregroundStyle(SocialPalette.secondaryText)
                        .monospacedDigit()
                }

                HStack(spacing: 8) {
                    statChip(symbol: "heart.fill", title: "HP \(hp)", bonus: hpBonus, color: .pink)
                    statChip(symbol: "bolt.fill", title: "攻撃 \(attack)", bonus: attackBonus, color: .orange)
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.34),
                                    Color.white.opacity(0.12)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .strokeBorder(Color.white.opacity(0.72), lineWidth: 0.8)
        }
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

    private func statChip(symbol: String, title: String, bonus: Int, color: Color) -> some View {
        HStack(spacing: 4) {
            Image(systemName: symbol)
                .fixedSize()
            Text(title)
                .fixedSize(horizontal: true, vertical: false)
                .layoutPriority(1)

            if bonus > 0 {
                Spacer(minLength: 0)

                HStack(spacing: 3) {
                    Image(avatarName.isEmpty ? "defaultIcon" : avatarName)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .clipShape(Circle())
                        .fixedSize()

                    Text("+\(bonus)")
                        .font(.system(size: 9, weight: .bold, design: .rounded))
                        .foregroundStyle(color)
                        .monospacedDigit()
                        .fixedSize(horizontal: true, vertical: false)
                }
                .frame(width: 54, height: 24)
                .background(Color.white.opacity(0.58), in: Capsule())
                .fixedSize(horizontal: true, vertical: false)
                .layoutPriority(3)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("おともによる補正、プラス\(bonus)")
            }
        }
        .font(.system(size: 9.5, weight: .bold))
        .foregroundStyle(color)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 7)
        .padding(.vertical, 3)
        .background(color.opacity(0.1), in: Capsule())
        .accessibilityElement(children: .contain)
    }
}

struct ContentView: View {
    @ObservedObject var authManager = AuthManager.shared
    @State private var userName: String = ""
    @State private var avatar: [[String: Any]] = []
    @State private var userMoney: Int = 0
    @State private var userHp: Int = 100
    @State private var userCsFlag: Int = 0
    @State private var userAttack: Int = 20
    @State private var tutorialNum: Int = 0
    @State private var isButtonEnabled: Bool = true
    @State private var lastClickedDate: Date?
    @State private var isPresentingQuizBeginnerList: Bool = false
    @State private var isPresentingSettingList: Bool = false
    @State private var isPresentingQuizList: Bool = false
    @State private var isIntermediateQuizActive: Bool = false
    @State private var isPresentingStoryView: Bool = false
    @State private var isPresentingGachaView: Bool = false
    @State private var isPresentingAvatarList: Bool = false
    @State private var isPresentingSettingView: Bool = false
    @State private var isPresentingTimeAttakView: Bool = false
    @State private var isPresentingTittleView: Bool = false
    @State private var isPresentingIllustratedView: Bool = false
    @State private var isPresentingPentagonView: Bool = false
    @State private var isPresentingRankingView: Bool = false
    @ObservedObject private var friendManager = FriendManager.shared
    @ObservedObject private var guildManager = GuildManager.shared
    @ObservedObject private var battleManager = BattleManager.shared
    @ObservedObject private var missionManager = MissionManager.shared
    @State private var isPresentingFriendView: Bool = false
    @State private var isPresentingGuildView: Bool = false
    @State private var isPresentingWeeklyLeagueView: Bool = false
    @State private var isPresentingMissionView: Bool = false
    @State private var audioPlayerKettei: AVAudioPlayer?
    @ObservedObject var audioManager = AudioManager.shared
    @State private var showTutorial = true
    @State private var buttonRect: CGRect = .zero
    @State private var bubbleHeight: CGFloat = 0.0
    @State private var isSoundOn: Bool = true
    @State private var isLoading: Bool = true
    @State private var isShowingLoginBonus = false
//    @ObservedObject var interstitial = Interstitial()
    @StateObject var reward = Reward()
    @State private var rewardFlag: Int = 0
    @State private var customerFlag: Bool = false
    @Environment(\.requestReview) var requestReview
    @State private var userPreFlag: Int = 0
    @State private var preFlag: Bool = false
    @State private var startFlag: Bool = false
    @State private var isFlag: Bool = false
    @State private var showCreateButton: Bool = false
    @State private var selectedAvatar: Avatar?
    @State private var isUserExists: Bool? = nil
    @State private var csFlag: Bool = false
    @State private var helpFlag: Bool = false
    @State private var showLoginBonus: Bool = false
    @State private var currentBonus: Int = 0
    @State private var loginCount: Int = 0
    @State private var tutorialPulse: Bool = false
    @State private var isPresentingTraining: Bool = false
    @State private var updateNameFlag: Bool = false
    @State private var hasBootstrapped = false
    @State private var hasLoadedDeferredHomeData = false
    private static let homeLoadingTimeout: TimeInterval = 8
    private let initialLaunchKey = "hasLaunchedBeforeOnappear"
    private let introOptOutKey = "hasOptedOutOfIntroTutorial"
    
    private var maxExperience: Int {
        return 100 // または authManager から取得
    }

    private var avatarName: String {
        avatar.first?["name"] as? String ?? ""
    }

    private var avatarBonusHp: Int {
        avatar.first?["health"] as? Int ?? 0
    }

    private var avatarBonusAttack: Int {
        avatar.first?["attack"] as? Int ?? 0
    }

    private var friendNotificationCount: Int {
        friendManager.incomingRequests.count + friendManager.pendingThanksCount
    }

    private var guildNotificationCount: Int {
        let claimableMissions = guildManager.missionProgresses.filter { $0.isCompleted && !$0.isClaimed }.count
        return claimableMissions + guildManager.claimableRankRewards.count
    }

    private var guildMissionProgress: Double? {
        guildManager.myGuildId != nil ? guildManager.guildLevelState.progressValue : nil
    }

    private var guildProgressLabel: String? {
        guildManager.myGuildId != nil ? "Lv.\(guildManager.guildLevelState.level)" : nil
    }

    var body: some View {
        NavigationView {
            ZStack{
                if isLoading {
                    VStack{
                        ActivityIndicator()
                    }
                        .frame(maxWidth:.infinity,maxHeight:.infinity)
                } else {
                    VStack {
                        if userPreFlag != 1 {
                            // 下のZStackの背景画像が .ignoresSafeArea() で上方向にはみ出し、
                            // バナーを覆って見えなくなるため、描画順を明示的に前面へ上げる。
                            BannerAdView()
                                .zIndex(1)
                        }
                        ZStack{
                            // LazyVStack内に置くと画面外では未描画のままになり遷移が発火しないため、
                            // ScrollViewの外(常に描画される場所)にNavigationLinkをまとめて置く。
                            Group {
                                NavigationLink("", destination: ManagerView().navigationBarBackButtonHidden(true), isActive: $isPresentingQuizList)
                                NavigationLink("", destination: GachaManagerView().navigationBarBackButtonHidden(true), isActive: $isPresentingGachaView)
                                NavigationLink("", destination: IllustratedView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingIllustratedView)
                                NavigationLink("", destination: TittlesView(isPresenting: .constant(false)).navigationBarBackButtonHidden(true), isActive: $isPresentingTittleView)
                                NavigationLink("", destination: RankingView(audioManager: audioManager).navigationBarBackButtonHidden(true), isActive: $isPresentingRankingView)
                                NavigationLink("", destination: ContactView(audioManager: AudioManager()).navigationBarBackButtonHidden(true), isActive: $isPresentingSettingView)
                                NavigationLink("", destination: StoryView(isReturnActive: .constant(true), isPresented: $isPresentingTraining).navigationBarBackButtonHidden(true), isActive: $isPresentingTraining)
                            }
                            Group {
                                NavigationLink("", destination: FriendListView().navigationBarBackButtonHidden(true), isActive: $isPresentingFriendView)
                                NavigationLink("", destination: GuildEntryView().navigationBarBackButtonHidden(true), isActive: $isPresentingGuildView)
                                NavigationLink("", destination: WeeklyLeagueView().navigationBarBackButtonHidden(true), isActive: $isPresentingWeeklyLeagueView)
                                NavigationLink("", destination: MissionView(), isActive: $isPresentingMissionView)
                            }
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack(spacing: 10) {
                                    CompactHomeProfileCard(
                                        userName: userName,
                                        avatarName: avatarName,
                                        coins: userMoney,
                                        level: authManager.level,
                                        experience: authManager.experience,
                                        maxExperience: maxExperience,
                                        hp: userHp + avatarBonusHp,
                                        hpBonus: avatarBonusHp,
                                        attack: userAttack + avatarBonusAttack,
                                        attackBonus: avatarBonusAttack,
                                        registerName: {
                                            generateHapticFeedback()
                                            updateNameFlag = true
                                        }
                                    )
                                    .onChange(of: updateNameFlag) { _ in
                                        authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                                            self.userName = name ?? ""
                                            self.avatar = avatar ?? [[String: Any]]()
                                            self.userMoney = money ?? 0
                                            self.userHp = hp ?? 100
                                            self.userAttack = attack ?? 20
                                            self.tutorialNum = tutorialNum ?? 0
                                            self.isLoading = false
                                        }
                                    }

                                    CompactHomeSectionHeader(title: "挑戦する")

                                    LazyVGrid(
                                        columns: [
                                            GridItem(.flexible(), spacing: 8),
                                            GridItem(.flexible(), spacing: 8)
                                        ],
                                        spacing: 8
                                    ) {
                                        CompactHomeFeatureCard(
                                            title: "ダンジョン",
                                            subtitle: "スタミナを確認",
                                            icon: .asset("HomeDungeonIcon"),
                                            accent: .orange,
                                            artworkName: "HomeDungeonButtonSquare",
                                            artworkIsSquare: true
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingTraining = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "学習モード",
                                            subtitle: "4教科から選ぶ",
                                            icon: .asset("HomeTrainingIcon"),
                                            accent: .green,
                                            artworkName: "HomeTrainingButtonSquare",
                                            artworkIsSquare: true
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingQuizList = true
                                            audioManager.playSound()
                                        }
                                        .background(GeometryReader { geometry in
                                            Color.clear.preference(key: ViewPositionKey.self, value: [geometry.frame(in: .global)])
                                        })

                                        CompactHomeFeatureCard(
                                            title: "週間リーグ",
                                            subtitle: battleManager.incomingBattles.isEmpty
                                                ? "今週の順位を確認"
                                                : "対戦できみの番です",
                                            icon: .asset("HomeWeeklyLeagueIcon"),
                                            accent: Color(red: 0.82, green: 0.59, blue: 0.04),
                                            badge: battleManager.incomingBattles.count
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingWeeklyLeagueView = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "ミッション",
                                            subtitle: missionManager.totalClaimableCount > 0
                                                ? "達成報酬を受け取ろう"
                                                : "今日の目標を確認",
                                            icon: .asset("HomeMissionIcon"),
                                            accent: Color(red: 0.25, green: 0.48, blue: 0.95),
                                            badge: missionManager.totalClaimableCount
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingMissionView = true
                                            audioManager.playSound()
                                        }
                                    }

                                    CompactHomeSectionHeader(title: "みんなで")

                                    LazyVGrid(
                                        columns: [
                                            GridItem(.flexible(), spacing: 8),
                                            GridItem(.flexible(), spacing: 8)
                                        ],
                                        spacing: 8
                                    ) {
                                        CompactHomeFeatureCard(
                                            title: "フレンド",
                                            subtitle: friendNotificationCount == 0
                                                ? "フレンドとつながろう"
                                                : "新着情報があります",
                                            icon: .asset("HomeFriendIcon"),
                                            accent: Color(red: 0.94, green: 0.35, blue: 0.65),
                                            badge: friendNotificationCount
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingFriendView = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "ギルド",
                                            subtitle: guildManager.guild?.name ?? "仲間と一緒に強くなろう",
                                            icon: .asset("HomeGuildIcon"),
                                            accent: Color(red: 0.05, green: 0.71, blue: 0.49),
                                            badge: guildNotificationCount,
                                            progress: guildMissionProgress,
                                            progressLabel: guildProgressLabel
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingGuildView = true
                                            audioManager.playSound()
                                        }
                                    }

                                    CompactHomeSectionHeader(title: "あつめる")

                                    LazyVGrid(
                                        columns: [
                                            GridItem(.flexible(), spacing: 8),
                                            GridItem(.flexible(), spacing: 8)
                                        ],
                                        spacing: 8
                                    ) {
                                        CompactHomeFeatureCard(
                                            title: "ガチャ",
                                            subtitle: "コインでおともを獲得",
                                            icon: .asset("HomeGachaIcon"),
                                            accent: .pink
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingGachaView = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "ランキング",
                                            subtitle: "みんなの記録を確認",
                                            icon: .asset("HomeRankingIcon"),
                                            accent: .purple
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingRankingView = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "おとも図鑑",
                                            subtitle: "集めたおともを見る",
                                            icon: .asset("HomeCompanionDexIcon"),
                                            accent: .teal
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingIllustratedView = true
                                            audioManager.playSound()
                                        }

                                        CompactHomeFeatureCard(
                                            title: "称号",
                                            subtitle: "実績で称号を獲得",
                                            icon: .asset("HomeTitleIcon"),
                                            accent: .orange
                                        ) {
                                            generateHapticFeedback()
                                            self.isPresentingTittleView = true
                                            audioManager.playSound()
                                        }
                                    }

                                }
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                .padding(.bottom, 12)
                            }
                        }
                        .background {
                            Image("HomeBackgroundAdventure")
                                .resizable()
                                .interpolation(.high)
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .clipped()
                                .ignoresSafeArea()
                                .allowsHitTesting(false)
                        }
                    }
                    .onPreferenceChange(ViewPositionKey.self) { positions in
                        self.buttonRect = positions.first ?? .zero
                    }
                }
                if showLoginBonus {
                    LoginBonusModernView(
                        isPresented: $showLoginBonus,
                        loginCount: loginCount,
                        currentBonus: currentBonus,
                        authManager: authManager,
                        onCollected: {
                            authManager.getUserMoney { money in
                                self.userMoney = money
                            }
                        }
                    )
                }
                if csFlag {
                    ReviewView(isPresented: $csFlag, helpFlag: $helpFlag)
                }
                
                if helpFlag {
                    HelpModalView(isPresented: $helpFlag)
                }
                
                if startFlag {
                    TutorialModalView(isPresented: $startFlag, isFlag: $isFlag, showAlert: $startFlag)
                }
                
                if customerFlag == true {
                    HelpModalView(isPresented: $customerFlag)
                }
                
                if isFlag {
                    ChangeNameView(isPresented: $isFlag, isReturnBtn: .constant(false), tutorialNum: $tutorialNum, initialUserName: userName, authManager: authManager)
                }
                
                if updateNameFlag {
                    ChangeNameView(isPresented: $updateNameFlag, isReturnBtn: .constant(true), tutorialNum: $tutorialNum, initialUserName: userName, authManager: authManager)
                }
                
                if tutorialNum == 1 {
                    GeometryReader { geometry in
                        let origin = geometry.frame(in: .global).origin
                        let localX = buttonRect.midX - origin.x
                        let localY = buttonRect.midY - origin.y
                        let cutoutWidth = max(buttonRect.width, 0)
                        let cutoutHeight = max(buttonRect.height, 0)

                        Color.black.opacity(0.6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .frame(width: cutoutWidth, height: cutoutHeight)
                                    .position(x: localX, y: localY)
                                    .blendMode(.destinationOut)
                            )
                            .compositingGroup()
                    }
                    .ignoresSafeArea()

                    GeometryReader { geometry in
                        let origin = geometry.frame(in: .global).origin
                        let localX = buttonRect.midX - origin.x
                        let localY = buttonRect.midY - origin.y
                        let cutoutWidth = max(buttonRect.width, 0)
                        let cutoutHeight = max(buttonRect.height, 0)

                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(QuizColors.primaryGradientStart, lineWidth: 3)
                            .frame(width: cutoutWidth, height: cutoutHeight)
                            .position(x: localX, y: localY)
                            .scaleEffect(tutorialPulse ? 1.05 : 1.0)
                            .opacity(tutorialPulse ? 0.6 : 1.0)
                    }
                    .ignoresSafeArea()

                    VStack {
                        Spacer()
                            .frame(height: buttonRect.minY - bubbleHeight)
                        VStack(spacing: 10) {
                            HStack(spacing: 4) {
                                Text("STEP 1")
                                    .font(.system(size: 11, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(
                                        LinearGradient(
                                            colors: [QuizColors.primaryGradientStart, QuizColors.primaryGradientEnd],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .clipShape(Capsule())
                            }

                            Image(systemName: "hand.tap.fill")
                                .font(.system(size: 28))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [QuizColors.primaryGradientStart, QuizColors.primaryGradientEnd],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )

                            Text("「学習モード」をタップ")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color("fontGray"))

                            Text("クイズに挑戦してみましょう")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 28)
                        .padding(.vertical, 22)
                        .background(Color("Color2"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black.opacity(0.2), radius: 15, y: 8)
                        .background(GeometryReader { geometry in
                            Path { _ in
                                DispatchQueue.main.async {
                                    self.bubbleHeight = geometry.size.height + 16
                                }
                            }
                        })
                        Spacer()
                    }
                    .ignoresSafeArea()

                    VStack {
                        HStack {
                            Button(action: {
                                generateHapticFeedback()
                                tutorialNum = 0
                                authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 0) { _ in
                                }
                            }) {
                                HStack(spacing: 6) {
                                    Image(systemName: "forward.fill")
                                        .font(.system(size: 12))
                                    Text("スキップ")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Capsule())
                            }
                            .padding(.leading, 20)
                            .padding(.top, 60)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            .onTapGesture {
                if tutorialNum == 1 {
                    audioManager.playSound()
                    tutorialNum = 0 // タップでチュートリアルを終了
                    authManager.updateTutorialNum(userId: authManager.currentUserId ?? "", tutorialNum: 2) { success in
                        // データベースのアップデートが成功したかどうかをハンドリング
                    }
                }
            }
                        .background(Color("Color2"))
                        .navigationBarHidden(true)
            }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .simultaneousGesture(
            TapGesture().onEnded {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                to: nil, from: nil, for: nil)
            }
        )
        .onAppear {
            scheduleHomeLoadingFallback()
            bootstrapIfNeeded()
        }
        .fullScreenCover(isPresented: $preFlag) {
            PreView(audioManager: audioManager)
        }
        .onChange(of: isPresentingQuizList) { isPresenting in
            fetchUserInfoIfNeeded(isPresenting: isPresenting)
            authManager.fetchUserExperienceAndLevel()
            authManager.fetchUserRewardFlag()
        }
        .onChange(of: isPresentingAvatarList) { isPresenting in
            fetchUserInfoIfNeeded(isPresenting: isPresenting)
            authManager.fetchUserExperienceAndLevel()
            authManager.fetchUserRewardFlag()
        }
        .background(Color("purple2").opacity(0.6))
        .onChange(of: tutorialNum) { num in
            if num == 1 {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    tutorialPulse = true
                }
            } else {
                tutorialPulse = false
            }
        }
        }
    func fetchUserInfoIfNeeded(isPresenting: Bool) {
        if !isPresenting {
            authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
                self.userName = name ?? ""
                self.avatar = avatar ?? [[String: Any]]()
                self.userMoney = money ?? 0
                self.userHp = hp ?? 100
                self.userAttack = attack ?? 20
                self.tutorialNum = tutorialNum ?? 0
            }
            authManager.fetchCurrentLoginStreak { streakCount in
                self.loginCount = streakCount
            }
        }
    }
    
    private func scheduleHomeLoadingFallback() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Self.homeLoadingTimeout) {
            guard isLoading else { return }
            print("Home loading timed out. Showing the home screen with available data.")
            isLoading = false
        }
    }

    private func bootstrapIfNeeded() {
        guard !hasBootstrapped else { return }
        hasBootstrapped = true
        
        if authManager.currentUserId != nil {
            performInitialLoad()
            return
        }
        
        authManager.onLoginCompleted = {
            DispatchQueue.main.async {
                self.authManager.onLoginCompleted = nil
                self.performInitialLoad()
            }
        }
        authManager.anonymousSignIn {
            DispatchQueue.main.async {
                guard self.authManager.currentUserId == nil else { return }
                self.hasBootstrapped = false
                self.isLoading = false
            }
        }
    }
    
    private func performInitialLoad() {
        guard let userId = authManager.currentUserId else {
            hasBootstrapped = false
            return
        }
        
        let userDefaults = UserDefaults.standard
        if !userDefaults.bool(forKey: initialLaunchKey) {
            userDefaults.set(true, forKey: initialLaunchKey)
            userDefaults.synchronize()
            showCreateButton = true
            let shouldShowIntro = !userDefaults.bool(forKey: introOptOutKey)
            authManager.saveUserToDatabase(userName: userName) { success in
                if success {
                    refreshUserInfo {
                        self.startFlag = shouldShowIntro
                        loadDeferredHomeData(userId: userId)
                    }
                } else {
                    refreshUserInfo {
                        self.startFlag = shouldShowIntro
                    }
                }
            }
            return
        }
        
        authManager.checkIfUserIdExists(userId: userId) { exists in
            self.isUserExists = exists
            guard self.isUserExists != nil else { return }

            refreshUserInfo {
                loadDeferredHomeData(userId: userId)
            }
        }
    }
    
    private func refreshUserInfo(completion: (() -> Void)? = nil) {
        authManager.fetchUserInfo { (name, avatar, money, hp, attack, tutorialNum) in
            self.userName = name ?? ""
            self.avatar = avatar ?? [[String: Any]]()
            self.userMoney = money ?? 0
            self.userHp = hp ?? 100
            self.userAttack = attack ?? 20
            self.tutorialNum = tutorialNum ?? 0
            self.isLoading = false
            completion?()
        }
    }

    private func loadDeferredHomeData(userId: String) {
        guard !hasLoadedDeferredHomeData else { return }
        hasLoadedDeferredHomeData = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            authManager.fetchCurrentLoginStreak { streakCount in
                self.loginCount = streakCount
            }
            authManager.fetchUserExperienceAndLevel()
            authManager.fetchInventory()
            authManager.fetchUserRewardFlag { _ in
                authManager.syncRewardBoostState()
                reward.checkRewardReset()
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            authManager.fetchPreFlag { preFlag in
                self.userPreFlag = preFlag
                if preFlag != 1 {
                    showPaywallEveryTenHomeAppearances()
                }
            }

            authManager.fetchUserCsFlag { csFlag in
                if csFlag == 0 {
                    executeProcessEveryThreeTimes()
                    executeProcessEveryTwentyTimes()
                }
            }

            authManager.fetchLastClickedDate(userId: userId) { lastDate in
                if let lastDate = lastDate {
                    let currentDate = Date()
                    let timeInterval = currentDate.timeIntervalSince(lastDate)
                    isButtonEnabled = timeInterval >= 86400
                } else {
                    isButtonEnabled = true
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            MissionManager.shared.fetchMissions { success in
                guard success else { return }
                MissionManager.shared.refreshAllMissions()
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            presentLoginBonusIfNeeded()
        }
    }

    private func presentLoginBonusIfNeeded() {
        authManager.fetchCurrentLoginStreak { streakCount in
            self.loginCount = streakCount
        }

        authManager.shouldShowLoginBonus { shouldShow in
            guard shouldShow else { return }

            authManager.checkAndGrantLoginBonus500 { success in
                guard success else { return }

                DispatchQueue.main.async {
                    self.loginCount = authManager.loginCount
                    self.currentBonus = authManager.loginBonus
                    self.showLoginBonus = true
                }
            }
        }
    }
    
    func executeProcessEveryTwentyTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "TwentyLaunchCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "TwentyLaunchCount")
        
        // 10回に1回の割合で処理を実行
        if count % 15 == 0 {
            csFlag = true
        }
    }
    
    func isSmallDevice() -> Bool {
        return UIScreen.main.bounds.width < 390
    }
    
    func saveLastLoginDate() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "lastLoginDate")
    }
    
    func saveLoginBonusReceivedDate() {
        let defaults = UserDefaults.standard
        defaults.set(Date(), forKey: "lastLoginBonusReceivedDate")
    }
    
    func executeProcessEveryThreeTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "launchCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "launchCount")
        
        // 3回に1回の割合で処理を実行
        if count % 20 == 0 {
            customerFlag = true
        }
    }
    
    /// ホーム画面表示10回に1回プレミアム訴求を出す。
    /// クイズ結果画面側のカウンタとはキーを分けること（同じキーを共有すると
    /// 結果画面の「広告 or 訴求」の比率が崩れる）。
    func showPaywallEveryTenHomeAppearances() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "homePaywallCount") + 1

        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "homePaywallCount")

        // 10回に1回の割合で処理を実行
        if count % 10 == 0 {
            preFlag = true
        }
    }

    func checkForLoginBonus() -> Bool {
        let defaults = UserDefaults.standard
        let lastLoginDate = defaults.object(forKey: "lastLoginDate") as? Date ?? Date.distantPast
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: lastLoginDate, to: Date())
        
        if let days = components.day, days > 0 {
            // 1日以上経過している場合はボーナスを付与
            return true
        } else {
            // 1日経過していない場合はボーナスを付与しない
            return false
        }
    }
}

struct ProgressBar: View {
    var value: Float

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: CGFloat(self.value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemTeal))
//                    .animation(.linear)
            }
        }.cornerRadius(45.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
//        ContentView()
        TopView()
    }
}
