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
    case ruins

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
        case .ruins:
            return "知恵の遺跡ガチャ"
        }
    }

    var bannerImageName: String {
        switch self {
        case .normal:
            return "regularGachaScreen"
        case .hero:
            return "heroGachaScreen"
        case .rare, .meka, .god, .constellation, .ruins:
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
        case .ruins:
            return "RuinsGachaBackground"
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
        let artworkAssetName: String?

        init(
            name: String,
            attack: Int,
            health: Int,
            probability: Int,
            rarity: GachaRarity,
            artworkName: String? = nil
        ) {
            self.name = name
            self.attack = attack
            self.health = health
            self.probability = probability
            self.rarity = rarity
            self.artworkAssetName = artworkName
        }
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
        case .ruins:
            return 1200
        }
    }
    
    private func setupItems() {
        switch mode {
        case .normal:
            self.items = [
                Item(name: "えんぴ君", attack: 20, health: 20, probability: 1270, rarity: .normal),
                Item(name: "ナイト", attack: 20, health: 20, probability: 1270, rarity: .normal),
                Item(name: "てーる", attack: 15, health: 15, probability: 1270, rarity: .normal),
                Item(name: "ぷりん", attack: 20, health: 10, probability: 1270, rarity: .normal),
                Item(name: "たまっち", attack: 20, health: 100, probability: 1270, rarity: .normal),
                Item(name: "うきわうさぎ", attack: 25, health: 150, probability: 1270, rarity: .normal),
                Item(name: "かげねこ", attack: 30, health: 200, probability: 1270, rarity: .normal),
                Item(name: "リュウ", attack: 35, health: 220, probability: 240, rarity: .rare),
                Item(name: "ウィザード", attack: 40, health: 240, probability: 240, rarity: .rare),
                Item(name: "ウィッチ", attack: 45, health: 260, probability: 240, rarity: .rare),
                Item(name: "フローラ", attack: 47, health: 280, probability: 160, rarity: .superRare),
                Item(name: "プリンス", attack: 48, health: 285, probability: 160, rarity: .superRare),
                Item(name: "キング・イロン", attack: 50, health: 300, probability: 70, rarity: .ultraRare)
            ]
        case .rare:
            self.items = [
                Item(name: "リュウ", attack: 38, health: 240, probability: 3900, rarity: .Rrare),
                Item(name: "ウィザード", attack: 44, health: 260, probability: 3900, rarity: .Rrare),
                Item(name: "ウィッチ", attack: 48, health: 285, probability: 1000, rarity: .RsuperRare),
                Item(name: "フローラ", attack: 54, health: 320, probability: 800, rarity: .RsuperRare),
                Item(name: "プリンス", attack: 58, health: 340, probability: 350, rarity: .RultraRare),
                Item(name: "キング・イロン", attack: 64, health: 380, probability: 50, rarity: .legendRare)
            ]
        case .meka:
            self.items = [
                Item(name: "ナイト", attack: 48, health: 320, probability: 4215, rarity: .mekaRare),
                Item(name: "かげねこ", attack: 54, health: 360, probability: 4015, rarity: .mekaRare),
                Item(name: "リュウ", attack: 62, health: 400, probability: 1300, rarity: .mekaSuperRare),
                Item(name: "フローラ", attack: 70, health: 450, probability: 400, rarity: .mekaUltraRare),
                Item(name: "キング・イロン", attack: 82, health: 520, probability: 70, rarity: .mekaLegendRare)
            ]
        case .god:
            self.items = [
                Item(name: "ウィッチ", attack: 68, health: 430, probability: 7950, rarity: .ultraRare),
                Item(name: "フローラ", attack: 76, health: 470, probability: 1000, rarity: .legendRare),
                Item(name: "プリンス", attack: 84, health: 520, probability: 850, rarity: .legendRare),
                Item(name: "キング・イロン", attack: 95, health: 600, probability: 200, rarity: .mekaLegendRare)
            ]
        case .hero:
            self.items = [
                Item(name: "ヒールスライム",   attack: 38, health: 240, probability: 1670, rarity: .Rrare),
                Item(name: "風の精",           attack: 44, health: 265, probability: 1670, rarity: .Rrare),
                Item(name: "スチームガンナー", attack: 41, health: 250, probability: 1470, rarity: .Rrare),
                Item(name: "バーサーカー",     attack: 43, health: 255, probability: 1470, rarity: .Rrare),
                Item(name: "森のアーチャー",   attack: 50, health: 300, probability: 1265, rarity: .Rrare),
                Item(name: "光の妖精",         attack: 54, health: 325, probability: 1265, rarity: .Rrare),
                Item(name: "蒼の銃士",         attack: 52, health: 310, probability: 500, rarity: .RsuperRare),
                Item(name: "紅の武者",         attack: 64, health: 390, probability: 450, rarity: .RsuperRare),
                Item(name: "大魔導士",         attack: 60, health: 370, probability: 160, rarity: .RultraRare),
                Item(name: "エルウィン",       attack: 56, health: 340, probability: 70, rarity: .RultraRare),
                Item(name: "スライムキング",   attack: 76, health: 480, probability:  10, rarity: .legendRare)
            ]
        case .constellation:
            // 合計10,000: レア85.98% / スーパー11% / ウルトラ2.5% / レジェンド0.5% / ゴッド0.02%
            self.items = [
                Item(name: "ほしうさ", attack: 42, health: 260, probability: 1572, rarity: .Rrare),
                Item(name: "こぐまナイト", attack: 40, health: 280, probability: 1572, rarity: .Rrare),
                Item(name: "てんびんロボ", attack: 45, health: 250, probability: 1492, rarity: .Rrare),
                Item(name: "かにシェル", attack: 36, health: 300, probability: 1411, rarity: .Rrare),
                Item(name: "やぎランナー", attack: 48, health: 245, probability: 1316, rarity: .Rrare),
                Item(name: "うおツイン", attack: 44, health: 255, probability: 1235, rarity: .Rrare),
                Item(name: "ししファング", attack: 58, health: 360, probability: 208, rarity: .RsuperRare),
                Item(name: "アクアマーメ", attack: 62, health: 340, probability: 198, rarity: .RsuperRare),
                Item(name: "おとめルナ", attack: 64, health: 330, probability: 191, rarity: .RsuperRare),
                Item(name: "ふたごスパーク", attack: 68, health: 320, probability: 178, rarity: .RsuperRare),
                Item(name: "いてアロー", attack: 66, health: 350, probability: 166, rarity: .RsuperRare),
                Item(name: "おひつじブレイブ", attack: 60, health: 370, probability: 159, rarity: .RsuperRare),
                Item(name: "オリオン", attack: 82, health: 440, probability: 70, rarity: .RultraRare),
                Item(name: "スコルピア", attack: 86, health: 430, probability: 65, rarity: .RultraRare),
                Item(name: "タウラスガード", attack: 74, health: 500, probability: 60, rarity: .RultraRare),
                Item(name: "カプリコーン", attack: 80, health: 455, probability: 55, rarity: .RultraRare),
                Item(name: "コスモドラゴン", attack: 98, health: 580, probability: 19, rarity: .legendRare),
                Item(name: "ルナフェニックス", attack: 106, health: 540, probability: 16, rarity: .legendRare),
                Item(name: "アストラナイト", attack: 94, health: 600, probability: 15, rarity: .legendRare),
                Item(name: "ゾディアーク", attack: 135, health: 780, probability: 2, rarity: .godRare)
            ]
        case .ruins:
            // 合計100,000: レア81.69% / スーパー15% / ウルトラ3% / レジェンド0.304% / ゴッド0.006%
            self.items = [
                Item(name: "ランプモス", attack: 48, health: 290, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion01"),
                Item(name: "インクぷるん", attack: 50, health: 310, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion02"),
                Item(name: "コンパスビートル", attack: 54, health: 300, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion03"),
                Item(name: "ブックバット", attack: 56, health: 295, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion04"),
                Item(name: "クリスタートル", attack: 49, health: 360, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion05"),
                Item(name: "そろばんゴーレム", attack: 58, health: 340, probability: 13_615, rarity: .Rrare, artworkName: "RuinsCompanion06"),
                Item(name: "ルーンオウル", attack: 68, health: 400, probability: 3_750, rarity: .RsuperRare, artworkName: "RuinsCompanion07"),
                Item(name: "ギアモール", attack: 72, health: 390, probability: 3_750, rarity: .RsuperRare, artworkName: "RuinsCompanion08"),
                Item(name: "プリズムクラブ", attack: 70, health: 430, probability: 3_750, rarity: .RsuperRare, artworkName: "RuinsCompanion09"),
                Item(name: "スクロールスネーク", attack: 78, health: 410, probability: 3_750, rarity: .RsuperRare, artworkName: "RuinsCompanion10"),
                Item(name: "ミラージュフォックス", attack: 92, health: 500, probability: 1_000, rarity: .RultraRare, artworkName: "RuinsCompanion11"),
                Item(name: "グリフガーゴイル", attack: 98, health: 540, probability: 1_000, rarity: .RultraRare, artworkName: "RuinsCompanion12"),
                Item(name: "クリスタルフォックス", attack: 104, health: 520, probability: 1_000, rarity: .RultraRare, artworkName: "RuinsCompanion13"),
                Item(name: "クイズミミック", attack: 122, health: 650, probability: 152, rarity: .legendRare, artworkName: "RuinsCompanion14"),
                Item(name: "アストロジェリー", attack: 128, health: 630, probability: 152, rarity: .legendRare, artworkName: "RuinsCompanion15"),
                Item(name: "セージドラコ", attack: 148, health: 860, probability: 6, rarity: .godRare, artworkName: "RuinsCompanion16")
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
        artworkAssetName ?? name
    }

    var silhouetteArtworkName: String {
        "\(artworkName)_シルエット"
    }

    var hasDedicatedSilhouette: Bool {
        artworkAssetName == nil
    }

    func probabilityText(totalProbability: Int) -> String {
        guard totalProbability > 0 else { return "0%" }
        let percent = Double(probability) / Double(totalProbability) * 100
        let decimals = percent < 0.1 ? 3 : (percent < 1 ? 2 : 1)
        return percent.formatted(.number.precision(.fractionLength(decimals))) + "%"
    }
}

struct GachaAnimationSession: Identifiable {
    let id = UUID()
    let item: GachaManager.Item
    /// 初めて手に入れたおともなら true。
    var isNew: Bool = false
}

// MARK: - Quest-style Gacha Lobby
// 見た目は itQuiz のガチャ画面（漆黒×金, GachaTheme）に揃えている。

private struct QuestGachaLobbyScreen: View {
    let mode: GachaMode
    let ticketType: InventoryItemType
    let ticketCount: Int
    let userMoney: Int
    let cost: Int
    let canAffordDraw: Bool
    let isDrawInProgress: Bool
    let rewardLoaded: Bool
    let rewardLoadFailed: Bool
    let rewardGrantFailed: Bool
    let catalogItems: [GachaManager.Item]
    let onBack: () -> Void
    let onCoinTap: () -> Void
    let onDraw: () -> Void
    let onTicketDraw: () -> Void
    let onRewardAd: () -> Void
    let onCatalog: () -> Void

    @ObservedObject private var authManager = AuthManager.shared
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var featuredIndex = 0
    @State private var featuredTimer = Timer.publish(every: 3.2, on: .main, in: .common).autoconnect()

    /// 各ガチャのテーマ色（召喚陣の奥にごく薄く敷く）。
    private var themeColor: Color {
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
        case .ruins:
            return Color(hex: "D08A32")
        }
    }

    private var featuredItem: GachaManager.Item? {
        guard !catalogItems.isEmpty else { return nil }
        return catalogItems[featuredIndex % catalogItems.count]
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 12) {
                headerView
                titleView
                    .padding(.top, 4)
                stageView
                drawButton
                    .padding(.top, 4)
                ticketButton
                utilityButtons
                catalogButton
            }
            .frame(maxWidth: 560)
            .padding(.horizontal, 16)
            .padding(.top, 8)
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
            withAnimation(.easeInOut(duration: reduceMotion ? 0.3 : 0.8)) {
                featuredIndex = (featuredIndex + 1) % catalogItems.count
            }
        }
    }

    /// 背景画像は使わず、漆黒＋金の放射グローで統一する。
    private var backgroundView: some View {
        ZStack {
            GachaTheme.background

            GachaRadialGlow(opacity: 0.22, radius: 300)
                .offset(y: -40)
        }
        .ignoresSafeArea()
    }

    private var headerView: some View {
        HStack(alignment: .center) {
            GachaBackPill {
                generateHapticFeedback()
                onBack()
            }

            Spacer()

            GachaCoinPill(amount: userMoney, unitText: "コイン") {
                generateHapticFeedback()
                onCoinTap()
            }
        }
    }

    private var titleView: some View {
        VStack(spacing: 6) {
            Text(mode.displayName)
                .font(GachaFont.display(32, relativeTo: .largeTitle))
                .tracking(GachaFont.tracking(32))
                .foregroundColor(GachaTheme.goldHighlight)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .gachaGoldTextGlow()
                .accessibilityAddTraits(.isHeader)

            Text("このガチャで登場するおとも")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(GachaTheme.textMuted)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Stage
    private var stageView: some View {
        ZStack {
            GachaRadialGlow(color: themeColor, opacity: 0.16, radius: 170)

            GachaSummoningCircle(size: 300)

            // 足元の楕円グロー
            Ellipse()
                .fill(
                    RadialGradient(
                        colors: [GachaTheme.gold.opacity(0.45), GachaTheme.gold.opacity(0)],
                        center: .center,
                        startRadius: 0,
                        endRadius: 110
                    )
                )
                .frame(width: 230, height: 44)
                .offset(y: 92)
                .accessibilityHidden(true)

            // フィーチャー中のおとも
            ZStack {
                if let item = featuredItem {
                    featuredArtwork(item)
                        .id(item.name)
                        .transition(.opacity)
                }
            }
            .gachaFloating(amplitude: 6, period: 4)
            .offset(y: -18)

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    GachaTag(text: "全\(catalogItems.count)体", useLabelFont: false, size: 12)
                }
                Spacer()
                namePlate
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 330)
    }

    private func featuredArtwork(_ item: GachaManager.Item) -> some View {
        let owned = isOwned(item.name)

        return companionArtworkImage(named: item.artworkName)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            // 未所持はシルエット。暗い背景でも形がわかるよう金の縁光を付ける。
            .colorMultiply(owned ? .white : Color(hex: "2A2438"))
            .shadow(
                color: owned ? Color.black.opacity(0.45) : GachaTheme.gold.opacity(0.55),
                radius: owned ? 12 : 6,
                x: 0,
                y: owned ? 10 : 0
            )
            .accessibilityHidden(true)
    }

    @ViewBuilder
    private var namePlate: some View {
        if let item = featuredItem {
            let owned = isOwned(item.name)

            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: owned ? "checkmark.circle.fill" : "lock.fill")
                            .font(.system(size: 10, weight: .bold))
                        Text(item.rarity.displayString)
                            .font(.system(size: 11, weight: .bold))
                            .tracking(0.5)
                            .lineLimit(1)
                    }
                    .foregroundColor(GachaTheme.tagText)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 3)
                    .background(RoundedRectangle(cornerRadius: 2).fill(GachaTheme.gold))

                    Text(owned ? item.name : "シークレット")
                        .font(GachaFont.display(16, relativeTo: .headline))
                        .tracking(GachaFont.tracking(16))
                        .foregroundColor(GachaTheme.goldHighlight)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.black.opacity(0.85))
                        .overlay(RoundedRectangle(cornerRadius: 2).stroke(GachaTheme.gold, lineWidth: 1))
                )
                .id("caption-\(item.name)")
                .transition(.opacity)
                .accessibilityElement(children: .combine)

                indicator(count: min(catalogItems.count, 5))
            }
        }
    }

    private func indicator(count: Int) -> some View {
        HStack(spacing: 4) {
            ForEach(0..<count, id: \.self) { index in
                let isActive = count > 0 && featuredIndex % count == index
                RoundedRectangle(cornerRadius: 1)
                    .fill(isActive ? GachaTheme.gold : GachaTheme.gold.opacity(0.35))
                    .frame(width: isActive ? 18 : 6, height: 4)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: featuredIndex)
        .accessibilityHidden(true)
    }

    // MARK: Buttons
    private var drawButton: some View {
        Button(action: {
            generateHapticFeedback()
            onDraw()
        }) {
            HStack(spacing: 14) {
                Image(systemName: "sparkles")
                    .font(.system(size: 20, weight: .bold))

                VStack(spacing: 3) {
                    Text("ガチャを引く")
                        .font(GachaFont.display(24, relativeTo: .title))
                        .tracking(24 * 0.2)
                        // tracking は末尾にも付くので、左にも同じ幅を足して中央に揃える
                        .padding(.leading, 24 * 0.2)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)

                    Text("\(cost)コイン")
                        .font(.system(size: 12, weight: .bold))
                        .monospacedDigit()
                        .lineLimit(1)
                }

                Image(systemName: "sparkles")
                    .font(.system(size: 20, weight: .bold))
            }
            .foregroundColor(canAffordDraw ? GachaTheme.goldButtonText : Color.white.opacity(0.7))
            .frame(maxWidth: .infinity)
            .frame(height: 68)
            .background(GachaGoldButtonBackground(isEnabled: canAffordDraw, shinePeriod: 2.8))
            .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle())
        // The displayed balance can briefly be stale after a reward or purchase.
        // Keep the button tappable and let startGacha validate the server balance.
        .disabled(isDrawInProgress)
        .accessibilityLabel("ガチャを引く、\(cost)コイン")
    }

    private var ticketButton: some View {
        let hasTicket = ticketCount > 0

        return Button(action: {
            generateHapticFeedback()
            onTicketDraw()
        }) {
            HStack(spacing: 12) {
                InventoryItemArtworkView(type: ticketType, width: 36, height: 36, cornerRadius: GachaTheme.cornerRadius)
                    .opacity(hasTicket ? 1 : 0.5)

                VStack(alignment: .leading, spacing: 2) {
                    Text("チケットで引く")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(hasTicket ? GachaTheme.text : GachaTheme.textMuted)
                        .lineLimit(1)

                    Text("\(ticketType.shortName)チケットを1枚消費")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(GachaTheme.textMuted)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer()

                Text("×\(ticketCount)")
                    .font(.system(size: 20, weight: .bold))
                    .monospacedDigit()
                    .foregroundColor(hasTicket ? GachaTheme.goldLight : GachaTheme.textMuted)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 58)
            .background(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .fill(GachaTheme.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                            .stroke(hasTicket ? GachaTheme.gold : Color.gray.opacity(0.35), lineWidth: 1)
                    )
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle())
        .accessibilityLabel("チケットで引く、\(ticketType.shortName)チケット残り\(ticketCount)枚")
    }

    private var utilityButtons: some View {
        let isRewardAvailable = rewardLoaded || rewardLoadFailed || rewardGrantFailed

        return HStack(spacing: 10) {
            QuestGachaUtilityButton(
                iconName: "play.rectangle.fill",
                title: rewardGrantFailed ? "コインを受け取る" : rewardLoaded ? "広告を見て" : rewardLoadFailed ? "広告を再読み込み" : "広告を準備中",
                subtitle: rewardGrantFailed ? "広告を見直さずに再試行" : rewardLoaded ? "300コイン獲得" : rewardLoadFailed ? "タップして再試行" : "読み込みが終わると利用できます",
                isEnabled: isRewardAvailable,
                isLoading: !isRewardAvailable,
                action: onRewardAd
            )
            .disabled(!isRewardAvailable)

            QuestGachaUtilityButton(
                iconName: "cart.fill",
                title: "コイン購入",
                subtitle: "必要な分だけ追加できます",
                action: onCoinTap
            )
        }
    }

    private var catalogButton: some View {
        Button(action: {
            generateHapticFeedback()
            onCatalog()
        }) {
            HStack(spacing: 10) {
                Image(systemName: "square.grid.2x2.fill")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(GachaTheme.gold)

                VStack(alignment: .leading, spacing: 2) {
                    Text("おとも一覧")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(GachaTheme.text)
                    Text("登場するおともを確認")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(GachaTheme.textMuted)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(GachaTheme.textMuted)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(minHeight: 52)
            .background(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .fill(GachaTheme.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                            .stroke(GachaTheme.line, lineWidth: 1)
                    )
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(ScaleButtonStyle())
    }

    private func isOwned(_ name: String) -> Bool {
        authManager.avatars.contains(where: { $0.name == name })
    }
}

/// ガチャ画面下段の小さな行動ボタン（広告／コイン購入）。
private struct QuestGachaUtilityButton: View {
    let iconName: String
    let title: String
    let subtitle: String
    var isEnabled: Bool = true
    var isLoading: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: {
            generateHapticFeedback()
            action()
        }) {
            HStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(isEnabled ? GachaTheme.gold : GachaTheme.textMuted)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(isEnabled ? GachaTheme.text : GachaTheme.textMuted)
                        .lineLimit(1)
                    Text(subtitle)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(GachaTheme.textMuted)
                        .lineLimit(2)
                }
                .minimumScaleFactor(0.8)

                Spacer(minLength: 0)

                if isLoading {
                    ProgressView()
                        .tint(GachaTheme.textMuted)
                        .scaleEffect(0.7)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, minHeight: 58)
            .background(
                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                    .fill(GachaTheme.surface.opacity(0.6))
                    .overlay(
                        RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                            .stroke(isEnabled ? GachaTheme.gold.opacity(0.22) : Color.gray.opacity(0.25), lineWidth: 1)
                    )
            )
            .contentShape(Rectangle())
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
    /// 抽選前の所持状態で判定した「初めて手に入れたおとも」かどうか。
    @State private var obtainedIsNew: Bool = false
    
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
    @StateObject var reward = Reward(placement: .gacha)
    
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
        case .ruins: return .ruinsGachaTicket
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
        case .ruins: return "遺跡"
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
                        guard userMoney >= gachaManager.gachaCost else {
                            showUnCoinModal = true
                            return
                        }
                        startGacha(keepResult: true)
                    },
                    isNew: obtainedIsNew
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
        .onDisappear { reward.stopPreloading() }
        .fullScreenCover(item: $activeAnimationSession) { session in
            GachaAnimationView(rarity: session.item.rarity, item: session.item) {
                activeAnimationSession = nil
                obtainedItem = session.item
                obtainedIsNew = session.isNew
                showResult = true
                isGachaInProgress = false
                fetchUserMoney()
            }
        }
        .alert("コインが足りません", isPresented: $showUnCoinModal) {
            Button(action: {
                if reward.rewardGrantFailed {
                    reward.retryPendingCoinReward()
                } else if reward.rewardLoaded {
                    reward.ShowReward()
                } else if reward.rewardLoadFailed {
                    reward.retryLoading()
                } else {
                    // リワード広告が読み込まれていない場合
                    showCoinModal = true
                }
            }) {
                Text(reward.rewardGrantFailed ? "コインの受け取りを再試行" : reward.rewardLoaded ? "広告を見る (300コイン)" : reward.rewardLoadFailed ? "広告を再読み込み" : "広告を読み込み中...")
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
        .alert("チケットがありません", isPresented: $showNoTicketAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("\(ticketName)ガチャチケットが必要です")
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
            rewardLoadFailed: reward.rewardLoadFailed,
            rewardGrantFailed: reward.rewardGrantFailed,
            catalogItems: gachaManager.items,
            onBack: {
                presentationMode.wrappedValue.dismiss()
                audioManager.playCancelSound()
            },
            onCoinTap: {
                showCoinModal = true
            },
            onDraw: { startGacha() },
            onTicketDraw: drawWithTicket,
            onRewardAd: {
                if reward.rewardGrantFailed {
                    reward.retryPendingCoinReward()
                } else if reward.rewardLoaded {
                    reward.ShowReward()
                } else if reward.rewardLoadFailed {
                    reward.retryLoading()
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
                    Button(action: { startGacha() }) {
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
                        if reward.rewardGrantFailed {
                            reward.retryPendingCoinReward()
                        } else if reward.rewardLoaded {
                            reward.ShowReward()
                        } else if reward.rewardLoadFailed {
                            reward.retryLoading()
                        }
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
                                if !reward.rewardLoaded && !reward.rewardLoadFailed && !reward.rewardGrantFailed {
                                    ZStack {
                                        Color.black.opacity(0.2).cornerRadius(16)
                                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    }
                                }
                            }
                        )
                    }
                    .disabled(!reward.rewardLoaded && !reward.rewardLoadFailed && !reward.rewardGrantFailed)

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

    /// - Parameter keepResult: 結果画面の「もう一度召喚」から呼ぶときは true。演出が出るまで結果画面を残す。
    private func startGacha(keepResult: Bool = false) {
        guard !isGachaInProgress else { return }
        let cost = gachaManager.gachaCost

        isGachaInProgress = true
        performGachaDraw(coinCost: cost, keepResult: keepResult)
    }

    private func performGachaDraw(
        coinCost: Int = 0,
        ticketType: InventoryItemType? = nil,
        keepResult: Bool = false
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
        let isNewAvatar = !authManager.avatars.contains { $0.name == item.name }
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
            if isNewAvatar {
                // 取得クールダウン中でも次回の NEW 判定がずれないよう、手元の一覧にも足しておく
                authManager.avatars.append(avatar)
            }
            recordGachaProgress()
            presentGachaAnimation(for: item, isNew: isNewAvatar, keepResult: keepResult)
            checkAvatarCount()
        }
    }

    private func presentGachaAnimation(for item: GachaManager.Item, isNew: Bool, keepResult: Bool) {
        if !keepResult {
            obtainedItem = nil
            showResult = false
        }
        activeAnimationSession = nil
        DispatchQueue.main.async {
            activeAnimationSession = GachaAnimationSession(item: item, isNew: isNew)
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

// MARK: - Result View
struct GachaResultView: View {
    let item: GachaManager.Item?
    let gachaCost: Int  // 追加
    let onClose: () -> Void
    let onPlayAgain: () -> Void
    /// 初めて手に入れたおともなら true（抽選前の所持状態で呼び出し側が判定する）。
    var isNew: Bool = false
    
    @State private var showContent: Bool = false
    @State private var raysRotation: Double = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    
    var body: some View {
        GeometryReader { proxy in
            // 縦が足りない端末（iPhone SE など）ではカードを縮める
            let cardScale = min(1, max(0.72, (proxy.size.height - 330) / 380))
            let cardSize = CGSize(width: 296 * cardScale, height: 380 * cardScale)

            ZStack {
                backgroundView(size: proxy.size)

                VStack(spacing: 0) {
                    Spacer(minLength: 8)

                    if let item = item {
                        rarityTitle(item)
                            .modifier(ResultAppear(isVisible: showContent, delay: 0.1, reduceMotion: reduceMotion))

                        Spacer(minLength: 12).frame(maxHeight: 22)

                        resultCard(item, size: cardSize, scale: cardScale)
                            .modifier(ResultAppear(isVisible: showContent, delay: 0.25, reduceMotion: reduceMotion, fromScale: 0.6))

                        Spacer(minLength: 12).frame(maxHeight: 20)

                        statusTiles(item)
                            .frame(maxWidth: cardSize.width + 24)
                            .modifier(ResultAppear(isVisible: showContent, delay: 0.45, reduceMotion: reduceMotion))
                    }

                    Spacer(minLength: 12)

                    buttons
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16)
                        .modifier(ResultAppear(isVisible: showContent, delay: 0.6, reduceMotion: reduceMotion))
                }
                .frame(maxWidth: 520)
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            startEntrance()
            if !reduceMotion {
                withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)) {
                    raysRotation = 360
                }
            }
        }
        // 「もう一度召喚」で中身が変わったら登場アニメをやり直す
        .onChange(of: item?.name) { _ in
            showContent = false
            startEntrance()
        }
    }

    private func startEntrance() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            showContent = true
        }
    }

    // MARK: Background
    private func backgroundView(size: CGSize) -> some View {
        let diameter = max(size.width, size.height) * 1.6

        return ZStack {
            GachaTheme.background

            GachaSunburst()
                .frame(width: diameter, height: diameter)
                .rotationEffect(.degrees(raysRotation))
                .position(x: size.width / 2, y: size.height * 0.42)

            GachaRadialGlow(opacity: 0.3, radius: 240)
                .position(x: size.width / 2, y: size.height * 0.42)

            // 下の方は背景色に溶かす
            LinearGradient(
                stops: [
                    .init(color: GachaTheme.background.opacity(0), location: 0.55),
                    .init(color: GachaTheme.background, location: 0.9)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
    }

    // MARK: Parts
    private func rarityTitle(_ item: GachaManager.Item) -> some View {
        HStack(spacing: 12) {
            GachaGoldRule(width: 40, fadeToTrailing: false)
            Text(item.rarity.displayString)
                .font(GachaFont.display(34, relativeTo: .largeTitle))
                .tracking(GachaFont.tracking(34))
                .foregroundColor(GachaTheme.goldHighlight)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .gachaGoldTextGlow()
            GachaGoldRule(width: 40, fadeToTrailing: true)
        }
        .padding(.horizontal, 16)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("レア度 \(item.rarity.displayString)")
    }

    private func resultCard(_ item: GachaManager.Item, size: CGSize, scale: CGFloat) -> some View {
        let frameWidth: CGFloat = 6

        return ZStack {
            // 枠（金グラデ）
            RoundedRectangle(cornerRadius: 8)
                .fill(GachaTheme.cardFrameGradient)

            // 内側
            ZStack(alignment: .bottom) {
                GachaTheme.cardInnerGradient(radius: size.height * 0.6)

                Image(item.name)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 18 * scale)
                    .padding(.top, 26 * scale)
                    .padding(.bottom, 64 * scale)
                    .shadow(color: GachaTheme.gold.opacity(0.35), radius: 18, x: 0, y: 8)
                    .gachaFloating(amplitude: 5, period: 4)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .accessibilityHidden(true)

                // 下部の暗いグラデ＋キャラ名
                LinearGradient(
                    colors: [Color.black.opacity(0), Color.black.opacity(0.85)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 96 * scale)

                Text(item.name)
                    .font(GachaFont.display(24, relativeTo: .title))
                    .tracking(GachaFont.tracking(24))
                    .foregroundColor(GachaTheme.goldHighlight)
                    .lineLimit(1)
                    .minimumScaleFactor(0.55)
                    .gachaGoldTextGlow()
                    .padding(.horizontal, 14)
                    .padding(.bottom, 18 * scale)
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(frameWidth)

            if isNew {
                GachaTag(text: "NEW", size: 12)
                    .padding(.top, frameWidth + 12)
                    .padding(.trailing, frameWidth + 12)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .accessibilityLabel("初めて獲得")
            }
        }
        .frame(width: size.width, height: size.height)
        .shadow(color: GachaTheme.glow, radius: 30, x: 0, y: 12)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.name)\(isNew ? "、初めて獲得" : "")")
    }

    private func statusTiles(_ item: GachaManager.Item) -> some View {
        HStack(spacing: 12) {
            statusTile(label: "攻撃力", value: item.attack)
            statusTile(label: "HP", value: item.health)
        }
        .padding(.horizontal, 12)
    }

    private func statusTile(label: String, value: Int) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(GachaTheme.textMuted)
            Text("\(value)")
                .font(.system(size: 22, weight: .bold))
                .monospacedDigit()
                .foregroundColor(GachaTheme.text)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(
            RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                .fill(GachaTheme.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                        .stroke(GachaTheme.line, lineWidth: 1)
                )
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(label) \(value)")
    }

    private var buttons: some View {
        VStack(spacing: 12) {
            // もう一度召喚
            Button(action: onPlayAgain) {
                VStack(spacing: 2) {
                    Text("もう一度召喚")
                        .font(GachaFont.display(19, relativeTo: .title3))
                        .tracking(GachaFont.tracking(19))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    Text("\(gachaCost.formatted())コイン")
                        .font(.system(size: 11, weight: .bold))
                        .monospacedDigit()
                }
                .foregroundColor(GachaTheme.goldButtonText)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(GachaGoldButtonBackground(shinePeriod: 2.8))
                .contentShape(Rectangle())
            }
            .buttonStyle(ScaleButtonStyle())
            .accessibilityLabel("もう一度召喚、\(gachaCost)コイン")

            // 確認
            Button(action: onClose) {
                Text("確認")
                    .font(.system(size: 16, weight: .bold))
                    .tracking(2)
                    .foregroundColor(GachaTheme.goldLight)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                            .fill(Color.black.opacity(0.35))
                            .overlay(
                                RoundedRectangle(cornerRadius: GachaTheme.cornerRadius)
                                    .stroke(GachaTheme.gold, lineWidth: 1)
                            )
                    )
                    .contentShape(Rectangle())
            }
            .buttonStyle(ScaleButtonStyle())
            .accessibilityLabel("確認して閉じる")
        }
    }
}

/// 結果画面の時間差登場（バネ）。Reduce Motion のときはフェードのみ。
private struct ResultAppear: ViewModifier {
    let isVisible: Bool
    let delay: Double
    let reduceMotion: Bool
    var fromScale: CGFloat = 0.85

    func body(content: Content) -> some View {
        content
            .scaleEffect(isVisible || reduceMotion ? 1 : fromScale)
            .offset(y: isVisible || reduceMotion ? 0 : 16)
            .opacity(isVisible ? 1 : 0)
            .animation(
                reduceMotion
                    ? .easeOut(duration: 0.25).delay(delay * 0.5)
                    : .spring(response: 0.6, dampingFraction: 0.7).delay(delay),
                value: isVisible
            )
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
