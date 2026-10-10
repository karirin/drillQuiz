import SwiftUI

struct StoryAdventureEntryView: View {
    @ObservedObject private var authManager = AuthManager.shared
    @Environment(\.dismiss) private var dismiss
    var mapStyle: AdventureMapStyle = .illustrated
    var body: some View {
        if let userID = authManager.currentUserId {
            StoryAdventureView(accountID: userID, mapStyle: mapStyle)
                .id(userID)
        } else {
            VStack(spacing: 20) {
                Text("冒険を始めるにはログインしてください")
                Button("ホームに戻る") { dismiss() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct StoryAdventureView: View {
    @StateObject private var store: AdventureStore
    private let mapStyle: AdventureMapStyle
    @ObservedObject private var authManager = AuthManager.shared
    @ObservedObject private var connectivity = AdventureConnectivityMonitor.shared
    @Environment(\.dismiss) private var dismiss
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var mapCommand: AdventureMapCommand?

    init(accountID: String, isPreview: Bool = false, defaults: UserDefaults = .standard,
         mapStyle: AdventureMapStyle = .illustrated) {
        _store = StateObject(wrappedValue: AdventureStore(accountID: accountID, defaults: defaults, isPreview: isPreview))
        self.mapStyle = mapStyle
    }

    private var companionName: String {
        authManager.avatars.first(where: { $0.usedFlag == 1 })?.name ?? "えんぴ君"
    }
    private var avatarName: String {
        guard let name = authManager.avatars.first(where: { $0.usedFlag == 1 })?.name else { return "defaultIcon" }
        let artwork = avatarArtworkName(for: name)
        return UIImage(named: artwork) == nil ? "defaultIcon" : artwork
    }
    private var coinBalance: Int { store.isPreview ? store.progress.earnedCoins : authManager.money }
    private var usesTransparentHUD: Bool { mapStyle == .storybook && store.loadError == nil }
    private var hudText: Color { usesTransparentHUD ? .white : AdventurePalette.ink }
    private var hudSecondaryText: Color { usesTransparentHUD ? .white.opacity(0.85) : AdventurePalette.muted }

    var body: some View {
        VStack(spacing: 0) {
            if usesTransparentHUD { compactHeader }
            else { header }
            if let error = store.loadError {
                VStack(spacing: 20) {
                    Image(systemName: "book.closed").font(.system(size: 42)).foregroundColor(AdventurePalette.muted)
                    Text(error).multilineTextAlignment(.center)
                    AdventurePrimaryButton("読み込みをやり直す", symbol: "arrow.clockwise") { store.reload(); store.presentStoryIfNeeded() }
                }
                .padding(30).frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                AdventureMapView(store: store, avatarName: avatarName, mapStyle: mapStyle, command: mapCommand)
                if usesTransparentHUD { compactFooter }
                else { footer }
            }
        }
        .foregroundColor(hudText)
        .backgroundPreferenceValue(AdventureMapBackdropPreferenceKey.self) { projection in
            AdventureScreenBackdrop(projection: projection, enabled: usesTransparentHUD)
                .ignoresSafeArea()
        }
        .preferredColorScheme(usesTransparentHUD ? .dark : nil)
        .navigationBarHidden(true)
        .sheet(item: $store.presentation, onDismiss: store.eventDidDismiss) { route in
            AdventureEventSheet(store: store, initialPresentation: route, coinBalance: coinBalance, avatarName: avatarName) { action in
                mapCommand = AdventureMapCommand(action: action)
            }
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
                .interactiveDismissDisabled(route.id == "battle" && store.progress.battle != nil)
        }
        .fullScreenCover(item: $store.storyPlayback, onDismiss: store.storyDidDismiss) { playback in
            AdventureDialogueView(playback: store.storyPlayback ?? playback,
                                  avatarName: avatarName, companionName: companionName,
                                  onAdvance: store.advanceStory,
                                  onPrevious: store.previousStoryPage,
                                  onSkip: store.finishStory)
                .interactiveDismissDisabled()
        }
        .onAppear { store.syncRewards(); store.presentStoryIfNeeded() }
        .onDisappear { store.cancelMovement() }
        .onChange(of: scenePhase) { phase in
            if phase == .active { store.syncRewards() }
            else { store.cancelMovement() }
        }
        .onChange(of: connectivity.isConnected) { connected in if connected { store.syncRewards() } }
    }

    private var compactHeader: some View {
        HStack(spacing: 6) {
            Button { store.cancelMovement(); dismiss() } label: {
                Image(systemName: "chevron.left").font(.system(size: 17, weight: .semibold))
                    .frame(width: 44, height: 44)
            }
            .accessibilityLabel("ホームに戻る").accessibilityIdentifier("adventure.close")
            Text("まなびの森").font(.system(size: 19, weight: .bold, design: .serif))
            Spacer()
            Button { store.presentation = .menu } label: {
                Image(systemName: "ellipsis").font(.system(size: 21, weight: .semibold))
                    .frame(width: 44, height: 44)
            }
            .disabled(store.isMoving)
            .accessibilityLabel("冒険メニュー")
            .accessibilityHint("クエスト、もちもの、地図の操作を開きます")
            .accessibilityIdentifier("adventure.menu")
        }
        .buttonStyle(.plain).padding(.horizontal, 8).padding(.vertical, 4)
        .shadow(color: .black.opacity(0.55), radius: 2, y: 1)
    }

    private var compactFooter: some View {
        let battleNode = store.progress.battle.flatMap { AdventureWorld.node($0.nodeID) }
        let node = battleNode ?? store.selectedNode
        let enabled = (store.canMove && canInspectCurrentNode) || battleNode != nil
        let detail = enabled || store.isMoving ? moveTitle : destinationDetail
        return Button(action: performMove) {
            HStack(spacing: 14) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(node.name).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.8))
                    Text(detail).font(.system(size: 15, weight: .bold)).fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
                Image(systemName: battleNode != nil ? "bolt.shield.fill" : enabled ? "arrow.right" : "lock.fill")
                    .font(.system(size: 19, weight: .semibold))
            }
            .padding(.horizontal, 18).padding(.vertical, 12)
            .frame(maxWidth: .infinity, minHeight: 64, alignment: .leading)
            .foregroundColor(.white)
            .background(AdventurePalette.deep.opacity(enabled ? 1 : 0.85), in: RoundedRectangle(cornerRadius: 18))
        }
        .buttonStyle(.plain).disabled(!enabled)
        .accessibilityIdentifier("adventure.move")
        .padding(.horizontal, 18).padding(.top, 8).padding(.bottom, 12)
    }

    private var header: some View {
        HStack(spacing: 10) {
            Button { store.cancelMovement(); dismiss() } label: {
                Image(systemName: "chevron.left").font(.system(size: 17, weight: .semibold)).frame(width: 30, height: 44)
            }
            .accessibilityLabel("ホームに戻る").accessibilityIdentifier("adventure.close")
            VStack(alignment: .leading, spacing: 4) {
                Text("第1章 · まっしろな冒険ノート").font(.system(size: 9, weight: .bold)).tracking(1.3).foregroundColor(hudSecondaryText)
                Text("まなびの森").font(.system(size: 23, weight: .bold, design: .serif))
            }
            Spacer(minLength: 4)
            HStack(spacing: 4) {
                Image(systemName: "circle.fill").foregroundColor(AdventurePalette.gold).overlay(Text("G").font(.system(size: 9, weight: .bold)).foregroundColor(Color(hex: "775324")))
                Text(coinBalance.formatted()).font(.system(size: 12, weight: .bold)).monospacedDigit().lineLimit(1).minimumScaleFactor(0.7)
            }
            .accessibilityLabel("所持コイン \(coinBalance)")
            Button { store.presentation = .world } label: { Image(systemName: "globe.asia.australia").font(.system(size: 20)).frame(width: 36, height: 44) }
                .disabled(store.isMoving).accessibilityLabel("世界地図を開く").accessibilityIdentifier("adventure.world")
            Button { store.presentation = .journal } label: {
                Image(systemName: "book.closed").font(.system(size: 19)).frame(width: 36, height: 44)
            }
            .disabled(store.isMoving || store.progress.battle != nil)
            .accessibilityLabel("冒険ノートを読む").accessibilityIdentifier("adventure.journal")
        }
        .buttonStyle(.plain).padding(.horizontal, 12).padding(.vertical, 10)
        .shadow(color: .black.opacity(usesTransparentHUD ? 0.55 : 0), radius: 2, y: 1)
    }

    private var footer: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(store.selectedNode.name).font(.system(size: 17, weight: .bold))
                    Text(destinationDetail).font(.system(size: 11)).foregroundColor(hudSecondaryText).fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 4)
                Text(store.progress.clearedNodeIDs.contains(store.selectedNodeID) ? "探索済み" : store.selectedNode.kind.title)
                    .font(.system(size: 10, weight: .medium)).padding(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(usesTransparentHUD ? .white.opacity(0.4) : AdventurePalette.line))
            }
            AdventurePrimaryButton(moveTitle, symbol: store.progress.battle != nil ? "bolt.shield.fill" : "figure.walk", action: performMove)
            .disabled((!store.canMove || !canInspectCurrentNode) && store.progress.battle == nil)
            .accessibilityIdentifier("adventure.move")
            HStack(spacing: 9) {
                Image(avatarName).resizable().scaledToFit().frame(width: 33, height: 33)
                VStack(spacing: 4) {
                    HStack {
                        Text("\(store.progress.course.title)の冒険者").font(.system(size: 10, weight: .semibold))
                        Spacer()
                        Text("\(store.progress.hp) / 100").font(.system(size: 10)).monospacedDigit()
                    }
                    AdventureHPBar(value: store.progress.hp, maximum: 100)
                }
                Button { store.presentation = .inventory } label: {
                    VStack(spacing: 3) { Image(systemName: "backpack").font(.system(size: 19)); Text("もちもの").font(.system(size: 9)) }.frame(minWidth: 44, minHeight: 44)
                }
                .buttonStyle(.plain).disabled(store.isMoving).accessibilityIdentifier("adventure.inventory")
            }
            if !store.isPreview && !store.progress.pendingRewardIDs.isEmpty {
                Button { store.syncRewards() } label: {
                    Label(store.isDeliveringRewards ? "コイン報酬を受取中…" : "保管中のコイン報酬を受け取る", systemImage: "tray.and.arrow.down")
                        .font(.system(size: 11)).foregroundColor(hudSecondaryText)
                }
                .disabled(store.isDeliveringRewards).accessibilityIdentifier("adventure.claimRewards")
            }
        }
        .padding(.horizontal, 18).padding(.top, 15).padding(.bottom, 12)
        .background(usesTransparentHUD ? Color.clear : AdventurePalette.paper)
        .shadow(color: .black.opacity(usesTransparentHUD ? 0.45 : 0), radius: 2, y: 1)
    }

    private var destinationDetail: String {
        if store.progress.battle != nil { return "戦闘を中断しています。続きから再開できます。" }
        if let reason = store.progress.blockedReason(for: store.selectedNodeID) { return reason }
        return store.selectedNode.detail
    }

    private func performMove() {
        if store.progress.battle != nil { store.presentation = .battle }
        else { AudioManager.shared.playKetteiSound(); store.move(reduceMotion: reduceMotion) }
    }
    private var moveTitle: String {
        if store.progress.battle != nil { return "戦闘を再開する" }
        if store.isMoving { return "移動中…" }
        if !store.canMove { return "道をつないで進もう" }
        if store.selectedNodeID == store.progress.currentNodeID { return canInspectCurrentNode ? "この場所を調べる" : "次の行き先を選ぼう" }
        return store.progress.clearedNodeIDs.contains(store.selectedNodeID) ? "ここへ戻る" : "ここへ進む"
    }
    private var canInspectCurrentNode: Bool {
        store.selectedNodeID != store.progress.currentNodeID || store.progress.currentNode.kind != .road
    }

}

struct AdventurePrimaryButton: View {
    let title: String
    let symbol: String
    let action: () -> Void
    @Environment(\.isEnabled) private var isEnabled
    init(_ title: String, symbol: String = "arrow.right", action: @escaping () -> Void) { self.title = title; self.symbol = symbol; self.action = action }
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: symbol).font(.system(size: 14, weight: .bold))
                .frame(maxWidth: .infinity, minHeight: 48)
                .foregroundColor(.white).background(AdventurePalette.deep.opacity(isEnabled ? 1 : 0.45), in: RoundedRectangle(cornerRadius: 13))
        }
        .buttonStyle(.plain)
    }
}

struct AdventureHPBar: View {
    let value: Int
    let maximum: Int
    var enemy = false
    var body: some View {
        GeometryReader { geometry in
            Capsule().fill(AdventurePalette.line).overlay(alignment: .leading) {
                Capsule().fill(enemy ? Color(hex: "BE8264") : Color(hex: "91AA68"))
                    .frame(width: geometry.size.width * min(1, max(0, Double(value) / Double(max(1, maximum)))))
            }
        }
        .frame(height: 5)
        .accessibilityLabel(enemy ? "敵のHP" : "冒険者のHP").accessibilityValue("\(value) / \(maximum)")
    }
}

struct StoryAdventureHomeCard: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image("defaultIcon").resizable().scaledToFit().frame(width: 62, height: 72)
                VStack(alignment: .leading, spacing: 5) {
                    Text("ストーリーモード").font(.system(size: 19, weight: .bold, design: .serif))
                    Text("おともと見つける、今日の「わかった！」").font(.system(size: 11, weight: .medium))
                    Text("第1章　まっしろな冒険ノート").font(.system(size: 10, weight: .semibold)).foregroundColor(AdventurePalette.muted)
                }
                Spacer(minLength: 0)
                Image(systemName: "arrow.right").font(.system(size: 16, weight: .bold))
            }
            .foregroundColor(AdventurePalette.ink).padding(.horizontal, 14).padding(.vertical, 8)
            .background(AdventurePalette.paper, in: RoundedRectangle(cornerRadius: 18))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(AdventurePalette.gold.opacity(0.6)))
            .shadow(color: .black.opacity(0.12), radius: 5, y: 3)
        }
        .buttonStyle(.plain).accessibilityIdentifier("home.storyAdventure")
    }
}

#if DEBUG
struct StoryAdventureView_Previews: PreviewProvider {
    static var previews: some View {
        StoryAdventureView(accountID: "swiftui-preview", isPreview: true,
                           defaults: UserDefaults(suiteName: "story-adventure-swiftui-preview") ?? .standard)
        StoryAdventureView(accountID: "swiftui-preview", isPreview: true,
                           defaults: UserDefaults(suiteName: "story-adventure-swiftui-preview") ?? .standard,
                           mapStyle: .storybook)
            .previewDisplayName("絵本の森・画像背景")
    }
}
#endif

#if DEBUG
/// Isolated local progress for simulator review and UI tests; never delivers rewards.
private struct StoryAdventurePreviewContainer: View {
    let defaults: UserDefaults
    var body: some View {
        StoryAdventureView(accountID: "story-preview", isPreview: true, defaults: defaults)
    }
}

struct StoryAdventurePreviewHost: View {
    private let defaults: UserDefaults
    init() {
        let suite = "drill.story-dialogue-preview"
        let storage = UserDefaults(suiteName: suite)!
        if ProcessInfo.processInfo.arguments.contains("-StoryAdventurePreviewFresh") {
            storage.removePersistentDomain(forName: suite)
        }
        defaults = storage
    }
    var body: some View { StoryAdventurePreviewContainer(defaults: defaults) }
}
#endif
