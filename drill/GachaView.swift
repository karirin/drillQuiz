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
        }
    }
    
    var movieName: String {
        return self.rawValue
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
        }
    }
}

enum GachaMode {
    case normal
    case rare
    case meka
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
    private var items: [Item] = []
    
    init(mode: GachaMode) {
        self.mode = mode
        setupItems()
    }
    
    var gachaCost: Int {
        switch mode {
        case .normal:
            return 300
        case .rare, .meka:
            return 600
        }
    }
    
    private func setupItems() {
        switch mode {
        case .normal:
            self.items = [
                Item(name: "えんぴ君", attack: 20, health: 20, probability: 25, rarity: .normal),
                Item(name: "ナイト", attack: 20, health: 20, probability: 25, rarity: .normal),
                Item(name: "てーる", attack: 15, health: 15, probability: 25, rarity: .normal),
                Item(name: "ぷりん", attack: 20, health: 10, probability: 25, rarity: .normal),
                Item(name: "たまっち", attack: 20, health: 100, probability: 25, rarity: .normal),
                Item(name: "うきわうさぎ", attack: 25, health: 150, probability: 25, rarity: .normal),
                Item(name: "かげねこ", attack: 30, health: 200, probability: 25, rarity: .normal),
                Item(name: "リュウ", attack: 35, health: 220, probability: 10, rarity: .rare),
                Item(name: "ウィザード", attack: 40, health: 240, probability: 10, rarity: .rare),
                Item(name: "ウィッチ", attack: 45, health: 260, probability: 10, rarity: .rare),
                Item(name: "フローラ", attack: 47, health: 280, probability: 5, rarity: .superRare),
                Item(name: "プリンス", attack: 48, health: 285, probability: 5, rarity: .superRare),
                Item(name: "キング・イロン", attack: 50, health: 300, probability: 3, rarity: .ultraRare)
            ]
        case .rare:
            self.items = [
                Item(name: "えんぴ君", attack: 20, health: 20, probability: 25, rarity: .normal)
                ]
        case .meka:
            self.items = [
                Item(name: "えんぴ君", attack: 20, health: 20, probability: 25, rarity: .normal)
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
                // アバターをFirebaseに追加
                let selectedAvatar = Avatar(name: item.name, attack: item.attack, health: item.health, usedFlag: 0, count: 1)
                AuthManager.shared.addAvatarToUser(avatar: selectedAvatar) { success in
                    if success {
                        print("Avatar successfully added!")
                    } else {
                        print("Failed to add avatar.")
                    }
                }
                return item
            }
        }
        
        return items.first
    }
}

struct GachaView: View {
    @StateObject private var authManager = AuthManager.shared
    @State private var gachaManager = GachaManager(mode: .normal)
    
    @State private var userMoney: Int = 0
    @State private var isGachaButtonDisabled: Bool = false
    @State private var obtainedRareItem: GachaManager.Item?
    @State private var obtainedItem: GachaManager.Item?
    
    @State private var showAnimation: Bool = false
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
                        // 結果画面を閉じずにガチャを再実行
                        obtainedItem = nil  // アイテムだけクリア
                        let cost = gachaManager.gachaCost
                        // コインチェック
                        if userMoney >= cost {
                             // コイン減少（複数回）
                             let decreaseCount = cost / 300
                             var completed = 0
                             
                             for _ in 0..<decreaseCount {
                                 authManager.decreaseUserMoney { success in
                                     if success {
                                         completed += 1
                                         if completed == decreaseCount {
                                             fetchUserMoney()
                                         }
                                     }
                                 }
                             }
                             
                             // ガチャ抽選
                             gachaManager.shuffleItems()
                             if let item = gachaManager.drawGacha() {
                                 obtainedRareItem = item
                                 
                                 DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                     showAnimation = true
                                 }
                             }
                             
                            // アバター数チェック
                            checkAvatarCount()
                        } else {
                            // コイン不足
                            showUnCoinModal = true
                        }
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
        }
        .onAppear {
            fetchUserMoney()
            reward.LoadReward()
        }
        .fullScreenCover(isPresented: $showAnimation) {
            if let rarity = obtainedRareItem?.rarity {
                GachaAnimationView(rarity: rarity) {
                    showAnimation = false
                    obtainedItem = obtainedRareItem
                    showResult = true
                    fetchUserMoney()
                }
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
        VStack(spacing: 30) {
            
            // コイン表示（購入ボタン付き）
            HStack {
                Button(action: {
                    generateHapticFeedback()
                    self.presentationMode.wrappedValue.dismiss()
                    audioManager.playCancelSound()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("fontGray"))
                    Text("戻る")
                        .foregroundColor(Color("fontGray"))
                }.buttonStyle(.plain)
                .padding(.leading)
                Spacer()
                
                Button(action: {
                    showCoinModal = true
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "dollarsign.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                        
                        Text("\(userMoney)")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("コイン")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                        
                        // プラスアイコン
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.yellow)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black.opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.yellow.opacity(0.6), lineWidth: 2)
                            )
                    )
                }
            }
            .padding(.trailing)
            
            Image("ガチャ")
                .resizable()
                .scaledToFit()
            
            // ガチャボタン
            Button(action: startGacha) {
                HStack(spacing: 15) {
                    Image(systemName: "sparkles")
                        .font(.system(size: 24, weight: .bold))
                    
                    VStack(spacing: 2) {
                        Text("ガチャを引く")
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("\(gachaManager.gachaCost)コイン")
                            .font(.system(size: 14, weight: .medium))
                            .opacity(0.9)
                    }
                    
                    Image(systemName: "sparkles")
                        .font(.system(size: 24, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(
                    Group {
                        if isGachaButtonDisabled {
                            LinearGradient(
                                colors: [.purple, .pink, .orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        } else {
                            LinearGradient(
                                colors: [.gray, .gray.opacity(0.6)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        }
                    }
                )
                .cornerRadius(20)
                .shadow(color: isGachaButtonDisabled ? .purple.opacity(0.6) : .clear, radius: 15, x: 0, y: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                )
            }
            .disabled(!isGachaButtonDisabled)
            .padding(.horizontal, 30)
            .padding(.bottom, 0)
            
            // ボタングループ（リワード広告・コイン購入）
            VStack(spacing: 12) {
                // リワード広告ボタン
                // GachaView内のリワード広告ボタンを修正

                Button(action: {
                    if reward.rewardLoaded {
                        reward.ShowReward()
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
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: reward.rewardLoaded ? [
                                Color(red: 0.95, green: 0.6, blue: 0.2),
                                Color(red: 0.98, green: 0.75, blue: 0.3)
                            ] : [
                                Color.gray.opacity(0.6),
                                Color.gray.opacity(0.4)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                    .shadow(color: reward.rewardLoaded ? Color(red: 0.95, green: 0.6, blue: 0.2).opacity(0.4) : Color.clear, radius: 8, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                    .overlay(
                        // ローディング中のオーバーレイ
                        Group {
                            if !reward.rewardLoaded {
                                ZStack {
                                    Color.black.opacity(0.3)
                                        .cornerRadius(16)
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(1.5)
                                }
                            }
                        }
                    )
                }
                .disabled(!reward.rewardLoaded)
                
                // コイン購入ボタン（新規追加）
                Button(action: {
                    showCoinModal = true
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 20, weight: .bold))
                        
                        Text("コイン購入")
                            .font(.system(size: 18, weight: .bold))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 0.2, green: 0.7, blue: 0.5),
                                Color(red: 0.3, green: 0.8, blue: 0.6)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                    .shadow(color: Color(red: 0.2, green: 0.7, blue: 0.5).opacity(0.4), radius: 8, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                    )
                }
            }
            .padding(.horizontal, 30)

            Image("卵レア度")
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
        }
    }
    
    private func startGacha() {
        let cost = gachaManager.gachaCost
        
        if userMoney >= cost {
            // コイン減少（複数回）
            let decreaseCount = cost / 300
            var completed = 0
            
            for _ in 0..<decreaseCount {
                authManager.decreaseUserMoney { success in
                    if success {
                        completed += 1
                        if completed == decreaseCount {
                            fetchUserMoney()
                        }
                    }
                }
            }
            
            // ガチャ抽選
            gachaManager.shuffleItems()
            if let item = gachaManager.drawGacha() {
                obtainedRareItem = item
                
                showResult = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showAnimation = true
                }
            }
            
            checkAvatarCount()
        } else {
            showUnCoinModal = true
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
                            
                            Image(item.name)
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
    }
    
    private func generateParticles() {
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
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
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
