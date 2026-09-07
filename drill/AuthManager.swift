//
//  AuthManager.swift
//  BuildApp
//
//  Created by hashimo ryoya on 2023/04/29.
//

import SwiftUI
import Firebase
import FirebaseAuth

enum InventoryItemType: String, Codable, CaseIterable {
    case normalGachaTicket
    case rareGachaTicket
    case mekaGachaTicket
    case godGachaTicket
    case constellationGachaTicket
    case staminaPotion
    case boostTicket

    var displayName: String {
        switch self {
        case .normalGachaTicket:
            return "レギュラーガチャチケット"
        case .rareGachaTicket:
            return "幸福ガチャチケット"
        case .mekaGachaTicket:
            return "メカガチャチケット"
        case .godGachaTicket:
            return "神ガチャチケット"
        case .constellationGachaTicket:
            return "星座ガチャチケット"
        case .staminaPotion:
            return "スタミナ回復薬"
        case .boostTicket:
            return "ブースト薬"
        }
    }

    var shortName: String {
        switch self {
        case .normalGachaTicket:
            return "レギュラー"
        case .rareGachaTicket:
            return "幸福"
        case .mekaGachaTicket:
            return "メカ"
        case .godGachaTicket:
            return "神"
        case .constellationGachaTicket:
            return "星座"
        case .staminaPotion:
            return "回復薬"
        case .boostTicket:
            return "ブースト薬"
        }
    }

    var systemImageName: String {
        switch self {
        case .normalGachaTicket:
            return "ticket.fill"
        case .rareGachaTicket:
            return "giftcard.fill"
        case .mekaGachaTicket:
            return "cpu.fill"
        case .godGachaTicket:
            return "sparkles.rectangle.stack.fill"
        case .constellationGachaTicket:
            return "moon.stars.fill"
        case .staminaPotion:
            return "cross.case.fill"
        case .boostTicket:
            return "bolt.circle.fill"
        }
    }

    var assetImageName: String? {
        switch self {
        case .staminaPotion:
            return "スタミナ回復薬"
        case .boostTicket:
            return "ブースト薬"
        default:
            return nil
        }
    }

    var accentColor: Color {
        switch self {
        case .normalGachaTicket:
            return Color(red: 1.0, green: 0.72, blue: 0.24)
        case .rareGachaTicket:
            return Color(red: 1.0, green: 0.42, blue: 0.36)
        case .mekaGachaTicket:
            return Color(red: 0.43, green: 0.49, blue: 0.92)
        case .godGachaTicket:
            return Color(red: 1.0, green: 0.84, blue: 0.22)
        case .constellationGachaTicket:
            return Color(hex: "6A2CFF")
        case .staminaPotion:
            return Color(red: 0.24, green: 0.74, blue: 0.48)
        case .boostTicket:
            return Color(red: 1.0, green: 0.45, blue: 0.24)
        }
    }

    var userFieldKey: String {
        rawValue
    }
}

struct InventoryReward: Codable, Hashable {
    let type: InventoryItemType
    let amount: Int

    var displayText: String {
        "\(type.displayName) x\(amount)"
    }
}

extension InventoryReward {
    static func merged(_ rewards: [InventoryReward]) -> [InventoryReward] {
        let totals = rewards.reduce(into: [InventoryItemType: Int]()) { partialResult, reward in
            partialResult[reward.type, default: 0] += reward.amount
        }

        return InventoryItemType.allCases.compactMap { type in
            guard let amount = totals[type], amount > 0 else { return nil }
            return InventoryReward(type: type, amount: amount)
        }
    }
}

struct InventoryItemArtworkView: View {
    let type: InventoryItemType
    let width: CGFloat
    let height: CGFloat
    var cornerRadius: CGFloat = 12

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(type.accentColor.opacity(0.12))

            if let assetImageName = type.assetImageName {
                Image(assetImageName)
                    .resizable()
                    .scaledToFit()
                    .padding(6)
            } else {
                Image(systemName: type.systemImageName)
                    .font(.system(size: min(width, height) * 0.42, weight: .bold))
                    .foregroundColor(type.accentColor)
            }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(type.accentColor.opacity(0.25), lineWidth: 1)
        )
    }
}

enum QuizLevel: CaseIterable {
    case beginner
    case beginnerStory1
    case beginnerStory2
    case beginnerStory3
    case intermediate
    case advanced
    case network
    case security
    case database
    case daily
    case god
    case incorrectAnswer
    case incorrectITAnswer
    case incorrectInfoAnswer
    case incorrectAppliedAnswer
    case incorrectESAnswer
    case incorrectITStrategyAnswer
    case timeBeginner
    case timeIntermediate
    case timeAdvanced
    case itBasic
    case infoBasic
    case appliedBasic
    case itStrategy
    case infoStrategy
    case appliedStrategy
    case itTechnology
    case infoTechnology
    case appliedTechnology
    case itManagement
    case infoManagement
    case appliedManagement
    case mugen
    case computerSystem
    case softHard
    case netwarkTusin
    case ESsecurity
    case kikaku
    case sekkei
    case kaihatu
    case unyouhoshu
    case sansu1
    case sansu2
    case sansu3
    case sansu4
    case sansu5
    case sansu6
    case shakai1
    case shakai2
    case shakai3
    case shakai4
    case shakai5
    case shakai6
    case rika1
    case rika2
    case rika3
    case rika4
    case rika5
    case rika6
    case kokugo1
    case kokugo2
    case kokugo3
    case kokugo4
    case kokugo5
    case kokugo6
    case incorrectSansuAnswer
    case incorrectShakaiAnswer
    case incorrectRikaAnswer
    case incorrectKokugoAnswer
    
    var description: String {
        switch self {
        case .sansu1:
            return "sansu1"
        case .sansu2:
            return "sansu2"
        case .sansu3:
            return "sansu3"
        case .sansu4:
            return "sansu4"
        case .sansu5:
            return "sansu5"
        case .sansu6:
            return "sansu6"
        case .shakai1:
            return "shakai1"
        case .shakai2:
            return "shakai2"
        case .shakai3:
            return "shakai3"
        case .shakai4:
            return "shakai4"
        case .shakai5:
            return "shakai5"
        case .shakai6:
            return "shakai6"
        case .rika1:
            return "rika1"
        case .rika2:
            return "rika2"
        case .rika3:
            return "rika3"
        case .rika4:
            return "rika4"
        case .rika5:
            return "rika5"
        case .rika6:
            return "rika6"
        case .kokugo1:
            return "kokugo1"
        case .kokugo2:
            return "kokugo2"
        case .kokugo3:
            return "kokugo3"
        case .kokugo4:
            return "kokugo4"
        case .kokugo5:
            return "kokugo5"
        case .kokugo6:
            return "kokugo6"
        case .beginner:
            return "beginner"
        case .intermediate:
            return "intermediate"
        case .advanced:
            return "advanced"
        case .network:
            return "network"
        case .security:
            return "security"
        case .database:
            return "database"
        case .daily:
            return "daily"
        case .god:
            return "god"
        case .incorrectAnswer:
            return "incorrectAnswer"
        case .timeBeginner:
            return "timeBeginner"
        case .timeIntermediate:
            return "timeIntermediate"
        case .timeAdvanced:
            return "timeAdvanced"
        case .beginnerStory1:
            return "beginnerStory1"
        case .beginnerStory2:
            return "beginnerStory2"
        case .beginnerStory3:
            return "beginnerStory3"
        case .itStrategy:
            return "itStrategy"
        case .infoStrategy:
            return "infoStrategy"
        case .appliedStrategy:
            return "appliedStrategy"
        case .itTechnology:
            return "itTechnology"
        case .infoTechnology:
            return "infoTechnology"
        case .appliedTechnology:
            return "appliedTechnology"
        case .itManagement:
            return "itManagement"
        case .infoManagement:
            return "infoManagement"
        case .appliedManagement:
            return "appliedManagement"
        case .incorrectITAnswer:
            return "incorrectITAnswer"
        case .incorrectInfoAnswer:
            return "incorrectInfoAnswer"
        case .incorrectAppliedAnswer:
            return "incorrectAppliedAnswer"
        case .itBasic:
            return "itBasic"
        case .infoBasic:
            return "infoBasic"
        case .appliedBasic:
            return "appliedBasic"
        case .mugen:
            return "mugen"
        case .computerSystem:
            return "computerSystem"
        case .softHard:
            return "softHard"
        case .netwarkTusin:
            return "netwarkTusin"
        case .ESsecurity:
            return "ESsecurity"
        case .kikaku:
            return "kikaku"
        case .sekkei:
            return "sekkei"
        case .kaihatu:
            return "kaihatu"
        case .unyouhoshu:
            return "unyouhoshu"
        case .incorrectESAnswer:
            return "incorrectESAnswer"
        case .incorrectITStrategyAnswer:
            return "incorrectITStrategyAnswer"
        case .incorrectSansuAnswer:
            return "incorrectSansuAnswer"
        case .incorrectShakaiAnswer:
            return "incorrectShakaiAnswer"
        case .incorrectRikaAnswer:
            return "incorrectRikaAnswer"
        case .incorrectKokugoAnswer:
            return "incorrectKokugoAnswer"
        }
    }
}

struct Avatar: Equatable {
    var name: String
    var attack: Int
    var health: Int
    var usedFlag: Int
    var count: Int
}

class User: Identifiable {
    var id: String
    var userName: String
    var level: Int
    var experience: Int
    var avatars: [[String: Any]]
    var userMoney: Int
    var userHp: Int
    var userAttack: Int
    var userFlag: Int
    var adminFlag: Int
    var rankMatchPoint: Int
    var rank: Int
    var loginCount: Int

    init(id: String, userName: String, level: Int, experience: Int, avatars: [[String: Any]], userMoney: Int, userHp: Int, userAttack: Int, userFlag: Int, adminFlag: Int,rankMatchPoint: Int,rank: Int, loginCount: Int = 0) {
        self.id = id
        self.userName = userName
        self.level = level
        self.experience = experience
        self.avatars = avatars
        self.userMoney = userMoney
        self.userHp = userHp
        self.userAttack = userAttack
        self.userFlag = userFlag
        self.adminFlag = adminFlag
        self.rankMatchPoint = rankMatchPoint
        self.rank = rank
        self.loginCount = loginCount
    }
}

class AuthManager: ObservableObject {
    @Published var user: FirebaseAuth.User?
    @Published var experience: Int = 0
    @Published var rankMatchPoint: Int = 0
    @Published var rank: Int = 0
    @Published var level: Int = 1
    @Published var money: Int = 0
    @Published var userFlag: Int = 0
    @Published var userCsFlag: Int = 0
    @Published var adminFlag: Int = 0
    @Published var avatars: [Avatar] = []
    @Published var rankUp: Bool = false
    @Published var rankDown: Bool = false
    @Published var didLevelUp: Bool = false
    @Published var userAvatars: [Avatar] = []
    @Published var rewardFlag: Int = 1
    @Published var story: Int = 0
    @Published var userPreFlag: Int = 0
    @State private var selectedAvatar: Avatar?
    @Published var loginCount: Int = 0
    @Published var loginBonus: Int = 0
    @Published var userStoryCsFlag: Int = 0
    @Published var normalGachaTicketCount: Int = 0
    @Published var rareGachaTicketCount: Int = 0
    @Published var mekaGachaTicketCount: Int = 0
    @Published var godGachaTicketCount: Int = 0
    @Published var constellationGachaTicketCount: Int = 0
    @Published var staminaPotionCount: Int = 0
    @Published var boostTicketCount: Int = 0
    @Published var usedAvatars: [Avatar] = []
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    private let rewardBoostDuration: TimeInterval = 3600
    private let rewardBoostDateKey = "rewardAcquiredDate"
    private let rewardBoostActivatedAtKey = "rewardBoostActivatedAt"
    private var rewardBoostResetWorkItem: DispatchWorkItem?
    private let lightweightFetchCooldown: TimeInterval = 12
    private let loginCountFetchCooldown: TimeInterval = 20
    private let avatarFetchCooldown: TimeInterval = 20
    private var hasFetchedExperienceAndLevel = false
    private var lastExperienceFetchAt: Date?
    private var isFetchingExperienceAndLevel = false
    private var pendingExperienceFetchCompletions: [() -> Void] = []
    private var hasFetchedInventory = false
    private var lastInventoryFetchAt: Date?
    private var isFetchingInventory = false
    private var pendingInventoryFetchCompletions: [(Bool) -> Void] = []
    private var hasFetchedRewardFlag = false
    private var lastRewardFlagFetchAt: Date?
    private var isFetchingRewardFlag = false
    private var pendingRewardFlagFetchCompletions: [(Int) -> Void] = []
    private var hasFetchedLoginCount = false
    private var lastLoginCountFetchAt: Date?
    private var isFetchingLoginCount = false
    private var pendingLoginCountFetchCompletions: [(Int) -> Void] = []
    private var hasFetchedAvatars = false
    private var lastAvatarFetchAt: Date?
    private var isFetchingAvatars = false
    private var pendingAvatarFetchCompletions: [() -> Void] = []
    
    init() {
        user = Auth.auth().currentUser
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                let previousUserId = self?.user?.uid
                self?.user = user
                if previousUserId != user?.uid, user != nil {
                    self?.onLoginCompleted?()
                }
            }
        }
    }
    
    static let shared: AuthManager = {
        let instance = AuthManager()
        return instance
    }()
    
    var onLoginCompleted: (() -> Void)?
    var currentUserId: String? {
        return user?.uid
    }
    
    deinit {
        if let authStateListenerHandle {
            Auth.auth().removeStateDidChangeListener(authStateListenerHandle)
        }
    }
    
    func addAvatarToUser(avatar: Avatar, completion: @escaping (Bool) -> Void) {
        guard let userId = user?.uid else {
            completion(false) // user IDがnilの場合、失敗としてfalseを返す
            return
        }
        // ユーザーのアバターデータの参照を作成
        let avatarsRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("avatars")
        // すべてのアバターを取得
        avatarsRef.observeSingleEvent(of: .value) { (snapshot, error) in
            if let error = error {
                print("Error fetching avatars: \(error)")
                completion(false) // エラーが発生した場合、falseを返す
                return
            }
            
            var avatarExists = false
            var existingRef: DatabaseReference?
            // 各アバターをループして、新しいアバターが既存のものと一致するか確認
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let avatarData = childSnapshot.value as? [String: Any],
                   let name = avatarData["name"] as? String,
                   name == avatar.name {
                    avatarExists = true
                    existingRef = childSnapshot.ref
                    break
                }
            }

            if avatarExists, let existingRef = existingRef {
                existingRef.child("count").runTransactionBlock { currentData in
                    var count = currentData.value as? Int ?? 0
                    count += 1
                    currentData.value = count
                    return TransactionResult.success(withValue: currentData)
                } andCompletionBlock: { error, committed, _ in
                    DispatchQueue.main.async {
                        guard error == nil, committed else {
                            completion(false)
                            return
                        }
                        self.hasFetchedAvatars = false
                        self.lastAvatarFetchAt = nil
                        completion(true)
                    }
                }
            } else {
                // 新しいアバターをデータベースに追加
                let avatarRef = avatarsRef.childByAutoId()
                let avatarData: [String: Any] = [
                    "name": avatar.name,
                    "attack": avatar.attack,
                    "health": avatar.health,
                    "usedFlag": avatar.usedFlag,
                    "count": 1  // 初期カウント値を設定
                ]
                avatarRef.setValue(avatarData) { (error, ref) in
                    if let error = error {
                        print("Failed to add avatar to database:", error.localizedDescription)
                        completion(false) // 保存に失敗した場合、falseを返す
                        return
                    }
                    print("Successfully added avatar to database.")
                    self.hasFetchedAvatars = false
                    self.lastAvatarFetchAt = nil
                    completion(true) // 保存に成功した場合、trueを返す
                }
            }
        }
    }

    /// ガチャの支払いとアバター付与を一つの transaction で確定する。
    /// coinCost == 0 かつ ticketType == nil は開発者モードなどの無料抽選。
    func commitGachaResult(
        avatar: Avatar,
        coinCost: Int = 0,
        ticketType: InventoryItemType? = nil,
        completion: @escaping (Bool) -> Void
    ) {
        guard coinCost >= 0, let userId = currentUserId else {
            completion(false)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        let newAvatarKey = userRef.child("avatars").childByAutoId().key ?? UUID().uuidString

        userRef.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.exists() else {
                DispatchQueue.main.async { completion(false) }
                return
            }

            userRef.runTransactionBlock { currentData in
                guard var userData = currentData.value as? [String: Any] else {
                    return TransactionResult.abort()
                }

                if coinCost > 0 {
                    let currentMoney = self.intValue(from: userData["userMoney"])
                    guard currentMoney >= coinCost else { return TransactionResult.abort() }
                    userData["userMoney"] = currentMoney - coinCost
                }

                if let ticketType {
                    let currentCount = self.intValue(from: userData[ticketType.userFieldKey])
                    guard currentCount > 0 else { return TransactionResult.abort() }
                    userData[ticketType.userFieldKey] = currentCount - 1
                }

                var avatars = userData["avatars"] as? [String: Any] ?? [:]
                if let existingEntry = avatars.first(where: { _, value in
                    (value as? [String: Any])?["name"] as? String == avatar.name
                }), var existingAvatar = existingEntry.value as? [String: Any] {
                    existingAvatar["count"] = self.intValue(from: existingAvatar["count"]) + 1
                    avatars[existingEntry.key] = existingAvatar
                } else {
                    avatars[newAvatarKey] = [
                        "name": avatar.name,
                        "attack": avatar.attack,
                        "health": avatar.health,
                        "usedFlag": avatar.usedFlag,
                        "count": 1
                    ]
                }
                userData["avatars"] = avatars
                currentData.value = userData
                return TransactionResult.success(withValue: currentData)
            } andCompletionBlock: { error, committed, snapshot in
                DispatchQueue.main.async {
                    guard error == nil,
                          committed,
                          let userData = snapshot?.value as? [String: Any] else {
                        completion(false)
                        return
                    }

                    self.money = self.intValue(from: userData["userMoney"])
                    if let ticketType {
                        self.setInventoryCount(self.intValue(from: userData[ticketType.userFieldKey]), for: ticketType)
                    }
                    self.hasFetchedAvatars = false
                    self.lastAvatarFetchAt = nil
                    completion(true)
                }
            }
        }, withCancel: { _ in
            DispatchQueue.main.async { completion(false) }
        })
    }
    
    func anonymousSignIn(completion: @escaping () -> Void) {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion()
                }
            } else if let result = result {
                print("Signed in anonymously with user ID: \(result.user.uid)")
                self.user = result.user
                self.onLoginCompleted?()
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
    
    func fetchUserStoryCsFlag() {
        guard let userId = user?.uid else { return }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
//                print("data:\(data)")
//                self.experience = data["experience"] as? Int ?? 0
                self.userStoryCsFlag = data["userStoryCsFlag"] as? Int ?? 0
            }
        }
    }
    
    func saveLastActiveTimeToFirebase(completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }

        let lastActiveRef = Database.database().reference()
            .child("storys")
            .child(userId)
            .child("lastActiveTime")
        
        let currentTime = Date().timeIntervalSince1970 // Unixタイムスタンプ

        lastActiveRef.setValue(currentTime) { error, _ in
            if let error = error {
                print("FirebaseへのlastActiveTimeの保存に失敗しました: \(error.localizedDescription)")
                completion(false)
            } else {
                print("FirebaseにlastActiveTimeを保存しました。時刻: \(currentTime)")
                completion(true)
            }
        }
    }
    
    func fetchLastActiveTimeFromFirebase(completion: @escaping (TimeInterval?) -> Void) {
        guard let userId = currentUserId else {
            completion(nil)
            return
        }

        let lastActiveRef = Database.database().reference()
            .child("storys")
            .child(userId)
            .child("lastActiveTime")

        lastActiveRef.observeSingleEvent(of: .value) { snapshot in
            if let lastActiveTimestamp = snapshot.value as? TimeInterval {
                print("FirebaseからlastActiveTimeを取得しました。時刻: \(lastActiveTimestamp)")
                completion(lastActiveTimestamp)
            } else {
                print("FirebaseからlastActiveTimeの取得に失敗しました。デフォルト値を使用します。")
                completion(nil)
            }
        }
    }
    
    func deleteUserAccount(completion: @escaping (Bool, Error?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.removeValue { error, _ in
            if let error = error {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }
    
    func fetchUserStory() {
        guard let userId = user?.uid else { return }

        let userRef = Database.database().reference().child("users").child(userId)
        userRef.child("story").observeSingleEvent(of: .value) { snapshot in
            if let story = snapshot.value as? Int {
                DispatchQueue.main.async {
                    self.story = story
                }
            }
        }
    }
    
    func updateStory(story: Int, completion: @escaping (Bool) -> Void) {
            guard let userId = user?.uid else {
                completion(false) // ユーザーIDがnilの場合は失敗
                return
            }

            let userRef = Database.database().reference().child("users").child(userId)
            userRef.child("story").setValue(story) { error, _ in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Failed to update story:", error.localizedDescription)
                        completion(false) // 更新に失敗した場合
                    } else {
                        print("Successfully updated story.")
                        self.story = story // AuthManagerのstoryプロパティを更新
                        completion(true) // 更新に成功した場合
                    }
                }
            }
        }
    
    func updateUserName(userName: String, completion: @escaping (Bool) -> Void) {
        guard let userId = user?.uid else {
            completion(false)
            return
        }
        
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["userName": userName]
        
        userRef.updateChildValues(updates) { error, _ in
            if let error = error {
                print("Failed to update userName: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Successfully updated userName.")
                completion(true)
            }
        }
    }
    
    func saveUserToDatabase(userName: String, completion: @escaping (Bool) -> Void) {
        guard let userId = user?.uid else {
            print("saveUserToDatabase")
            completion(false)
            return
        }

        // ユーザーのリファレンスを作成
        let userRef = Database.database().reference().child("users").child(userId)
        
        // 選択されたアバターの作成
        let selectedAvatar = Avatar(name: self.selectedAvatar?.name ?? "えんぴ君", attack: 20, health: 20, usedFlag: 1, count: 1)
        
        // ユーザーデータを設定（アバターデータは後で設定）
        let userData: [String: Any] = [
            "userName": userName,
            "userMoney": 300,
            "userHp": 100,
            "userAttack": 20,
            "tutorialNum": 0,
            "userFlag": 0,
            "loginCount": 0,
            InventoryItemType.normalGachaTicket.userFieldKey: 0,
            InventoryItemType.rareGachaTicket.userFieldKey: 0,
            InventoryItemType.mekaGachaTicket.userFieldKey: 0,
            InventoryItemType.godGachaTicket.userFieldKey: 0,
            InventoryItemType.constellationGachaTicket.userFieldKey: 0,
            InventoryItemType.staminaPotion.userFieldKey: 0,
            InventoryItemType.boostTicket.userFieldKey: 0
        ]

        // ユーザーデータを保存
        userRef.setValue(userData) { (error, ref) in
            if let error = error {
                print("Failed to save user to database:", error.localizedDescription)
                completion(false)
                return
            }
            print("Successfully saved user to database.")
            
            // アバターデータを保存
            let avatarRef = userRef.child("avatars").childByAutoId()
            let avatarData: [String: Any] = [
                "name": selectedAvatar.name,
                "attack": selectedAvatar.attack,
                "health": selectedAvatar.health,
                "usedFlag": selectedAvatar.usedFlag,
                "count": selectedAvatar.count
            ]
            
            avatarRef.setValue(avatarData) { (error, ref) in
                if let error = error {
                    print("Failed to save avatar to database:", error.localizedDescription)
                    completion(false)
                    return
                }
                print("Successfully saved avatar to database.")
                completion(true)
            }
        }
    }

    func fetchUserInfo(completion: @escaping (String?, [[String: Any]]?, Int?, Int?, Int?, Int?) -> Void) {
        guard let userId = user?.uid else {
            completion(nil, nil, nil, nil, nil, nil)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { snapshot in
            guard
                let data = snapshot.value as? [String: Any],
                let userName = data["userName"] as? String,
                let avatarsData = data["avatars"] as? [String: [String: Any]],
                let userMoney = data["userMoney"] as? Int,
                let userHp = data["userHp"] as? Int,
                let userAttack = data["userAttack"] as? Int,
                let tutorialNum = data["tutorialNum"] as? Int
            else {
                DispatchQueue.main.async {
                    completion(nil, nil, nil, nil, nil, nil)
                }
                return
            }

            let filteredAvatars = avatarsData.values.filter { $0["usedFlag"] as? Int == 1 }

            DispatchQueue.main.async {
                completion(userName, filteredAvatars, userMoney, userHp, userAttack, tutorialNum)
            }
        }
    }
    
    func fetchCurrentUserAdminFlag() {
        guard let userId = user?.uid else {
            print("User is not logged in")
            return
        }
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self = self, let data = snapshot.value as? [String: Any], let adminFlag = data["adminFlag"] as? Int else {
                print("Failed to fetch user data or adminFlag is missing")
                return
            }
            DispatchQueue.main.async {
                self.adminFlag = adminFlag
                print("Updated adminFlag to \(adminFlag)")
            }
        })
    }


    func updateTutorialNum(userId: String, tutorialNum: Int, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["tutorialNum": tutorialNum]
        userRef.updateChildValues(updates) { (error, _) in
            if let error = error {
                print("Error updating tutorialNum: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func updateUserFlag(userId: String, userFlag: Int, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["userFlag": userFlag]
        userRef.updateChildValues(updates) { (error, _) in
            if let error = error {
                print("Error updating tutorialNum: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func updateUserCsFlag(userId: String, userCsFlag: Int, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["userCsFlag": userCsFlag]
        print(updates)
        userRef.updateChildValues(updates) { (error, _) in
            if let error = error {
                print("Error updating tutorialNum: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func updatePreFlag(userId: String, userPreFlag: Int, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["userPreFlag": userPreFlag]
        userRef.updateChildValues(updates) { (error, _) in
            if let error = error {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func fetchPreFlag(completion: ((Int) -> Void)? = nil) {
        guard let userId = user?.uid else {
            completion?(0)
            return
        }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                self.userPreFlag = data["userPreFlag"] as? Int ?? 0
            }
            DispatchQueue.main.async {
                completion?(self.userPreFlag)
            }
        }
    }
    
    func updateContact(userId: String, newContact: String, completion: @escaping (Bool) -> Void) {
        // contactテーブルの下の指定されたuserIdの参照を取得
        let contactRef = Database.database().reference().child("contacts").child(userId)
        
        // まず現在のcontactの値を読み取る
        contactRef.observeSingleEvent(of: .value, with: { snapshot in
            // 既存の問い合わせ内容を保持する変数を準備
            var contacts: [String] = []
            
            // 現在の問い合わせ内容がある場合、それを読み込む
            if let currentContacts = snapshot.value as? [String] {
                contacts = currentContacts
            }
            
            // 新しい問い合わせ内容をリストに追加
            contacts.append(newContact)
            
            // データベースを更新する
            contactRef.setValue(contacts, withCompletionBlock: { error, _ in
                if let error = error {
                    print("Error updating contact: \(error)")
                    completion(false)
                } else {
                    completion(true)
                }
            })
        }) { error in
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    func fetchAvatars(force: Bool = false, completion: @escaping () -> Void) {
        guard let userId = user?.uid else {
            completion()
            return
        }

        if !force, shouldUseCachedFetch(lastFetchedAt: lastAvatarFetchAt, hasFetched: hasFetchedAvatars, cooldown: avatarFetchCooldown) {
            completion()
            return
        }

        pendingAvatarFetchCompletions.append(completion)
        if isFetchingAvatars {
            return
        }

        isFetchingAvatars = true
        let userRef = Database.database().reference().child("users").child(userId).child("avatars")
        userRef.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            var newAvatars: [Avatar] = []
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let avatarData = childSnapshot.value as? [String: Any],
                   let name = avatarData["name"] as? String,
                   let attack = avatarData["attack"] as? Int,
                   let health = avatarData["health"] as? Int,
                   let usedFlag = avatarData["usedFlag"] as? Int,
                   let count = avatarData["count"] as? Int {
                    let avatar = Avatar(name: name, attack: attack, health: health, usedFlag: usedFlag, count: count)
                    newAvatars.append(avatar)
                }
            }
            DispatchQueue.main.async {
                self.avatars = newAvatars
                self.hasFetchedAvatars = true
                self.lastAvatarFetchAt = Date()
                self.finishAvatarFetch()
            }
        }
    }
    
    func updateUsedFlag(for avatar: Avatar, to newValue: Int) -> Avatar {
        return Avatar(name: avatar.name, attack: avatar.attack, health: avatar.health, usedFlag: newValue, count: avatar.count)
    }
    
    func switchAvatar(to newAvatar: Avatar, completion: @escaping (Bool) -> Void) {
        guard let userId = user?.uid else {
            completion(false) // user IDがnilなので、失敗としてfalseを返します。
            return
        }
        
        let avatarsRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("avatars")
        
        avatarsRef.observeSingleEvent(of: .value) { snapshot in
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot else { continue }
                let avatarKey = childSnapshot.key
                let avatarRef = avatarsRef.child(avatarKey)
                avatarRef.updateChildValues(["usedFlag": 0])
            }
            
            if let avatarKey = snapshot.children.allObjects.first(where: { (child) -> Bool in
                guard let childSnapshot = child as? DataSnapshot,
                      let avatarData = childSnapshot.value as? [String: Any],
                      let name = avatarData["name"] as? String else { return false }
                return name == newAvatar.name
            }) as? DataSnapshot {
                let avatarRef = avatarsRef.child(avatarKey.key)
                avatarRef.updateChildValues(["usedFlag": 1]) { (error, ref) in
                    if let error = error {
                        print("Failed to update avatar: \(error.localizedDescription)")
                        completion(false) // 更新に失敗したので、falseを返します。
                    } else {
                        print("Successfully updated avatar.")
                        self.hasFetchedAvatars = false
                        self.lastAvatarFetchAt = nil
                        self.fetchAvatars(force: true) {
                            completion(true) // 更新に成功したので、trueを返します。
                        }
                    }
                }
            } else {
                completion(false) // 新しいアバターが見つからなかったので、falseを返します。
            }
        }
    }

    
//    func addExperience(points: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (Error?) -> Void) {
//        guard let userId = user?.uid else {
//            onFailure(nil)
//            return
//        }
//        let userRef = Database.database().reference().child("users").child(userId)
//        userRef.observeSingleEvent(of: .value) { (snapshot) in
//
//            if let data = snapshot.value as? [String: Any] {
//                let currentExperience = data["experience"] as? Int ?? 0
//                var newExperience = currentExperience + points
//
//                while newExperience >= self.level * 100 {
//                    newExperience -= self.level * 100
//                    print("self.level1:\(self.level)")
//                    self.level += 1
//                    print("self.level2:\(self.level)")
//                    self.didLevelUp = true
//                    self.updateStatsUponLevelUp()
//                }
//
//                self.experience = newExperience
//
//                let userData: [String: Any] = ["experience": self.experience, "level": self.level]
//                print("userData")
//                print(userData)
//                userRef.updateChildValues(userData) { (error, ref) in
//                    if error == nil {
//                        self.saveEarnedTitles()
//                        onSuccess()  // 成功時のコールバックを呼ぶ
//                    } else {
//                        onFailure(error)  // エラー時のコールバックを呼ぶ
//                    }
//                }
//            }
//        }
//    }
    
//    func addExperience(points: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (Error?) -> Void) {
//        guard let userId = user?.uid else {
//            onFailure(nil)
//            return
//        }
//
//        let userRef = Database.database().reference().child("users").child(userId)
//        userRef.observeSingleEvent(of: .value) { (snapshot, errorString) in
//            if let errorString = errorString {
//                // Handle the error here
//                onFailure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorString]))
//                return
//            }
//            if let data = snapshot.value as? [String: Any] {
//                var currentExperience = data["experience"] as? Int ?? 0
//                var currentLevel = data["level"] as? Int ?? 1
//
//                currentExperience += points
//
//                while currentExperience >= currentLevel * 100 {
//                    currentExperience -= currentLevel * 100
//                    currentLevel += 1
//                    self.didLevelUp = true
//                    self.updateStatsUponLevelUp()
//                }
//
//                let updatedData: [String: Any] = ["experience": currentExperience, "level": currentLevel]
//                userRef.updateChildValues(updatedData) { (error, ref) in
//                    if let error = error {
//                        onFailure(error)
//                    } else {
//                        self.experience = currentExperience
//                        self.level = currentLevel
////                        self.saveEarnedTitles()
//                        onSuccess()
//                    }
//                }
//            } else {
//                onFailure(nil)
//            }
//        }
//    }
    
    func addRankMatchPoints(for userId: String, points: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (Error?) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                // 現在のrankMatchPointとrankを取得、またはデフォルト値として100と1を設定
                var currentRankMatchPoints = data["rankMatchPoint"] as? Int ?? 100
                var currentRank = data["rank"] as? Int ?? 1
                
                // 100の位が変わるかどうかをチェック
                let previousHundred = currentRankMatchPoints / 100
                currentRankMatchPoints += points
                let newHundred = currentRankMatchPoints / 100

                if newHundred > previousHundred {
                    // 100の位が増加した場合、rankをインクリメント
                    currentRank += 1
                    self.rankUp = true
                }

                // 更新されたデータでデータベースを更新
                let updatedData: [String: Any] = ["rankMatchPoint": currentRankMatchPoints, "rank": currentRank]
                userRef.updateChildValues(updatedData) { (error, ref) in
                    if let error = error {
                        onFailure(error)
                    } else {
                        onSuccess()
                    }
                }
            } else {
                onFailure(nil)
            }
        }
    }

    
    func subtractRankMatchPoints(for userId: String, points: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (Error?) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                // 現在のrankMatchPointとrankを取得、またはデフォルト値として100と1を設定
                var currentRankMatchPoints = data["rankMatchPoint"] as? Int ?? 100
                var currentRank = data["rank"] as? Int ?? 1

                // 100の位が変わるかどうかをチェック
                let previousHundred = currentRankMatchPoints / 100
                currentRankMatchPoints -= points // ポイントを減算
                let newHundred = currentRankMatchPoints / 100

                if newHundred < previousHundred {
                    // 100の位が減少した場合、rankをデクリメント（ただし、rankが1より小さくならないようにする）
                    currentRank = max(currentRank - 1, 1)
                    self.rankDown = true
                }

                // 更新されたデータでデータベースを更新
                let updatedData: [String: Any] = ["rankMatchPoint": currentRankMatchPoints, "rank": currentRank]
                userRef.updateChildValues(updatedData) { (error, _) in
                    if let error = error {
                        onFailure(error)
                    } else {
                        onSuccess()
                    }
                }
            } else {
                onFailure(nil)
            }
        }
    }

    
    func addExperience(points: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (Error?) -> Void) {
        guard let userId = user?.uid else {
            onFailure(nil)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot, errorString) in
            if let errorString = errorString {
                onFailure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorString]))
                return
            }
            if let data = snapshot.value as? [String: Any] {
                var currentExperience = data["experience"] as? Int ?? 0
                var currentLevel = data["level"] as? Int ?? 1

                currentExperience += points
                GuildManager.shared.recordExperience(points)

                while currentExperience >= currentLevel * 100 {
                    currentExperience -= currentLevel * 100
                    currentLevel += 1
                    self.didLevelUp = true
                    self.updateStatsUponLevelUp()

                    if currentLevel == 3 {
                        // レベル3に達した場合、称号を保存
                        self.saveTitleForUser(userId: userId, title: "レベル３")
                    } else if currentLevel == 5 {
                        self.saveTitleForUser(userId: userId, title: "レベル５")
                    } else if currentLevel == 10 {
                        self.saveTitleForUser(userId: userId, title: "レベル10")
                    }
                }

                let updatedData: [String: Any] = ["experience": currentExperience, "level": currentLevel]
                userRef.updateChildValues(updatedData) { (error, ref) in
                    if let error = error {
                        onFailure(error)
                    } else {
                        self.experience = currentExperience
                        self.level = currentLevel
                        onSuccess()
                    }
                }
            } else {
                onFailure(nil)
            }
        }
    }
    
    func checkTitles(userId: String, title: String, completion: @escaping (Bool) -> Void) {
        let titlesRef = Database.database().reference().child("titles").child(userId)

        titlesRef.observeSingleEvent(of: .value, with: { snapshot in
            if let titlesData = snapshot.value as? [String: Bool] {
                // 指定された称号が存在するかチェックし、その結果を返す
                completion(titlesData[title] ?? false)
            } else {
                // `titles` データが存在しない場合は false を返す
                completion(false)
            }
        })
    }

    
    func saveTitleForUser(userId: String, title: String) {
        let titleRef = Database.database().reference().child("titles").child(userId)
        // 辞書形式でデータを追加する
        let titleData = [title: true] // または任意の値
        titleRef.updateChildValues(titleData) { error, ref in
            if let error = error {
                print("Error saving title: \(error)")
            }
        }
    }

    private func shouldUseCachedFetch(lastFetchedAt: Date?, hasFetched: Bool, cooldown: TimeInterval) -> Bool {
        guard hasFetched, let lastFetchedAt else { return false }
        return Date().timeIntervalSince(lastFetchedAt) < cooldown
    }

    private func finishExperienceFetch() {
        isFetchingExperienceAndLevel = false
        let completions = pendingExperienceFetchCompletions
        pendingExperienceFetchCompletions.removeAll()
        completions.forEach { $0() }
    }

    private func finishInventoryFetch(success: Bool) {
        isFetchingInventory = false
        let completions = pendingInventoryFetchCompletions
        pendingInventoryFetchCompletions.removeAll()
        completions.forEach { $0(success) }
    }

    private func finishRewardFlagFetch() {
        isFetchingRewardFlag = false
        let completions = pendingRewardFlagFetchCompletions
        pendingRewardFlagFetchCompletions.removeAll()
        completions.forEach { $0(rewardFlag) }
    }

    private func finishLoginCountFetch(count: Int) {
        isFetchingLoginCount = false
        let completions = pendingLoginCountFetchCompletions
        pendingLoginCountFetchCompletions.removeAll()
        completions.forEach { $0(count) }
    }

    private func finishAvatarFetch() {
        isFetchingAvatars = false
        let completions = pendingAvatarFetchCompletions
        pendingAvatarFetchCompletions.removeAll()
        completions.forEach { $0() }
    }
    
    func calculateLevel(experience: Int) -> Int {
        return experience / 100 + 1
    }

    func fetchUserExperienceAndLevel(force: Bool = false, completion: (() -> Void)? = nil) {
        guard let userId = user?.uid else {
            completion?()
            return
        }

        if !force, shouldUseCachedFetch(lastFetchedAt: lastExperienceFetchAt, hasFetched: hasFetchedExperienceAndLevel, cooldown: lightweightFetchCooldown) {
            completion?()
            return
        }

        if let completion {
            pendingExperienceFetchCompletions.append(completion)
        }

        if isFetchingExperienceAndLevel {
            return
        }

        isFetchingExperienceAndLevel = true
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            let data = snapshot.value as? [String: Any]
            DispatchQueue.main.async {
                if let data {
                    self.experience = data["experience"] as? Int ?? 0
                    self.level = data["level"] as? Int ?? 1
                } else {
                    self.experience = 0
                    self.level = 1
                }
                self.hasFetchedExperienceAndLevel = true
                self.lastExperienceFetchAt = Date()
                self.finishExperienceFetch()
            }
        }
    }
    
    func fetchUserRankMatchPoint() {
        guard let userId = user?.uid else { return }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            var rankMatchPoint = 100 // デフォルト値を100に設定
            var rank = 1
            
            if let data = snapshot.value as? [String: Any] {
                // rankMatchPointが存在する場合は取得した値を使用
                if let existingRankMatchPoint = data["rankMatchPoint"] as? Int,
                   let existingRank = data["rank"] as? Int{
                    rankMatchPoint = existingRankMatchPoint
                    rank = existingRank
                    self.rankMatchPoint = existingRankMatchPoint
                    self.rank = existingRank
                } else {
                    // rankMatchPointが存在しない場合は、デフォルト値でデータベースを更新
                    userRef.updateChildValues(["rankMatchPoint": rankMatchPoint,"rank": rank])
                    self.rankMatchPoint = 100
                    self.rank = 1
                }
            }
            
            // rankMatchPointを使用する処理（必要に応じて）
            print("rankMatchPoint: \(self.rank)")
        }
    }

    
    func fetchUserRewardFlag(force: Bool = false, completion: ((Int) -> Void)? = nil) {
        guard let userId = user?.uid else {
            completion?(1)
            return
        }

        if !force, shouldUseCachedFetch(lastFetchedAt: lastRewardFlagFetchAt, hasFetched: hasFetchedRewardFlag, cooldown: lightweightFetchCooldown) {
            completion?(rewardFlag)
            return
        }

        if let completion {
            pendingRewardFlagFetchCompletions.append(completion)
        }

        if isFetchingRewardFlag {
            return
        }

        isFetchingRewardFlag = true
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            DispatchQueue.main.async {
                if let data = snapshot.value as? [String: Any] {
                    self.rewardFlag = data["rewardFlag"] as? Int ?? 1
                } else {
                    self.rewardFlag = 1
                }
                self.hasFetchedRewardFlag = true
                self.lastRewardFlagFetchAt = Date()
                self.finishRewardFlagFetch()
            }
        }
    }

    func inventoryCount(for type: InventoryItemType) -> Int {
        switch type {
        case .normalGachaTicket:
            return normalGachaTicketCount
        case .rareGachaTicket:
            return rareGachaTicketCount
        case .mekaGachaTicket:
            return mekaGachaTicketCount
        case .godGachaTicket:
            return godGachaTicketCount
        case .constellationGachaTicket:
            return constellationGachaTicketCount
        case .staminaPotion:
            return staminaPotionCount
        case .boostTicket:
            return boostTicketCount
        }
    }

    private func setInventoryCount(_ count: Int, for type: InventoryItemType) {
        let safeCount = max(0, count)
        switch type {
        case .normalGachaTicket:
            normalGachaTicketCount = safeCount
        case .rareGachaTicket:
            rareGachaTicketCount = safeCount
        case .mekaGachaTicket:
            mekaGachaTicketCount = safeCount
        case .godGachaTicket:
            godGachaTicketCount = safeCount
        case .constellationGachaTicket:
            constellationGachaTicketCount = safeCount
        case .staminaPotion:
            staminaPotionCount = safeCount
        case .boostTicket:
            boostTicketCount = safeCount
        }
        hasFetchedInventory = true
        lastInventoryFetchAt = Date()
    }

    private func intValue(from value: Any?) -> Int {
        if let intValue = value as? Int {
            return intValue
        }
        if let numberValue = value as? NSNumber {
            return numberValue.intValue
        }
        if let doubleValue = value as? Double {
            return Int(doubleValue)
        }
        if let stringValue = value as? String, let intValue = Int(stringValue) {
            return intValue
        }
        return 0
    }

    private func timeIntervalValue(from value: Any?) -> TimeInterval? {
        if let doubleValue = value as? Double {
            return doubleValue
        }
        if let intValue = value as? Int {
            return TimeInterval(intValue)
        }
        if let numberValue = value as? NSNumber {
            return numberValue.doubleValue
        }
        if let stringValue = value as? String, let doubleValue = Double(stringValue) {
            return doubleValue
        }
        return nil
    }

    func fetchInventory(force: Bool = false, completion: ((Bool) -> Void)? = nil) {
        guard let userId = currentUserId else {
            completion?(false)
            return
        }

        if !force, shouldUseCachedFetch(lastFetchedAt: lastInventoryFetchAt, hasFetched: hasFetchedInventory, cooldown: lightweightFetchCooldown) {
            completion?(true)
            return
        }

        if let completion {
            pendingInventoryFetchCompletions.append(completion)
        }

        if isFetchingInventory {
            return
        }

        isFetchingInventory = true
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { snapshot in
            let data = snapshot.value as? [String: Any] ?? [:]
            DispatchQueue.main.async {
                self.normalGachaTicketCount = self.intValue(from: data[InventoryItemType.normalGachaTicket.userFieldKey])
                self.rareGachaTicketCount = self.intValue(from: data[InventoryItemType.rareGachaTicket.userFieldKey])
                self.mekaGachaTicketCount = self.intValue(from: data[InventoryItemType.mekaGachaTicket.userFieldKey])
                self.godGachaTicketCount = self.intValue(from: data[InventoryItemType.godGachaTicket.userFieldKey])
                self.constellationGachaTicketCount = self.intValue(from: data[InventoryItemType.constellationGachaTicket.userFieldKey])
                self.staminaPotionCount = self.intValue(from: data[InventoryItemType.staminaPotion.userFieldKey])
                self.boostTicketCount = self.intValue(from: data[InventoryItemType.boostTicket.userFieldKey])
                self.hasFetchedInventory = true
                self.lastInventoryFetchAt = Date()
                self.finishInventoryFetch(success: true)
            }
        }
    }

    func addItem(_ type: InventoryItemType, amount: Int = 1, completion: ((Bool) -> Void)? = nil) {
        guard amount > 0 else {
            completion?(false)
            return
        }
        guard let userId = currentUserId else {
            completion?(false)
            return
        }

        let itemRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child(type.userFieldKey)

        itemRef.runTransactionBlock { currentData in
            let current = self.intValue(from: currentData.value)
            currentData.value = current + amount
            return TransactionResult.success(withValue: currentData)
        } andCompletionBlock: { error, committed, snapshot in
            guard error == nil, committed else {
                DispatchQueue.main.async {
                    completion?(false)
                }
                return
            }
            DispatchQueue.main.async {
                self.setInventoryCount(self.intValue(from: snapshot?.value), for: type)
                completion?(true)
            }
        }
    }

    func addItems(_ rewards: [InventoryReward], completion: ((Bool) -> Void)? = nil) {
        let validRewards = InventoryReward.merged(rewards.filter { $0.amount > 0 })
        guard !validRewards.isEmpty else {
            completion?(true)
            return
        }

        var grantedRewards: [InventoryReward] = []
        var nextIndex = 0

        func rollbackAndComplete() {
            guard !grantedRewards.isEmpty else {
                completion?(false)
                return
            }

            let group = DispatchGroup()
            for reward in grantedRewards {
                group.enter()
                consumeItem(reward.type, amount: reward.amount) { _ in
                    group.leave()
                }
            }

            group.notify(queue: .main) {
                completion?(false)
            }
        }

        func addNextReward() {
            guard nextIndex < validRewards.count else {
                completion?(true)
                return
            }

            let reward = validRewards[nextIndex]
            nextIndex += 1
            addItem(reward.type, amount: reward.amount) { success in
                guard success else {
                    rollbackAndComplete()
                    return
                }

                grantedRewards.append(reward)
                addNextReward()
            }
        }

        addNextReward()
    }

    func fetchUsedAvatars(completion: @escaping ([Avatar]) -> Void) {
        guard let userId = currentUserId else {
            DispatchQueue.main.async {
                self.usedAvatars = []
            }
            completion([])
            return
        }

        let avatarsRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("avatars")

        avatarsRef.observeSingleEvent(of: .value) { snapshot in
            var fetchedUsedAvatars: [Avatar] = []

            for child in snapshot.children {
                guard
                    let childSnapshot = child as? DataSnapshot,
                    let avatarData = childSnapshot.value as? [String: Any],
                    let name = avatarData["name"] as? String,
                    let attack = avatarData["attack"] as? Int,
                    let health = avatarData["health"] as? Int,
                    let usedFlag = avatarData["usedFlag"] as? Int,
                    let count = avatarData["count"] as? Int
                else {
                    continue
                }

                let avatar = Avatar(name: name, attack: attack, health: health, usedFlag: usedFlag, count: count)
                if usedFlag == 1 {
                    fetchedUsedAvatars.append(avatar)
                }
            }

            DispatchQueue.main.async {
                self.usedAvatars = fetchedUsedAvatars
            }
            completion(fetchedUsedAvatars)
        }
    }

    func consumeItem(_ type: InventoryItemType, amount: Int = 1, completion: @escaping (Bool) -> Void) {
        guard amount > 0 else {
            completion(false)
            return
        }
        guard let userId = currentUserId else {
            completion(false)
            return
        }

        let itemRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child(type.userFieldKey)

        itemRef.runTransactionBlock { currentData in
            let current = self.intValue(from: currentData.value)
            guard current >= amount else {
                return TransactionResult.abort()
            }
            currentData.value = current - amount
            return TransactionResult.success(withValue: currentData)
        } andCompletionBlock: { error, committed, snapshot in
            DispatchQueue.main.async {
                guard error == nil, committed else {
                    completion(false)
                    return
                }
                self.setInventoryCount(self.intValue(from: snapshot?.value), for: type)
                completion(true)
            }
        }
    }

    func useStaminaPotion(recoveryAmount: Int = 30, completion: @escaping (Bool) -> Void) {
        guard !PositionViewModel.shared.isStaminaUnlimited else {
            completion(false)
            return
        }
        guard PositionViewModel.shared.stamina < PositionViewModel.Constants.maxStamina else {
            completion(false)
            return
        }

        consumeItem(.staminaPotion) { success in
            guard success else {
                completion(false)
                return
            }
            PositionViewModel.shared.recoverStamina(by: recoveryAmount) { recoverySuccess in
                guard recoverySuccess else {
                    self.addItem(.staminaPotion) { _ in
                        completion(false)
                    }
                    return
                }
                completion(true)
            }
        }
    }

    func useBoostTicket(completion: @escaping (Bool) -> Void) {
        resolveRewardBoostState { isActive in
            guard !isActive else {
                completion(false)
                return
            }

            self.consumeItem(.boostTicket) { success in
                guard success else {
                    completion(false)
                    return
                }

                self.activateOneHourBoost { boostSuccess in
                    guard boostSuccess else {
                        self.addItem(.boostTicket) { _ in
                            completion(false)
                        }
                        return
                    }
                    completion(true)
                }
            }
        }
    }

    func activateOneHourBoost(completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }

        let activatedAt = Date()
        let userRef = Database.database().reference().child("users").child(userId)

        let updates: [String: Any] = [
            "rewardFlag": 2,
            rewardBoostActivatedAtKey: activatedAt.timeIntervalSince1970
        ]

        userRef.updateChildValues(updates) { error, _ in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(false)
                    return
                }

                self.rewardFlag = 2
                self.hasFetchedRewardFlag = true
                self.lastRewardFlagFetchAt = Date()
                UserDefaults.standard.set(activatedAt, forKey: self.rewardBoostDateKey)
                self.scheduleRewardBoostReset(from: activatedAt)
                completion(true)
            }
        }
    }

    func syncRewardBoostState() {
        guard currentUserId != nil else {
            syncLocalRewardBoostState()
            return
        }

        resolveRewardBoostState { _ in }
    }

    private func syncLocalRewardBoostState() {
        guard let activatedAt = UserDefaults.standard.object(forKey: rewardBoostDateKey) as? Date else {
            rewardBoostResetWorkItem?.cancel()
            return
        }

        let elapsed = Date().timeIntervalSince(activatedAt)
        guard elapsed < rewardBoostDuration else {
            rewardBoostResetWorkItem?.cancel()
            rewardBoostResetWorkItem = nil
            UserDefaults.standard.removeObject(forKey: rewardBoostDateKey)
            if let userId = currentUserId, rewardFlag != 1 {
                updateRewardFlag(userId: userId, userFlag: 1)
            }
            DispatchQueue.main.async {
                self.rewardFlag = 1
                self.hasFetchedRewardFlag = true
                self.lastRewardFlagFetchAt = Date()
            }
            return
        }

        DispatchQueue.main.async {
            self.rewardFlag = max(self.rewardFlag, 2)
            self.hasFetchedRewardFlag = true
            self.lastRewardFlagFetchAt = Date()
        }
        scheduleRewardBoostReset(from: activatedAt)
    }

    private func resolveRewardBoostState(completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            syncLocalRewardBoostState()
            completion(rewardFlag >= 2)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { snapshot in
            let data = snapshot.value as? [String: Any] ?? [:]
            let fetchedRewardFlag = self.intValue(from: data["rewardFlag"])
            let remoteActivatedAt = self.timeIntervalValue(from: data[self.rewardBoostActivatedAtKey]).map {
                Date(timeIntervalSince1970: $0)
            }
            let localActivatedAt = UserDefaults.standard.object(forKey: self.rewardBoostDateKey) as? Date
            let activatedAt = remoteActivatedAt ?? localActivatedAt

            DispatchQueue.main.async {
                self.rewardFlag = fetchedRewardFlag >= 2 ? 2 : 1
                self.hasFetchedRewardFlag = true
                self.lastRewardFlagFetchAt = Date()

                guard fetchedRewardFlag >= 2 else {
                    self.rewardBoostResetWorkItem?.cancel()
                    self.rewardBoostResetWorkItem = nil
                    UserDefaults.standard.removeObject(forKey: self.rewardBoostDateKey)
                    completion(false)
                    return
                }

                guard let activatedAt else {
                    self.expireRewardBoost(userRef: userRef)
                    completion(false)
                    return
                }

                let elapsed = Date().timeIntervalSince(activatedAt)
                guard elapsed < self.rewardBoostDuration else {
                    self.expireRewardBoost(userRef: userRef)
                    completion(false)
                    return
                }

                UserDefaults.standard.set(activatedAt, forKey: self.rewardBoostDateKey)
                self.rewardFlag = 2
                self.scheduleRewardBoostReset(from: activatedAt)
                completion(true)
            }
        }
    }

    private func expireRewardBoost(userRef: DatabaseReference) {
        rewardBoostResetWorkItem?.cancel()
        rewardBoostResetWorkItem = nil
        rewardFlag = 1
        hasFetchedRewardFlag = true
        lastRewardFlagFetchAt = Date()
        UserDefaults.standard.removeObject(forKey: rewardBoostDateKey)
        userRef.updateChildValues([
            "rewardFlag": 1,
            rewardBoostActivatedAtKey: NSNull()
        ])
    }

    private func scheduleRewardBoostReset(from activatedAt: Date) {
        rewardBoostResetWorkItem?.cancel()

        let remaining = max(0, rewardBoostDuration - Date().timeIntervalSince(activatedAt))
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            UserDefaults.standard.removeObject(forKey: self.rewardBoostDateKey)
            if let userId = self.currentUserId {
                let userRef = Database.database().reference().child("users").child(userId)
                userRef.updateChildValues([
                    "rewardFlag": 1,
                    self.rewardBoostActivatedAtKey: NSNull()
                ])
            }
            DispatchQueue.main.async {
                self.rewardFlag = 1
                self.hasFetchedRewardFlag = true
                self.lastRewardFlagFetchAt = Date()
            }
        }

        rewardBoostResetWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + remaining, execute: workItem)
    }
    
    func fetchUserFlag() {
        guard let userId = user?.uid else { return }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
//                print("data:\(data)")
//                self.experience = data["experience"] as? Int ?? 0
                self.userFlag = data["userFlag"] as? Int ?? 0
                print("self.userFlag:\(self.userFlag)")
            }
        }
    }
    
    func fetchUserCsFlag(completion: ((Int) -> Void)? = nil) {
        guard let userId = user?.uid else {
            completion?(0)
            return
        }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String: Any] {
                self.userCsFlag = data["userCsFlag"] as? Int ?? 0
            }
            DispatchQueue.main.async {
                completion?(self.userCsFlag)
            }
        }
    }
    
    func addMoney(amount: Int, completion: ((Bool) -> Void)? = nil) {
        guard amount != 0 else {
            completion?(true)
            return
        }
        guard let userId = currentUserId else {
            completion?(false)
            return
        }

        let moneyRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("userMoney")

        moneyRef.runTransactionBlock { currentData in
            let currentMoney = self.intValue(from: currentData.value)
            currentData.value = max(0, currentMoney + amount)
            return TransactionResult.success(withValue: currentData)
        } andCompletionBlock: { error, committed, snapshot in
            DispatchQueue.main.async {
                guard error == nil, committed else {
                    completion?(false)
                    return
                }
                self.money = self.intValue(from: snapshot?.value)
                completion?(true)
            }
        }
    }

    /// StoreKit の消耗型購入を、トランザクションID単位で一度だけ反映する。
    /// コイン残高と処理済みIDを同じ Firebase transaction で更新するため、
    /// アプリ中断や Transaction.updates からの再配信でも二重付与されない。
    func grantPurchasedCoins(
        transactionId: UInt64,
        productId: String,
        amount: Int,
        completion: @escaping (Bool) -> Void
    ) {
        guard amount > 0, let userId = currentUserId else {
            completion(false)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        let receiptKey = firebaseSafeKey(String(transactionId))

        // Realtime Database transaction が空のローカルキャッシュから始まって
        // 既存ユーザーデータを上書きしないよう、先にユーザーノードを取得する。
        userRef.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.exists() else {
                DispatchQueue.main.async { completion(false) }
                return
            }

            userRef.runTransactionBlock { currentData in
                guard var userData = currentData.value as? [String: Any] else {
                    return TransactionResult.abort()
                }

                var receipts = userData["processedCoinTransactions"] as? [String: Any] ?? [:]
                if receipts[receiptKey] != nil {
                    return TransactionResult.success(withValue: currentData)
                }

                let currentMoney = self.intValue(from: userData["userMoney"])
                userData["userMoney"] = currentMoney + amount
                receipts[receiptKey] = [
                    "productId": productId,
                    "amount": amount,
                    "processedAt": Int64(Date().timeIntervalSince1970 * 1_000)
                ]
                userData["processedCoinTransactions"] = receipts
                currentData.value = userData
                return TransactionResult.success(withValue: currentData)
            } andCompletionBlock: { error, committed, snapshot in
                DispatchQueue.main.async {
                    guard error == nil,
                          committed,
                          let userData = snapshot?.value as? [String: Any] else {
                        completion(false)
                        return
                    }
                    self.money = self.intValue(from: userData["userMoney"])
                    completion(true)
                }
            }
        }, withCancel: { _ in
            DispatchQueue.main.async { completion(false) }
        })
    }

    /// 複数種類のゲーム内報酬を、idempotencyKey ごとに一度だけ付与する。
    func grantRewardBundle(
        idempotencyKey: String,
        coinAmount: Int,
        itemRewards: [InventoryReward],
        completion: @escaping (Bool) -> Void
    ) {
        guard coinAmount >= 0, let userId = currentUserId else {
            completion(false)
            return
        }

        let rewards = InventoryReward.merged(itemRewards.filter { $0.amount > 0 })
        let userRef = Database.database().reference().child("users").child(userId)
        let receiptKey = firebaseSafeKey(idempotencyKey)

        userRef.observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.exists() else {
                DispatchQueue.main.async { completion(false) }
                return
            }

            userRef.runTransactionBlock { currentData in
                guard var userData = currentData.value as? [String: Any] else {
                    return TransactionResult.abort()
                }

                var receipts = userData["rewardGrantReceipts"] as? [String: Any] ?? [:]
                if receipts[receiptKey] != nil {
                    return TransactionResult.success(withValue: currentData)
                }

                userData["userMoney"] = self.intValue(from: userData["userMoney"]) + coinAmount
                for reward in rewards {
                    userData[reward.type.userFieldKey] = self.intValue(from: userData[reward.type.userFieldKey]) + reward.amount
                }
                receipts[receiptKey] = [
                    "coinAmount": coinAmount,
                    "processedAt": Int64(Date().timeIntervalSince1970 * 1_000)
                ]
                userData["rewardGrantReceipts"] = receipts
                currentData.value = userData
                return TransactionResult.success(withValue: currentData)
            } andCompletionBlock: { error, committed, snapshot in
                DispatchQueue.main.async {
                    guard error == nil,
                          committed,
                          let userData = snapshot?.value as? [String: Any] else {
                        completion(false)
                        return
                    }
                    self.money = self.intValue(from: userData["userMoney"])
                    for reward in rewards {
                        self.setInventoryCount(self.intValue(from: userData[reward.type.userFieldKey]), for: reward.type)
                    }
                    completion(true)
                }
            }
        }, withCancel: { _ in
            DispatchQueue.main.async { completion(false) }
        })
    }

    private func firebaseSafeKey(_ value: String) -> String {
        Data(value.utf8)
            .base64EncodedString()
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "=", with: "")
    }
    
    func saveLastClickedDate(userId: String, completion: @escaping (Bool) -> Void) {
            let ref = Database.database().reference().child("users").child(userId)
            ref.updateChildValues(["lastClickedDate": "\(Date())"]) { (error, _) in
                if let error = error {
                    print("Error saving last clicked date: \(error)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }

    func fetchLastClickedDate(userId: String, completion: @escaping (Date?) -> Void) {
        let ref = Database.database().reference().child("users").child(userId)
        ref.child("lastClickedDate").observeSingleEvent(of: .value) { (snapshot) in
            
            // DateFormatterのインスタンスを作成
            let dateFormatter = DateFormatter()
            
            // フォーマットを設定
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            
            // このフォーマッターを使用して、文字列から日付に変換
            if let dateString = snapshot.value as? String, let date = dateFormatter.date(from: dateString) {
                completion(date)
            } else {
                completion(nil)
            }
        }
    }
    
    func saveLastLoginDate(completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }
        let ref = Database.database().reference().child("users").child(userId)
        let currentTimestamp = Date().timeIntervalSince1970
        ref.updateChildValues(["lastLoginDate": currentTimestamp]) { (error, _) in
            if let error = error {
                print("最後のログイン日時の保存に失敗: \(error.localizedDescription)")
                completion(false)
            } else {
                print("最後のログイン日時を正常に保存しました。")
                completion(true)
            }
        }
    }
    
    /// ユーザーの最後のログイン日時を取得する
    func fetchLastLoginDate(completion: @escaping (Date?) -> Void) {
        guard let userId = currentUserId else {
            completion(nil)
            return
        }
        let ref = Database.database().reference().child("users").child(userId).child("lastLoginDate")
        ref.observeSingleEvent(of: .value) { snapshot in
            if let timestamp = snapshot.value as? TimeInterval {
                let date = Date(timeIntervalSince1970: timestamp)
                completion(date)
            } else {
                completion(nil)
            }
        }
    }
    
    func daysBetween(_ from: Date, _ to: Date) -> Int {
        let calendar = Calendar.current
        let fromDate = calendar.startOfDay(for: from)
        let toDate = calendar.startOfDay(for: to)
        let components = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return components.day ?? 0
    }
    
    /// ログインボーナスを表示すべきかどうかを判断する
    func shouldShowLoginBonus(completion: @escaping (Bool) -> Void) {
        fetchLastLoginDate { lastLoginDate in
            let calendar = Calendar.current
            let now = Date()
            if let lastLogin = lastLoginDate {
                if !calendar.isDate(lastLogin, inSameDayAs: now) {
                    // 前回のログインが異なる日に行われている
                    completion(true)
                } else {
                    // 前回のログインが同じ日
                    completion(false)
                }
            } else {
                // 最後のログイン日時が記録されていない場合（初回ログイン）
                completion(true)
            }
        }
    }

    /// ログインボーナスをユーザーに付与する
    func grantLoginBonus(amount: Int, itemRewards: [InventoryReward] = [], completion: @escaping (Bool) -> Void) {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd"
        let grantKey = "loginBonus:\(formatter.string(from: Date()))"

        grantRewardBundle(
            idempotencyKey: grantKey,
            coinAmount: amount,
            itemRewards: itemRewards
        ) { success in
            guard success else {
                completion(false)
                return
            }

            let bonusSummary = itemRewards.isEmpty
                ? "\(amount)コイン"
                : "\(amount)コイン, \(itemRewards.map { $0.displayText }.joined(separator: ", "))"
            print("ログインボーナスを付与: +\(bonusSummary)")
            completion(true)
        }
    }
    
    func addLoginMoney(amount: Int, completion: @escaping (Bool) -> Void) {
        addMoney(amount: amount, completion: completion)
    }

    /// loginCount を取得する
    func fetchLoginCount(completion: @escaping (Int) -> Void) {
        guard let userId = currentUserId else {
            completion(0)
            return
        }
        let loginCountRef = Database.database().reference().child("users").child(userId).child("loginCount")
        loginCountRef.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.value as? Int ?? 0
            DispatchQueue.main.async {
                self.loginCount = count
                self.hasFetchedLoginCount = true
                self.lastLoginCountFetchAt = Date()
            }
            completion(count)
        }
    }

    func fetchLoginCount500(force: Bool = false, completion: @escaping (Int) -> Void) {
        guard let userId = currentUserId else {
            completion(0)
            return
        }

        if !force, shouldUseCachedFetch(lastFetchedAt: lastLoginCountFetchAt, hasFetched: hasFetchedLoginCount, cooldown: loginCountFetchCooldown) {
            completion(loginCount)
            return
        }

        pendingLoginCountFetchCompletions.append(completion)
        if isFetchingLoginCount {
            return
        }

        isFetchingLoginCount = true
        let ref = Database.database().reference().child("users").child(userId).child("loginCount")
        ref.observeSingleEvent(of: .value) { snapshot in
            let count = snapshot.value as? Int ?? 0
            DispatchQueue.main.async {
                self.loginCount = count
                self.hasFetchedLoginCount = true
                self.lastLoginCountFetchAt = Date()
                self.finishLoginCountFetch(count: count)
            }
            self.awardLoginStreakTitles(for: userId, streakCount: count)
        }
    }

    func fetchCurrentLoginStreak(force: Bool = false, completion: @escaping (Int) -> Void) {
        fetchLoginCount500(force: force, completion: completion)
    }
    /// loginCount をインクリメントする
    func incrementLoginCount(completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }
        let loginCountRef = Database.database().reference().child("users").child(userId).child("loginCount")
        loginCountRef.runTransactionBlock { currentData in
            var value = currentData.value as? Int ?? 0
            value += 1
            currentData.value = value > 5 ? 1 : value
            return TransactionResult.success(withValue: currentData)
        } andCompletionBlock: { error, committed, snapshot in
            if let error = error {
                print("loginCount のインクリメントに失敗: \(error.localizedDescription)")
                completion(false)
            } else {
                let updatedCount = snapshot?.value as? Int ?? 1
                DispatchQueue.main.async {
                    self.loginCount = updatedCount
                    self.hasFetchedLoginCount = true
                    self.lastLoginCountFetchAt = Date()
                }
                print("loginCount を更新しました。新しい値: \(updatedCount)")
                completion(true)
            }
        }
    }
    
    func updateStatsUponLevelUp() {
        guard let userId = user?.uid else { return }
        let userRef = Database.database().reference().child("users").child(userId)
        
        // レベルに応じて攻撃力とHPを計算
        let newAttack = 20 + (level - 1) * 2
        let newHp = 100 + (level - 1) * 10
        
        // データベースに新しい攻撃力とHPを保存
        let updatedStats: [String: Any] = ["userAttack": newAttack, "userHp": newHp]
        userRef.updateChildValues(updatedStats) { (error, ref) in
            if let error = error {
                print("Failed to update stats:", error.localizedDescription)
                return
            }
            print("Successfully updated stats.")
        }
    }
    
//    private func saveEarnedTitles() {
//        guard let userId = user?.uid else { return }
//        let userRef = Database.database().reference().child("users").child(userId).child("titles")
//
//        checkForTitles { titles in
//            var titlesData: [String] = []
//            for title in titles {
//                titlesData.append(title.name)
//            }
//            userRef.setValue(titlesData)
//        }
//    }
    
    func checkIfUserIdExists(userId: String, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            completion(snapshot.exists())
        }
    }
    
    func updateLoginCount(to newCount: Int, completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }
        
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.updateChildValues(["loginCount": newCount]) { error, _ in
            if let error = error {
                print("loginCount の更新に失敗: \(error.localizedDescription)")
                completion(false)
            } else {
                DispatchQueue.main.async {
                    self.loginCount = newCount
                    self.hasFetchedLoginCount = true
                    self.lastLoginCountFetchAt = Date()
                }
                print("loginCount を \(newCount) に更新しました。")
                completion(true)
            }
        }
    }

    func updateLoginCount500(to newCount: Int, completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }

        let userRef = Database.database().reference().child("users").child(userId)
        userRef.updateChildValues(["loginCount": newCount]) { error, _ in
            if let error = error {
                print("loginCount の更新に失敗: \(error.localizedDescription)")
                completion(false)
            } else {
                DispatchQueue.main.async {
                    self.loginCount = newCount
                    self.hasFetchedLoginCount = true
                    self.lastLoginCountFetchAt = Date()
                }
                self.awardLoginStreakTitles(for: userId, streakCount: newCount)
                MissionManager.shared.updateMissionProgressWithValue(type: .login, currentValue: newCount) { _ in }
                print("loginCount を \(newCount) に更新しました。")
                completion(true)
            }
        }
    }

    func awardLoginStreakTitles(for userId: String, streakCount: Int) {
        let thresholds: [(Int, String)] = [
            (7, "連続ログイン7日"),
            (30, "連続ログイン30日"),
            (100, "連続ログイン100日"),
        ]

        for (threshold, title) in thresholds where streakCount >= threshold {
            saveTitleForUser(userId: userId, title: title)
        }
    }
    
    func updateUserStoryCsFlag(userId: String, userCsFlag: Int, completion: @escaping (Bool) -> Void) {
        let userRef = Database.database().reference().child("users").child(userId)
        let updates = ["userStoryCsFlag": userCsFlag]
        print(updates)
        userRef.updateChildValues(updates) { (error, _) in
            if let error = error {
                print("Error updating tutorialNum: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func checkAndGrantLoginBonus(completion: @escaping (Bool) -> Void) {
        checkAndGrantLoginBonus500(completion: completion)
    }

    /// ログインボーナスをチェックし、付与する（500日対応）
    func checkAndGrantLoginBonus500(completion: @escaping (Bool) -> Void) {
        fetchLastLoginDate { lastLoginDate in
            let now = Date()

            if let lastLogin = lastLoginDate {
                let days = self.daysBetween(lastLogin, now)
                guard days != 0 else {
                    completion(false)
                    return
                }

                self.fetchLoginCount500 { currentCount in
                    let newCount = days == 1 ? min(currentCount + 1, LoginBonusConfig.maxDay) : 1
                    let bonus = LoginBonusConfig.coinAmount(for: newCount)
                    let itemRewards = LoginBonusConfig.itemRewards(for: newCount)

                    DispatchQueue.main.async {
                        self.loginCount = newCount
                        self.loginBonus = bonus
                    }

                    self.grantLoginBonus(amount: bonus, itemRewards: itemRewards) { success in
                        guard success else {
                            completion(false)
                            return
                        }

                        self.saveLastLoginDate { saveSuccess in
                            guard saveSuccess else {
                                completion(false)
                                return
                            }

                            self.updateLoginCount500(to: newCount, completion: completion)
                        }
                    }
                }
            } else {
                let newCount = 1
                let bonus = LoginBonusConfig.coinAmount(for: newCount)
                let itemRewards = LoginBonusConfig.itemRewards(for: newCount)

                DispatchQueue.main.async {
                    self.loginCount = newCount
                    self.loginBonus = bonus
                }

                self.grantLoginBonus(amount: bonus, itemRewards: itemRewards) { success in
                    guard success else {
                        completion(false)
                        return
                    }

                    self.saveLastLoginDate { saveSuccess in
                        guard saveSuccess else {
                            completion(false)
                            return
                        }

                        self.updateLoginCount500(to: newCount, completion: completion)
                    }
                }
            }
        }
    }
    
    func getBonusAmount(for count: Int) -> Int {
        // 例として、1日目から10日目まで異なるボーナス額を設定
        let bonuses = [100, 300, 500, 800, 1000]
        return count <= 5 ? bonuses[count - 1] : 100
    }
    
    func decreaseUserMoney(by amount: Int = 300, completion: @escaping (Bool) -> Void) {
        changeMoney(by: -amount, allowNegative: false, completion: completion)
    }
    
    func decreaseRareUserMoney(by amount: Int = 600, completion: @escaping (Bool) -> Void) {
        changeMoney(by: -amount, allowNegative: false, completion: completion)
    }

    private func changeMoney(by amount: Int, allowNegative: Bool, completion: @escaping (Bool) -> Void) {
        guard let userId = currentUserId else {
            completion(false)
            return
        }

        let moneyRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("userMoney")

        // Realtime Database transactions may invoke the update block with a nil
        // local cache before the server value has been downloaded. Treating that
        // nil as zero would abort a valid purchase even when the user has enough
        // coins. Prime the exact child first for protected withdrawals, then keep
        // the transaction check below to handle concurrent balance changes.
        if amount < 0, !allowNegative {
            moneyRef.observeSingleEvent(of: .value, with: { snapshot in
                let currentMoney = self.intValue(from: snapshot.value)
                guard currentMoney + amount >= 0 else {
                    DispatchQueue.main.async {
                        self.money = currentMoney
                        completion(false)
                    }
                    return
                }

                self.runMoneyTransaction(
                    at: moneyRef,
                    amount: amount,
                    allowNegative: allowNegative,
                    fallbackMoney: currentMoney,
                    completion: completion
                )
            }, withCancel: { _ in
                DispatchQueue.main.async {
                    completion(false)
                }
            })
            return
        }

        runMoneyTransaction(
            at: moneyRef,
            amount: amount,
            allowNegative: allowNegative,
            fallbackMoney: nil,
            completion: completion
        )
    }

    private func runMoneyTransaction(
        at moneyRef: DatabaseReference,
        amount: Int,
        allowNegative: Bool,
        fallbackMoney: Int?,
        completion: @escaping (Bool) -> Void
    ) {
        var hasUsedFallback = false
        moneyRef.runTransactionBlock { currentData in
            let currentMoney: Int
            if let value = currentData.value, !(value is NSNull) {
                currentMoney = self.intValue(from: value)
            } else if let fallbackMoney, !hasUsedFallback {
                // A transaction can start before its local cache contains this
                // child. Seed only that first attempt with the server value read
                // immediately above. Firebase will compare it with the current
                // server state and retry with the authoritative value if needed.
                currentMoney = fallbackMoney
                hasUsedFallback = true
            } else if amount >= 0 || allowNegative {
                currentMoney = 0
            } else {
                return TransactionResult.abort()
            }

            let nextMoney = currentMoney + amount
            guard allowNegative || nextMoney >= 0 else {
                return TransactionResult.abort()
            }
            currentData.value = nextMoney
            return TransactionResult.success(withValue: currentData)
        } andCompletionBlock: { error, committed, snapshot in
            DispatchQueue.main.async {
                guard error == nil,
                      committed,
                      let committedValue = snapshot?.value,
                      !(committedValue is NSNull) else {
                    completion(false)
                    return
                }
                self.money = self.intValue(from: committedValue)
                completion(true)
            }
        }
    }
    
    func getUserMoney(completion: @escaping (Int) -> Void) {
        guard let userId = currentUserId else {
            DispatchQueue.main.async {
                completion(0)
            }
            return
        }

        let moneyRef = Database.database().reference()
            .child("users")
            .child(userId)
            .child("userMoney")

        moneyRef.observeSingleEvent(of: .value, with: { snapshot in
            let currentMoney = self.intValue(from: snapshot.value)
            DispatchQueue.main.async {
                self.money = currentMoney
                completion(currentMoney)
            }
        }, withCancel: { _ in
            DispatchQueue.main.async {
                completion(self.money)
            }
        })
    }
    
    func updateUserFlag(userId: String, userFlag: Int) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.updateChildValues(["userFlag": userFlag]) { error, _ in
            if let error = error {
                print("Error updating userFlag: \(error)")
            } else {
                print("userFlag successfully updated")
            }
        }
    }
    
    func updateRewardFlag(userId: String, userFlag: Int) {
        let userRef = Database.database().reference().child("users").child(userId)
        userRef.updateChildValues(["rewardFlag": userFlag]) { error, _ in
            if let error = error {
                print("Error updating rewardFlag: \(error)")
            } else {
                print("userFlag successfully updated")
            }
        }
    }
    
    func saveElapsedTime(category: String, elapsedTime: TimeInterval, completion: @escaping (Bool) -> Void) {
        guard let userId = user?.uid else {
            completion(false) // ユーザーIDがnilの場合、失敗としてfalseを返す
            return
        }

        // ユーザーの経過時間データの参照を作成
        let userRef = Database.database().reference().child("users").child(userId)

        // 経過時間を保存する辞書を作成
        let elapsedTimeData: [String: Any] = ["タイム": elapsedTime]

        // カテゴリに応じて保存する場所を指定
        userRef.child(category).setValue(elapsedTimeData) { (error, ref) in
            if let error = error {
                print("Failed to save elapsed time:", error.localizedDescription)
                completion(false) // 保存に失敗した場合、falseを返す
                return
            }
            print("Successfully saved elapsed time.")
            completion(true) // 保存に成功した場合、trueを返す
        }
    }
    
    struct QuizTotal {
        var totalAnswers: Int
    }
    
    func fetchTotalAnswersData(userId: String, completion: @escaping ([QuizLevel: QuizTotal], Int) -> Void) {
        let answersRef = Database.database().reference().child("answers").child(userId)

        answersRef.observeSingleEvent(of: .value, with: { snapshot in
            var totalData = [QuizLevel: QuizTotal]()
            var totalAnswers = 0 // 全体の回答数の合計を格納する変数

            // 各クイズレベルでループ
            for level in QuizLevel.allCases {
                var totalAnswersForLevel = 0

                // 指定されたレベルの日付別データにアクセス
                let levelSnapshot = snapshot.childSnapshot(forPath: level.description)
                if levelSnapshot.exists() {
                    for dateChild in levelSnapshot.children {
                        if let dateSnapshot = dateChild as? DataSnapshot,
                           let answersCount = dateSnapshot.value as? Int {
                            totalAnswersForLevel += answersCount
                        }
                    }
                }

                totalData[level] = QuizTotal(totalAnswers: totalAnswersForLevel)
                totalAnswers += totalAnswersForLevel // 合計回答数に加算
            }

//            print("totalData:\(totalData)")
//            print("Total Answers for all levels: \(totalAnswers)") // 全レベルの合計回答数を出力
            completion(totalData, totalAnswers) // コンプリーションハンドラーに合計回答数も渡す
        })
    }

}

struct AuthManager1: View {
    @ObservedObject var authManager = AuthManager.shared

    var body: some View {
        VStack {
            if authManager.user == nil {
                Text("Not logged in")
            } else {
                Text("Logged in with user ID: \(authManager.user!.uid)")
            }
            Button(action: {
                                generateHapticFeedback()
                if self.authManager.user == nil {
                    self.authManager.anonymousSignIn(){}
                }
            }) {
                Text("Log in anonymously")
            }
        }
    }
}

struct AuthManager_Previews: PreviewProvider {
    static var previews: some View {
        AuthManager1()
    }
}
