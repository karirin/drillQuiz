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

enum Rarity {
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
            return Color.yellow
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
        Item(name: "キング・イロン", attack: 50, probability: 3, health: 300, rarity: .ultraRare)
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
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                // 詳細表示エリア
                DetailCardView(selectedItem: selectedItem, authManager: authManager, animateSelection: animateSelection)
                    .frame(height: 180)
                    .padding(.horizontal, 20)
                    .padding(.top,20)
                // グリッドエリア
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(allItems) { item in
                            GridItemView(
                                item: item,
                                isOwned: authManager.avatars.contains(where: { $0.name == item.name }),
                                isSelected: selectedItem?.name == item.name,
                                onTap: {
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
                    .padding(.vertical, 16)
                }
                .background(Color("purple2").opacity(0.3))
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
                    let contains = authManager.avatars.contains(where: { $0.name == item.name })
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
}

// MARK: - Detail Card View
struct DetailCardView: View {
    let selectedItem: Item?
    let authManager: AuthManager
    let animateSelection: Bool
    
    var body: some View {
        if let selected = selectedItem {
            VStack(spacing: 16) {
                // レアリティとタイトル
                HStack {
                    RarityBadge(rarity: selected.rarity)
                    Text(authManager.avatars.contains(where: { $0.name == selected.name }) ? selectedItem!.name : "???")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(authManager.avatars.contains(where: { $0.name == selected.name }) ? .primary : .secondary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                
                // メインコンテンツ
                HStack(alignment: .center, spacing: 30) {
                    // キャラクター画像
                    CharacterImageView(
                        item: selected,
                        isOwned: authManager.avatars.contains(where: { $0.name == selected.name }),
                        animate: animateSelection
                    )
                    
//                    Spacer()
                    
                    // ステータス
                    VStack(alignment: .trailing, spacing: 12) {
                        VStack{
                            ZStack {
                                Image("ハートバー")
                                    .resizable()
                                    .frame(width:120,height:40)
                                Text("\(selected.health)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 26))
                                    .foregroundColor(Color("fontGray"))
                                    .padding(.leading,65)
                                    .padding(.top,15)
                            }
                            ZStack {
                                Image("攻撃バー")
                                    .resizable()
                                    .frame(width:116,height:40)
                                Text("\(selected.attack)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 26))
                                    .foregroundColor(Color("fontGray"))
                                    .padding(.leading,65)
                                    .padding(.top,10)
                            }.padding(.top,5)
                        }
                    }
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selected.rarity.color.opacity(0.3), lineWidth: 2)
                    )
            )
        } else {
            RoundedRectangle(cornerRadius: 20)
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
                // 背景の光効果（レジェンドレアの場合）
                if item.rarity == .legendRare && isOwned {
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [item.rarity.color.opacity(0.3), Color.clear]),
                                center: .center,
                                startRadius: 10,
                                endRadius: 80
                            )
                        )
                        .frame(width: 160, height: 160)
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                }
                
                Image(isOwned ? item.name : "\(item.name)_シルエット")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: item.rarity.color.opacity(0.5), radius: 10, x: 0, y: 5)
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
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
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
            VStack(spacing: 8) {
                ZStack {
                    // 選択時の光効果
                    if isSelected {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.rarity.color.opacity(0.2))
                            .frame(width: 90, height: 90)
//                            .scaleEffect(1.2)
                            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: isSelected)
                    }
                    
                    Image(isOwned ? item.name : "\(item.name)_シルエット")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .opacity(isOwned ? 1.0 : 0.6)
                }
//
//                // レアリティインジケータ
//                Rectangle()
//                    .fill(item.rarity.color)
//                    .frame(height: 3)
//                    .frame(maxWidth: 60)
//                    .clipShape(Capsule())
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                isSelected ? item.rarity.color : Color.clear,
                                lineWidth: isSelected ? 3 : 0
                            )
                    )
            )
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
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
