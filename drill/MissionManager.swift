//
//  MissionManager.swift
//  drill
//

import Foundation
import Firebase

final class MissionManager: ObservableObject {
    @Published var missions: [Mission] = []
    @Published var isLoading = false
    @Published var selectedCategory: MissionCategory = .daily
    @Published var lastDailyReset: Date?
    @Published var lastWeeklyReset: Date?

    static let shared = MissionManager()

    private let authManager = AuthManager.shared
    private let formatter = ISO8601DateFormatter()
    private var hasFetchedMissions = false
    private var isFetchingMissions = false
    private var pendingFetchCompletions: [(Bool) -> Void] = []
    private var isRefreshingMissions = false
    private var pendingRefreshCompletions: [() -> Void] = []
    private var pendingForcedRefresh = false
    private var lastRefreshAt: Date?
    private var pendingSaveWorkItem: DispatchWorkItem?
    private var claimingMissionIds = Set<String>()
    private var claimingCategories = Set<MissionCategory>()
    private let refreshCooldown: TimeInterval = 180
    private let saveDebounceInterval: TimeInterval = 0.8

    private init() {
        setupDefaultMissions()
    }

    var dailyMissions: [Mission] {
        missions.filter { $0.category == .daily }
    }

    var weeklyMissions: [Mission] {
        missions.filter { $0.category == .weekly }
    }

    var normalMissions: [Mission] {
        missions.filter { $0.category == .normal }
    }

    func missionsForCategory(_ category: MissionCategory) -> [Mission] {
        missions.filter { $0.category == category }
    }

    func completedCount(for category: MissionCategory) -> Int {
        missionsForCategory(category).filter { $0.isCompleted && !$0.isClaimed }.count
    }

    var totalClaimableCount: Int {
        missions.filter { $0.isCompleted && !$0.isClaimed }.count
    }

    var isDailyAllCompleted: Bool {
        let targets = dailyMissions
        return !targets.isEmpty && targets.allSatisfy(\.isCompleted)
    }

    var isWeeklyAllCompleted: Bool {
        let targets = weeklyMissions
        return !targets.isEmpty && targets.allSatisfy(\.isCompleted)
    }

    private func setupDefaultMissions() {
        missions = defaultDailyMissions() + defaultWeeklyMissions() + defaultNormalMissions()
    }

    private func defaultDailyMissions() -> [Mission] {
        [
            Mission(
                type: .answer,
                category: .daily,
                title: "問題を5回解こう",
                description: "今日中に問題を5回解答しましょう",
                targetCount: 5,
                rewardCoin: 50,
                rewardIcon: "ミッション問題"
            ),
            Mission(
                type: .correctAnswer,
                category: .daily,
                title: "正解を3回しよう",
                description: "今日中に3問正解しましょう",
                targetCount: 3,
                rewardCoin: 30,
                rewardIcon: "ミッション正解"
            ),
            Mission(
                type: .gacha,
                category: .daily,
                title: "ガチャを1回引こう",
                description: "今日中にガチャを1回引きましょう",
                targetCount: 1,
                rewardCoin: 20,
                rewardIcon: "ミッションガチャ"
            )
        ]
    }

    private func defaultWeeklyMissions() -> [Mission] {
        [
            Mission(
                type: .answer,
                category: .weekly,
                title: "問題を30回解こう",
                description: "今週中に30問解答しましょう",
                targetCount: 30,
                rewardCoin: 200,
                rewardIcon: "ミッション問題",
                rewardItemType: .staminaPotion,
                rewardItemAmount: 2
            ),
            Mission(
                type: .correctAnswer,
                category: .weekly,
                title: "正解を15回しよう",
                description: "今週中に15問正解しましょう",
                targetCount: 15,
                rewardCoin: 150,
                rewardIcon: "ミッション正解"
            ),
            Mission(
                type: .dailyComplete,
                category: .weekly,
                title: "デイリーを3日全クリアしよう",
                description: "デイリーミッションを3日すべて達成しましょう",
                targetCount: 3,
                rewardCoin: 300,
                rewardIcon: "デイリー全クリア"
            )
        ]
    }

    private func defaultNormalMissions() -> [Mission] {
        [
            Mission(
                type: .answer,
                category: .normal,
                title: "問題を14回解こう",
                description: "累計で14問解答しましょう",
                targetCount: 14,
                rewardCoin: 100,
                rewardIcon: "ミッション問題",
                rewardItemType: .staminaPotion,
                rewardItemAmount: 1
            ),
            Mission(
                type: .correctAnswer,
                category: .normal,
                title: "正解を4回しよう",
                description: "累計で4問正解しましょう",
                targetCount: 4,
                rewardCoin: 50,
                rewardIcon: "ミッション正解"
            ),
            Mission(
                type: .avatar,
                category: .normal,
                title: "おともを9体仲間にしよう",
                description: "ガチャでおともを9体獲得しましょう",
                targetCount: 9,
                rewardCoin: 200,
                rewardIcon: "ライム"
            ),
            Mission(
                type: .gacha,
                category: .normal,
                title: "ガチャを10回引こう",
                description: "ガチャを10回引いてみましょう",
                targetCount: 10,
                rewardCoin: 150,
                rewardIcon: "ミッションガチャ"
            ),
            Mission(
                type: .level,
                category: .normal,
                title: "レベル4に到達しよう",
                description: "経験値を貯めてレベル4に到達しましょう",
                targetCount: 4,
                rewardCoin: 300,
                rewardIcon: "ミッションレベル",
                rewardItemType: .boostTicket,
                rewardItemAmount: 1
            ),
            Mission(
                type: .experience,
                category: .normal,
                title: "経験値を500獲得しよう",
                description: "累計で経験値を500獲得しましょう",
                targetCount: 500,
                rewardCoin: 250,
                rewardIcon: "ミッション経験値",
                rewardItemType: .staminaPotion,
                rewardItemAmount: 2
            ),
            Mission(
                type: .money,
                category: .normal,
                title: "コインを1000枚集めよう",
                description: "累計で1000コインを集めましょう",
                targetCount: 1000,
                rewardCoin: 500,
                rewardIcon: "ミッションコイン"
            ),
            Mission(
                type: .login,
                category: .normal,
                title: "7日連続ログインしよう",
                description: "連続ログイン7日を達成しましょう",
                targetCount: 7,
                rewardCoin: 200,
                rewardIcon: "ミッションログイン"
            ),
            Mission(
                type: .dungeonStep,
                category: .normal,
                title: "ダンジョンを30コマ進もう",
                description: "ダンジョンを30コマ以上進みましょう",
                targetCount: 30,
                rewardCoin: 200,
                rewardIcon: "足場1",
                rewardItemType: .staminaPotion,
                rewardItemAmount: 2
            )
        ]
    }

    func itemRewards(for mission: Mission) -> [InventoryReward] {
        guard let itemType = mission.rewardItemType, mission.rewardItemAmount > 0 else {
            return []
        }
        return [InventoryReward(type: itemType, amount: mission.rewardItemAmount)]
    }

    func rewardSummary(coinAmount: Int, itemRewards: [InventoryReward]) -> String {
        var components: [String] = []
        if coinAmount > 0 {
            components.append("\(coinAmount)コイン")
        }
        components.append(contentsOf: itemRewards.map { "\($0.type.displayName) x\($0.amount)" })
        return components.joined(separator: " / ")
    }

    private func completionBonusReceiptKey(for category: MissionCategory) -> String? {
        guard category.completionBonusCoin > 0 else { return nil }

        let calendar = Calendar.current
        let now = Date()
        let periodKey: String
        switch category {
        case .daily:
            let components = calendar.dateComponents([.year, .month, .day], from: now)
            guard let year = components.year,
                  let month = components.month,
                  let day = components.day else { return nil }
            periodKey = String(format: "%04d-%02d-%02d", year, month, day)
        case .weekly:
            let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now)
            guard let year = components.yearForWeekOfYear,
                  let week = components.weekOfYear else { return nil }
            periodKey = String(format: "%04d-W%02d", year, week)
        case .normal:
            return nil
        }

        return "missionCompletionBonus:\(category.rawValue):\(periodKey)"
    }

    private func claimCompletionBonusIfNeeded(
        for category: MissionCategory,
        completion: @escaping (_ success: Bool, _ newlyGrantedCoins: Int) -> Void
    ) {
        let categoryMissions = missionsForCategory(category)
        let bonusCoin = category.completionBonusCoin
        guard bonusCoin > 0,
              !categoryMissions.isEmpty,
              categoryMissions.allSatisfy(\.isCompleted),
              let receiptKey = completionBonusReceiptKey(for: category) else {
            completion(true, 0)
            return
        }

        authManager.grantRewardBundleIfNeeded(
            idempotencyKey: receiptKey,
            coinAmount: bonusCoin,
            itemRewards: []
        ) { success, newlyGranted in
            completion(success, newlyGranted ? bonusCoin : 0)
        }
    }

    private func grantAvailableCompletionBonuses(completion: @escaping () -> Void) {
        let categories: [MissionCategory] = [.daily, .weekly]

        func grantNext(at index: Int) {
            guard index < categories.count else {
                completion()
                return
            }

            claimCompletionBonusIfNeeded(for: categories[index]) { _, _ in
                grantNext(at: index + 1)
            }
        }

        grantNext(at: 0)
    }

    func fetchMissions(force: Bool = false, completion: @escaping (Bool) -> Void) {
        guard let userId = authManager.currentUserId else {
            completion(false)
            return
        }

        if force {
            hasFetchedMissions = false
        }

        if hasFetchedMissions && !missions.isEmpty {
            completion(true)
            return
        }

        if isFetchingMissions {
            pendingFetchCompletions.append(completion)
            return
        }

        isFetchingMissions = true
        pendingFetchCompletions.append(completion)
        isLoading = true
        let missionsRef = Database.database().reference().child("missions").child(userId)

        missionsRef.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self = self else { return }

            if
                let root = snapshot.value as? [String: Any],
                let resetDates = root["resetDates"] as? [String: Any]
            {
                if let dailyString = resetDates["lastDailyReset"] as? String {
                    self.lastDailyReset = self.formatter.date(from: dailyString)
                }
                if let weeklyString = resetDates["lastWeeklyReset"] as? String {
                    self.lastWeeklyReset = self.formatter.date(from: weeklyString)
                }
            }

            if
                let root = snapshot.value as? [String: Any],
                let list = root["list"] as? [[String: Any]]
            {
                self.missions = self.parseMissionList(list)
                self.addMissingDefaultMissions()
                self.checkAndResetMissions()
                self.finishFetch(success: true)
                return
            }

            if let list = snapshot.value as? [[String: Any]] {
                self.missions = self.parseMissionList(list)
                self.addMissingDefaultMissions()
                self.checkAndResetMissions()
                self.saveMissions { _ in }
                self.finishFetch(success: true)
                return
            }

            self.setupDefaultMissions()
            self.lastDailyReset = self.lastDailyReset ?? Date()
            self.lastWeeklyReset = self.lastWeeklyReset ?? Date()
            self.syncMissionsWithCurrentProgress {
                self.finishFetch(success: true)
            }
        }, withCancel: { [weak self] error in
            print("ミッションの読み込みに失敗しました: \(error.localizedDescription)")
            self?.finishFetch(success: false)
        })
    }

    private func finishFetch(success: Bool) {
        isLoading = false
        isFetchingMissions = false
        hasFetchedMissions = success

        let completions = pendingFetchCompletions
        pendingFetchCompletions.removeAll()
        completions.forEach { $0(success) }
    }

    private func parseMissionList(_ list: [[String: Any]]) -> [Mission] {
        list.compactMap { item in
            guard
                let id = item["id"] as? String,
                let typeRaw = item["type"] as? String,
                let type = MissionType(rawValue: typeRaw),
                let title = item["title"] as? String,
                let description = item["description"] as? String,
                let targetCount = item["targetCount"] as? Int,
                let currentCount = item["currentCount"] as? Int,
                let rewardCoin = item["rewardCoin"] as? Int,
                let rewardIcon = item["rewardIcon"] as? String
            else {
                return nil
            }

            let category = MissionCategory(rawValue: item["category"] as? String ?? "") ?? .normal
            let rewardItemType = (item["rewardItemType"] as? String).flatMap(InventoryItemType.init(rawValue:))
            let rewardItemAmount = item["rewardItemAmount"] as? Int ?? 0
            let isCompleted = item["isCompleted"] as? Bool ?? false
            let isClaimed = item["isClaimed"] as? Bool ?? false

            return Mission(
                id: id,
                type: type,
                category: category,
                title: title,
                description: description,
                targetCount: targetCount,
                currentCount: currentCount,
                rewardCoin: rewardCoin,
                rewardIcon: Mission.normalizedRewardIcon(rewardIcon, type: type),
                rewardItemType: rewardItemType,
                rewardItemAmount: rewardItemAmount,
                isCompleted: isCompleted,
                isClaimed: isClaimed
            )
        }
    }

    private func addMissingDefaultMissions() {
        let defaults = defaultDailyMissions() + defaultWeeklyMissions() + defaultNormalMissions()
        let existingKeys = Set(missions.map { "\($0.category.rawValue)-\($0.type.rawValue)" })

        for mission in defaults {
            let key = "\(mission.category.rawValue)-\(mission.type.rawValue)"
            if !existingKeys.contains(key) {
                missions.append(mission)
            }
        }
    }

    private func nextDailyResetDate(from date: Date = Date()) -> Date {
        let calendar = Calendar.current
        let startOfToday = calendar.startOfDay(for: date)
        return calendar.date(byAdding: .day, value: 1, to: startOfToday) ?? date
    }

    private func nextWeeklyResetDate(from date: Date = Date()) -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        components.weekday = 2
        let thisWeekMonday = calendar.date(from: components) ?? date
        return calendar.date(byAdding: .weekOfYear, value: 1, to: thisWeekMonday) ?? date
    }

    func timeUntilReset(for category: MissionCategory) -> TimeInterval {
        switch category {
        case .daily:
            return max(nextDailyResetDate().timeIntervalSinceNow, 0)
        case .weekly:
            return max(nextWeeklyResetDate().timeIntervalSinceNow, 0)
        case .normal:
            return 0
        }
    }

    func checkAndResetMissions() {
        let calendar = Calendar.current
        let now = Date()

        if let lastDailyReset {
            if !calendar.isDate(lastDailyReset, inSameDayAs: now) {
                resetDailyMissions()
            }
        } else {
            lastDailyReset = now
        }

        if let lastWeeklyReset {
            let lastWeek = calendar.component(.weekOfYear, from: lastWeeklyReset)
            let currentWeek = calendar.component(.weekOfYear, from: now)
            let lastYear = calendar.component(.yearForWeekOfYear, from: lastWeeklyReset)
            let currentYear = calendar.component(.yearForWeekOfYear, from: now)
            if lastWeek != currentWeek || lastYear != currentYear {
                resetWeeklyMissions()
            }
        } else {
            lastWeeklyReset = now
        }
    }

    private func resetDailyMissions() {
        if isDailyAllCompleted {
            updateMissionProgress(type: .dailyComplete, category: .weekly, increment: 1) { _ in }
        }
        missions.removeAll { $0.category == .daily }
        missions.append(contentsOf: defaultDailyMissions())
        lastDailyReset = Date()
        saveMissions { _ in }
    }

    private func resetWeeklyMissions() {
        missions.removeAll { $0.category == .weekly }
        missions.append(contentsOf: defaultWeeklyMissions())
        lastWeeklyReset = Date()
        saveMissions { _ in }
    }

    func saveMissions(completion: @escaping (Bool) -> Void) {
        guard let userId = authManager.currentUserId else {
            completion(false)
            return
        }

        pendingSaveWorkItem?.cancel()
        pendingSaveWorkItem = nil

        let data: [[String: Any]] = missions.map { mission in
            [
                "id": mission.id,
                "type": mission.type.rawValue,
                "category": mission.category.rawValue,
                "title": mission.title,
                "description": mission.description,
                "targetCount": mission.targetCount,
                "currentCount": mission.currentCount,
                "rewardCoin": mission.rewardCoin,
                "rewardIcon": mission.rewardIcon,
                "rewardItemType": mission.rewardItemType?.rawValue ?? "",
                "rewardItemAmount": mission.rewardItemAmount,
                "isCompleted": mission.isCompleted,
                "isClaimed": mission.isClaimed
            ]
        }

        let payload: [String: Any] = [
            "list": data,
            "resetDates": [
                "lastDailyReset": formatter.string(from: lastDailyReset ?? Date()),
                "lastWeeklyReset": formatter.string(from: lastWeeklyReset ?? Date())
            ]
        ]

        Database.database().reference()
            .child("missions")
            .child(userId)
            .setValue(payload) { error, _ in
                completion(error == nil)
            }
    }

    private func scheduleProgressSave() {
        pendingSaveWorkItem?.cancel()

        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.pendingSaveWorkItem = nil
            self.saveMissions { _ in }
        }

        pendingSaveWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + saveDebounceInterval, execute: workItem)
    }

    func flushPendingProgressSave(completion: ((Bool) -> Void)? = nil) {
        guard pendingSaveWorkItem != nil else {
            completion?(true)
            return
        }

        pendingSaveWorkItem?.cancel()
        pendingSaveWorkItem = nil
        saveMissions { success in
            completion?(success)
        }
    }

    func syncMissionsWithCurrentProgress(completion: (() -> Void)? = nil) {
        guard let userId = authManager.currentUserId else {
            completion?()
            return
        }

        if missions.isEmpty {
            setupDefaultMissions()
        }

        let group = DispatchGroup()

        group.enter()
        authManager.fetchTotalAnswersData(userId: userId) { [weak self] _, totalAnswers in
            self?.applyAbsoluteProgress(type: .answer, value: totalAnswers)
            group.leave()
        }

        group.enter()
        authManager.getUserMoney { [weak self] money in
            self?.applyAbsoluteProgress(type: .money, value: money)
            group.leave()
        }

        group.enter()
        authManager.fetchAvatars { [weak self] in
            let count = self?.authManager.avatars.reduce(0) { $0 + $1.count } ?? 0
            self?.applyAbsoluteProgress(type: .avatar, value: count)
            group.leave()
        }

        group.enter()
        authManager.fetchCurrentLoginStreak { [weak self] count in
            self?.applyAbsoluteProgress(type: .login, value: count)
            group.leave()
        }

        group.enter()
        authManager.fetchUserExperienceAndLevel { [weak self] in
            guard let self = self else {
                group.leave()
                return
            }
            self.applyAbsoluteProgress(type: .level, value: self.authManager.level)
            self.applyAbsoluteProgress(type: .experience, value: self.authManager.experience)
            group.leave()
        }

        let currentPosition = PositionViewModel.shared.userPosition
        applyAbsoluteProgress(type: .dungeonStep, value: currentPosition)

        group.notify(queue: .main) {
            self.lastDailyReset = self.lastDailyReset ?? Date()
            self.lastWeeklyReset = self.lastWeeklyReset ?? Date()
            self.saveMissions { _ in
                completion?()
            }
        }
    }

    func refreshAllMissions(force: Bool = false, completion: (() -> Void)? = nil) {
        let now = Date()

        if !force, let lastRefreshAt, now.timeIntervalSince(lastRefreshAt) < refreshCooldown {
            completion?()
            return
        }

        if isRefreshingMissions {
            if force {
                pendingForcedRefresh = true
            }
            if let completion {
                pendingRefreshCompletions.append(completion)
            }
            return
        }

        isRefreshingMissions = true
        if let completion {
            pendingRefreshCompletions.append(completion)
        }

        checkAndResetMissions()
        syncMissionsWithCurrentProgress { [weak self] in
            guard let self = self else { return }

            // 全達成カードに表示している追加報酬は受取ボタンを持たないため、
            // 達成を同期した時点で一度だけ自動付与する。過去に全達成済みでも
            // receipt が無ければここで補填される。
            self.grantAvailableCompletionBonuses {
                self.lastRefreshAt = Date()
                self.isRefreshingMissions = false

                let completions = self.pendingRefreshCompletions
                self.pendingRefreshCompletions.removeAll()
                completions.forEach { $0() }

                if self.pendingForcedRefresh {
                    self.pendingForcedRefresh = false
                    self.refreshAllMissions(force: true)
                }
            }
        }
    }

    private func applyAbsoluteProgress(type: MissionType, value: Int) {
        for index in missions.indices where missions[index].type == type && !missions[index].isCompleted {
            missions[index].currentCount = max(missions[index].currentCount, value)
            if missions[index].currentCount >= missions[index].targetCount {
                missions[index].isCompleted = true
            }
        }
    }

    func recordAnswerProgress(isCorrect: Bool) {
        var updated = false

        for index in missions.indices where missions[index].type == .answer && !missions[index].isCompleted {
            missions[index].currentCount += 1
            if missions[index].currentCount >= missions[index].targetCount {
                missions[index].isCompleted = true
            }
            updated = true
        }

        if isCorrect {
            for index in missions.indices where missions[index].type == .correctAnswer && !missions[index].isCompleted {
                missions[index].currentCount += 1
                if missions[index].currentCount >= missions[index].targetCount {
                    missions[index].isCompleted = true
                }
                updated = true
            }
        }

        if updated {
            scheduleProgressSave()
        }
    }

    func updateMissionProgress(type: MissionType, increment: Int = 1, completion: @escaping (Bool) -> Void) {
        var updated = false
        for index in missions.indices where missions[index].type == type && !missions[index].isCompleted {
            missions[index].currentCount += increment
            if missions[index].currentCount >= missions[index].targetCount {
                missions[index].isCompleted = true
            }
            updated = true
        }

        guard updated else {
            completion(false)
            return
        }

        scheduleProgressSave()
        completion(true)
    }

    func updateMissionProgress(type: MissionType, category: MissionCategory, increment: Int = 1, completion: @escaping (Bool) -> Void) {
        guard let index = missions.firstIndex(where: { $0.type == type && $0.category == category && !$0.isCompleted }) else {
            completion(false)
            return
        }

        missions[index].currentCount += increment
        if missions[index].currentCount >= missions[index].targetCount {
            missions[index].isCompleted = true
        }
        scheduleProgressSave()
        completion(true)
    }

    func updateMissionProgressWithValue(type: MissionType, currentValue: Int, completion: @escaping (Bool) -> Void) {
        var updated = false
        for index in missions.indices where missions[index].type == type && !missions[index].isCompleted {
            missions[index].currentCount = max(missions[index].currentCount, currentValue)
            if missions[index].currentCount >= missions[index].targetCount {
                missions[index].isCompleted = true
            }
            updated = true
        }

        guard updated else {
            completion(false)
            return
        }

        scheduleProgressSave()
        completion(true)
    }

    func claimReward(missionId: String, completion: @escaping (Bool, Int, [InventoryReward]) -> Void) {
        guard !claimingMissionIds.contains(missionId) else {
            completion(false, 0, [])
            return
        }
        guard let index = missions.firstIndex(where: { $0.id == missionId }) else {
            completion(false, 0, [])
            return
        }

        guard missions[index].isCompleted, !missions[index].isClaimed else {
            completion(false, 0, [])
            return
        }

        let coinReward = missions[index].rewardCoin
        let itemRewards = itemRewards(for: missions[index])
        let category = missions[index].category
        claimingMissionIds.insert(missionId)

        authManager.grantRewardBundle(
            idempotencyKey: "missionReward:\(missionId)",
            coinAmount: coinReward,
            itemRewards: itemRewards
        ) { rewardSuccess in
            guard rewardSuccess else {
                self.claimingMissionIds.remove(missionId)
                completion(false, 0, [])
                return
            }

            self.claimCompletionBonusIfNeeded(for: category) { bonusSuccess, bonusCoin in
                guard bonusSuccess,
                      let currentIndex = self.missions.firstIndex(where: { $0.id == missionId }) else {
                    self.claimingMissionIds.remove(missionId)
                    completion(false, 0, [])
                    return
                }
                self.missions[currentIndex].isClaimed = true
                self.saveMissions { saveSuccess in
                    self.claimingMissionIds.remove(missionId)
                    if saveSuccess {
                        completion(true, coinReward + bonusCoin, itemRewards)
                    } else {
                        self.missions[currentIndex].isClaimed = false
                        completion(false, 0, [])
                    }
                }
            }
        }
    }

    func claimAllRewards(for category: MissionCategory, completion: @escaping (Bool, Int, [InventoryReward]) -> Void) {
        guard !claimingCategories.contains(category) else {
            completion(false, 0, [])
            return
        }
        let targetIndices = missions.indices.filter {
            missions[$0].category == category && missions[$0].isCompleted && !missions[$0].isClaimed
        }

        guard !targetIndices.isEmpty else {
            completion(false, 0, [])
            return
        }

        let targetMissions = targetIndices.map { missions[$0] }
        let coinReward = targetMissions.reduce(0) { $0 + $1.rewardCoin }
        let mergedItemRewards = InventoryReward.merged(targetMissions.flatMap { itemRewards(for: $0) })
        claimingCategories.insert(category)

        grantRewardsSequentially(for: targetMissions) { rewardSuccess in
            guard rewardSuccess else {
                self.claimingCategories.remove(category)
                completion(false, 0, [])
                return
            }

            self.claimCompletionBonusIfNeeded(for: category) { bonusSuccess, bonusCoin in
                guard bonusSuccess else {
                    self.claimingCategories.remove(category)
                    completion(false, 0, [])
                    return
                }

                let claimedIds = Set(targetMissions.map(\.id))
                for index in self.missions.indices where claimedIds.contains(self.missions[index].id) {
                    self.missions[index].isClaimed = true
                }

                self.saveMissions { saveSuccess in
                    self.claimingCategories.remove(category)
                    if saveSuccess {
                        completion(true, coinReward + bonusCoin, mergedItemRewards)
                    } else {
                        for index in self.missions.indices where claimedIds.contains(self.missions[index].id) {
                            self.missions[index].isClaimed = false
                        }
                        completion(false, 0, [])
                    }
                }
            }
        }
    }

    private func grantRewardsSequentially(
        for targetMissions: [Mission],
        at index: Int = 0,
        completion: @escaping (Bool) -> Void
    ) {
        guard index < targetMissions.count else {
            completion(true)
            return
        }

        let mission = targetMissions[index]
        authManager.grantRewardBundle(
            idempotencyKey: "missionReward:\(mission.id)",
            coinAmount: mission.rewardCoin,
            itemRewards: itemRewards(for: mission)
        ) { success in
            guard success else {
                completion(false)
                return
            }
            self.grantRewardsSequentially(
                for: targetMissions,
                at: index + 1,
                completion: completion
            )
        }
    }
}

extension AuthManager {
    func recordAnswer(isCorrect: Bool) {
        MissionManager.shared.recordAnswerProgress(isCorrect: isCorrect)
        GuildManager.shared.recordAnswer(isCorrect: isCorrect)
    }

    func recordGachaUsed() {
        MissionManager.shared.updateMissionProgress(type: .gacha, increment: 1) { _ in }
    }

    func recordAvatarObtained() {
        let avatarCount = avatars.reduce(0) { $0 + $1.count }
        MissionManager.shared.updateMissionProgressWithValue(type: .avatar, currentValue: avatarCount) { _ in }
    }

    func recordStoryCompleted(isBoss: Bool = false) {
        MissionManager.shared.updateMissionProgress(type: .story, increment: 1) { _ in }
        GuildManager.shared.recordStoryCompleted(isBoss: isBoss)
    }

    func recordDungeonStep(position: Int) {
        MissionManager.shared.updateMissionProgressWithValue(type: .dungeonStep, currentValue: position) { _ in }
    }

}
