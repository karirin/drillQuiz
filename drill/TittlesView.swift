//
//  TittlesView.swift
//  itQuiz
//
//  Created by hashimo ryoya on 2024/01/04.
//

import SwiftUI
import Firebase

struct TittlesView: View {
    let items = ["もりこう","ライム", "レッドドラゴン", "レインボードラゴン"]

    struct Item: Identifiable {
        let name: String
        let attack: String
        let probability: Int
        let health: String
        let rarity: Rarity
        var id: String { name }
    }

    enum Rarity: CaseIterable {
        case normal
        case rare
        case superRare
        case ultraRare
        case legendRare

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
                return Color.red
            }
        }

        var backgroundColor: Color {
            switch self {
            case .normal:
                return Color.gray.opacity(0.1)
            case .rare:
                return Color.blue.opacity(0.1)
            case .superRare:
                return Color.purple.opacity(0.1)
            case .ultraRare:
                return Color.orange.opacity(0.1)
            case .legendRare:
                return Color.red.opacity(0.1)
            }
        }

        var icon: String {
            switch self {
            case .normal: return "circle.fill"
            case .rare: return "diamond.fill"
            case .superRare: return "star.fill"
            case .ultraRare: return "bolt.fill"
            case .legendRare: return "crown.fill"
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
                return [Color.red.opacity(0.3), Color.red.opacity(0.1)]
            }
        }
    }

    let allItems: [Item] = [
        Item(name: "レベル３", attack: "スリースター", probability: 25, health: "レベル３を達成したことを讃える称号", rarity: .normal),
        Item(name: "レベル５", attack: "ネオンスター", probability: 25, health: "レベル５を達成したことを讃える称号", rarity: .normal),
        Item(name: "レベル１０", attack: "プラチナスター", probability: 25, health: "レベル１０を達成したことを讃える称号", rarity: .normal),
        Item(name: "回答数３０", attack: "ブロンズコイン", probability: 25, health: "問題の回答数が３０問を達成したことを讃える称号", rarity: .normal),
        Item(name: "回答数５０", attack: "シルバーコイン", probability: 25, health: "問題の回答数が５０問を達成したことを讃える称号", rarity: .normal),
        Item(name: "回答数１００", attack: "ゴールドコイン", probability: 25, health: "問題の回答数が１００問を達成したことを讃える称号", rarity: .normal),
        Item(name: "おとも１０種類制覇", attack: "ライムコイン", probability: 10, health: "おともを１０種類仲間にしたことを讃える称号", rarity: .rare),
        Item(name: "おとも２０種類制覇", attack: "覚醒ライムの盾", probability: 10, health: "おともを２０種類仲間にしたことを讃える称号", rarity: .rare),
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

    init(isPresenting: Binding<Bool>) {
        _isPresenting = isPresenting
    }

    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    @State private var userTitles: [String: Bool] = [:]

    func fetchUserTitles(userId: String) {
        let titlesRef = Database.database().reference().child("titles").child(userId)
        titlesRef.observeSingleEvent(of: .value) { snapshot in
            if let titles = snapshot.value as? [String: Bool] {
                self.userTitles = titles
            }
        }
    }

    // 取得済みの称号数
    private var unlockedCount: Int {
        allItems.filter { userTitles[$0.name] == true }.count
    }

    // レアリティでグループ化
    private func rarityGroups() -> [(Rarity, [Item])] {
        let order: [Rarity] = [.normal, .rare, .superRare, .ultraRare, .legendRare]
        return order.compactMap { rarity in
            let items = allItems.filter { $0.rarity == rarity }
            return items.isEmpty ? nil : (rarity, items)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // 称号進捗バー
            TitleProgressBar(unlocked: unlockedCount, total: allItems.count)
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 8)

            // 詳細表示エリア
            titleDetailView
                .padding(.horizontal, 20)
                .padding(.bottom, 8)

            // レアリティ別グリッド
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(rarityGroups(), id: \.0.displayString) { rarity, items in
                        TitleRaritySectionView(
                            rarity: rarity,
                            items: items,
                            selectedItem: selectedItem,
                            userTitles: userTitles,
                            columns: columns,
                            onTap: { item in
                                generateHapticFeedback()
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    selectedItem = item
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
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.95, green: 0.97, blue: 1.0),
                    Color(red: 0.90, green: 0.94, blue: 0.98)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            generateHapticFeedback()
            self.presentationMode.wrappedValue.dismiss()
            audioManager.playCancelSound()
        }) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                Text("戻る")
                    .font(.system(size: 16))
            }
            .foregroundColor(Color("fontGray"))
        })
        .navigationTitle("称号一覧")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.selectedItem = allItems.first
            self.fetchUserTitles(userId: authManager.currentUserId ?? "")
            authManager.fetchAvatars {
                for item in allItems {
                    let _ = authManager.avatars.contains(where: { $0.name == item.name })
                }
            }
        }
    }

    // 詳細表示ビュー
    private var titleDetailView: some View {
        VStack {
            if let selected = selectedItem {
                let isUnlocked = userTitles[selected.name] == true
                HStack(spacing: 16) {
                    // 画像エリア
                    ZStack {
                        if isUnlocked {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: selected.rarity.gradientColors),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 110, height: 110)

                            Image(selected.name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 110, height: 110)

                            Image("\(selected.name)_シルエット")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .opacity(0.5)
                        }

                        // 取得済みバッジ
                        if isUnlocked {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "checkmark.seal.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.green)
                                        .shadow(color: .green.opacity(0.3), radius: 4)
                                }
                                Spacer()
                            }
                            .frame(width: 110, height: 110)
                            .padding(4)
                        }
                    }

                    // テキスト情報
                    VStack(alignment: .leading, spacing: 8) {
                        // レアリティバッジ
                        Text(selected.rarity.displayString)
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: selected.rarity.gradientColors),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .overlay(
                                        Capsule()
                                            .stroke(selected.rarity.color, lineWidth: 1)
                                    )
                            )

                        Text(isUnlocked ? selected.attack : "???")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(isUnlocked ? .primary : .secondary)

                        Text(selected.health)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 4)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selected.rarity.color.opacity(0.2), lineWidth: 1.5)
                )
            }
        }
    }
}

// MARK: - 称号進捗バー
struct TitleProgressBar: View {
    let unlocked: Int
    let total: Int

    private var progress: CGFloat {
        guard total > 0 else { return 0 }
        return CGFloat(unlocked) / CGFloat(total)
    }

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Color.orange)
                Text("称号達成度")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(unlocked) / \(total)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.orange, Color.yellow]),
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
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 2)
        )
    }
}

// MARK: - レアリティセクション (称号用)
struct TitleRaritySectionView: View {
    let rarity: TittlesView.Rarity
    let items: [TittlesView.Item]
    let selectedItem: TittlesView.Item?
    let userTitles: [String: Bool]
    let columns: [GridItem]
    let onTap: (TittlesView.Item) -> Void

    private var unlockedInSection: Int {
        items.filter { userTitles[$0.name] == true }.count
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
                    .foregroundColor(.primary)

                Spacer()

                Text("\(unlockedInSection)/\(items.count)")
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(rarity.color)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(
                        Capsule()
                            .fill(rarity.color.opacity(0.12))
                    )
            }
            .padding(.horizontal, 4)

            // グリッド
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(items) { item in
                    TitleGridCard(
                        item: item,
                        isUnlocked: userTitles[item.name] == true,
                        isSelected: selectedItem?.name == item.name,
                        onTap: { onTap(item) }
                    )
                }
            }
        }
    }
}

// MARK: - 称号グリッドカード
struct TitleGridCard: View {
    let item: TittlesView.Item
    let isUnlocked: Bool
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            isUnlocked ?
                            Color.white :
                            Color.gray.opacity(0.08)
                        )
                        .frame(height: 80)

                    if isUnlocked {
                        Image(item.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Image("\(item.name)_シルエット")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .opacity(0.4)
                    }

                    // 取得済みチェック
                    if isUnlocked {
                        VStack {
                            HStack {
                                Spacer()
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 16, height: 16)
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 9, weight: .bold))
                                            .foregroundColor(.white)
                                    )
                                    .shadow(color: .green.opacity(0.3), radius: 2)
                            }
                            Spacer()
                        }
                        .padding(6)
                    }
                }

                // 称号名
                Text(item.name)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(isUnlocked ? .primary : .secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(item.rarity.backgroundColor)
                    .shadow(color: .black.opacity(isSelected ? 0.1 : 0.04), radius: isSelected ? 6 : 3, x: 0, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? item.rarity.color : Color.clear,
                        lineWidth: 2.5
                    )
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
//    TittlesView(isPresenting: .constant(false))
    TopView()
}
