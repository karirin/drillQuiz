//
//  TestView.swift
//  it
//
//  Created by Apple on 2024/11/12.
//

import SwiftUI
import Firebase
import Combine
import UIKit

struct QuizStoryData: Identifiable {
    let id = UUID()
    let monsterName: String
    let backgroundName: String
}

enum DungeonQuizSubject {
    case math
    case japanese
    case science
    case socialStudies

    var title: String {
        switch self {
        case .math: return "算数"
        case .japanese: return "国語"
        case .science: return "理科"
        case .socialStudies: return "社会"
        }
    }

    static func subject(for floor: Int) -> DungeonQuizSubject {
        switch floor {
        case 1...5, 10...15, 41...52, 53...64:
            return .math
        case 6...9, 16...20, 65...76:
            return .japanese
        case 21...25, 30...35, 77...88:
            return .science
        case 26...29, 36...40, 89...100:
            return .socialStudies
        default:
            return .math
        }
    }
}

struct DungeonTheme {
    static let maxFloor = 100

    static func clampedFloor(_ floor: Int) -> Int {
        min(max(floor, 1), maxFloor)
    }

    static func mapBackgroundName(for floor: Int) -> String {
        switch clampedFloor(floor) {
        case 1...52: return "背景1"
        default: return "背景3"
        }
    }

    static func battleBackgroundName(for floor: Int) -> String {
        clampedFloor(floor) <= 52 ? "ダンジョン背景1" : "ダンジョン背景2"
    }

    static func platformImageName(for floor: Int) -> String {
        switch clampedFloor(floor) {
        case 1...52: return floor == 52 ? "ボス足場1" : "足場1"
        case 53...99: return "足場3"
        default: return "ボス足場3"
        }
    }
}

// PositionViewModel の定義
class PositionViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var userPosition: Int = 1
    @Published var coin: Int = 1
    @Published var monster: Int = 1
    @Published var stamina: Int = 100
    @Published var monsterName: String = "モンスタ-1"
    @Published var showStaminaAlert: Bool = false
    @Published var showCoinAlert: Bool = false
    @Published var showMonsterAlert: Bool = false
    @Published var isPositionFetched: Bool = false // フラグを追加
    @Published var showMonsterQuizList = false
    @Published var avatarName: String = ""
    @Published var selectedBattleFloor: Int?
    private let authManager = AuthManager.shared
    
    // MARK: - Private Properties
    private var dbRef: DatabaseReference
    private var handle: DatabaseHandle?
    private var cancellables = Set<AnyCancellable>()
    private var staminaRecoveryCancellable: AnyCancellable?
    
    private var isTimerActive = false
    
    // MARK: - Constants
    struct Constants {
        static let maxStamina: Int = 100
        static let maxDungeonPosition: Int = DungeonTheme.maxFloor
        static let staminaRecoveryInterval: TimeInterval = 60 // 60秒 = 1分
        static let staminaRecoveryAmount: Int = 1
    }

    static var isDeveloperMode: Bool {
        #if DEBUG
        true
        #else
        false
        #endif
    }

    var isStaminaUnlimited: Bool {
        Self.isDeveloperMode
    }

    var staminaDisplayText: String {
        isStaminaUnlimited ? "∞" : "\(stamina)/\(Constants.maxStamina)"
    }

    var staminaProgress: Float {
        isStaminaUnlimited ? 1 : Float(stamina) / Float(Constants.maxStamina)
    }

    func hasEnoughStamina(for cost: Int) -> Bool {
        isStaminaUnlimited || stamina >= cost
    }
    
    // MARK: - Singleton Instance
    static let shared: PositionViewModel = {
        let instance = PositionViewModel()
        return instance
    }()
    
    // MARK: - Initializer
    private init() {
        self.dbRef = Database.database().reference()
        
        // アバターの監視
        authManager.$avatars
            .receive(on: DispatchQueue.main)
            .sink { [weak self] avatars in
                if let firstUsedAvatar = avatars.first(where: { $0.usedFlag == 1 }) {
                    self?.avatarName = firstUsedAvatar.name
                } else {
                    self?.avatarName = "ネッキー" // デフォルト値
                }
            }
            .store(in: &cancellables)
        
        // 認証されたユーザーの監視
        authManager.$user
            .compactMap { $0?.uid }
            .sink { [weak self] userId in
                print("userId   :\(userId)")
                self?.fetchPosition(for: userId ?? "")
                self?.fetchUserStamina(for: userId ?? "")
                self?.fetchAvatars(for: userId ?? "")
            }
            .store(in: &cancellables)
        
        // スタミナ回復タイマーの設定
        staminaRecoveryCancellable = Timer.publish(every: Constants.staminaRecoveryInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.recoverStamina()
            }
    }
    
    // MARK: - Deinitializer
    deinit {
        staminaRecoveryCancellable?.cancel()
        // Remove observer when the view model is deallocated
        if let userId = authManager.currentUserId, let handle = handle {
            dbRef.child("storys").child(userId).child("position").removeObserver(withHandle: handle)
        }
    }
    
    // MARK: - Stamina Recovery
    private func recoverStamina() {
        guard !isStaminaUnlimited else { return }
        guard stamina < Constants.maxStamina else { return }
        
        DispatchQueue.main.async {
            self.stamina += Constants.staminaRecoveryAmount
            // 最大スタミナを超えないようにする
            if self.stamina > Constants.maxStamina {
                self.stamina = Constants.maxStamina
            }
        }
        
        updateStaminaInFirebase()
    }
    
    func incrementUserPosition() {
        guard let userId = AuthManager.shared.currentUserId else {
            print("User is not logged in.")
            return
        }
        
        // スタミナが十分か確認
        guard hasEnoughStamina(for: 10) else {
            showStaminaAlert = true
            return
        }
        
        guard userPosition < Constants.maxDungeonPosition else { return }
        let newPosition = min(userPosition + 1, Constants.maxDungeonPosition)
        let newStamina = self.stamina
        
        // ローカルの状態を即時に更新し、アニメーションをトリガー
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: 0.5)) { // アニメーションの調整
                self.userPosition = newPosition
                self.stamina = newStamina
            }
        }
        
        let storyRef = dbRef.child("storys").child(userId)
        
        // 複数のフィールドを同時に更新するためのデータ構造
        var updates: [String: Any] = ["position": newPosition]
        if !isStaminaUnlimited {
            updates["stamina"] = newStamina
        }
        
        // Firebase に位置とスタミナを同時に更新
        storyRef.updateChildValues(updates) { error, _ in
            if let error = error {
                print("position と stamina の更新に失敗しました: \(error.localizedDescription)")
                // 必要に応じてローカルの状態を元に戻す処理を追加
                DispatchQueue.main.async {
                    withAnimation {
                        self.userPosition = newPosition - 1
                        self.stamina = newStamina
                    }
                }
            } else {
                print("position と stamina が更新されました: position=\(newPosition), stamina=\(newStamina)")
                AuthManager.shared.recordDungeonStep(position: newPosition)
                GuildManager.shared.recordDungeonStep()
            }
        }
    }
    
    // スタミナ回復のためのメソッド
    func recoverStaminaOnAppLaunch(completion: @escaping (Bool) -> Void) {
        stopStaminaRecoveryTimer()
        guard !isStaminaUnlimited else {
            completion(true)
            return
        }
        authManager.fetchLastActiveTimeFromFirebase { [weak self] lastActiveTimestamp in
            guard let self = self else {
                completion(false)
                return
            }

            let currentTime = Date().timeIntervalSince1970

            if let lastActive = lastActiveTimestamp {
                let elapsedTime = currentTime - lastActive
                let minutesPassed = Int(elapsedTime / Constants.staminaRecoveryInterval)

                guard minutesPassed > 0 else {
                    print("スタミナ回復の必要なし。経過時間: \(elapsedTime)秒")
                    completion(true)
                    self.startStaminaRecoveryTimer()
                    return
                }

                let staminaToRecover = minutesPassed * Constants.staminaRecoveryAmount
                let newStamina = min(self.stamina + staminaToRecover, Constants.maxStamina)
                let actualRecovered = newStamina - self.stamina

                if actualRecovered > 0 {
                    DispatchQueue.main.async {
                        self.stamina = newStamina
                        self.updateStaminaInFirebase()
                    }
                    print("\(actualRecovered)スタミナを回復しました。")
                } else {
                    print("スタミナの回復が必要ありません。")
                }
            } else {
                print("lastActiveTimeが存在しないため、スタミナ回復をスキップします。")
            }

            // 最後のアクティブ時刻を現在時刻に更新
            self.authManager.saveLastActiveTimeToFirebase { success in
                completion(success)
                self.startStaminaRecoveryTimer()
            }
        }
    }
    
    func handleAppBecameActive() {
        recoverStaminaOnAppLaunch { success in
            if success {
                print("アプリ復帰時のスタミナ回復に成功しました。")
            }
        }
        startStaminaRecoveryTimer()
    }
    // アプリがバックグラウンドになった時の処理
    func handleAppWentToBackground() {
        saveLastActiveTime { _ in }
        stopStaminaRecoveryTimer()
    }
    
    func recoverStamina(by amount: Int, completion: ((Bool) -> Void)? = nil) {
        guard !isStaminaUnlimited else {
            completion?(false)
            return
        }
        guard amount > 0 else {
            completion?(false)
            return
        }

        let recoveredStamina = min(stamina + amount, Constants.maxStamina)
        guard recoveredStamina > stamina else {
            completion?(false)
            return
        }

        updateStaminaInFirebase(value: recoveredStamina) { success in
            DispatchQueue.main.async {
                if success {
                    self.stamina = recoveredStamina
                }
                completion?(success)
            }
        }
    }
    
    // スタミナを更新するメソッド
    func updateStaminaInFirebase(value: Int? = nil, completion: ((Bool) -> Void)? = nil) {
        guard let userId = AuthManager.shared.currentUserId else {
            completion?(false)
            return
        }
        let storyRef = dbRef.child("storys").child(userId)
        let staminaValue = value ?? stamina
        let updates = ["stamina": staminaValue] as [String : Any]
        
        storyRef.updateChildValues(updates) { error, _ in
            if let error = error {
                print("スタミナの更新に失敗しました: \(error.localizedDescription)")
                completion?(false)
            } else {
                print("スタミナが\(staminaValue)に回復しました")
                completion?(true)
            }
        }
    }
    
    // MARK: - Firebase Fetch Methods
    
    func fetchUserStamina(for userId: String) {
        let staminaRef = Database.database().reference().child("storys").child(userId).child("stamina")
        
        staminaRef.observeSingleEvent(of: .value) { snapshot in
            if let staminaValue = snapshot.value as? Int {
                DispatchQueue.main.async {
                    self.stamina = staminaValue
                }
            } else {
                // スタミナが存在しない場合は初期値を設定
                self.stamina = 100
                self.saveInitialStamina(for: userId)
            }
        }
    }
    
    private func saveInitialStamina(for userId: String) {
        let staminaRef = dbRef.child("storys").child(userId).child("stamina")
        staminaRef.setValue(self.stamina) { error, _ in
            if let error = error {
                print("初期スタミナの保存に失敗しました: \(error.localizedDescription)")
            } else {
                print("初期スタミナをFirebaseに保存しました: \(self.stamina)")
            }
        }
    }
    
    /// Fetch the position for a specific userId
    func fetchPosition(for userId: String) {
        // Remove existing observer if any
        if let handle = handle {
            dbRef.child("storys").child(userId).child("position").removeObserver(withHandle: handle)
        }
        
        // Observe the position value in Firebase
        handle = dbRef.child("storys").child(userId).child("position").observe(.value) { [weak self] snapshot in
            guard let self = self else { return }
            if let positionValue = snapshot.value as? Int {
                DispatchQueue.main.async {
                    self.userPosition = DungeonTheme.clampedFloor(positionValue)
                    self.isPositionFetched = true // フラグを設定
                    print("取得した position: \(positionValue)")
                }
            } else if let positionValue = snapshot.value as? Double {
                // FirebaseからDoubleとして取得される場合もあるため
                DispatchQueue.main.async {
                    self.userPosition = DungeonTheme.clampedFloor(Int(positionValue))
                    self.isPositionFetched = true // フラグを設定
                    print("取得した position (Double): \(positionValue)")
                }
            } else {
                // position が存在しない場合は初期値を設定
                self.userPosition = 1
                self.isPositionFetched = true
                self.saveInitialPosition(for: userId)
                print("position が存在しないため、初期値を設定しました。")
            }
        }
    }

    private func saveInitialPosition(for userId: String) {
        let positionRef = dbRef.child("storys").child(userId).child("position")
        positionRef.setValue(self.userPosition) { error, _ in
            if let error = error {
                print("初期 position の保存に失敗しました: \(error.localizedDescription)")
            } else {
                print("初期 position をFirebaseに保存しました: \(self.userPosition)")
            }
        }
    }
    
    func fetchAvatars(for userId: String) {
        authManager.fetchAvatars() {}
    }
    
    /// ユーザーのポジションを増加させる
    func incrementPosition() {
        guard let userId = AuthManager.shared.currentUserId else {
            print("User is not logged in.")
            return
        }
        
        // スタミナが十分か確認
        guard hasEnoughStamina(for: 10) else {
            showStaminaAlert = true
            return
        }
        
        guard userPosition < Constants.maxDungeonPosition else { return }
        let newPosition = min(userPosition + 1, Constants.maxDungeonPosition)
        let previousStamina = stamina
        let newStamina = isStaminaUnlimited ? previousStamina : previousStamina - 10
        
        // ローカルの状態を即時に更新し、アニメーションをトリガー
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: 0.5)) { // アニメーションの調整
                self.userPosition = newPosition
                self.stamina = newStamina
            }
        }
        
        let storyRef = dbRef.child("storys").child(userId)
        
        // 複数のフィールドを同時に更新するためのデータ構造
        var updates: [String: Any] = ["position": newPosition]
        if !isStaminaUnlimited {
            updates["stamina"] = newStamina
        }
        
        // Firebase に位置とスタミナを同時に更新
        storyRef.updateChildValues(updates) { error, _ in
            if let error = error {
                print("position と stamina の更新に失敗しました: \(error.localizedDescription)")
                // 必要に応じてローカルの状態を元に戻す処理を追加
                DispatchQueue.main.async {
                    withAnimation {
                        self.userPosition = newPosition - 1
                        self.stamina = previousStamina
                    }
                }
            } else {
                print("position と stamina が更新されました: position=\(newPosition), stamina=\(newStamina)")
                AuthManager.shared.recordDungeonStep(position: newPosition)
                GuildManager.shared.recordDungeonStep()
            }
        }
    }

    /// スタミナを減少させる関数
    func decreaseStamina(by amount: Int = 10) {
        guard !isStaminaUnlimited else { return }
        guard let userId = authManager.currentUserId else {
            print("ユーザーがログインしていません。")
            return
        }
        
        // スタミナが十分か確認
        guard self.stamina >= amount else {
            DispatchQueue.main.async {
                self.showStaminaAlert = true
            }
            return
        }
        
        let newStamina = self.stamina - amount
        
        // ローカルの状態を即時に更新し、アニメーションをトリガー
        DispatchQueue.main.async {
            withAnimation(.easeInOut(duration: 0.5)) { // アニメーションの調整
                self.stamina = newStamina
            }
        }
        
        let storyRef = dbRef.child("storys").child(userId)
        
        // スタミナのみを更新するためのデータ構造
        let updates = [
            "stamina": newStamina
        ] as [String : Any]
        
        // Firebase にスタミナを更新
        storyRef.updateChildValues(updates) { error, _ in
            if let error = error {
                print("スタミナの更新に失敗しました: \(error.localizedDescription)")
                // 必要に応じてローカルの状態を元に戻す処理を追加
                DispatchQueue.main.async {
                    withAnimation {
                        self.stamina = newStamina + amount
                    }
                }
            } else {
                print("スタミナが更新されました: stamina=\(newStamina)")
            }
        }
    }
    
    func saveLastActiveTimeToFirebase() {
        guard let userId = authManager.currentUserId else { return }
        let lastActiveRef = dbRef.child("storys").child(userId).child("lastActiveTime")
        let currentTime = Date().timeIntervalSince1970 // Unixタイムスタンプとして保存
        
        lastActiveRef.setValue(currentTime) { error, _ in
            if let error = error {
                print("FirebaseへのlastActiveTimeの保存に失敗しました: \(error.localizedDescription)")
            } else {
                print("FirebaseにlastActiveTimeを保存しました")
            }
        }
    }

    // saveLastActiveTime 関数を拡張してFirebaseにも保存
    func saveLastActiveTime(completion: @escaping (Bool) -> Void) {
        authManager.saveLastActiveTimeToFirebase { success in
            if success {
                print("最後のアクティブ時刻を保存しました。")
            } else {
                print("最後のアクティブ時刻の保存に失敗しました。")
            }
            completion(success)
        }
    }
    
    func startStaminaRecoveryTimer() {
        guard !isStaminaUnlimited else {
            stopStaminaRecoveryTimer()
            return
        }
        guard !isTimerActive else {
        print("タイマーは既に動作中です")
        return
        }
        print("スタミナ回復タイマーを開始します")
        isTimerActive = true
        
        staminaRecoveryCancellable = Timer.publish(every: Constants.staminaRecoveryInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.recoverStamina()
            }
    }
    
    /// スタミナ回復タイマーを停止する
    func stopStaminaRecoveryTimer() {
        staminaRecoveryCancellable?.cancel()
        staminaRecoveryCancellable = nil
        isTimerActive = false
    }
}

// Viewの中心に近いPlatformViewを特定するためのPreferenceKey
struct ViewOffsetKey: PreferenceKey {
    typealias Value = [Int: CGFloat]
    
    static var defaultValue: [Int: CGFloat] = [:]
    
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct DownArrowPositionKey: PreferenceKey {
    typealias Value = CGPoint?
    static var defaultValue: CGPoint? = nil

    static func reduce(value: inout CGPoint?, nextValue: () -> CGPoint?) {
        if let next = nextValue() {
            value = next
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private enum StoryDungeonScrollTarget: Hashable {
    case currentPosition(Int)
}

// TestView の定義
struct StoryView: View {
    @StateObject var viewModel = PositionViewModel.shared
    @StateObject var rankingViewModel = RankingViewModel()
    @ObservedObject var audioManager = AudioManager()
    @ObservedObject var authManager = AuthManager()
    @Namespace private var animationNamespace
    @State private var initialScrollDone = false
    @State private var isPreparingInitialScroll = false
    @State private var isStorySutaminaModal = false
    @State private var isLoading = true
    @State private var position: Int = 1
    @State private var index: Int = 1
    @State private var currentVisiblePosition: Int = 1
    @State private var isSoundOn: Bool = true
    @Environment(\.scenePhase) var scenePhase
    @State private var userPreFlag: Int = 0
    @State private var isStoryFlag: Bool = false
    @State private var isTutorialStart: Bool = false
    @State private var csFlag: Bool = false
    @State private var downArrowPosition: CGPoint? = nil
    @Binding var isReturnActive: Bool
    @Binding var isPresented: Bool
    @State private var isStoryRankingModal = false
    @State private var hasAppeared = false

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ZStack {
                    Image(backgroundImageName(for: currentVisiblePosition))
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.5), value: currentVisiblePosition)

                    VStack {
                        if userPreFlag != 1 {
                            BannerStortyView()
                        }
                        VStack {
                                HStack{
                                    if isReturnActive {
                                        Button(action: {
                                generateHapticFeedback()
                                            isPresented = false
                                            audioManager.playCancelSound()
                                        }) {
                                            Image(systemName: "chevron.left")
                                            Text("戻る")
                                        }
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(30)
                                    }
                                Spacer()
                                Button(action: {
                                generateHapticFeedback()
                                    audioManager.toggleSound()
                                    audioManager.playSound()
                                    isSoundOn.toggle()
                                }) {
                                    if isSoundOn {
//                                        Image(systemName: "speaker.wave.2")
                                        Image("音声オン")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:40)
                                    } else {
//                                        Image(systemName: "speaker.slash")
                                        Image("音声オフ")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:40)
                                    }
                                }
                                HStack {
                                    Image("スタミナ")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                    Text("スタミナ: \(viewModel.staminaDisplayText)")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding(10)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                            }
                            .padding(.horizontal, 40)
                        }
//                        Button(action: {
//                                generateHapticFeedback()
//                            audioManager.toggleSound()
//                            audioManager.playSound()
//                            isStoryRankingModal = true
//                        }) {
//                            Image("ランキングボタン")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height:45)
//                        }
                        // スタミナゲージ
                        ProgressStoryView(progress: .constant(viewModel.staminaProgress))
                            .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            .padding(.bottom, 10)
                        
                        // スクロールビュー
                        ScrollView {
                            VStack {
                                PlatformsContainer(viewModel: viewModel, namespace: animationNamespace)
                            }
                            NavigationLink("", destination: StoryRankingView(viewModel: rankingViewModel, isReturnFlag: .constant(true)).navigationBarBackButtonHidden(true), isActive: $isStoryRankingModal)
                        }
                        .opacity(initialScrollDone ? 1 : 0)
                        .allowsHitTesting(initialScrollDone)
                        .onPreferenceChange(ViewOffsetKey.self) { offsets in
                            updateVisiblePosition(from: offsets)
                        }
                        
                    }
                    
                    if viewModel.showStaminaAlert {
                        StorySutaminaModalView(isPresented: $viewModel.showStaminaAlert)
                    }
                    
                    if viewModel.showCoinAlert {
                        StoryCoinModalView(coin: viewModel.coin, isPresented: $viewModel.showCoinAlert)
                    }
                    
                    if viewModel.showMonsterAlert {
                        StoryMonsterModalView(viewModel: viewModel, monster: $viewModel.monster, isPresented: $viewModel.showMonsterAlert, showQuizList: $viewModel.showMonsterQuizList, audioManager: audioManager)
                    }
                    
                    if isStoryFlag {
                        TutorialStoryModalView(isPresented: $isStoryFlag, isTutorialStart: $isTutorialStart)
                    }
                    
                    if csFlag {
                        HelpStoryModalView(audioManager: audioManager, isPresented: $csFlag)
                    }
                    
                    if isTutorialStart {
                       if let position = downArrowPosition {
                           Color.black.opacity(0.5)
                               .overlay(
                                Group {
                                    Circle()
                                        .frame(width: 100, height: 100)
                                        .position(x: position.x, y: isSmallDevice() ? position.y : position.y + 30)
                                        .blendMode(.destinationOut)
                                }
                           )
                               .ignoresSafeArea()
                               .compositingGroup()
                               .background(.clear)
                               .onTapGesture {
                                   isTutorialStart = false
                               }
                               VStack {
                                   Spacer()
                                   Spacer()
                                   Spacer()
                                   VStack(alignment: .trailing, spacing: .zero) {
                                       Text("「下矢印」をクリックすると進むことができます")
                                           .font(.callout)
                                           .padding(5)
                                           .font(.system(size: 24.0))
                                           .padding(.all, 16.0)
                                           .background(Color("Color2"))
                                           .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.gray, lineWidth: 15)
                                           )
                                           .cornerRadius(20)
                                           .padding(.horizontal, 16)
                                           .padding(.bottom)
                                           .foregroundColor(Color("fontGray"))
                                           .shadow(radius: 10)
                                   }
                                   Spacer()
                               }
                               .onTapGesture {
                                   isTutorialStart = false
                               }
                           }
                       }
                    
                    if isLoading {
                        VStack {
                            ActivityIndicator()
                        }
                        .background(Color("Color2"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .coordinateSpace(name: "StoryViewCoordinateSpace") // 名前付き座標空間を設定
                .onPreferenceChange(DownArrowPositionKey.self) { position in
                    self.downArrowPosition = position
                }
                .onAppear{
                    guard !hasAppeared else { return }
                    hasAppeared = true
                    let userDefaults = UserDefaults.standard
                    if !userDefaults.bool(forKey: "hasLaunchedStoryOnappear") {
                        isStoryFlag = true
                    }
                    userDefaults.set(true, forKey: "hasLaunchedStoryOnappear")
                    userDefaults.synchronize()
                    authManager.fetchUserStoryCsFlag()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if authManager.userStoryCsFlag == 0 {
                            executeProcessEveryfifTimes()
                        }
                    }
                    position = viewModel.userPosition
                    index = viewModel.userPosition
                    if let userId = AuthManager.shared.currentUserId {
                         viewModel.fetchUserStamina(for: userId)
                    }
                    authManager.fetchPreFlag()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        userPreFlag = authManager.userPreFlag
                    }
                    if viewModel.isPositionFetched {
                        prepareInitialCurrentPositionScroll(proxy: proxy)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        if !initialScrollDone && !isPreparingInitialScroll {
                            prepareInitialCurrentPositionScroll(proxy: proxy)
                        }
                    }
                    viewModel.recoverStaminaOnAppLaunch { success in
                        if success {
                            print("スタミナ回復に成功しました。")
                        } else {
                            print("スタミナ回復に失敗しました。")
                        }
                    }
                    viewModel.startStaminaRecoveryTimer()
                }
                // userPosition が取得されたときにスクロール
                .onReceive(viewModel.$isPositionFetched) { fetched in
                    if fetched && !initialScrollDone {
                        prepareInitialCurrentPositionScroll(proxy: proxy)
                    }
                }
                // userPosition が変更されたときにスクロール
                .onChange(of: viewModel.userPosition) { newPosition in
                    if let userId = AuthManager.shared.currentUserId {
                        viewModel.fetchUserStamina(for: userId)
                    }
                    if initialScrollDone {
                        scrollToCurrentPosition(proxy: proxy, animated: true)
                    }
                }
//                .onPreferenceChange(ViewOffsetKey.self) { offsets in
//                    // 現在のスクリーン中央のY座標
//                    let screenHeight = UIScreen.main.bounds.height
//                    let centerY = screenHeight / 2
//
//                    // 各PlatformViewのmidYとスクリーン中央との距離を計算
//                    let closest = offsets.min { abs($0.value - centerY) < abs($1.value - centerY) }
//
//                    if let closestPosition = closest?.key {
//                        if currentVisiblePosition != closestPosition {
//                            currentVisiblePosition = closestPosition
//                        }
//                    }
//                }
            }
        }
        // アプリのライフサイクルの変更を監視
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background:
                // アプリがバックグラウンドに移行したとき
                viewModel.saveLastActiveTime { success in
                    if success {
                        print("最後のアクティブ時刻を保存しました。")
                    } else {
                        print("最後のアクティブ時刻の保存に失敗しました。")
                    }
                }
            case .active:
                // アプリがアクティブになったとき
                viewModel.recoverStaminaOnAppLaunch { success in
                    if success {
                        print("スタミナ回復に成功しました。")
                    } else {
                        print("スタミナ回復に失敗しました。")
                    }
                }
                viewModel.startStaminaRecoveryTimer()
            default:
                break
            }
        }
        .onDisappear {
            // タブ切り替え時にタイマーを停止
            viewModel.stopStaminaRecoveryTimer()
        }
    }
    
    func executeProcessEveryfifTimes() {
        // UserDefaultsからカウンターを取得
        let count = UserDefaults.standard.integer(forKey: "launchStoryCSCount") + 1
        
        // カウンターを更新
        UserDefaults.standard.set(count, forKey: "launchStoryCSCount")
        
        // 3回に1回の割合で処理を実行
        if count % 10 == 0 {
            csFlag = true
        }
    }
    
    private func updateVisiblePosition(from offsets: [Int: CGFloat]) {
        let screenCenterY = UIScreen.main.bounds.midY
        guard let closestFloor = offsets.min(by: {
            abs($0.value - screenCenterY) < abs($1.value - screenCenterY)
        })?.key else {
            return
        }

        if currentVisiblePosition != closestFloor {
            currentVisiblePosition = DungeonTheme.clampedFloor(closestFloor)
        }
    }
    
    private func backgroundImageName(for position: Int) -> String {
        DungeonTheme.mapBackgroundName(for: position)
    }
    private func prepareInitialCurrentPositionScroll(proxy: ScrollViewProxy) {
        guard !initialScrollDone, !isPreparingInitialScroll else { return }

        isPreparingInitialScroll = true
        let delays: [TimeInterval] = [0, 0.05, 0.16, 0.30]

        for delay in delays {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                scrollToCurrentPosition(proxy: proxy, animated: false)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.34) {
            withAnimation(.easeOut(duration: 0.16)) {
                initialScrollDone = true
                isLoading = false
            }
            isPreparingInitialScroll = false
        }
    }

    private func scrollToCurrentPosition(proxy: ScrollViewProxy, animated: Bool) {
        let userPos = DungeonTheme.clampedFloor(viewModel.userPosition)
        let action = {
            proxy.scrollTo(StoryDungeonScrollTarget.currentPosition(userPos), anchor: .center)
        }

        if animated {
            withAnimation(.spring(response: 0.45, dampingFraction: 0.88)) {
                action()
            }
        } else {
            withTransaction(Transaction(animation: nil)) {
                action()
            }
        }
    }
}


struct PlatformData: Identifiable {
    var id: Int { position }
    let imageName: String
    let position: Int
    let padding: EdgeInsets?
    let padding1: EdgeInsets?
    let paddingMonster: EdgeInsets?
    let paddingTreasure: EdgeInsets?
    let boss: Int?
    let treasure: Int?
    let monster: Int?
    
    init(
        imageName: String,
        position: Int,
        padding: EdgeInsets? = nil,
        padding1: EdgeInsets? = nil,
        paddingMonster: EdgeInsets? = nil,
        paddingTreasure: EdgeInsets? = nil,
        boss: Int = 0,
        treasure: Int = 0,
        monster: Int = 0
    ) {
        self.imageName = imageName
        self.position = position
        self.padding = padding
        self.padding1 = padding1
        self.paddingMonster = paddingMonster
        self.paddingTreasure = paddingTreasure
        self.boss = boss
        self.treasure = treasure
        self.monster = monster
    }
}

// PlatformsContainer の定義
struct PlatformsContainer: View {
    let platformImageName: String
    @ObservedObject var viewModel: PositionViewModel
    let namespace: Namespace.ID
    let platformDatas: [[PlatformData]]
    
    // カスタムイニシャライザ
    init(viewModel: PositionViewModel, namespace: Namespace.ID) {
        self.viewModel = viewModel
        self.namespace = namespace
        self.platformImageName = "足場1"
        let lowerFloorDatas: [[PlatformData]] = [
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 97,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 98,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 99,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 96,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 95,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 94,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 91,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 92,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 93,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 90,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 89,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 88,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 85,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 86,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 87,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 84,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 83,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 82,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 79,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 80,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 81,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 78,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 77,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 76,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 73,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 74,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 75,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 72,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 71,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 70,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 67,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 68,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 69,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 66,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 65,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 64,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 61,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 62,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 63,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position:60,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 59,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 58,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 55,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 56,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 57,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                )
//            ],
//            [
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position:54,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 53,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 52,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
//                    padding1: nil
//                )
//            ],
            [
                PlatformData(
                    imageName: DungeonTheme.platformImageName(for: 52),
                    position: 52,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    boss: 15
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 49,
                    padding: EdgeInsets(top: 0, leading: 40, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0),
                    paddingTreasure: EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0),
                    treasure: 12
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 50,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 51,
                    padding: EdgeInsets(top: 0, leading: -20, bottom: 60, trailing: 30),
                    padding1: EdgeInsets(top: 0, leading: -10, bottom: 120, trailing: 30)
                )
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 49,
//                    padding: EdgeInsets(top: 0, leading: 45, bottom: -60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 50,
//                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
//                ),
//                PlatformData(
//                    imageName: self.platformImageName,
//                    position: 51,
//                    padding: EdgeInsets(top: 0, leading: -45, bottom: 60, trailing: 0),
//                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
//                    boss: 2
//                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 48,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    monster: 14
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 47,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 46,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    paddingMonster: EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0),
                    monster: 13
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 43,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 44,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    paddingTreasure: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    treasure: 11
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 45,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 42,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    monster: 12
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 41,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 40,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    treasure: 10
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 37,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    treasure: 9
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 38,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    paddingMonster: EdgeInsets(top: -90, leading: 0, bottom: 0, trailing: 0),
                    monster: 11
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 39,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 36,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 35,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    paddingMonster: EdgeInsets(top: -90, leading: 0, bottom: 0, trailing: 0),
                    monster: 10
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 34,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    treasure: 8
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 31,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    paddingMonster: EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0),
                    monster: 9
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 32,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 33,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 30,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 29,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    paddingTreasure: EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0),
                    treasure: 7
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 28,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 25,
                    padding: EdgeInsets(top: 0, leading: 60, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 26,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 27,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 60),
                    padding1: EdgeInsets(top: 0, leading: -50, bottom: 120, trailing: 0)
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 24,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    monster: 7
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 23,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 22,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    treasure: 5
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 19,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    treasure: 4
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 20,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    paddingMonster: EdgeInsets(top: -90, leading: 0, bottom: 0, trailing: 0),
                    monster: 6
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 21,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0)
                )
            ],
            [
                
                PlatformData(
                    imageName: self.platformImageName,
                    position: 18,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    monster: 5
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 17,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 16,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 13,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    paddingTreasure: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    treasure: 3
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 14,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 15,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    monster: 8
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 12,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingMonster: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    monster: 4
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 11,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 10,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    paddingMonster: EdgeInsets(top: -60, leading: 10, bottom: 0, trailing: 0),
                    monster: 3
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 7,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    paddingMonster: EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0),
                    monster: 1
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 8,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 9,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 120, trailing: 0),
                    paddingTreasure: EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 0),
                    treasure: 0
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 6,
                    padding: EdgeInsets(top: -30, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 90, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 5,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 4,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -30, trailing: 0),
                    padding1: nil,
                    paddingTreasure: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    treasure: 1
                )
            ],
            [
                PlatformData(
                    imageName: self.platformImageName,
                    position: 1,
                    padding: EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: -30, leading: 0, bottom: 0, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 2,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0)
                ),
                PlatformData(
                    imageName: self.platformImageName,
                    position: 3,
                    padding: EdgeInsets(top: -30, leading: 0, bottom: 0, trailing: 0),
                    padding1: EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0),
                    paddingMonster: EdgeInsets(top: -110, leading: 0, bottom: 0, trailing: 0),
                    monster: 2
                )
            ],
        ]
        self.platformDatas = Self.makeUpperFloorDatas() + lowerFloorDatas
    }

    private static func makeUpperFloorDatas() -> [[PlatformData]] {
        let monsterPositions = Array(stride(from: 55, through: 97, by: 3)) + [99]
        let monsterByPosition = Dictionary(
            uniqueKeysWithValues: zip(monsterPositions, Array(17...32))
        )
        let treasureByPosition: [Int: Int] = [
            60: 13,
            69: 14,
            78: 15,
            87: 16,
            96: 17
        ]

        func makePlatform(position: Int, index: Int, ascending: Bool) -> PlatformData {
            let platformBottomOffsets: [CGFloat] = ascending ? [-60, 0, 60] : [60, 0, -60]
            let avatarBottomOffsets: [CGFloat] = ascending ? [0, 60, 120] : [120, 60, 0]
            let monster = monsterByPosition[position] ?? 0
            let treasure = treasureByPosition[position] ?? 0

            return PlatformData(
                imageName: DungeonTheme.platformImageName(for: position),
                position: position,
                padding: EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: platformBottomOffsets[index],
                    trailing: 0
                ),
                padding1: EdgeInsets(
                    top: 0,
                    leading: 0,
                    bottom: avatarBottomOffsets[index],
                    trailing: 0
                ),
                paddingMonster: monster == 0
                    ? nil
                    : EdgeInsets(top: -110, leading: 0, bottom: 0, trailing: 0),
                paddingTreasure: treasure == 0
                    ? nil
                    : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
                treasure: treasure,
                monster: monster
            )
        }

        var rows: [[PlatformData]] = [
            [
                PlatformData(
                    imageName: DungeonTheme.platformImageName(for: 100),
                    position: 100,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: -60, trailing: 0),
                    padding1: nil,
                    boss: 150
                )
            ]
        ]

        var rowTop = 99
        while rowTop >= 57 {
            let ascendingPositions = Array((rowTop - 2)...rowTop)
            rows.append(
                ascendingPositions.enumerated().map { index, position in
                    makePlatform(position: position, index: index, ascending: true)
                }
            )

            let descendingPositions = Array(
                stride(from: rowTop - 3, through: max(rowTop - 5, 53), by: -1)
            )
            rows.append(
                descendingPositions.enumerated().map { index, position in
                    makePlatform(position: position, index: index, ascending: false)
                }
            )
            rowTop -= 6
        }

        return rows
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                // 外側のForEachをインデックスで回す
                ForEach(platformDatas.indices, id: \.self) { index in
                    let platformSet = platformDatas[index]
                    HStack(spacing: 30) {
                        // 内側のForEachはPlatformDataがIdentifiableなのでid不要
                        ForEach(platformSet) { platformData in
                            ZStack{
                                PlatformView(
                                    imageName: platformData.imageName,
                                    position: platformData.position,
                                    padding: platformData.padding ?? EdgeInsets(),
                                    padding1: platformData.padding1 ?? EdgeInsets(),
                                    paddingMonster: platformData.paddingMonster ?? EdgeInsets(),
                                    paddingTreasure: platformData.paddingTreasure ?? EdgeInsets(),
                                    userPosition: viewModel.userPosition,
                                    onArrowTap: (platformData.position == viewModel.userPosition + 1) ? { viewModel.incrementPosition() } : nil,
                                    namespace: namespace,
                                    treasure: platformData.treasure ?? 0,
                                    monster: platformData.monster ?? 0,
                                    boss: platformData.boss ?? 0,
                                    viewModel: viewModel
                                )
                                .id(platformData.position)
                            }
                        }
                    }
                    .id("dungeon-row-\(index)")
                }
            }
        }
    }
}

// PlatformView の定義
struct PlatformView: View {
    let imageName: String
    let position: Int
    let padding: EdgeInsets
    let padding1: EdgeInsets?
    let paddingMonster: EdgeInsets?
    let paddingTreasure: EdgeInsets?
    let userPosition: Int
    let onArrowTap: (() -> Void)?
    let treasure: Int?
    let monster: Int?
    let boss: Int?
    let namespace: Namespace.ID
    @State private var isMovingUp = false
    @State private var isPulsing = false
    @State private var avatarName: String = ""
    @State private var showStaminaAlert: Bool = false
    @State private var isPresentingQuizStory = false
    @ObservedObject var viewModel: PositionViewModel
    @State private var monsterName: String = ""
    @State private var backgroundName: String = ""
    @State private var quizStoryData: QuizStoryData? = nil
    @State private var coin: Int = 1
    private var audioManager = AudioManager.shared
    
    private var targetFloor: Int {
        DungeonTheme.clampedFloor(viewModel.selectedBattleFloor ?? (viewModel.userPosition + 1))
    }

    private var battleBackgroundName: String {
        DungeonTheme.battleBackgroundName(for: targetFloor)
    }

    private var isBossFloor: Bool {
        position == 52 || position == 100
    }

    private var platformContentYOffset: CGFloat {
        (padding.top - padding.bottom) / 2
    }

    /// The crystal tips extend above the circular surface where occupants stand.
    private var platformSurfaceInset: CGFloat {
        18
    }

    /// Upper-floor monsters use 1024px images with different transparent margins.
    /// Align each visible bottom edge with the top surface of its own platform.
    private var upperFloorMonsterYOffset: CGFloat {
        guard let monster, monster >= 17 else { return 0 }

        let imageBaselineOffset: CGFloat

        switch monster {
        case 17: imageBaselineOffset = -50
        case 18: imageBaselineOffset = -47
        case 19: imageBaselineOffset = -48
        case 20: imageBaselineOffset = -46
        case 21: imageBaselineOffset = -45
        case 22: imageBaselineOffset = -43
        case 23: imageBaselineOffset = -51
        case 24: imageBaselineOffset = -49
        case 25: imageBaselineOffset = -48
        case 26: imageBaselineOffset = -53
        case 27: imageBaselineOffset = -44
        case 28: imageBaselineOffset = -48
        case 29: imageBaselineOffset = -43
        case 30: imageBaselineOffset = -51
        case 31: imageBaselineOffset = -61
        case 32: imageBaselineOffset = -52
        default: imageBaselineOffset = -48
        }

        return platformContentYOffset + imageBaselineOffset + platformSurfaceInset
    }

    /// Upper-floor treasure images also have different transparent margins.
    /// Keep their visible bottom edges on the same platform surface as monsters.
    private var upperFloorTreasureYOffset: CGFloat {
        guard let treasure, treasure >= 13 else { return 0 }

        let imageBaselineOffset: CGFloat

        switch treasure {
        case 13: imageBaselineOffset = -48
        case 14: imageBaselineOffset = -48
        case 15: imageBaselineOffset = -55
        case 16: imageBaselineOffset = -49
        case 17: imageBaselineOffset = -54
        default: imageBaselineOffset = -60
        }

        return platformContentYOffset + imageBaselineOffset + platformSurfaceInset
    }
    
    init(imageName: String, position: Int, padding: EdgeInsets = EdgeInsets(), padding1: EdgeInsets? = nil, paddingMonster: EdgeInsets? = nil, paddingTreasure: EdgeInsets? = nil, userPosition: Int, onArrowTap: (() -> Void)? = nil, namespace: Namespace.ID, treasure: Int? = 0, monster: Int? = 0, boss: Int? = 0, viewModel: PositionViewModel) {
        self.imageName = imageName
        self.position = position
        self.padding = padding
        self.padding1 = padding1
        self.paddingMonster = paddingMonster
        self.paddingTreasure = paddingTreasure
        self.userPosition = userPosition
        self.onArrowTap = onArrowTap
        self.namespace = namespace
        self.treasure = treasure
        self.monster = monster
        self.boss = boss
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            // プラットフォーム画像
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: isBossFloor ? 350 : 80)
                .padding(padding)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: ViewOffsetKey.self, value: [position: geometry.frame(in: .global).midY])
                    }
                )
//                .onTapGesture {
//                    self.triggerHaptic()
//                    if viewModel.stamina >= 10 {
//                        if let treasure = treasure, treasure != 0 {
//                            audioManager.playTittleSound()
//                            viewModel.coin = treasure
//                            viewModel.showCoinAlert = true
//                            onArrowTap?()
//                        }
//                        if let boss = boss, boss != 0 {
//                            audioManager.playSound()
//                            let data = QuizStoryData(monsterName: "ボス\(boss)", backgroundName: "ダンジョン背景1")
//                            viewModel.monsterName = "ボス\(boss)"
//                            viewModel.monster = boss
//                            viewModel.showMonsterAlert = true
//                        }
//                        if let monster = monster, monster != 0 {
//                            audioManager.playSound()
//                            let data = QuizStoryData(monsterName: "モンスター\(monster)", backgroundName: "ダンジョン背景1")
////                                quizStoryData = data
//                            viewModel.monsterName = "モンスター\(monster)"
//                            viewModel.monster = monster
//                            viewModel.showMonsterAlert = true
//                        }
//                        if let monster = monster, monster == 0, let boss = boss, boss == 0 {
//                            onArrowTap?()
//                        }
//                    } else {
//                        viewModel.showStaminaAlert = true
//                    }
//                }
            
            // アバター表示
            if position == userPosition {
                Image("\(viewModel.avatarName)")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, -45)
                    .padding(padding1 ?? EdgeInsets())
                    .offset(y: isMovingUp ? -3 : 3)
                    .id(StoryDungeonScrollTarget.currentPosition(position))
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            isMovingUp.toggle()
                        }
                    }
            } else {
            }
            
            // 宝箱表示
            if let treasure = treasure, treasure != 0 && userPosition < position {
                Image("宝箱\(treasure)")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(treasure >= 13 ? EdgeInsets() : (paddingTreasure ?? EdgeInsets()))
                    .offset(y: treasure >= 13 ? upperFloorTreasureYOffset : 0)
                    .onTapGesture {
                        if viewModel.hasEnoughStamina(for: 10) {
                            if position == userPosition + 1 {
                                self.triggerHaptic()
                                audioManager.playTittleSound()
                                viewModel.coin = treasure
                                viewModel.showCoinAlert = true
                                onArrowTap?()
                            }
                        } else {
                            viewModel.showStaminaAlert = true
                        }
                    }
            } else {
            }
            
            // モンスター表示
            if let monster = monster, monster != 0 && userPosition < position {
                    Image("モンスター\(monster)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .padding(monster >= 17 ? EdgeInsets() : (paddingMonster ?? EdgeInsets()))
                        .offset(y: monster >= 17 ? upperFloorMonsterYOffset : 0)
                        .onTapGesture {
                            if position == userPosition + 1 {
                                self.triggerHaptic()
                                audioManager.playSound()
                                if viewModel.hasEnoughStamina(for: 10) {
                                    viewModel.selectedBattleFloor = position
                                    let data = QuizStoryData(monsterName: "モンスター\(monster)", backgroundName: battleBackgroundName)
                                    quizStoryData = data
                                    viewModel.monsterName = "モンスター\(monster)"
                                    viewModel.monster = monster
                                    viewModel.showMonsterAlert = true
                                } else {
                                    viewModel.showStaminaAlert = true
                                }
                            }
                        }
                } else if monster != 0 {
                }
            
            // ボス表示
            if let boss = boss, boss != 0 && userPosition < position {
                Image("ボス\(boss)")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 10)
                    .frame(width: boss == 150 ? 260 : 200)
                    .padding(.top, boss == 150 ? -80 : -30)
                    .padding(.leading, boss == 150 ? 0 : 40)
                    .onTapGesture {
                        if position == userPosition + 1 {
                            self.triggerHaptic()
                            audioManager.playSound()
                            if viewModel.hasEnoughStamina(for: 10) {
                                viewModel.selectedBattleFloor = position
                                viewModel.monsterName = "ボス\(boss)"
                                viewModel.monster = boss
                                viewModel.showMonsterAlert = true
                            } else {
                                viewModel.showStaminaAlert = true
                            }
                        }
                    }
            } else if boss != 0 {
            }
            
            // 下矢印表示
            if position == userPosition + 1 {
                Image("下矢印")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(padding1 ?? EdgeInsets())
                    .scaleEffect(isPulsing ? 1.4 : 1.0)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .preference(key: DownArrowPositionKey.self, value: CGPoint(
                                    x: geometry.frame(in: .named("StoryViewCoordinateSpace")).midX,
                                    y: geometry.frame(in: .named("StoryViewCoordinateSpace")).midY
                                ))
                        }
                    )
                    .padding(.top, -30)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                            isPulsing.toggle()
                        }
                    }
                    .onTapGesture {
                        if viewModel.hasEnoughStamina(for: 10) {
                            if let treasure = treasure, treasure != 0 {
                                audioManager.playTittleSound()
                                viewModel.coin = treasure
                                viewModel.showCoinAlert = true
                                onArrowTap?()
                            }
                            if let boss = boss, boss != 0 {
                                audioManager.playSound()
                                viewModel.selectedBattleFloor = position
                                viewModel.monsterName = "ボス\(boss)"
                                viewModel.monster = boss
                                viewModel.showMonsterAlert = true
                            }
                            if let monster = monster, monster != 0 {
                                audioManager.playSound()
                                viewModel.selectedBattleFloor = position
                                viewModel.monsterName = "モンスター\(monster)"
                                viewModel.monster = monster
                                viewModel.showMonsterAlert = true
                            }
                            if let monster = monster, monster == 0, let boss = boss, boss == 0 {
                                if let treasure = treasure, treasure == 0 {
                                    audioManager.playSound()
                                }
                                self.triggerHaptic()
                                onArrowTap?()
                            }
                        } else {
                            viewModel.showStaminaAlert = true
                        }
                    }
            } else {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 50, height: 50)
                    .padding(.top, -30)
                    .padding(padding1 ?? EdgeInsets())
            }
            
//            Text("\(position)")
//                .font(.system(size: 50))
        }
        .fullScreenCover(isPresented: $viewModel.showMonsterQuizList) {
            switch DungeonQuizSubject.subject(for: targetFloor) {
            case .math:
                StorySansuListView(
                    isPresenting: $viewModel.showMonsterQuizList,
                    monsterName: viewModel.monsterName,
                    backgroundName: battleBackgroundName,
                    viewModel: viewModel
                )
            case .japanese:
                StoryKokugoListView(
                    isPresenting: $viewModel.showMonsterQuizList,
                    monsterName: viewModel.monsterName,
                    backgroundName: battleBackgroundName,
                    viewModel: viewModel
                )
            case .science:
                StoryRikaListView(
                    isPresenting: $viewModel.showMonsterQuizList,
                    monsterName: viewModel.monsterName,
                    backgroundName: battleBackgroundName,
                    viewModel: viewModel
                )
            case .socialStudies:
                StoryShakaiListView(
                    isPresenting: $viewModel.showMonsterQuizList,
                    monsterName: viewModel.monsterName,
                    backgroundName: battleBackgroundName,
                    viewModel: viewModel
                )
            }
        }
    }
    func triggerHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}

// EdgeInsets の拡張
extension EdgeInsets {
    static func leading(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: value, bottom: 0, trailing: 0)
    }
    
    static func bottom(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: value, trailing: 0)
    }
    
    static func trailing(_ value: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: value)
    }
    
    static func bottom(_ value: CGFloat, trailing: CGFloat) -> EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: value, trailing: trailing)
    }
}

// プレビューの定義
struct StoryViewView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(isReturnActive: .constant(true), isPresented: .constant(false))
    }
}
