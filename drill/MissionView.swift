//
//  MissionView.swift
//  drill
//

import SwiftUI

struct MissionView: View {
    @StateObject private var missionManager = MissionManager.shared
    @ObservedObject private var authManager = AuthManager.shared
    @ObservedObject private var audioManager = AudioManager.shared

    @State private var selectedCategory: MissionCategory = .daily
    @State private var showRewardAnimation = false
    @State private var rewardCoinAmount = 0
    @State private var rewardItems: [InventoryReward] = []
    @State private var isLoading = true
    @State private var timerText = ""
    @State private var timer: Timer?
    @State private var selectedMissionForDetail: Mission?

    private var currentMissions: [Mission] {
        missionManager.missionsForCategory(selectedCategory)
    }

    private var completedCount: Int {
        currentMissions.filter { $0.isCompleted && !$0.isClaimed }.count
    }

    private var totalCount: Int {
        currentMissions.count
    }

    private var clearedCount: Int {
        currentMissions.filter(\.isCompleted).count
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 0.07, green: 0.07, blue: 0.15),
                        Color(red: 0.10, green: 0.08, blue: 0.20)
                    ]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            if isLoading {
                VStack {
                    CustomSpinner5()
                }
            } else {
                VStack(spacing: 0) {
                    categoryTabBar

                    if selectedCategory != .normal {
                        timerAndProgressBar
                    } else {
                        normalProgressBar
                    }

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 14) {
                            if selectedCategory == .daily || selectedCategory == .weekly {
                                completionBonusCard
                            }

                            ForEach(currentMissions) { mission in
                                MissionCardModernView(
                                    mission: mission,
                                    claimAction: {
                                        claimMissionReward(mission)
                                    },
                                    detailAction: {
                                        withAnimation(.spring(response: 0.3)) {
                                            selectedMissionForDetail = mission
                                        }
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 100)
                    }
                    .gesture(
                        DragGesture(minimumDistance: 40)
                            .onEnded { value in
                                let categories = MissionCategory.allCases
                                guard let currentIndex = categories.firstIndex(of: selectedCategory) else { return }

                                if value.translation.width < 0, currentIndex < categories.count - 1 {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedCategory = categories[currentIndex + 1]
                                    }
                                    generateHapticFeedback()
                                } else if value.translation.width > 0, currentIndex > 0 {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedCategory = categories[currentIndex - 1]
                                    }
                                    generateHapticFeedback()
                                }
                            }
                    )
                }

                VStack {
                    Spacer()
                    bottomBar
                }
            }

            if showRewardAnimation {
                MissionRewardAnimationView(
                    coinAmount: rewardCoinAmount,
                    itemRewards: rewardItems,
                    isPresented: $showRewardAnimation
                )
            }

            if let mission = selectedMissionForDetail {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        selectedMissionForDetail = nil
                    }

                MissionDetailModalView(mission: mission) {
                    selectedMissionForDetail = nil
                }
                .padding(.horizontal, 24)
                .fixedSize(horizontal: false, vertical: true)
                .transition(.scale(scale: 0.9).combined(with: .opacity))
            }
        }
        .onAppear {
            selectedCategory = missionManager.selectedCategory
            loadMissions()
            startTimer()

            let position = PositionViewModel.shared.userPosition
            if position > 1 {
                authManager.recordDungeonStep(position: position)
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
        .onChange(of: selectedCategory) { newValue in
            missionManager.selectedCategory = newValue
            updateTimerText()
        }
    }

    private var categoryTabBar: some View {
        HStack(spacing: 0) {
            ForEach(MissionCategory.allCases, id: \.self) { category in
                let count = missionManager.completedCount(for: category)

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedCategory = category
                    }
                    generateHapticFeedback()
                }) {
                    VStack(spacing: 6) {
                        HStack(spacing: 4) {
                            Text(category.displayName)
                                .font(.system(size: 14, weight: selectedCategory == category ? .bold : .medium))

                            if count > 0 {
                                Text("\(count)")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 18, height: 18)
                                    .background(Circle().fill(Color.red))
                            }
                        }
                        .foregroundColor(selectedCategory == category ? .white : .white.opacity(0.5))

                        RoundedRectangle(cornerRadius: 2)
                            .fill(selectedCategory == category ? categoryColor(category) : Color.clear)
                            .frame(height: 3)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 4)
        .background(Color.white.opacity(0.05))
    }

    private var timerAndProgressBar: some View {
        HStack(spacing: 12) {
            HStack(spacing: 6) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 12))
                    .foregroundColor(categoryColor(selectedCategory))
                Text("リセット: \(timerText)")
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(categoryColor(selectedCategory).opacity(0.15))
                    .overlay(
                        Capsule()
                            .stroke(categoryColor(selectedCategory).opacity(0.3), lineWidth: 1)
                    )
            )

            Spacer()

            HStack(spacing: 4) {
                Text("\(clearedCount)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(categoryColor(selectedCategory))
                Text("/")
                    .foregroundColor(.white.opacity(0.4))
                Text("\(totalCount)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
                Text("クリア")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    private var normalProgressBar: some View {
        HStack {
            Spacer()

            HStack(spacing: 4) {
                Text("\(clearedCount)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(categoryColor(selectedCategory))
                Text("/")
                    .foregroundColor(.white.opacity(0.4))
                Text("\(totalCount)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
                Text("クリア")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    private var completionBonusCard: some View {
        let allCleared = selectedCategory == .daily ? missionManager.isDailyAllCompleted : missionManager.isWeeklyAllCompleted
        let bonusCoin = selectedCategory == .daily ? 100 : 500
        let bonusImageName = selectedCategory == .daily ? "デイリーコンプリート" : "ウィークリーコンプリート"
        let bonusLabel = selectedCategory == .daily ? "デイリーコンプリートボーナス" : "ウィークリーコンプリートボーナス"

        return HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: allCleared
                                ? [Color.yellow, Color.orange]
                                : [Color.white.opacity(0.1), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 44, height: 44)

                Image(bonusImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(bonusLabel)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)

                HStack(spacing: 4) {
                    Image("コイン")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                    Text("×\(bonusCoin)")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.yellow)
                }
            }

            Spacer()

            Text("\(clearedCount)/\(totalCount)")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(allCleared ? .yellow : .white.opacity(0.5))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(allCleared ? Color.yellow.opacity(0.2) : Color.white.opacity(0.05))
                )
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: allCleared
                            ? [Color.yellow.opacity(0.15), Color.orange.opacity(0.1)]
                            : [Color.white.opacity(0.06), Color.white.opacity(0.03)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            allCleared ? Color.yellow.opacity(0.4) : Color.white.opacity(0.08),
                            lineWidth: 1
                        )
                )
        )
    }

    private var bottomBar: some View {
        HStack(spacing: 12) {
            Button(action: {
                generateHapticFeedback()
                audioManager.playSound()
                claimAllRewards()
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "gift.fill")
                        .font(.system(size: 16))
                    Text("まとめて受け取る")
                        .font(.system(size: 15, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            completedCount > 0
                                ? LinearGradient(
                                    colors: [categoryColor(selectedCategory), categoryColor(selectedCategory).opacity(0.7)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                : LinearGradient(
                                    colors: [Color.white.opacity(0.1), Color.white.opacity(0.05)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                        )
                )
                .shadow(color: completedCount > 0 ? categoryColor(selectedCategory).opacity(0.4) : .clear, radius: 8, y: 4)
            }
            .disabled(completedCount == 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            Rectangle()
                .fill(Color(red: 0.07, green: 0.07, blue: 0.15).opacity(0.95))
                .shadow(color: .black.opacity(0.3), radius: 10, y: -5)
        )
    }

    private func categoryColor(_ category: MissionCategory) -> Color {
        switch category {
        case .daily:
            return Color(red: 0.3, green: 0.8, blue: 0.5)
        case .weekly:
            return Color(red: 0.4, green: 0.6, blue: 1.0)
        case .normal:
            return Color(red: 1.0, green: 0.7, blue: 0.3)
        }
    }

    private func startTimer() {
        updateTimerText()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateTimerText()
        }
    }

    private func updateTimerText() {
        let interval = missionManager.timeUntilReset(for: selectedCategory)
        let hours = Int(interval) / 3600
        let minutes = (Int(interval) % 3600) / 60
        let seconds = Int(interval) % 60
        timerText = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    private func loadMissions() {
        missionManager.fetchMissions { success in
            if success {
                missionManager.refreshAllMissions()
            }
            isLoading = false
        }
    }

    private func claimMissionReward(_ mission: Mission) {
        generateHapticFeedback()
        audioManager.playSound()

        missionManager.claimReward(missionId: mission.id) { success, coins, items in
            if success {
                rewardCoinAmount = coins
                rewardItems = items
                showRewardAnimation = true
            }
        }
    }

    private func claimAllRewards() {
        missionManager.claimAllRewards(for: selectedCategory) { success, coins, items in
            if success {
                rewardCoinAmount = coins
                rewardItems = items
                showRewardAnimation = true
            }
        }
    }
}

struct MissionDetailModalView: View {
    let mission: Mission
    let onClose: () -> Void

    private var imageAssetName: String? {
        mission.displayIconAssetName ?? mission.rewardIcon
    }

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white.opacity(0.06))
                    .frame(width: 90, height: 90)

                if let imageAssetName {
                    Image(imageAssetName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding(.top, 20)
                } else {
                    Image(systemName: mission.fallbackSystemIconName)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                }
            }

            Text(mission.title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)

            Text(mission.description)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)

            VStack(spacing: 6) {
                HStack {
                    Text("進捗")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("\(mission.currentCount) / \(mission.targetCount)")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                }

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 7)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: max(geo.size.width * CGFloat(mission.progressPercentage), 6), height: 7)
                    }
                }
                .frame(height: 7)
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))

            VStack(alignment: .leading, spacing: 8) {
                Text("獲得できる報酬")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.6))

                HStack(spacing: 16) {
                    HStack(spacing: 6) {
                        Image("コイン")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        Text("×\(mission.rewardCoin)")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.yellow)
                    }

                    if let itemType = mission.rewardItemType, mission.rewardItemAmount > 0 {
                        HStack(spacing: 6) {
                            InventoryItemArtworkView(type: itemType, width: 32, height: 32, cornerRadius: 8)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(itemType.displayName)
                                    .font(.system(size: 11, weight: .semibold))
                                    .foregroundColor(itemType.accentColor)
                                Text("×\(mission.rewardItemAmount)")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))

            Button(action: { onClose() }) {
                Text("閉じる")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.1)))
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.10, green: 0.08, blue: 0.22),
                    Color(red: 0.07, green: 0.07, blue: 0.15)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
        )
    }
}

struct MissionCardModernView: View {
    let mission: Mission
    let claimAction: () -> Void
    let detailAction: () -> Void

    private var accentColor: Color {
        if mission.isClaimed { return .gray }
        if mission.isCompleted { return .green }
        return Color.white.opacity(0.6)
    }

    private var imageAssetName: String? {
        mission.displayIconAssetName ?? mission.rewardIcon
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: mission.isClaimed
                                    ? [Color.white.opacity(0.05), Color.white.opacity(0.03)]
                                    : [accentColor.opacity(0.2), accentColor.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)

                    if let imageAssetName {
                        Image(imageAssetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .opacity(mission.isClaimed ? 0.4 : 1.0)
                    } else {
                        Image(systemName: mission.fallbackSystemIconName)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(accentColor)
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(mission.title)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(mission.isClaimed ? .white.opacity(0.3) : .white)
                        .lineLimit(2)

                    HStack(spacing: 10) {
                        HStack(spacing: 3) {
                            Image("コイン")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                            Text("×\(mission.rewardCoin)")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(mission.isClaimed ? .yellow.opacity(0.3) : .yellow)
                        }

                        if let rewardItemType = mission.rewardItemType, mission.rewardItemAmount > 0 {
                            HStack(spacing: 3) {
                                InventoryItemArtworkView(type: rewardItemType, width: 32, height: 32, cornerRadius: 6)
                                Text("×\(mission.rewardItemAmount)")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(
                                        mission.isClaimed
                                            ? rewardItemType.accentColor.opacity(0.3)
                                            : rewardItemType.accentColor
                                    )
                            }
                        }
                    }
                }

                Spacer()

                if mission.isClaimed {
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 12))
                        Text("CLEAR")
                            .font(.system(size: 11, weight: .bold))
                    }
                    .foregroundColor(.white.opacity(0.3))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.05))
                    )
                } else if mission.isCompleted {
                    Button(action: claimAction) {
                        HStack(spacing: 4) {
                            Image(systemName: "gift.fill")
                                .font(.system(size: 12))
                            Text("受取")
                                .font(.system(size: 12, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.green, Color.green.opacity(0.7)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                        .shadow(color: Color.green.opacity(0.4), radius: 6, y: 2)
                    }
                }
            }
            .padding(.horizontal, 14)
            .padding(.top, 14)
            .padding(.bottom, 10)

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.08))
                        .frame(height: 6)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: mission.isClaimed
                                    ? [Color.white.opacity(0.15), Color.white.opacity(0.1)]
                                    : [accentColor, accentColor.opacity(0.6)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: max(geometry.size.width * CGFloat(mission.progressPercentage), 6), height: 6)
                }
            }
            .frame(height: 6)
            .padding(.horizontal, 14)

            HStack {
                Spacer()
                Text("\(mission.currentCount)/\(mission.targetCount)")
                    .font(.system(size: 11, weight: .medium, design: .monospaced))
                    .foregroundColor(.white.opacity(0.4))
            }
            .padding(.horizontal, 14)
            .padding(.top, 4)
            .padding(.bottom, 12)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(mission.isClaimed ? 0.03 : 0.06))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            mission.isCompleted && !mission.isClaimed
                                ? Color.green.opacity(0.3)
                                : Color.white.opacity(0.08),
                            lineWidth: 1
                        )
                )
        )
        .onTapGesture {
            detailAction()
        }
    }
}

struct MissionRewardAnimationView: View {
    let coinAmount: Int
    let itemRewards: [InventoryReward]
    @Binding var isPresented: Bool
    @ObservedObject private var audioManager = AudioManager.shared

    @State private var showBackground = false
    @State private var showCard = false
    @State private var showTitle = false
    @State private var showCoins = false
    @State private var showItems = false
    @State private var showButton = false
    @State private var coinScale: CGFloat = 0.3
    @State private var particles: [RewardParticle] = []
    @State private var confetti: [ConfettiPiece] = []

    var body: some View {
        ZStack {
            Color.black.opacity(showBackground ? 0.7 : 0)
                .ignoresSafeArea()
                .onTapGesture { }

            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .offset(x: particle.x, y: particle.y)
                    .opacity(particle.opacity)
                    .blur(radius: 1)
            }

            ForEach(confetti) { piece in
                RoundedRectangle(cornerRadius: 2)
                    .fill(piece.color)
                    .frame(width: piece.width, height: piece.height)
                    .rotationEffect(.degrees(piece.rotation))
                    .offset(x: piece.x, y: piece.y)
                    .opacity(piece.opacity)
            }

            if showCard {
                VStack(spacing: 24) {
                    if showTitle {
                        VStack(spacing: 8) {
                            Text("🎉")
                                .font(.system(size: 48))

                            Text("ミッションクリア！")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)

                            HStack(spacing: 8) {
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.clear, .yellow.opacity(0.6)],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(height: 1)

                                Text("✦")
                                    .foregroundColor(.yellow)

                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [.yellow.opacity(0.6), .clear],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(height: 1)
                            }
                            .padding(.horizontal, 20)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }

                    if showCoins && coinAmount > 0 {
                        HStack(spacing: 8) {
                            Image("コイン")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 36)
                                .scaleEffect(coinScale)

                            Text("+\(coinAmount)")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.yellow)
                                .shadow(color: .yellow.opacity(0.5), radius: 10)
                        }
                        .transition(.scale.combined(with: .opacity))
                    }

                    if showItems && !itemRewards.isEmpty {
                        VStack(spacing: 12) {
                            ForEach(itemRewards, id: \.type) { reward in
                                HStack(spacing: 10) {
                                    InventoryItemArtworkView(type: reward.type, width: 36, height: 36, cornerRadius: 8)

                                    Text(reward.type.displayName)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)

                                    Spacer()

                                    Text("×\(reward.amount)")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(reward.type.accentColor)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white.opacity(0.08))
                                )
                            }
                        }
                        .padding(.horizontal, 8)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }

                    if showButton {
                        Button(action: {
                            generateHapticFeedback()
                            audioManager.playCancelSound()
                            withAnimation(.easeOut(duration: 0.2)) {
                                isPresented = false
                            }
                        }) {
                            Text("OK")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(
                                            LinearGradient(
                                                colors: [Color.green, Color.green.opacity(0.7)],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                )
                                .shadow(color: Color.green.opacity(0.4), radius: 8, y: 4)
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .padding(28)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.12, green: 0.12, blue: 0.22),
                                    Color(red: 0.08, green: 0.08, blue: 0.16)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.yellow.opacity(0.2), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.5), radius: 30, y: 10)
                )
                .padding(.horizontal, 32)
                .transition(.scale(scale: 0.8).combined(with: .opacity))
            }
        }
        .onAppear {
            playRewardSequence()
        }
    }

    private func playRewardSequence() {
        withAnimation(.easeOut(duration: 0.3)) {
            showBackground = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                showCard = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                showTitle = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                showCoins = true
                coinScale = 1.0
            }
            spawnParticles()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                showItems = true
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            spawnConfetti()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                showButton = true
            }
        }
    }

    private func spawnParticles() {
        for i in 0..<15 {
            let angle = Double(i) / 15.0 * .pi * 2
            let distance: CGFloat = CGFloat.random(in: 60...120)
            var particle = RewardParticle(
                x: 0,
                y: 0,
                size: CGFloat.random(in: 4...10),
                color: [Color.yellow, Color.orange, Color.white].randomElement()!,
                opacity: 1.0
            )

            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.03) {
                withAnimation(.easeOut(duration: 0.8)) {
                    particle.x = cos(angle) * distance
                    particle.y = sin(angle) * distance
                    particle.opacity = 0
                }
                particles.append(particle)
            }
        }
    }

    private func spawnConfetti() {
        let colors: [Color] = [.yellow, .orange, .red, .pink, .purple, .blue, .cyan, .green]

        for i in 0..<30 {
            var piece = ConfettiPiece(
                x: CGFloat.random(in: -180...180),
                y: -400,
                width: CGFloat.random(in: 4...8),
                height: CGFloat.random(in: 8...16),
                color: colors.randomElement()!,
                rotation: 0,
                opacity: 1.0
            )

            let delay = Double(i) * 0.02
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.easeIn(duration: Double.random(in: 1.5...3.0))) {
                    piece.y = 500
                    piece.x += CGFloat.random(in: -30...30)
                    piece.rotation = Double.random(in: 360...720)
                    piece.opacity = 0
                }
                confetti.append(piece)
            }
        }
    }
}

struct RewardParticle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var color: Color
    var opacity: Double
}

struct ConfettiPiece: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var rotation: Double
    var opacity: Double
}

#Preview {
    NavigationView {
        MissionView()
    }
}
