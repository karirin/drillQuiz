//
//  RankingView.swift
//  it
//
//  Created by hashimo ryoya on 2023/11/01.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RankedUser: Identifiable {
    let id: String
    let user: User
    let position: Int
    var rank: Int?

    init(user: User, position: Int) {
        self.id = user.id
        self.user = user
        self.position = position
    }
}

class RankingViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var streakUsers = [User]()
    @Published var rankMatchUsers = [User]()
    @Published var displayedUserCount = 10
    @State private var rankNum: Int = 0
    @Published var userAnswerDataList = [UserAnswerData]()
    @ObservedObject var authManager = AuthManager.shared
    @Published var currentUserRank: Int?
    @Published var currentUserLevelRank: Int?
    @Published var userAvatarCounts: [UserAvatarCount] = []
    @Published var currentUserAvatarRank: Int?
    @Published var rankedUsers = [User]()
    @Published var currentUserRankRank: Int?
    @Published var currentUserStreakRank: Int?
    @Published var currentStoryUser: Int?
    @Published var currentUserStory: Int?
//    @Published var rankedUsers = [User]()
//    @Published var currentUserRankRank: Int?
//    @Published var rankMatchUsers = [User]()
    
    init() {
        fetchUsers()
//        fetchMonthlyAnswers()
    }
    
    func fetchUsers() {
        let usersRef = Database.database().reference().child("users")
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            var users: [User] = []

            guard let usersData = snapshot.value as? [String: [String: Any]] else {
                print("Error: Could not parse users data")
                return
            }

            for (userId, data) in usersData {
                if let userName = data["userName"] as? String,
                   let userMoney = data["userMoney"] as? Int,
                   let userHp = data["userHp"] as? Int,
                   let userAttack = data["userAttack"] as? Int,
                   let level = data["level"] as? Int,
                   let experience = data["experience"] as? Int {

                    let rankMatchPoint = data["rankMatchPoint"] as? Int ?? 100
                    let rank = data["rank"] as? Int ?? 1
                    let loginCount = data["loginCount"] as? Int ?? 0

                    var filteredAvatars: [[String: Any]] = []
                    if let avatarsData = data["avatars"] as? [String: [String: Any]] {
                        for (_, avatarData) in avatarsData {
                            if avatarData["usedFlag"] as? Int == 1 {
                                filteredAvatars.append(avatarData)
                            }
                        }
                    }

                    let user = User(id: userId,
                                    userName: userName,
                                    level: level,
                                    experience: experience,
                                    avatars: filteredAvatars,
                                    userMoney: userMoney,
                                    userHp: userHp,
                                    userAttack: userAttack,
                                    userFlag: 1,
                                    adminFlag: 0,
                                    rankMatchPoint: rankMatchPoint,
                                    rank: rank,
                                    loginCount: loginCount)
                    users.append(user)
                }
            }

            self.users = users.sorted { $0.level > $1.level }
            self.streakUsers = users.sorted {
                if $0.loginCount == $1.loginCount {
                    if $0.level == $1.level {
                        return $0.id < $1.id
                    }
                    return $0.level > $1.level
                }
                return $0.loginCount > $1.loginCount
            }
            self.rankedUsers = users.sorted { $0.rankMatchPoint > $1.rankMatchPoint }
            
            DispatchQueue.main.async {
                self.calculateLevelRankings()
                self.calculateRankRankings()
                self.calculateStreakRankings()
            }
            self.fetchMonthlyAnswers()
        }) { (error) in
            print("Error getting users: \(error.localizedDescription)")
        }
    }
    
    private func calculateRankRankings() {
        if let currentUserIndex = rankedUsers.firstIndex(where: { $0.id == self.authManager.currentUserId }) {
            self.currentUserRankRank = currentUserIndex + 1
        }
    }

    private func calculateStreakRankings() {
        if let currentUserIndex = streakUsers.firstIndex(where: { $0.id == self.authManager.currentUserId }) {
            self.currentUserStreakRank = currentUserIndex + 1
        }
    }
    
//    func fetchUsers() {
//        let usersRef = Database.database().reference().child("users")
//        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            var users: [User] = []
//
//            guard let usersData = snapshot.value as? [String: [String: Any]] else {
//                print("Error: Could not parse users data")
//                return
//            }
//
//            for (userId, data) in usersData {
//                if let userName = data["userName"] as? String,
//                   let userMoney = data["userMoney"] as? Int,
//                   let userHp = data["userHp"] as? Int,
//                   let userAttack = data["userAttack"] as? Int,
//                   let level = data["level"] as? Int,
//                   let experience = data["experience"] as? Int {
//
//                    // rankMatchPointが存在しない場合は100をデフォルト値として使用
//                    let rankMatchPoint = data["rankMatchPoint"] as? Int ?? 100
//
//                    var filteredAvatars: [[String: Any]] = []
//                    if let avatarsData = data["avatars"] as? [String: [String: Any]] {
//                        for (_, avatarData) in avatarsData {
//                            if avatarData["usedFlag"] as? Int == 1 {
//                                filteredAvatars.append(avatarData)
//                            }
//                        }
//                    }
//
//                    let user = User(id: userId,
//                                    userName: userName,
//                                    level: level,
//                                    experience: experience,
//                                    avatars: filteredAvatars,
//                                    userMoney: userMoney,
//                                    userHp: userHp,
//                                    userAttack: userAttack, userFlag: 1,adminFlag: 0, rankMatchPoint: rankMatchPoint)
//                    users.append(user)
//                }
//            }
//
//            // レベルが高い順にソート
//            self.users = users.sorted { $0.level > $1.level }
//            DispatchQueue.main.async {
//                        self.calculateLevelRankings()
//                    }
//            self.fetchMonthlyAnswers()
//        }) { (error) in
//            // エラーハンドリング
//        }
//    }
    
    func rankMatchFetchUsers() {
        let usersRef = Database.database().reference().child("users")
        usersRef.observeSingleEvent(of: .value, with: { (snapshot) in
            var users: [User] = []
            
            guard let usersData = snapshot.value as? [String: [String: Any]] else {
                print("Error: Could not parse users data")
                return
            }
            
            guard let currentUserUID = Auth.auth().currentUser?.uid else { return }
            
            var currentUserRank: Int? = nil
            for (userId, data) in usersData {
                if userId == currentUserUID {
                    currentUserRank = data["rank"] as? Int ?? 1
                    break
                }
            }
            
            let sameRankUsers = usersData.filter { $1["rank"] as? Int == currentUserRank && $0 != currentUserUID }
            let otherUsers = usersData.filter { $1["rank"] as? Int != currentUserRank && $0 != currentUserUID }
            
            for array in [sameRankUsers, otherUsers] {
                for (userId, data) in array {
                    if let userName = data["userName"] as? String,
                       let userMoney = data["userMoney"] as? Int,
                       let userHp = data["userHp"] as? Int,
                       let userAttack = data["userAttack"] as? Int,
                       let level = data["level"] as? Int,
                       let experience = data["experience"] as? Int {
                        // rankMatchPointが存在しない場合は100をデフォルト値として使用
                        let rankMatchPoint = data["rankMatchPoint"] as? Int ?? 100
                        let rank = data["rank"] as? Int ?? 1
                        let loginCount = data["loginCount"] as? Int ?? 0
                        
                        var filteredAvatars: [[String: Any]] = []
                        if let avatarsData = data["avatars"] as? [String: [String: Any]] {
                            for (_, avatarData) in avatarsData {
                                if avatarData["usedFlag"] as? Int == 1 {
                                    filteredAvatars.append(avatarData)
                                }
                            }
                        }
                        
                        let user = User(id: userId, userName: userName, level: level, experience: experience, avatars: filteredAvatars, userMoney: userMoney, userHp: userHp, userAttack: userAttack, userFlag: 1, adminFlag: 0, rankMatchPoint: rankMatchPoint, rank: rank, loginCount: loginCount)
                        users.append(user)
                    }
                }
            }
            
            // ここでユーザーリストの更新とその他の処理を行います
            self.rankMatchUsers = users
            DispatchQueue.main.async {
                self.calculateLevelRankings()
            }
            self.fetchMonthlyAnswers()
        }) { (error) in
            // エラーハンドリング
        }
    }


    
    private func calculateLevelRankings() {
        // ユーザーをレベルが高い順にソート（レベルが同じ場合は経験値でソート、それでも同じ場合はIDでソート）
        let sortedUsers = users.sorted {
            if $0.level == $1.level {
                return $0.experience == $1.experience ? $0.id < $1.id : $0.experience > $1.experience
            }
            return $0.level > $1.level
        }
//        print("sortedUsers:\(sortedUsers)")

        // ログイン中のユーザーの順位を見つける
        if let currentUserIndex = sortedUsers.firstIndex(where: { $0.id == self.authManager.currentUserId }) {
//            print("currentUserIndex:\(currentUserIndex)")
            // 順位はインデックス+1（配列は0から始まるため）
            self.currentUserLevelRank = currentUserIndex + 1
        }
    }
    
    func fetchMonthlyAnswers() {
        let answersRef = Database.database().reference().child("answers")
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        let currentMonth = formatter.string(from: now)

        answersRef.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self = self else { return }
            var answerCounts: [String: Int] = [:]

            guard let answersData = snapshot.value as? [String: AnyObject] else {
                print("Error: Could not parse answers data")
                return
            }

            for (userId, categoriesData) in answersData {
                guard let categories = categoriesData as? [String: [String: Int]] else {
                    continue
                }

                var totalAnswersForMonth = 0
                for (_, dates) in categories {
                    for (date, count) in dates {
                        if date.hasPrefix(currentMonth) {
                            totalAnswersForMonth += count
                        }
                    }
                }
                answerCounts[userId] = totalAnswersForMonth
            }
        
            DispatchQueue.main.async {
                self.userAnswerDataList = self.users.compactMap { user in
                    // ユーザーのアバター情報から、表示に使用するアバターの名前を選択します。
                    // ここではシンプルに最初のアバターの名前を使用しています。
                    let avatarName = user.avatars.first?["name"] as? String ?? ""
                    guard let answerCount = answerCounts[user.id] else { return nil }
                    return UserAnswerData(userId: user.id, userName: user.userName, answerCount: answerCount, avatarName: avatarName)
                }
                .sorted { $0.answerCount > $1.answerCount }
                .prefix(10)
                .map { $0 }
            }
            DispatchQueue.main.async {
                // ここでuserAnswerDataListが更新された後...
                let sortedAnswerCounts = answerCounts.sorted {
                    if $0.value == $1.value {
                        return $0.key < $1.key // 回答数が同じ場合はユーザーIDでソート
                    }
                    return $0.value > $1.value // まずは回答数で降順にソート
                }
                let maxRank = sortedAnswerCounts.count // 最下位の順位
                let userRankings = sortedAnswerCounts.enumerated().map { (index, element) -> (userId: String, rank: Int) in
                    let rank = element.value > 0 ? index + 1 : maxRank // 回答数が0の場合は最下位
                    return (element.key, rank)
                }
                // ログインユーザーの順位を見つける
                if let currentUserRanking = userRankings.first(where: { $0.userId == self.authManager.currentUserId }) {
                    // ここでログインユーザーの順位が currentUserRanking.rank に格納される
                    self.currentUserRank = currentUserRanking.rank
                }
            }
        })
    }

    func fetchUsersByAvatarCount() {
        let usersRef = Database.database().reference().child("users")
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            var userAvatarCounts: [UserAvatarCount] = []

            guard let usersData = snapshot.value as? [String: [String: Any]] else {
                print("Error: Could not parse users data")
                return
            }

            for (userId, data) in usersData {
                if let userName = data["userName"] as? String,
                   let avatarsData = data["avatars"] as? [String: [String: Any]] {
                    var totalAvatarCount = 0 // アバターの合計数を保持する変数
                    var usedAvatarName: String? = nil // 使用中のアバター名

                    // アバターデータをループして合計を計算
                    for (_, avatarData) in avatarsData {
                        if let count = avatarData["count"] as? Int {
                            totalAvatarCount += count // 各アバターのcountを合算
                        }
                        if avatarData["usedFlag"] as? Int == 1, usedAvatarName == nil {
                            usedAvatarName = avatarData["name"] as? String // 使用中のアバター名を設定
                        }
                    }

                    let userAvatarCount = UserAvatarCount(
                        userId: userId,
                        userName: userName,
                        avatarCount: totalAvatarCount,
                        avatarName: usedAvatarName ?? "defaultAvatar" // 使用中のアバター名がない場合はデフォルト名を使用
                    )
                    userAvatarCounts.append(userAvatarCount)
                }
            }

            // アバター数が多い順にソート
            self.userAvatarCounts = userAvatarCounts.sorted(by: { $0.avatarCount > $1.avatarCount })
            
            // ログインユーザーの順位を計算
            if let currentUserIndex = self.userAvatarCounts.firstIndex(where: { $0.userId == self.authManager.currentUserId }) {
                self.currentUserAvatarRank = currentUserIndex + 1
            }
        })
    }
    
    func showMoreUsers() {
        displayedUserCount = 10  // 表示するユーザー数を10に更新
    }

    @Published var storys: [String: Story] = [:]
     @Published var storyUsers: [RankedUser] = []
     
     struct Story: Codable {
         let lastActiveTime: Double?
         let position: Int
         let stamina: Int
     }
     
     func fetchStorys() {
         Database.database().reference().child("storys").observeSingleEvent(of: .value) { [weak self] snapshot in
             var tempStorys: [String: Story] = [:]
             for child in snapshot.children {
                 if let childSnapshot = child as? DataSnapshot,
                    let value = childSnapshot.value as? [String: Any],
                    let position = value["position"] as? Int,
                    let stamina = value["stamina"] as? Int {
                     let lastActiveTime = value["lastActiveTime"] as? Double
                     
                     let story = Story(lastActiveTime: lastActiveTime, position: position, stamina: stamina)
                     tempStorys[childSnapshot.key] = story
                 }
             }
             DispatchQueue.main.async {
                 guard let self else { return }
                 self.storys = tempStorys
                 self.updateRankedUsers() { success in
                     if success {
                         self.storyUsers = self.storyUsers.sorted { $0.position > $1.position }
                         if let currentStoryUserIndex = self.storyUsers.firstIndex(where: { $0.id == self.authManager.currentUserId }) {
                 //            print("currentUserIndex:\(currentUserIndex)")
                             // 順位はインデックス+1（配列は0から始まるため）
                             self.currentStoryUser = currentStoryUserIndex + 1
                         }
                         self.assignRanks()
                     }
                 }
             }
         }
     }
     
     private func assignRanks() {
         var currentRank = 1
         var previousPosition: Int? = nil
         var sameRankCount = 0
         for (index, user) in storyUsers.enumerated() {
             if let prevPos = previousPosition {
                 if user.position == prevPos {
                     storyUsers[index].rank = currentRank
                     sameRankCount += 1
                 } else {
                     currentRank += sameRankCount + 1
                     storyUsers[index].rank = currentRank
                     sameRankCount = 0
                 }
             } else {
                 storyUsers[index].rank = currentRank
             }
             previousPosition = user.position
         }
     }
     
    func updateRankedUsers(completion: @escaping (Bool) -> Void) {
        let ranked = users.compactMap { user -> RankedUser? in
            guard let story = storys[user.id] else { return nil }
            return RankedUser(user: user, position: story.position)
        }
        .sorted { $1.position < $0.position } // positionが小さいほど上位

        DispatchQueue.main.async {
            self.storyUsers = ranked
            self.updateCurrentUserRank()
            completion(true)
        }
    }
     
     func updateCurrentUserRank() {
         // ここで現在のユーザーIDを取得します。例えば、Firebase Authenticationを使用している場合：
         guard let currentUserID = Auth.auth().currentUser?.uid else { return }
         if let index = storyUsers.firstIndex(where: { $0.user.id == currentUserID }) {
             currentUserLevelRank = index + 1
         }
     }
}

// MARK: - 共通ランキング行ヘルパー
private func rankingFontSize(for text: String, isIPad: Bool) -> CGFloat {
    let baseFontSize: CGFloat = isIPad ? 22 : 16
    let englishAlphabet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let textCharacterSet = CharacterSet(charactersIn: text)
    if englishAlphabet.isSuperset(of: textCharacterSet) {
        return baseFontSize
    } else {
        if text.count >= 12 { return baseFontSize - 6 }
        else if text.count >= 10 { return baseFontSize - 4 }
        else if text.count >= 8 { return baseFontSize - 2 }
        else { return baseFontSize }
    }
}

private func rankingIsIPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}

// MARK: - ランキング順位バッジ
struct RankBadgeView: View {
    let rank: Int

    var badgeColors: [Color] {
        switch rank {
        case 1: return [Color(red: 1.0, green: 0.84, blue: 0.0), Color(red: 1.0, green: 0.68, blue: 0.0)]
        case 2: return [Color(red: 0.75, green: 0.75, blue: 0.78), Color(red: 0.60, green: 0.60, blue: 0.65)]
        case 3: return [Color(red: 0.80, green: 0.50, blue: 0.20), Color(red: 0.65, green: 0.38, blue: 0.15)]
        default: return [Color.clear, Color.clear]
        }
    }

    var body: some View {
        if rank <= 3 {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: badgeColors),
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 36, height: 36)
                    .shadow(color: badgeColors[0].opacity(0.4), radius: 4, x: 0, y: 2)
                Text("\(rank)")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        } else {
            Text("\(rank)")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Color("fontGray").opacity(0.6))
                .frame(width: 36, height: 36)
        }
    }
}

// MARK: - ランキング行カード
struct RankingRowCard<Content: View>: View {
    let rank: Int
    let isCurrentUser: Bool
    let avatars: [[String: Any]]
    let userName: String
    let content: () -> Content

    init(rank: Int, isCurrentUser: Bool, avatars: [[String: Any]], userName: String, @ViewBuilder content: @escaping () -> Content) {
        self.rank = rank
        self.isCurrentUser = isCurrentUser
        self.avatars = avatars
        self.userName = userName
        self.content = content
    }

    var body: some View {
        HStack(spacing: 12) {
            RankBadgeView(rank: rank)

            // アバター
            ForEach(avatars.indices, id: \.self) { index in
                let avatarData = avatars[index]
                if let name = avatarData["name"] as? String,
                   let usedFlag = avatarData["usedFlag"] as? Int,
                   usedFlag == 1 {
                    Image(name)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(rank <= 3 ? Color.orange.opacity(0.3) : Color.clear, lineWidth: 2)
                        )
                }
            }

            Text(userName)
                .font(.system(size: rankingFontSize(for: userName, isIPad: rankingIsIPad()), weight: .medium))
                .foregroundColor(Color("fontGray"))
                .lineLimit(1)

            Spacer()

            content()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(isCurrentUser ? Color("loading").opacity(0.1) : SocialPalette.cardOpaque)
                .shadow(color: Color.black.opacity(rank <= 3 ? 0.08 : 0.04), radius: rank <= 3 ? 8 : 4, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isCurrentUser ? Color("loading").opacity(0.4) : Color.clear, lineWidth: 2)
        )
    }
}

// MARK: - 自分の順位表示
struct MyRankFooter: View {
    let rank: Int
    let label: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "person.fill")
                .foregroundColor(Color("loading"))
                .font(.system(size: 14))
            Text("あなたの順位")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
            Spacer()
            Text("\(rank)位")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color("loading"))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color("loading").opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color("loading").opacity(0.2), lineWidth: 1)
                )
        )
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct StoryRankingView: View {
    @ObservedObject var viewModel: RankingViewModel
    @Binding var isReturnFlag: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            if viewModel.storyUsers.isEmpty {
                ActivityIndicator()
            } else {
                VStack(spacing: 0) {
                    if isReturnFlag {
                        HStack{
                            Button(action: {
                                generateHapticFeedback()
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                Text("戻る")
                                    .foregroundColor(Color("fontGray"))
                            }
                            .padding(.top)
                            Spacer()
                            Text("コマ数ランキング")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.top)
                                .foregroundColor(Color("fontGray"))
                            Spacer()
                            Button(action: {}) {
                                Text("戻る").opacity(0)
                            }
                            .padding(.top)
                        }
                        .padding(.horizontal)
                        .background(SocialPalette.cardOpaque)
                    }
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(Array(viewModel.storyUsers.prefix(10).enumerated()), id: \.element.id) { index, rankedUser in
                                let isMe = rankedUser.user.id == viewModel.authManager.currentUserId
                                RankingRowCard(
                                    rank: rankedUser.rank ?? (index + 1),
                                    isCurrentUser: isMe,
                                    avatars: rankedUser.user.avatars,
                                    userName: rankedUser.user.userName
                                ) {
                                    HStack(spacing: 4) {
                                        Image("足場1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20)
                                        Text("\(rankedUser.position)")
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .foregroundColor(Color("fontGray"))
                                        Text("コマ")
                                            .font(.system(size: 12))
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)

                        if let currentStoryUser = viewModel.currentStoryUser {
                            MyRankFooter(rank: currentStoryUser, label: "コマ数")
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Color2"))
        .foregroundColor(Color("fontGray"))
        .onAppear {
            if viewModel.storyUsers.isEmpty {
                viewModel.fetchStorys()
            }
        }
    }
}

struct RankRankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    var body: some View {
        if viewModel.rankedUsers.isEmpty {
            VStack {
                ActivityIndicator()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(Array(viewModel.rankedUsers.prefix(viewModel.displayedUserCount).enumerated()), id: \.element.id) { index, user in
                        let isMe = user.id == viewModel.authManager.currentUserId
                        RankingRowCard(
                            rank: index + 1,
                            isCurrentUser: isMe,
                            avatars: user.avatars,
                            userName: user.userName
                        ) {
                            HStack(spacing: 4) {
                                Image("ランクマッチマーク")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                Text("\(user.rankMatchPoint)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("fontGray"))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)

                if let currentUserRankRank = viewModel.currentUserRankRank {
                    MyRankFooter(rank: currentUserRankRank, label: "ランク")
                }
            }
            .foregroundColor(Color("fontGray"))
        }
    }
}


struct LevelRankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    var body: some View {
        if viewModel.users.isEmpty {
            VStack {
                ActivityIndicator()
            }
            .background(Color("Color2"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(Array(viewModel.users.prefix(viewModel.displayedUserCount).enumerated()), id: \.element.id) { index, user in
                        let isMe = user.id == viewModel.authManager.currentUserId
                        RankingRowCard(
                            rank: index + 1,
                            isCurrentUser: isMe,
                            avatars: user.avatars,
                            userName: user.userName
                        ) {
                            HStack(spacing: 4) {
                                Image("星")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Lv.\(user.level)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("fontGray"))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)

                if let currentUserLevelRank = viewModel.currentUserLevelRank {
                    MyRankFooter(rank: currentUserLevelRank, label: "レベル")
                }
            }
            .background(Color("Color2"))
            .foregroundColor(Color("fontGray"))
        }
    }
}

struct UserAnswerData {
    let userId: String
    let userName: String
    var answerCount: Int
    let avatarName: String // アバターの名前を保持するプロパティ
}

struct MonthlyAnswersRankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    var body: some View {
        if viewModel.userAnswerDataList.isEmpty {
            VStack {
                ActivityIndicator()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(0..<viewModel.userAnswerDataList.count, id: \.self) { index in
                        let userAnswerData = viewModel.userAnswerDataList[index]
                        let isMe = userAnswerData.userId == viewModel.authManager.currentUserId
                        HStack(spacing: 12) {
                            RankBadgeView(rank: index + 1)

                            Image(userAnswerData.avatarName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(index < 3 ? Color.orange.opacity(0.3) : Color.clear, lineWidth: 2)
                                )

                            Text(userAnswerData.userName)
                                .font(.system(size: rankingFontSize(for: userAnswerData.userName, isIPad: rankingIsIPad()), weight: .medium))
                                .foregroundColor(Color("fontGray"))
                                .lineLimit(1)

                            Spacer()

                            HStack(spacing: 4) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("loading"))
                                    .font(.system(size: 16))
                                Text("\(userAnswerData.answerCount)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("fontGray"))
                                Text("問")
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(isMe ? Color("loading").opacity(0.1) : SocialPalette.cardOpaque)
                                .shadow(color: Color.black.opacity(index < 3 ? 0.08 : 0.04), radius: index < 3 ? 8 : 4, x: 0, y: 2)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(isMe ? Color("loading").opacity(0.4) : Color.clear, lineWidth: 2)
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)

                if let rank = viewModel.currentUserRank {
                    MyRankFooter(rank: rank, label: "回答数")
                }
            }
            .foregroundColor(Color("fontGray"))
        }
    }
}

struct StreakRankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    var body: some View {
        if viewModel.streakUsers.isEmpty {
            VStack {
                ActivityIndicator()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(Array(viewModel.streakUsers.prefix(viewModel.displayedUserCount).enumerated()), id: \.element.id) { index, user in
                        let isMe = user.id == viewModel.authManager.currentUserId
                        RankingRowCard(
                            rank: index + 1,
                            isCurrentUser: isMe,
                            avatars: user.avatars,
                            userName: user.userName
                        ) {
                            HStack(spacing: 4) {
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.orange)
                                    .font(.system(size: 16))
                                Text("\(user.loginCount)日")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("fontGray"))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)

                if let currentUserStreakRank = viewModel.currentUserStreakRank {
                    MyRankFooter(rank: currentUserStreakRank, label: "連続ログイン")
                }
            }
            .foregroundColor(Color("fontGray"))
        }
    }
}

struct UserAvatarCount {
    let userId: String
    let userName: String
    let avatarCount: Int
    let avatarName: String
}

struct AvatarRankingView: View {
    @ObservedObject var viewModel: RankingViewModel

    var body: some View {
        if viewModel.userAvatarCounts.isEmpty {
            VStack {
                ActivityIndicator()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(Array(viewModel.userAvatarCounts.prefix(10).enumerated()), id: \.element.userId) { index, userAvatarCount in
                        let isMe = userAvatarCount.userId == viewModel.authManager.currentUserId
                        HStack(spacing: 12) {
                            RankBadgeView(rank: index + 1)

                            Image(userAvatarCount.avatarName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(index < 3 ? Color.orange.opacity(0.3) : Color.clear, lineWidth: 2)
                                )

                            Text(userAvatarCount.userName)
                                .font(.system(size: rankingFontSize(for: userAvatarCount.userName, isIPad: rankingIsIPad()), weight: .medium))
                                .foregroundColor(Color("fontGray"))
                                .lineLimit(1)

                            Spacer()

                            HStack(spacing: 4) {
                                Image("ライム")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                Text("\(userAvatarCount.avatarCount)")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(Color("fontGray"))
                                Text("体")
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(isMe ? Color("loading").opacity(0.1) : SocialPalette.cardOpaque)
                                .shadow(color: Color.black.opacity(index < 3 ? 0.08 : 0.04), radius: index < 3 ? 8 : 4, x: 0, y: 2)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(isMe ? Color("loading").opacity(0.4) : Color.clear, lineWidth: 2)
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)

                if let rank = viewModel.currentUserAvatarRank {
                    MyRankFooter(rank: rank, label: "おとも")
                }
            }
            .foregroundColor(Color("fontGray"))
            .onAppear {
                viewModel.fetchUsersByAvatarCount()
            }
        }
    }
}

// MARK: - モダンセグメントタブ
struct RankingSegmentedTab: View {
    let tabs: [String]
    let icons: [String]
    @Binding var selectedTab: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 4) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: {
                        generateHapticFeedback()
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selectedTab = index
                        }
                    }) {
                        VStack(spacing: 4) {
                            Image(systemName: icons[index])
                                .font(.system(size: 14))
                            Text(tabs[index])
                                .font(.system(size: 12, weight: .semibold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.65)
                        }
                        .foregroundColor(selectedTab == index ? .white : Color("fontGray"))
                        .frame(minWidth: tabs[index].count > 4 ? 92 : 72)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedTab == index ? Color("loading") : Color.clear)
                        )
                    }
                }
            }
            .padding(4)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(SocialPalette.cardOpaque)
                    .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
}

struct RankingView: View {
    @StateObject var viewModel = RankingViewModel()
    @ObservedObject var audioManager: AudioManager
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Int = 0
    let tabs: [String] = ["レベル", "回答数", "連続ログイン", "ダンジョン"]
    let icons: [String] = ["star.fill", "checkmark.circle.fill", "flame.fill", "map.fill"]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                RankingSegmentedTab(tabs: tabs, icons: icons, selectedTab: $selectedTab)

                TabView(selection: $selectedTab) {
                    LevelRankingView(viewModel: viewModel)
                        .tag(0)
                    MonthlyAnswersRankingView(viewModel: viewModel)
                        .tag(1)
                    StreakRankingView(viewModel: viewModel)
                        .tag(2)
                    StoryRankingView(viewModel: viewModel, isReturnFlag: .constant(false))
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .background(Color("Color2"))
        }
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
        .navigationTitle("ランキング")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView(audioManager: AudioManager())
    }
}
