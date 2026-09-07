//
//  GachaView.swift
//  it
//
//  Created by hashimo ryoya on 2023/09/18.
//

import Foundation
import FirebaseDatabaseInternal
import SwiftUI
import AVKit

enum GachaRarity: String, Codable {
    case normal
    case rare
    case Rrare
    case mekaRare
    case superRare
    case RsuperRare
    case mekaSuperRare
    case ultraRare
    case RultraRare
    case mekaUltraRare
    case legendRare
    case mekaLegendRare
    case godRare
    
    var displayString: String {
        switch self {
        case .normal:
            return "ノーマル"
        case .rare, .Rrare, .mekaRare:
            return "レア"
        case .superRare, .RsuperRare, .mekaSuperRare:
            return "スーパーレア"
        case .ultraRare, .RultraRare, .mekaUltraRare:
            return "ウルトラレア"
        case .legendRare, .mekaLegendRare:
            return "レジェンドレア"
        case .godRare:
            return "ゴッドレア"
        }
    }
    
    var movieName: String {
        self == .godRare ? GachaRarity.legendRare.rawValue : self.rawValue
    }
    
    var gradientColors: [Color] {
        switch self {
        case .normal:
            return [Color.gray.opacity(0.6), Color.gray.opacity(0.3)]
        case .rare, .Rrare, .mekaRare:
            return [Color.blue.opacity(0.6), Color.cyan.opacity(0.3)]
        case .superRare, .RsuperRare, .mekaSuperRare:
            return [Color.purple.opacity(0.6), Color.pink.opacity(0.3)]
        case .ultraRare, .RultraRare, .mekaUltraRare:
            return [Color.orange.opacity(0.6), Color.yellow.opacity(0.3)]
        case .legendRare, .mekaLegendRare:
            return [Color.red.opacity(0.6), Color.orange.opacity(0.4)]
        case .godRare:
            return [Color(hex: "14002E"), Color(hex: "5E2BFF"), Color(hex: "FFD700")]
        }
    }
}

enum GachaMode {
    case normal
    case rare
    case meka
    case god
    case hero
    case constellation

    var displayName: String {
        switch self {
        case .normal:
            return "レギュラーガチャ"
        case .rare:
            return "幸福ガチャ"
        case .meka:
            return "メカガチャ"
        case .god:
            return "神ガチャ"
        case .hero:
            return "英雄ガチャ"
        case .constellation:
            return "星座ガチャ"
        }
    }

    var bannerImageName: String {
        switch self {
        case .normal:
            return "regularGachaScreen"
        case .hero:
            return "heroGachaScreen"
        case .rare, .meka, .god, .constellation:
            return "ガチャ"
        }
    }

    var backgroundImageName: String {
        switch self {
        case .normal:
            return "RegularGachaBackground"
        case .hero:
            return "HeroGachaBackground"
        case .constellation:
            return "ConstellationGachaBackground"
        case .rare, .meka, .god:
            return "HomeBackgroundAdventure"
        }
    }
}

class GachaManager {
    struct Item: Codable {
        let name: String
        let attack: Int
        let health: Int
        let probability: Int
        let rarity: GachaRarity
    }
    
    private let mode: GachaMode
    var items: [Item] = []
    
    init(mode: GachaMode) {
        self.mode = mode
        setupItems()
    }
    
    var gachaCost: Int {
        switch mode {
        case .normal:
            return 300
        case .rare, .meka, .hero:
            return 600
        case .god:
            return 900
        case .constellation:
            return 1000
        }
    }
    
    private func setupItems() {
        switch mode {
        case .normal:
            self.items = [
                Item(name: "えんぴ君", attack: 20, health: 20, probability: 1200, rarity: .normal),
                Item(name: "ナイト", attack: 20, health: 20, probability: 1200, rarity: .normal),
                Item(name: "てーる", attack: 15, health: 15, probability: 1200, rarity: .normal),
                Item(name: "ぷりん", attack: 20, health: 10, probability: 1200, rarity: .normal),
                Item(name: "たまっち", attack: 20, health: 100, probability: 1200, rarity: .normal),
                Item(name: "うきわうさぎ", attack: 25, health: 150, probability: 1200, rarity: .normal),
                Item(name: "かげねこ", attack: 30, health: 200, probability: 1200, rarity: .normal),
                Item(name: "リュウ", attack: 35, health: 220, probability: 330, rarity: .rare),
                Item(name: "ウィザード", attack: 40, health: 240, probability: 330, rarity: .rare),
                Item(name: "ウィッチ", attack: 45, health: 260, probability: 330, rarity: .rare),
                Item(name: "フローラ", attack: 47, health: 280, probability: 220, rarity: .superRare),
                Item(name: "プリンス", attack: 48, health: 285, probability: 220, rarity: .superRare),
                Item(name: "キング・イロン", attack: 50, health: 300, probability: 170, rarity: .ultraRare)
            ]
        case .rare:
            self.items = [
                Item(name: "リュウ", attack: 38, health: 240, probability: 3600, rarity: .Rrare),
                Item(name: "ウィザード", attack: 44, health: 260, probability: 3600, rarity: .Rrare),
                Item(name: "ウィッチ", attack: 48, health: 285, probability: 1200, rarity: .RsuperRare),
                Item(name: "フローラ", attack: 54, health: 320, probability: 1000, rarity: .RsuperRare),
                Item(name: "プリンス", attack: 58, health: 340, probability: 500, rarity: .RultraRare),
                Item(name: "キング・イロン", attack: 64, health: 380, probability: 100, rarity: .legendRare)
            ]
        case .meka:
            self.items = [
                Item(name: "ナイト", attack: 48, health: 320, probability: 3900, rarity: .mekaRare),
                Item(name: "かげねこ", attack: 54, health: 360, probability: 3700, rarity: .mekaRare),
                Item(name: "リュウ", attack: 62, health: 400, probability: 1700, rarity: .mekaSuperRare),
                Item(name: "フローラ", attack: 70, health: 450, probability: 550, rarity: .mekaUltraRare),
                Item(name: "キング・イロン", attack: 82, health: 520, probability: 150, rarity: .mekaLegendRare)
            ]
        case .god:
            self.items = [
                Item(name: "ウィッチ", attack: 68, health: 430, probability: 7200, rarity: .ultraRare),
                Item(name: "フローラ", attack: 76, health: 470, probability: 1300, rarity: .legendRare),
                Item(name: "プリンス", attack: 84, health: 520, probability: 1100, rarity: .legendRare),
                Item(name: "キング・イロン", attack: 95, health: 600, probability: 400, rarity: .mekaLegendRare)
            ]
        case .hero:
            self.items = [
                Item(name: "ヒールスライム",   attack: 38, health: 240, probability: 1600, rarity: .Rrare),
                Item(name: "風の精",           attack: 44, health: 265, probability: 1600, rarity: .Rrare),
                Item(name: "スチームガンナー", attack: 41, health: 250, probability: 1400, rarity: .Rrare),
                Item(name: "バーサーカー",     attack: 43, health: 255, probability: 1400, rarity: .Rrare),
                Item(name: "森のアーチャー",   attack: 50, health: 300, probability: 1200, rarity: .Rrare),
                Item(name: "光の妖精",         attack: 54, health: 325, probability: 1200, rarity: .Rrare),
                Item(name: "蒼の銃士",         attack: 52, health: 310, probability: 650, rarity: .RsuperRare),
                Item(name: "紅の武者",         attack: 64, health: 390, probability: 600, rarity: .RsuperRare),
                Item(name: "大魔導士",         attack: 60, health: 370, probability: 230, rarity: .RultraRare),
                Item(name: "エルウィン",       attack: 56, health: 340, probability: 100, rarity: .RultraRare),
                Item(name: "スライムキング",   attack: 76, health: 480, probability:  20, rarity: .legendRare)
            ]
        case .constellation:
            // 合計10,000: レア80% / スーパー15% / ウルトラ4% / レジェンド0.95% / ゴッド0.05%
            self.items = [
                Item(name: "ほしうさ", attack: 42, health: 260, probability: 1463, rarity: .Rrare),
                Item(name: "こぐまナイト", attack: 40, health: 280, probability: 1463, rarity: .Rrare),
                Item(name: "てんびんロボ", attack: 45, health: 250, probability: 1388, rarity: .Rrare),
                Item(name: "かにシェル", attack: 36, health: 300, probability: 1313, rarity: .Rrare),
                Item(name: "やぎランナー", attack: 48, health: 245, probability: 1224, rarity: .Rrare),
                Item(name: "うおツイン", attack: 44, health: 255, probability: 1149, rarity: .Rrare),
                Item(name: "ししファング", attack: 58, health: 360, probability: 283, rarity: .RsuperRare),
                Item(name: "アクアマーメ", attack: 62, health: 340, probability: 270, rarity: .RsuperRare),
                Item(name: "おとめルナ", attack: 64, health: 330, probability: 261, rarity: .RsuperRare),
                Item(name: "ふたごスパーク", attack: 68, health: 320, probability: 243, rarity: .RsuperRare),
                Item(name: "いてアロー", attack: 66, health: 350, probability: 226, rarity: .RsuperRare),
                Item(name: "おひつじブレイブ", attack: 60, health: 370, probability: 217, rarity: .RsuperRare),
                Item(name: "オリオン", attack: 82, health: 440, probability: 112, rarity: .RultraRare),
                Item(name: "スコルピア", attack: 86, health: 430, probability: 104, rarity: .RultraRare),
                Item(name: "タウラスガード", attack: 74, health: 500, probability: 96, rarity: .RultraRare),
                Item(name: "カプリコーン", attack: 80, health: 455, probability: 88, rarity: .RultraRare),
                Item(name: "コスモドラゴン", attack: 98, health: 580, probability: 36, rarity: .legendRare),
                Item(name: "ルナフェニックス", attack: 106, health: 540, probability: 31, rarity: .legendRare),
                Item(name: "アストラナイト", attack: 94, health: 600, probability: 28, rarity: .legendRare),
                Item(name: "ゾディアーク", attack: 135, health: 780, probability: 5, rarity: .godRare)
            ]
        }
    }
    
    func shuffleItems() {
        items.shuffle()
    }
    
    func drawGacha() -> Item? {
        let totalProbability = items.map { $0.probability }.reduce(0, +)
        let randomNumber = Int.random(in: 0..<totalProbability)
        
        var accumulatedProbability = 0
        for item in items {
            accumulatedProbability += item.probability
            if randomNumber < accumulatedProbability {
                return item
            }
        }
        
        return items.first
    }
}

extension GachaManager.Item {
    var artworkName: String {
        name
    }

    var silhouetteArtworkName: String {
        "\(artworkName)_シルエット"
    }
}

struct GachaAnimationSession: Identifiable {
    let id = UUID()
    let item: GachaManager.Item

    init(item: GachaManager.Item) {
        self.item = item
    }
}

// MARK: - Quest-style Gacha Lobby

private struct QuestGachaLobbyScreen: View {
    let mode: GachaMode
    let ticketType: InventoryItemType
    let ticketCount: Int
    let userMoney: Int
    let cost: Int
    let canAffordDraw: Bool
    let isDrawInProgress: Bool
    let rewardLoaded: Bool
    let catalogItems: [GachaManager.Item]
    let onBack: () -> Void
    let onCoinTap: () -> Void
    let onDraw: () -> Void
    let onTicketDraw: () -> Void
    let onRewardAd: () -> Void
    let onCatalog: () -> Void

    @ObservedObject private var authManager = AuthManager.shared
    @State private var featuredIndex = 0
    @State private var featuredTimer = Timer.publish(every: 3.2, on: .main, in: .common).autoconnect()

    private var accentColor: Color {
        switch mode {
        case .hero:
            return Color(red: 0.66, green: 0.34, blue: 0.96)
        case .normal:
            return Color(red: 0.16, green: 0.74, blue: 0.68)
        case .rare:
            return Color(red: 0.96, green: 0.34, blue: 0.42)
        case .meka:
            return Color(red: 0.34, green: 0.48, blue: 0.94)
        case .god:
            return Color(red: 1.0, green: 0.72, blue: 0.2)
        case .constellation:
            return Color(hex: "6A2CFF")
        }
    }

    private var accentGradient: [Color] {
        switch mode {
        case .hero:
            return [Color(hex: "6A2CFF"), Color(hex: "E544B5"), Color(hex: "FF8A34")]
        case .constellation:
            return [Color(hex: "1A1A5E"), Color(hex: "6A2CFF"), Color(hex: "FFD700")]
        default:
            return [Color(hex: "16A89A"), Color(hex: "42C98B"), Color(hex: "F2B84B")]
        }
    }

    private var ticketGradient: [Color] {
        guard ticketCount > 0 else { return [Color.gray, Color.gray.opacity(0.72)] }
        return [ticketType.accentColor, accentColor]
    }

    private var featuredItem: GachaManager.Item? {
        guard !catalogItems.isEmpty else { return nil }
        return catalogItems[featuredIndex % catalogItems.count]
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 18) {
                headerView
                featuredCard
                drawButton
                ticketButton
                utilityButtons
                catalogButton
            }
            .frame(maxWidth: 560)
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 110)
            .frame(maxWidth: .infinity)
        }
        .background { backgroundView }
        .onAppear {
            authManager.fetchAvatars {}
            if featuredIndex >= catalogItems.count {
                featuredIndex = 0
            }
        }
        .onReceive(featuredTimer) { _ in
            guard catalogItems.count > 1 else { return }
            withAnimation(.easeInOut(duration: 0.7)) {
                featuredIndex = (featuredIndex + 1) % catalogItems.count
            }
        }
    }

    private var backgroundView: some View {
        ZStack {
            Image(mode.backgroundImageName)
                .resizable()
                .scaledToFill()

            LinearGradient(
                colors: [
                    Color.black.opacity(0.42),
                    accentColor.opacity(0.18),
                    Color.black.opacity(0.52)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }

    private var headerView: some View {
        HStack(alignment: .center) {
            Button(action: {
                generateHapticFeedback()
                onBack()
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                    Text("戻る")
                        .font(.system(size: 18, weight: .medium))
                }
                .foregroundColor(.white.opacity(0.94))
            }
            .buttonStyle(.plain)

            Spacer()

            Button(action: {
                generateHapticFeedback()
                onCoinTap()
            }) {
                HStack(spacing: 8) {
                    Image("コイン")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)

                    Text(userMoney.formatted())
                        .font(.system(size: 19, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .monospacedDigit()

                    Text("コイン")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.72))
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 9)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.24))
                        .overlay(Capsule().stroke(Color.white.opacity(0.28), lineWidth: 1))
                )
            }
            .buttonStyle(.plain)
        }
    }

    private var featuredCard: some View {
        VStack(spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mode.displayName)
                        .font(.system(size: 24, weight: .black))
                        .foregroundColor(.white)
                    Text("このガチャで登場するおとも")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white.opacity(0.72))
                }

                Spacer()

                Text("全\(catalogItems.count)体")
                    .font(.system(size: 12, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal, 11)
                    .padding(.vertical, 7)
                    .background(
                        Capsule()
                            .fill(accentColor.opacity(0.28))
                            .overlay(Capsule().stroke(accentColor.opacity(0.7), lineWidth: 1))
                    )
            }

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [featuredItem?.rarity.catalogColor.opacity(0.48) ?? accentColor.opacity(0.4), .clear],
                            center: .center,
                            startRadius: 12,
                            endRadius: 112
                        )
                    )
                    .frame(width: 215, height: 215)

                if let item = featuredItem {
                    let owned = isOwned(item.name)
                    Image(item.artworkName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 166, height: 166)
                        .colorMultiply(owned ? .white : .black)
                        .shadow(color: owned ? item.rarity.catalogColor.opacity(0.5) : .clear, radius: 16, x: 0, y: 9)
                        .id(item.name)
                        .transition(.opacity)
                }
            }
            .frame(height: 190)

            if let item = featuredItem {
                let owned = isOwned(item.name)
                VStack(spacing: 5) {
                    Text(owned ? item.name : "シークレット")
                        .font(.system(size: 18, weight: .black))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)

                    HStack(spacing: 6) {
                        Image(systemName: owned ? "checkmark.circle.fill" : "lock.fill")
                        Text(item.rarity.displayString)
                    }
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(item.rarity.catalogColor)
                }
                .id("caption-\(item.name)")
                .transition(.opacity)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.black.opacity(0.2))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(Color.white.opacity(0.26), lineWidth: 1.2)
                )
        )
        .shadow(color: Color.black.opacity(0.24), radius: 18, x: 0, y: 12)
    }

    private var drawButton: some View {
        Button(action: {
            generateHapticFeedback()
            onDraw()
        }) {
            HStack(spacing: 15) {
                Image(systemName: "sparkles")
                    .font(.system(size: 24, weight: .bold))

                VStack(spacing: 2) {
                    Text("ガチャを引く")
                        .font(.system(size: 23, weight: .bold))
                    Text("\(cost)コイン")
                        .font(.system(size: 14, weight: .medium))
                        .opacity(0.9)
                }

                Image(systemName: "sparkles")
                    .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 74)
            .background(
                LinearGradient(
                    colors: canAffordDraw ? accentGradient : [Color.gray, Color.gray.opacity(0.72)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color.white.opacity(0.32), lineWidth: 1.5)
            )
            .shadow(color: canAffordDraw ? accentColor.opacity(0.38) : .clear, radius: 14, x: 0, y: 7)
        }
        .buttonStyle(ScaleButtonStyle())
        // The displayed balance can briefly be stale after a reward or purchase.
        // Keep the button tappable and let startGacha validate the server balance.
        .disabled(isDrawInProgress)
    }

    private var ticketButton: some View {
        Button(action: {
            generateHapticFeedback()
            onTicketDraw()
        }) {
            HStack(spacing: 14) {
                InventoryItemArtworkView(type: ticketType, width: 42, height: 42, cornerRadius: 11)

                VStack(alignment: .leading, spacing: 3) {
                    Text("チケットで引く")
                        .font(.system(size: 20, weight: .bold))
                    Text("\(ticketType.shortName)チケットを1枚消費")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.84))
                }

                Spacer()

                Text("×\(ticketCount)")
                    .font(.system(size: 21, weight: .heavy, design: .rounded))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 76)
            .padding(.horizontal, 18)
            .background(
                LinearGradient(colors: ticketGradient, startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color.white.opacity(0.26), lineWidth: 1.2)
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }

    private var utilityButtons: some View {
        VStack(spacing: 12) {
            QuestGachaUtilityButton(
                iconName: "play.rectangle.fill",
                title: rewardLoaded ? "広告を見て" : "広告を準備中",
                subtitle: rewardLoaded ? "300コイン獲得" : "読み込みが終わると利用できます",
                gradientColors: rewardLoaded
                    ? [Color(red: 0.95, green: 0.58, blue: 0.2), Color(red: 0.98, green: 0.76, blue: 0.3)]
                    : [Color.gray.opacity(0.8), Color.gray.opacity(0.58)],
                isLoading: !rewardLoaded,
                action: onRewardAd
            )
            .disabled(!rewardLoaded)

            QuestGachaUtilityButton(
                iconName: "cart.fill",
                title: "コイン購入",
                subtitle: "必要な分だけ追加できます",
                gradientColors: [Color(red: 0.18, green: 0.68, blue: 0.5), Color(red: 0.28, green: 0.8, blue: 0.62)],
                action: onCoinTap
            )
        }
    }

    private var catalogButton: some View {
        Button(action: {
            generateHapticFeedback()
            onCatalog()
        }) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(accentColor.opacity(0.22))
                        .frame(width: 46, height: 46)

                    Image(systemName: "square.grid.2x2.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(accentColor)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("おとも一覧")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    Text("登場するおともと出現率を確認")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.72))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white.opacity(0.82))
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(Color.black.opacity(0.3))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1.2)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }

    private func isOwned(_ name: String) -> Bool {
        authManager.avatars.contains(where: { $0.name == name })
    }
}

private struct QuestGachaUtilityButton: View {
    let iconName: String
    let title: String
    let subtitle: String
    let gradientColors: [Color]
    var isLoading: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 14) {
                Image(systemName: iconName)
                    .font(.system(size: 22, weight: .bold))

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                    Text(subtitle)
                        .font(.system(size: 17, weight: .black))
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color.white.opacity(0.24), lineWidth: 1.2)
            )
            .overlay {
                if isLoading {
                    ZStack {
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .fill(Color.black.opacity(0.25))
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    }
                }
            }
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct GachaView: View {
    @StateObject private var authManager = AuthManager.shared
    @State private var gachaManager: GachaManager
    private let mode: GachaMode

    init(mode: GachaMode = .normal) {
        self.mode = mode
        _gachaManager = State(initialValue: GachaManager(mode: mode))
    }

    @State private var isPresentingCatalog: Bool = false
    @State private var userMoney: Int = 0
    @State private var isGachaButtonDisabled: Bool = false
    @State private var obtainedItem: GachaManager.Item?
    
    @State private var activeAnimationSession: GachaAnimationSession?
    @State private var isGachaInProgress: Bool = false
    @State private var showResult: Bool = false
    @State private var showCoinModal: Bool = false
    @State private var showUnCoinModal: Bool = false
    
    @State private var otomo10flag: Bool = false
    @State private var otomo20flag: Bool = false
    @State private var showTitleModal: Bool = false
    @State private var obtainedTitle: String = ""
    
    @State private var showRewardAlert: Bool = false
    
    @ObservedObject var audioManager = AudioManager.shared
    @StateObject var reward = Reward()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showCoinOptionsAlert: Bool = false
    @State private var showNoTicketAlert: Bool = false

    private var ticketType: InventoryItemType {
        switch mode {
        case .normal: return .normalGachaTicket
        case .rare:   return .rareGachaTicket
        case .meka:   return .mekaGachaTicket
        case .god:    return .godGachaTicket
        case .hero:   return .normalGachaTicket
        case .constellation: return .constellationGachaTicket
        }
    }

    private var ticketName: String {
        switch mode {
        case .normal: return "レギュラー"
        case .rare:   return "幸福"
        case .meka:   return "メカ"
        case .god:    return "神"
        case .hero:   return "レギュラー"
        case .constellation: return "星座"
        }
    }
    
    var body: some View {
        ZStack {
            // 背景グラデーション
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("Color2")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            if !showResult {
                // ガチャ初期画面
                gachaMainView
            } else {
                // 結果画面
                GachaResultView(
                    item: obtainedItem,
                    gachaCost: gachaManager.gachaCost,
                    onClose: {
                        showResult = false
                        obtainedItem = nil
                    },
                    onPlayAgain: {
                        startGacha()
                    }
                )
            }
            VStack{
                if showCoinModal {
                    if showUnCoinModal {
                        VStack{
                            HStack{
                                Image("コインが無い")
                                    .resizable()
                                    .frame(width:70,height: 70)
                                VStack(alignment: .leading, spacing:15){
                                    HStack{
                                        Text("コインが足りません")
                                        Spacer()
                                    }
                                    Text("ご購入することもできます")
                                        .font(.system(size: isSmallDevice() ? 17 : 18))
                                }
                                
                            }.padding()
                        }.frame(width: isSmallDevice() ? 330: 340, height:120)
                            .background(Color("Color2"))
                            .font(.system(size: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 15)
                            )
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                    CoinModalView(audioManager: audioManager, isPresented: $showCoinModal)
                }
            }

            NavigationLink(
                "",
                destination: GachaCatalogView(mode: mode).navigationBarBackButtonHidden(true),
                isActive: $isPresentingCatalog
            )
        }
        .onAppear {
            fetchUserMoney()
            reward.LoadReward()
            authManager.fetchInventory()
        }
        .fullScreenCover(item: $activeAnimationSession) { session in
            GachaAnimationView(rarity: session.item.rarity) {
                activeAnimationSession = nil
                obtainedItem = session.item
                showResult = true
                isGachaInProgress = false
                fetchUserMoney()
            }
        }
        .alert("コインが足りません", isPresented: $showUnCoinModal) {
            Button(action: {
                if reward.rewardLoaded {
                    reward.ShowReward()
                } else {
                    // リワード広告が読み込まれていない場合
                    showCoinModal = true
                }
            }) {
                Text(reward.rewardLoaded ? "広告を見る (300コイン)" : "広告を読み込み中...")
            }
            Button("コインを購入") {
                showCoinModal = true
            }
            Button("キャンセル", role: .cancel) {}
        } message: {
            Text("ガチャを引くには\(gachaManager.gachaCost)コインが必要です")
        }
        .alert("300コイン獲得しました。", isPresented: $showRewardAlert) {
            Button("OK") {
                fetchUserMoney()
            }
        }
        .alert("称号獲得!", isPresented: $showTitleModal) {
            Button("OK") {}
        } message: {
            Text(obtainedTitle)
        }
        .onChange(of: reward.rewardEarned) { rewardEarned in
            showRewardAlert = rewardEarned
            if rewardEarned {
                fetchUserMoney()
                reward.rewardEarned = false
            }
        }
        .onChange(of: showCoinModal) { _ in
            fetchUserMoney()
        }
    }
    
    private var gachaMainView: some View {
        QuestGachaLobbyScreen(
            mode: mode,
            ticketType: ticketType,
            ticketCount: authManager.inventoryCount(for: ticketType),
            userMoney: userMoney,
            cost: gachaManager.gachaCost,
            canAffordDraw: isGachaButtonDisabled,
            isDrawInProgress: isGachaInProgress,
            rewardLoaded: reward.rewardLoaded,
            catalogItems: gachaManager.items,
            onBack: {
                presentationMode.wrappedValue.dismiss()
                audioManager.playCancelSound()
            },
            onCoinTap: {
                showCoinModal = true
            },
            onDraw: startGacha,
            onTicketDraw: drawWithTicket,
            onRewardAd: {
                if reward.rewardLoaded {
                    reward.ShowReward()
                }
            },
            onCatalog: {
                audioManager.playSound()
                isPresentingCatalog = true
            }
        )
    }

    private var legacyGachaMainView: some View {
        VStack(spacing: 0) {
            // ヘッダー
            HStack {
                Button(action: {
                    generateHapticFeedback()
                    self.presentationMode.wrappedValue.dismiss()
                    audioManager.playCancelSound()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("戻る")
                    }
                    .foregroundColor(Color("fontGray"))
                }
                .buttonStyle(.plain)
                .padding(.leading)

                Spacer()

                HStack(spacing: 6) {
                    Image(systemName: "dollarsign.circle.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.yellow)
                    Text("\(userMoney)")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color("fontGray"))
                    Text("コイン")
                        .font(.system(size: 14))
                        .foregroundColor(Color("fontGray").opacity(0.7))
                }
                .padding(.trailing)
            }
            .padding(.vertical, 10)

            // バナー画像
            Image(mode.bannerImageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

            // ボタンエリア
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    // ガチャを引く
                    Button(action: startGacha) {
                        HStack {
                            Image(systemName: "sparkles")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                            VStack(spacing: 2) {
                                Text("ガチャを引く")
                                    .font(.system(size: 22, weight: .bold))
                                Text("\(gachaManager.gachaCost)コイン")
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: "sparkles")
                                .font(.system(size: 22, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 76)
                        .background(
                            LinearGradient(
                                colors: isGachaButtonDisabled
                                    ? [.purple, .pink, .orange]
                                    : [.gray.opacity(0.6), .gray.opacity(0.4)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                    }
                    .disabled(!isGachaButtonDisabled || isGachaInProgress)

                    // 広告を見て
                    Button(action: {
                        if reward.rewardLoaded { reward.ShowReward() }
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "play.rectangle.fill")
                                .font(.system(size: 22, weight: .bold))

                            VStack(alignment: .leading, spacing: 2) {
                                Text("広告を見て")
                                    .font(.system(size: 14, weight: .medium))
                                Text("300コイン獲得")
                                    .font(.system(size: 18, weight: .bold))
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 66)
                        .background(
                            LinearGradient(
                                colors: reward.rewardLoaded
                                    ? [Color(red: 0.95, green: 0.6, blue: 0.2), Color(red: 0.98, green: 0.75, blue: 0.3)]
                                    : [Color.gray.opacity(0.6), Color.gray.opacity(0.4)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                        .overlay(
                            Group {
                                if !reward.rewardLoaded {
                                    ZStack {
                                        Color.black.opacity(0.2).cornerRadius(16)
                                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    }
                                }
                            }
                        )
                    }
                    .disabled(!reward.rewardLoaded)

                    // コイン購入
                    Button(action: { showCoinModal = true }) {
                        HStack(spacing: 12) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 22, weight: .bold))

                            VStack(alignment: .leading, spacing: 2) {
                                Text("コイン購入")
                                    .font(.system(size: 14, weight: .medium))
                                Text("必要な分だけ追加できます")
                                    .font(.system(size: 16, weight: .bold))
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 66)
                        .background(
                            LinearGradient(
                                colors: [Color(red: 0.2, green: 0.7, blue: 0.5), Color(red: 0.3, green: 0.8, blue: 0.6)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(16)
                    }

                    // おとも一覧（図鑑）
                    Button(action: {
                        generateHapticFeedback()
                        audioManager.playSound()
                        isPresentingCatalog = true
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "square.grid.2x2.fill")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color("fontGray").opacity(0.5))

                            VStack(alignment: .leading, spacing: 2) {
                                Text("おとも一覧")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(Color("fontGray"))
                                Text("このガチャで登場するおともを確認")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("fontGray").opacity(0.6))
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("fontGray").opacity(0.4))
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 66)
                        .background(Color.gray.opacity(0.12))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 30)
            }
        }
        .alert("チケットがありません", isPresented: $showNoTicketAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("\(ticketName)ガチャチケットが必要です")
        }
    }
    
    private func drawWithTicket() {
        generateHapticFeedback()
        guard !isGachaInProgress else { return }
        guard PositionViewModel.isDeveloperMode || authManager.inventoryCount(for: ticketType) > 0 else {
            showNoTicketAlert = true
            return
        }

        isGachaInProgress = true
        // 開発者モードはチケットを消費せず無制限に引ける。
        performGachaDraw(ticketType: PositionViewModel.isDeveloperMode ? nil : ticketType)
    }

    private func startGacha() {
        guard !isGachaInProgress else { return }
        let cost = gachaManager.gachaCost

        isGachaInProgress = true
        performGachaDraw(coinCost: cost)
    }

    private func performGachaDraw(
        coinCost: Int = 0,
        ticketType: InventoryItemType? = nil
    ) {
        gachaManager.shuffleItems()
        guard let item = gachaManager.drawGacha() else {
            isGachaInProgress = false
            return
        }

        let avatar = Avatar(
            name: item.name,
            attack: item.attack,
            health: item.health,
            usedFlag: 0,
            count: 1
        )
        authManager.commitGachaResult(
            avatar: avatar,
            coinCost: coinCost,
            ticketType: ticketType
        ) { success in
            guard success else {
                isGachaInProgress = false
                if ticketType != nil {
                    showNoTicketAlert = true
                } else if coinCost > 0 {
                    fetchUserMoney()
                    showUnCoinModal = true
                }
                return
            }

            userMoney = authManager.money
            isGachaButtonDisabled = userMoney >= gachaManager.gachaCost
            recordGachaProgress()
            presentGachaAnimation(for: item)
            checkAvatarCount()
        }
    }

    private func presentGachaAnimation(for item: GachaManager.Item) {
        obtainedItem = nil
        showResult = false
        activeAnimationSession = nil
        DispatchQueue.main.async {
            activeAnimationSession = GachaAnimationSession(item: item)
        }
    }

    private func fetchUserMoney() {
        authManager.getUserMoney { money in
            self.userMoney = money
            // ボタンの有効/無効を更新（コストに応じて）
            let cost = gachaManager.gachaCost
            isGachaButtonDisabled = money >= cost
        }
    }
    
    private func checkAvatarCount() {
        guard let userId = authManager.currentUserId else { return }
        
        countAvatarsForUser(userId: userId) { avatarCount in
            print("ユーザーのアバターの数: \(avatarCount)")
            
            if avatarCount > 9 {
                authManager.checkTitles(userId: userId, title: "おとも１０種類制覇") { exists in
                    if !exists {
                        otomo10flag = true
                        obtainedTitle = "おとも１０種類制覇"
                        showTitleModal = true
                        authManager.saveTitleForUser(userId: userId, title: "おとも１０種類制覇")
                    }
                }
            }
            
            if avatarCount > 19 {
                authManager.checkTitles(userId: userId, title: "おとも２０種類制覇") { exists in
                    if !exists {
                        otomo20flag = true
                        obtainedTitle = "おとも２０種類制覇"
                        showTitleModal = true
                        authManager.saveTitleForUser(userId: userId, title: "おとも２０種類制覇")
                    }
                }
            }
        }
    }
    
    private func countAvatarsForUser(userId: String, completion: @escaping (Int) -> Void) {
        let avatarsRef = Database.database().reference().child("users").child(userId).child("avatars")
        
        avatarsRef.observeSingleEvent(of: .value, with: { snapshot in
            let avatarCount = snapshot.childrenCount
            completion(Int(avatarCount))
        })
    }

    private func recordGachaProgress() {
        authManager.recordGachaUsed()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            authManager.fetchAvatars {
                authManager.recordAvatarObtained()
            }
        }
    }
}

// MARK: - Custom Shapes
struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        for i in 0..<6 {
            let angle = CGFloat(i) * .pi / 3
            let point = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// MARK: - Result View
struct GachaResultView: View {
    let item: GachaManager.Item?
    let gachaCost: Int  // 追加
    let onClose: () -> Void
    let onPlayAgain: () -> Void
    
    @State private var showContent: Bool = false
    @State private var showParticles: Bool = false
    
    var body: some View {
        ZStack {
            // 背景
            LinearGradient(
                gradient: Gradient(colors: item?.rarity.gradientColors ?? [.gray, .gray]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // パーティクルエフェクト
            if showParticles {
                ParticleEffectView()
            }
            
            VStack(spacing: 0) {
                Spacer()
                
                if let item = item {
                    // レアリティ表示
                    Text(item.rarity.displayString)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                                )
                        )
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                        .scaleEffect(showContent ? 1 : 0.5)
                        .opacity(showContent ? 1 : 0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.2), value: showContent)
                    
                    // キャラクター画像エリア
                    ZStack {
                        // 光の輪
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [
                                        Color.white.opacity(0.4),
                                        Color.white.opacity(0.1),
                                        Color.clear
                                    ],
                                    center: .center,
                                    startRadius: 50,
                                    endRadius: 150
                                )
                            )
                            .frame(width: 250, height: 250)
                            .scaleEffect(showContent ? 1 : 0.3)
                            .opacity(showContent ? 1 : 0)
                            .animation(.easeOut(duration: 0.8), value: showContent)
                        
                        // キャラクター画像
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .frame(width: 200, height: 200)
                            
                            Image(item.artworkName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        }
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.6), lineWidth: 4)
                        )
                        .shadow(color: .black.opacity(0.4), radius: 20, x: 0, y: 10)
                        .scaleEffect(showContent ? 1 : 0.3)
                        .opacity(showContent ? 1 : 0)
                        .animation(.spring(response: 0.7, dampingFraction: 0.6).delay(0.3), value: showContent)
                    }
                    
                    // キャラクター名
                    Text(item.name)
                        .font(.system(size: 42, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 3)
                        .scaleEffect(showContent ? 1 : 0.5)
                        .opacity(showContent ? 1 : 0)
                        .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.4), value: showContent)
                    
                    Spacer().frame(height: 30)
                    
                    // ステータス表示
                    HStack(spacing: 40) {
                        HStack(spacing: 8) {
                            VStack{
                                Image("攻撃マーク")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:50)
                            }
                            Text("\(item.attack)")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                )
                        )
                        
                        HStack(spacing: 8) {
                            VStack{
                                Image("HPマーク")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:50)
                            }
                            
                            Text("\(item.health)")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                )
                        )
                    }
                    .scaleEffect(showContent ? 1 : 0.5)
                    .opacity(showContent ? 1 : 0)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7).delay(0.5), value: showContent)
                }
                
                Spacer()
                
                // ボタンエリア（2つのボタン）
                VStack(spacing: 15) {
                    // もう一度引くボタン
                    Button(action: onPlayAgain) {
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .font(.system(size: 24))
                            
                            Text("もう一度引く")
                                .font(.system(size: 22, weight: .bold))
                            
                            Text("\(gachaCost)コイン")
                                .font(.system(size: 16, weight: .medium))
                                .opacity(0.9)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            LinearGradient(
                                colors: [.purple, .pink, .orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                        )
                        .shadow(color: .purple.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                    
                    // 閉じるボタン
                    Button(action: onClose) {
                        HStack(spacing: 12) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 24))
                            
                            Text("確認")
                                .font(.system(size: 22, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(
                            LinearGradient(
                                colors: [Color.white.opacity(0.3), Color.white.opacity(0.2)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                            )
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                .opacity(showContent ? 1 : 0)
                .animation(.easeIn(duration: 0.3).delay(0.8), value: showContent)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                showContent = true
                showParticles = true
            }
        }
    }
}

// MARK: - Particle Effect
struct ParticleEffectView: View {
    @State private var particles: [Particle] = []
    @State private var animationTimer: Timer?
    
    struct Particle: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var scale: CGFloat
        var opacity: Double
    }
    
    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .fill(Color.white)
                    .frame(width: 6, height: 6)
                    .scaleEffect(particle.scale)
                    .opacity(particle.opacity)
                    .position(x: particle.x, y: particle.y)
            }
        }
        .onAppear {
            generateParticles()
        }
        .onDisappear {
            animationTimer?.invalidate()
            animationTimer = nil
        }
    }
    
    private func generateParticles() {
        particles.removeAll(keepingCapacity: true)
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        for _ in 0..<30 {
            let particle = Particle(
                x: CGFloat.random(in: 0...screenWidth),
                y: CGFloat.random(in: 0...screenHeight),
                scale: CGFloat.random(in: 0.5...1.5),
                opacity: Double.random(in: 0.3...0.8)
            )
            particles.append(particle)
        }
        
        animateParticles()
    }
    
    private func animateParticles() {
        animationTimer?.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            for i in 0..<particles.count {
                particles[i].y -= CGFloat.random(in: 1...3)
                particles[i].opacity -= 0.01
                
                if particles[i].opacity <= 0 || particles[i].y < 0 {
                    particles[i].y = UIScreen.main.bounds.height
                    particles[i].x = CGFloat.random(in: 0...UIScreen.main.bounds.width)
                    particles[i].opacity = Double.random(in: 0.3...0.8)
                }
            }
        }
    }
}

// MARK: - Coin Purchase View
struct CoinPurchaseView: View {
    @Environment(\.dismiss) var dismiss
    
    // コインパッケージ定義
    struct CoinPackage {
        let coins: Int
        let price: String
        let bonus: String?
        let isPopular: Bool
        let gradientColors: [Color]
    }
    
    let packages = [
        CoinPackage(coins: 500, price: "¥120", bonus: nil, isPopular: false,
                    gradientColors: [Color(red: 0.4, green: 0.6, blue: 0.9), Color(red: 0.3, green: 0.5, blue: 0.8)]),
        CoinPackage(coins: 1200, price: "¥250", bonus: "+200ボーナス", isPopular: true,
                    gradientColors: [Color(red: 0.9, green: 0.6, blue: 0.2), Color(red: 0.8, green: 0.5, blue: 0.1)]),
        CoinPackage(coins: 2500, price: "¥490", bonus: "+500ボーナス", isPopular: false,
                    gradientColors: [Color(red: 0.7, green: 0.3, blue: 0.9), Color(red: 0.6, green: 0.2, blue: 0.8)]),
        CoinPackage(coins: 6000, price: "¥980", bonus: "+1500ボーナス", isPopular: false,
                    gradientColors: [Color(red: 0.9, green: 0.2, blue: 0.4), Color(red: 0.8, green: 0.1, blue: 0.3)])
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景グラデーション
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("Color2"),
                        Color("Color2").opacity(0.8)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // ヘッダー
                        VStack(spacing: 8) {
                            Image(systemName: "dollarsign.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.yellow)
                                .shadow(color: .yellow.opacity(0.5), radius: 10)
                            
                            Text("コイン購入")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("お得なパッケージをお選びください")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        
                        // コインパッケージ一覧
                        VStack(spacing: 16) {
                            ForEach(packages.indices, id: \.self) { index in
                                CoinPurchasePackageCard(package: packages[index])
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // 注意事項
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.white.opacity(0.6))
                                Text("ご注意")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            Text("• 購入したコインは返金できません")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.6))
                            Text("• コインの有効期限はありません")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
            }
        }
    }
}

#Preview {
    GachaView()
}
