//
//  GachaCatalogView.swift
//  drill
//

import SwiftUI

// MARK: - GachaRarity display helpers
extension GachaRarity {
    var catalogColor: Color {
        switch self {
        case .normal: return .gray
        case .rare, .Rrare, .mekaRare: return .blue
        case .superRare, .RsuperRare, .mekaSuperRare: return .purple
        case .ultraRare, .RultraRare, .mekaUltraRare: return .orange
        case .legendRare, .mekaLegendRare: return .yellow
        case .godRare: return Color(hex: "FFD700")
        }
    }

    var catalogIcon: String {
        switch self {
        case .normal: return "circle.fill"
        case .rare, .Rrare, .mekaRare: return "diamond.fill"
        case .superRare, .RsuperRare, .mekaSuperRare: return "star.fill"
        case .ultraRare, .RultraRare, .mekaUltraRare: return "bolt.fill"
        case .legendRare, .mekaLegendRare: return "crown.fill"
        case .godRare: return "sparkles"
        }
    }
}

// MARK: - GachaCatalogView
struct GachaCatalogView: View {
    let mode: GachaMode
    @ObservedObject var authManager = AuthManager.shared
    @ObservedObject var audioManager = AudioManager.shared
    @Environment(\.presentationMode) var presentationMode

    private let items: [GachaManager.Item]
    @State private var selectedItem: GachaManager.Item?
    @State private var animateSelection = false

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    init(mode: GachaMode) {
        self.mode = mode
        self.items = GachaManager(mode: mode).items
    }

    private var ownedCount: Int {
        items.filter { item in
            authManager.avatars.contains(where: { $0.name == item.name })
        }.count
    }

    private func rarityGroups() -> [(String, [GachaManager.Item])] {
        let order = ["ゴッドレア", "レジェンドレア", "ウルトラレア", "スーパーレア", "レア", "ノーマル"]
        return order.compactMap { rarityStr in
            let filtered = items.filter { $0.rarity.displayString == rarityStr }
            return filtered.isEmpty ? nil : (rarityStr, filtered)
        }
    }

    var body: some View {
        GeometryReader { _ in
            VStack(spacing: 0) {
                // コレクション進捗バー
                CollectionProgressBar(owned: ownedCount, total: items.count)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    .padding(.bottom, 8)

                // 詳細カード
                GachaCatalogDetailCard(
                    selectedItem: selectedItem,
                    authManager: authManager,
                    animateSelection: animateSelection
                )
                .frame(height: 185)
                .padding(.horizontal, 20)
                .padding(.bottom, 8)

                // レアリティ別グリッド
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(rarityGroups(), id: \.0) { rarityStr, groupItems in
                            GachaCatalogSectionView(
                                rarityString: rarityStr,
                                items: groupItems,
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
            selectedItem = items.first
            authManager.fetchAvatars { }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {
            generateHapticFeedback()
            presentationMode.wrappedValue.dismiss()
            audioManager.playCancelSound()
        }))
        .navigationTitle("\(mode.displayName)図鑑")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Detail Card
struct GachaCatalogDetailCard: View {
    let selectedItem: GachaManager.Item?
    let authManager: AuthManager
    let animateSelection: Bool

    var body: some View {
        if let item = selectedItem {
            let isOwned = authManager.avatars.contains(where: { $0.name == item.name })
            VStack(spacing: 10) {
                HStack {
                    GachaCatalogRarityBadge(rarity: item.rarity)
                    Text(isOwned ? item.name : "???")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(isOwned ? .primary : .secondary)
                    Spacer()
                }

                HStack(alignment: .center, spacing: 24) {
                    ZStack {
                        if item.rarity == .legendRare && isOwned {
                            Circle()
                                .fill(RadialGradient(
                                    gradient: Gradient(colors: [item.rarity.catalogColor.opacity(0.3), Color.clear]),
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: 60
                                ))
                                .frame(width: 120, height: 120)
                        }
                            Image(isOwned ? item.artworkName : item.silhouetteArtworkName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .shadow(color: item.rarity.catalogColor.opacity(0.5), radius: 8, x: 0, y: 4)
                            .scaleEffect(animateSelection ? 1.05 : 1.0)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: animateSelection)
                    }

                    VStack(alignment: .trailing, spacing: 8) {
                        ZStack {
                            Image("ハートバー")
                                .resizable()
                                .frame(width: 110, height: 36)
                            Text("\(item.health)")
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("fontGray"))
                                .padding(.leading, 60)
                                .padding(.top, 12)
                        }
                        ZStack {
                            Image("攻撃バー")
                                .resizable()
                                .frame(width: 106, height: 36)
                            Text("\(item.attack)")
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
                            .stroke(item.rarity.catalogColor.opacity(0.3), lineWidth: 2)
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

// MARK: - Section View
struct GachaCatalogSectionView: View {
    let rarityString: String
    let items: [GachaManager.Item]
    let selectedItem: GachaManager.Item?
    let authManager: AuthManager
    let columns: [GridItem]
    let onTap: (GachaManager.Item) -> Void

    private var sectionRarity: GachaRarity { items[0].rarity }

    private var ownedInSection: Int {
        items.filter { item in
            authManager.avatars.contains(where: { $0.name == item.name })
        }.count
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: sectionRarity.catalogIcon)
                    .font(.system(size: 12))
                    .foregroundColor(sectionRarity.catalogColor)
                Text(rarityString)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color("fontGray"))
                Spacer()
                Text("\(ownedInSection)/\(items.count)")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(sectionRarity.catalogColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Capsule().fill(sectionRarity.catalogColor.opacity(0.2)))
            }
            .padding(.horizontal, 4)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(items, id: \.name) { item in
                    GachaCatalogGridItemView(
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

// MARK: - Grid Item View
struct GachaCatalogGridItemView: View {
    let item: GachaManager.Item
    let isOwned: Bool
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.rarity.catalogColor.opacity(0.2))
                            .frame(width: 80, height: 80)
                    }
                    Image(isOwned ? item.artworkName : item.silhouetteArtworkName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(isOwned ? 1.0 : 0.5)
                }
                Circle()
                    .fill(item.rarity.catalogColor)
                    .frame(width: 6, height: 6)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(
                                isSelected ? item.rarity.catalogColor : Color.clear,
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

// MARK: - Rarity Badge
struct GachaCatalogRarityBadge: View {
    let rarity: GachaRarity

    var body: some View {
        Text(rarity.displayString)
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: rarity.gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .overlay(Capsule().stroke(rarity.catalogColor, lineWidth: 1))
            )
    }
}
