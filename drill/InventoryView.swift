//
//  InventoryView.swift
//  drill
//

import SwiftUI

extension InventoryItemType {
    var usageDescription: String {
        switch self {
        case .normalGachaTicket:
            return "レギュラーガチャを1回引けます"
        case .rareGachaTicket:
            return "幸福ガチャを1回引けます"
        case .mekaGachaTicket:
            return "メカガチャを1回引けます"
        case .godGachaTicket:
            return "神ガチャを1回引けます"
        case .constellationGachaTicket:
            return "星座ガチャを1回引けます"
        case .staminaPotion:
            return "スタミナを30回復します"
        case .boostTicket:
            return "1時間、経験値とコインの獲得量が2倍になります"
        }
    }
}

struct InventoryView: View {
    var showsNavigationTitle: Bool = true
    var showsOwnBackground: Bool = true
    @ObservedObject private var authManager = AuthManager.shared
    @ObservedObject private var storyViewModel = PositionViewModel.shared

    @State private var alertMessage = ""
    @State private var showAlert = false

    private let supportTypes: [InventoryItemType] = [
        .staminaPotion, .boostTicket
    ]

    private var currentItems: [InventoryItemType] {
        supportTypes
    }

    private var totalItemCount: Int {
        supportTypes.reduce(0) { $0 + authManager.inventoryCount(for: $1) }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 18) {
                inventoryHero

                VStack(spacing: 14) {
                    ForEach(currentItems, id: \.rawValue) { type in
                        itemRow(for: type)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
        }
        .background(
            Group {
                if showsOwnBackground {
                    Color(.systemGroupedBackground).ignoresSafeArea()
                } else {
                    Color.clear
                }
            }
        )
        .navigationTitle(showsNavigationTitle ? "持ち物" : "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            authManager.fetchInventory(force: true)
            authManager.fetchUserRewardFlag(force: true)
            authManager.syncRewardBoostState()
        }
        .alert("持ち物", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
    }

    private var inventoryHero: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Text("合計 \(totalItemCount) アイテム")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                Text("サポートアイテムをまとめて確認")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.72))
            }

            HStack(spacing: 10) {
                summaryBubble(type: .staminaPotion)
                summaryBubble(type: .boostTicket)
            }

            HStack(spacing: 0) {
                summaryValue(title: "スタミナ", value: "\(storyViewModel.stamina)/100")
                Divider().background(Color.white.opacity(0.2))
                summaryValue(title: "ブースト", value: authManager.rewardFlag >= 2 ? "発動中" : "未使用")
            }
            .frame(height: 56)
            .background(Color.white.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.23, green: 0.27, blue: 0.46),
                    Color(red: 0.18, green: 0.49, blue: 0.56)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }

    private func summaryBubble(type: InventoryItemType) -> some View {
        VStack(spacing: 8) {
            InventoryItemArtworkView(type: type, width: 42, height: 42, cornerRadius: 12)
            Text("\(authManager.inventoryCount(for: type))")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }

    private func summaryValue(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
            Text(value)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }

    private func itemRow(for type: InventoryItemType) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 14) {
                ZStack(alignment: .topTrailing) {
                    InventoryItemArtworkView(type: type, width: 64, height: 64, cornerRadius: 18)
                    Text("\(authManager.inventoryCount(for: type))")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(type.accentColor))
                        .offset(x: 8, y: -8)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(type.displayName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                    Text(type.usageDescription)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            if type == .staminaPotion {
                gaugeBar(
                    title: "スタミナ",
                    value: Double(storyViewModel.stamina),
                    maxValue: 100,
                    tint: type.accentColor,
                    trailingText: "\(storyViewModel.stamina)/100"
                )
            }

            if type == .boostTicket {
                HStack {
                    Label(authManager.rewardFlag >= 2 ? "経験値・コイン2倍 発動中" : "現在は未使用", systemImage: authManager.rewardFlag >= 2 ? "bolt.fill" : "bolt.slash.fill")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(authManager.rewardFlag >= 2 ? type.accentColor : .secondary)
                    Spacer()
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(type.accentColor.opacity(authManager.rewardFlag >= 2 ? 0.12 : 0.05))
                )
            }

            actionButton(for: type)
        }
        .padding(18)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 5)
    }

    private func gaugeBar(title: String, value: Double, maxValue: Double, tint: Color, trailingText: String) -> some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.secondary)
                Spacer()
                Text(trailingText)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.primary)
            }

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.systemGray5))
                    RoundedRectangle(cornerRadius: 6)
                        .fill(
                            LinearGradient(
                                colors: [tint, tint.opacity(0.72)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: proxy.size.width * CGFloat(min(value / maxValue, 1)))
                }
            }
            .frame(height: 10)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(tint.opacity(0.08))
        )
    }

    @ViewBuilder
    private func actionButton(for type: InventoryItemType) -> some View {
        switch type {
        case .normalGachaTicket, .rareGachaTicket, .mekaGachaTicket, .godGachaTicket, .constellationGachaTicket:
            EmptyView()
        case .staminaPotion:
            Button(action: useStaminaPotion) {
                Label(storyViewModel.stamina >= 100 ? "スタミナ満タン" : "回復薬を使う", systemImage: "heart.fill")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(authManager.inventoryCount(for: type) > 0 && storyViewModel.stamina < 100 ? type.accentColor : Color.gray.opacity(0.35))
                    )
            }
            .buttonStyle(.plain)
            .disabled(authManager.inventoryCount(for: type) == 0 || storyViewModel.stamina >= 100)
        case .boostTicket:
            Button(action: useBoostTicket) {
                Label(authManager.rewardFlag >= 2 ? "ブースト発動中" : "ブースト薬を使う", systemImage: "bolt.fill")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(authManager.inventoryCount(for: type) > 0 && authManager.rewardFlag < 2 ? type.accentColor : Color.gray.opacity(0.35))
                    )
            }
            .buttonStyle(.plain)
            .disabled(authManager.inventoryCount(for: type) == 0 || authManager.rewardFlag >= 2)
        }
    }

    private func useStaminaPotion() {
        authManager.useStaminaPotion { success in
            alertMessage = success ? "スタミナを30回復しました。" : "回復薬を使えませんでした。"
            authManager.fetchInventory(force: true)
            showAlert = true
        }
    }

    private func useBoostTicket() {
        authManager.useBoostTicket { success in
            alertMessage = success ? "1時間のブーストを発動しました。" : "ブースト薬を使えませんでした。"
            authManager.fetchInventory(force: true)
            authManager.syncRewardBoostState()
            showAlert = true
        }
    }
}

struct TicketGachaView: View {
    let mode: GachaMode
    let ticketType: InventoryItemType

    @ObservedObject private var authManager = AuthManager.shared
    @ObservedObject private var audioManager = AudioManager.shared
    @Environment(\.presentationMode) private var presentationMode

    @State private var gachaManager: GachaManager
    @State private var obtainedItem: GachaManager.Item?
    @State private var activeAnimationSession: GachaAnimationSession?
    @State private var isGachaInProgress = false
    @State private var showResult = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    init(mode: GachaMode, ticketType: InventoryItemType) {
        self.mode = mode
        self.ticketType = ticketType
        _gachaManager = State(initialValue: GachaManager(mode: mode))
    }

    private var ticketCount: Int {
        authManager.inventoryCount(for: ticketType)
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.14, green: 0.12, blue: 0.25),
                    Color(red: 0.08, green: 0.10, blue: 0.18)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                headerBar

                Spacer()

                if showResult, let obtainedItem {
                    resultView(item: obtainedItem)
                } else {
                    ticketMainView
                }

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .onAppear {
            authManager.fetchInventory()
        }
        .alert("ガチャ", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(alertMessage)
        }
        .fullScreenCover(item: $activeAnimationSession) { session in
            GachaAnimationView(rarity: session.item.rarity) {
                activeAnimationSession = nil
                obtainedItem = session.item
                showResult = true
                isGachaInProgress = false
            }
        }
    }

    private var headerBar: some View {
        HStack {
            Button(action: {
                generateHapticFeedback()
                audioManager.playCancelSound()
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Text("戻る")
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            }
            .buttonStyle(.plain)

            Spacer()

            VStack(spacing: 4) {
                Text(mode.displayName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Text("\(ticketType.displayName) x \(ticketCount)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.72))
            }

            Spacer()

            InventoryItemArtworkView(type: ticketType, width: 38, height: 38, cornerRadius: 12)
        }
    }

    private var ticketMainView: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 240, height: 240)
                Image("卵レア度")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230)
            }

            VStack(spacing: 10) {
                Text("チケットを使って\(mode.displayName)を引けます")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                Text("所持数: \(ticketCount)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.72))
            }

            Button(action: startTicketGacha) {
                Label(ticketCount > 0 ? "チケットを使って引く" : "チケットが不足しています", systemImage: "sparkles")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(ticketCount > 0 ? ticketType.accentColor : Color.gray.opacity(0.35))
                    )
            }
            .buttonStyle(.plain)
            .disabled(ticketCount == 0 || isGachaInProgress)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
    }

    private func resultView(item: GachaManager.Item) -> some View {
        VStack(spacing: 22) {
            Text(item.rarity.displayString)
                .font(.system(size: 28, weight: .black))
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.16))
                )

            Image(item.artworkName)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .padding(18)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.10))
                )

            VStack(spacing: 6) {
                Text(item.name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                Text("攻撃 \(item.attack) / HP \(item.health)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.72))
            }

            HStack(spacing: 12) {
                Button(action: {
                    showResult = false
                    obtainedItem = nil
                }) {
                    Text("閉じる")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white.opacity(0.14))
                        )
                }
                .buttonStyle(.plain)

                Button(action: startTicketGacha) {
                    Text(ticketCount > 0 ? "もう一度引く" : "チケット不足")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(ticketCount > 0 ? ticketType.accentColor : Color.gray.opacity(0.35))
                        )
                }
                .buttonStyle(.plain)
                .disabled(ticketCount == 0 || isGachaInProgress)
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
    }

    private func startTicketGacha() {
        guard !isGachaInProgress else { return }
        guard ticketCount > 0 else {
            alertMessage = "チケットが足りません。"
            showAlert = true
            return
        }

        isGachaInProgress = true
        gachaManager.shuffleItems()
        guard let item = gachaManager.drawGacha() else {
            alertMessage = "ガチャの実行に失敗しました。"
            isGachaInProgress = false
            showAlert = true
            return
        }

        let avatar = Avatar(
            name: item.name,
            attack: item.attack,
            health: item.health,
            usedFlag: 0,
            count: 1
        )
        authManager.commitGachaResult(avatar: avatar, ticketType: ticketType) { success in
            guard success else {
                isGachaInProgress = false
                alertMessage = "チケットを消費できませんでした。"
                showAlert = true
                return
            }

            obtainedItem = nil
            showResult = false
            authManager.recordGachaUsed()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                authManager.fetchAvatars {
                    authManager.recordAvatarObtained()
                }
            }
            activeAnimationSession = nil
            DispatchQueue.main.async {
                activeAnimationSession = GachaAnimationSession(item: item)
            }
        }
    }
}
