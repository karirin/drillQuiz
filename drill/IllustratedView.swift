//
//  IllustratedView.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/07.
//

import SwiftUI
import Firebase

// MARK: - Models
struct Item: Identifiable {
    let name: String
    let attack: Int
    let probability: Int
    let health: Int
    let rarity: Rarity
    var id: String { name }
}

enum Rarity: CaseIterable {
    case normal
    case rare
    case superRare
    case ultraRare
    case legendRare
    case godRare

    var displayString: String {
        switch self {
        case .normal:
            return "ノーマル"
        case .rare:
            return "レア"
        case .superRare:
            return "スーパーレア"
        case .ultraRare:
            return "ウルトラレア"
        case .legendRare:
            return "レジェンドレア"
        case .godRare:
            return "ゴッドレア"
        }
    }

    var color: Color {
        switch self {
        case .normal:
            return Color.gray
        case .rare:
            return Color.blue
        case .superRare:
            return Color.purple
        case .ultraRare:
            return Color.orange
        case .legendRare:
            return Color.yellow
        case .godRare:
            return Color(hex: "FFD700")
        }
    }

    var gradientColors: [Color] {
        switch self {
        case .normal:
            return [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]
        case .rare:
            return [Color.blue.opacity(0.3), Color.blue.opacity(0.1)]
        case .superRare:
            return [Color.purple.opacity(0.3), Color.purple.opacity(0.1)]
        case .ultraRare:
            return [Color.orange.opacity(0.3), Color.orange.opacity(0.1)]
        case .legendRare:
            return [Color.yellow.opacity(0.3), Color.yellow.opacity(0.1)]
        case .godRare:
            return [Color(hex: "14002E").opacity(0.35), Color(hex: "5E2BFF").opacity(0.25), Color(hex: "FFD700").opacity(0.2)]
        }
    }

    var icon: String {
        switch self {
        case .normal: return "circle.fill"
        case .rare: return "diamond.fill"
        case .superRare: return "star.fill"
        case .ultraRare: return "bolt.fill"
        case .legendRare: return "crown.fill"
        case .godRare: return "sparkles"
        }
    }
}

struct IllustratedView: View {
    let items = ["もりこう","ライム", "レッドドラゴン", "レインボードラゴン"]

    let allItems: [Item] = [
        Item(name: "えんぴ君", attack: 20, probability: 25, health: 20, rarity: .normal),
        Item(name: "ナイト", attack: 20, probability: 25, health: 20, rarity: .normal),
        Item(name: "てーる", attack: 15, probability: 25, health: 15, rarity: .normal),
        Item(name: "ぷりん", attack: 20, probability: 25, health: 10, rarity: .normal),
        Item(name: "たまっち", attack: 20, probability: 25, health: 100, rarity: .normal),
        Item(name: "うきわうさぎ", attack: 25, probability: 25, health: 150, rarity: .normal),
        Item(name: "かげねこ", attack: 30, probability: 25, health: 200, rarity: .normal),
        Item(name: "リュウ", attack: 35, probability: 10, health: 220, rarity: .rare),
        Item(name: "ウィザード", attack: 40, probability: 10, health: 240, rarity: .rare),
        Item(name: "ウィッチ", attack: 45, probability: 10, health: 260, rarity: .rare),
        Item(name: "フローラ", attack: 47, probability: 5, health: 280, rarity: .superRare),
        Item(name: "プリンス", attack: 48, probability: 5, health: 285, rarity: .superRare),
        Item(name: "キング・イロン", attack: 50, probability: 3, health: 300, rarity: .ultraRare),
        // 英雄ガチャ
        Item(name: "ヒールスライム", attack: 38, probability: 28, health: 240, rarity: .rare),
        Item(name: "風の精",        attack: 44, probability: 28, health: 265, rarity: .rare),
        Item(name: "森のアーチャー", attack: 50, probability: 24, health: 300, rarity: .superRare),
        Item(name: "エルウィン",    attack: 56, probability: 14, health: 340, rarity: .superRare),
        Item(name: "紅の武者",      attack: 64, probability: 5,  health: 390, rarity: .ultraRare),
        Item(name: "スライムキング", attack: 76, probability: 1,  health: 480, rarity: .legendRare),
        // 星座ガチャ
        Item(name: "ほしうさ", attack: 42, probability: 980, health: 260, rarity: .rare),
        Item(name: "こぐまナイト", attack: 40, probability: 980, health: 280, rarity: .rare),
        Item(name: "てんびんロボ", attack: 45, probability: 930, health: 250, rarity: .rare),
        Item(name: "かにシェル", attack: 36, probability: 880, health: 300, rarity: .rare),
        Item(name: "やぎランナー", attack: 48, probability: 820, health: 245, rarity: .rare),
        Item(name: "うおツイン", attack: 44, probability: 770, health: 255, rarity: .rare),
        Item(name: "ししファング", attack: 58, probability: 650, health: 360, rarity: .superRare),
        Item(name: "アクアマーメ", attack: 62, probability: 620, health: 340, rarity: .superRare),
        Item(name: "おとめルナ", attack: 64, probability: 600, health: 330, rarity: .superRare),
        Item(name: "ふたごスパーク", attack: 68, probability: 560, health: 320, rarity: .superRare),
        Item(name: "いてアロー", attack: 66, probability: 520, health: 350, rarity: .superRare),
        Item(name: "おひつじブレイブ", attack: 60, probability: 500, health: 370, rarity: .superRare),
        Item(name: "オリオン", attack: 82, probability: 280, health: 440, rarity: .ultraRare),
        Item(name: "スコルピア", attack: 86, probability: 260, health: 430, rarity: .ultraRare),
        Item(name: "タウラスガード", attack: 74, probability: 240, health: 500, rarity: .ultraRare),
        Item(name: "カプリコーン", attack: 80, probability: 220, health: 455, rarity: .ultraRare),
        Item(name: "コスモドラゴン", attack: 98, probability: 70, health: 580, rarity: .legendRare),
        Item(name: "ルナフェニックス", attack: 106, probability: 60, health: 540, rarity: .legendRare),
        Item(name: "アストラナイト", attack: 94, probability: 55, health: 600, rarity: .legendRare),
        Item(name: "ゾディアーク", attack: 135, probability: 5, health: 780, rarity: .godRare)
    ]

    @State private var selectedItem: Item?
    @State private var avatars: [String] = []
    @ObservedObject var authManager = AuthManager.shared
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var audioManager = AudioManager.shared
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var switchingAvatar: Avatar?
    @Binding var isPresenting: Bool
    @State private var animateSelection = false

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
    }

    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    // コレクション進捗
    private var ownedCount: Int {
        allItems.filter { item in
            authManager.avatars.contains(where: { $0.name == item.name })
        }.count
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // コレクション進捗バー
                CollectionProgressBar(owned: ownedCount, total: allItems.count)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 8)

                // 詳細表示エリア
                DetailCardView(selectedItem: selectedItem, authManager: authManager, animateSelection: animateSelection)
                    .frame(height: 170)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)

                // レアリティ別グリッド
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(rarityGroups(), id: \.0.displayString) { rarity, items in
                            RaritySectionView(
                                rarity: rarity,
                                items: items,
                                selectedItem: selectedItem,
                                authManager: authManager,
                                columns: columns,
                                onTap: { item in
                                    generateHapticFeedback()
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                                        selectedItem = item
                                        animateSelection.toggle()
                                    }
                                    audioManager.playSound()
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                }
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("purple2"), Color("purple2").opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .onAppear {
            selectedItem = allItems.first
            authManager.fetchAvatars {
                for item in allItems {
                    let _ = authManager.avatars.contains(where: { $0.name == item.name })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            generateHapticFeedback()
            presentationMode.wrappedValue.dismiss()
            audioManager.playCancelSound()
        }))
        .navigationTitle("おとも図鑑")
        .navigationBarTitleDisplayMode(.inline)
    }

    // レアリティごとにグループ化
    private func rarityGroups() -> [(Rarity, [Item])] {
        let order: [Rarity] = [.normal, .rare, .superRare, .ultraRare, .legendRare, .godRare]
        return order.compactMap { rarity in
            let items = allItems.filter { $0.rarity == rarity }
            return items.isEmpty ? nil : (rarity, items)
        }
    }
}

// MARK: - コレクション進捗バー
struct CollectionProgressBar: View {
    let owned: Int
    let total: Int

    private var progress: CGFloat {
        guard total > 0 else { return 0 }
        return CGFloat(owned) / CGFloat(total)
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Image(systemName: "book.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Color("fontGray"))
                Text("コレクション")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("fontGray"))
                Spacer()
                Text("\(owned) / \(total)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color("fontGray"))
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.yellow, Color.orange]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.7))
        )
    }
}

// MARK: - レアリティセクション
struct RaritySectionView: View {
    let rarity: Rarity
    let items: [Item]
    let selectedItem: Item?
    let authManager: AuthManager
    let columns: [GridItem]
    let onTap: (Item) -> Void

    private var ownedInSection: Int {
        items.filter { item in
            authManager.avatars.contains(where: { $0.name == item.name })
        }.count
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // セクションヘッダー
            HStack(spacing: 8) {
                Image(systemName: rarity.icon)
                    .font(.system(size: 12))
                    .foregroundColor(rarity.color)
                Text(rarity.displayString)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color("fontGray"))

                Spacer()

                Text("\(ownedInSection)/\(items.count)")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(rarity.color)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        Capsule()
                            .fill(rarity.color.opacity(0.2))
                    )
            }
            .padding(.horizontal, 4)

            // グリッド
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(items) { item in
                    GridItemView(
                        item: item,
                        isOwned: authManager.avatars.contains(where: { $0.name == item.name }),
                        isSelected: selectedItem?.name == item.name,
                        onTap: { onTap(item) }
                    )
                }
            }
        }
    }
}

// MARK: - Detail Card View
struct DetailCardView: View {
    let selectedItem: Item?
    let authManager: AuthManager
    let animateSelection: Bool

    var body: some View {
        if let selected = selectedItem {
            VStack(spacing: 12) {
                // レアリティとタイトル
                HStack {
                    RarityBadge(rarity: selected.rarity)
                    Text(authManager.avatars.contains(where: { $0.name == selected.name }) ? selectedItem!.name : "???")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(authManager.avatars.contains(where: { $0.name == selected.name }) ? .primary : .secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }

                // メインコンテンツ
                HStack(alignment: .center, spacing: 24) {
                    // キャラクター画像
                    CharacterImageView(
                        item: selected,
                        isOwned: authManager.avatars.contains(where: { $0.name == selected.name }),
                        animate: animateSelection
                    )

                    // ステータス
                    VStack(alignment: .trailing, spacing: 8) {
                        ZStack {
                            Image("ハートバー")
                                .resizable()
                                .frame(width: 110, height: 36)
                            Text("\(selected.health)")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("fontGray"))
                                .padding(.leading, 60)
                                .padding(.top, 12)
                        }
                        ZStack {
                            Image("攻撃バー")
                                .resizable()
                                .frame(width: 106, height: 36)
                            Text("\(selected.attack)")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("fontGray"))
                                .padding(.leading, 60)
                                .padding(.top, 8)
                        }
                    }
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(selected.rarity.color.opacity(0.3), lineWidth: 2)
                    )
            )
        } else {
            RoundedRectangle(cornerRadius: 18)
                .fill(.ultraThinMaterial)
                .overlay(
                    Text("キャラクターを選択してください")
                        .foregroundColor(.secondary)
                        .font(.headline)
                )
        }
    }
}

// MARK: - Character Image View
struct CharacterImageView: View {
    let item: Item
    let isOwned: Bool
    let animate: Bool

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                if (item.rarity == .legendRare || item.rarity == .godRare) && isOwned {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [item.rarity.color.opacity(0.3), Color.clear]),
                                center: .center,
                                startRadius: 10,
                                endRadius: 70
                            )
                        )
                        .frame(width: 140, height: 140)
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                }

                Image(isOwned ? item.name : "\(item.name)_シルエット")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: item.rarity.color.opacity(0.5), radius: 8, x: 0, y: 4)
                    .scaleEffect(animate ? 1.05 : 1.0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: animate)
            }
        }
    }
}

// MARK: - Status Bar
struct StatusBar: View {
    let icon: String
    let value: String
    let color: Color
    let maxWidth: CGFloat

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 20)

            Text(value)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .frame(maxWidth: maxWidth, alignment: .leading)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

// MARK: - Rarity Badge
struct RarityBadge: View {
    let rarity: Rarity

    var body: some View {
        Text(rarity.displayString)
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: rarity.gradientColors),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .overlay(
                        Capsule()
                            .stroke(rarity.color, lineWidth: 1)
                    )
            )
    }
}

// MARK: - Grid Item View
struct GridItemView: View {
    let item: Item
    let isOwned: Bool
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.rarity.color.opacity(0.2))
                            .frame(width: 80, height: 80)
                            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isSelected)
                    }

                    Image(isOwned ? item.name : "\(item.name)_シルエット")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(isOwned ? 1.0 : 0.5)
                }

                // レアリティドット
                Circle()
                    .fill(item.rarity.color)
                    .frame(width: 6, height: 6)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(
                                isSelected ? item.rarity.color : Color.clear,
                                lineWidth: isSelected ? 2.5 : 0
                            )
                    )
            )
            .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Back Button
struct BackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                Text("戻る")
                    .font(.system(size: 16))
            }
            .foregroundColor(Color("fontGray"))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
//    IllustratedView(isPresenting: .constant(false))
    TopView()
}
