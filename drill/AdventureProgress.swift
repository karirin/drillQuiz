import Foundation

struct AdventureBattle: Codable, Equatable {
    let nodeID: Int
    let questions: [AdventureQuestion]
    var questionIndex = 0
    var enemyHP: Int
    var selectedAnswer: Int?

    var currentQuestion: AdventureQuestion? {
        guard questions.indices.contains(questionIndex) else { return nil }
        return questions[questionIndex]
    }
    var wasCorrect: Bool? {
        guard let selectedAnswer, let currentQuestion else { return nil }
        return selectedAnswer == currentQuestion.correctAnswerIndex
    }
}

enum AdventureBattleStep: Equatable { case question, victory, defeat, unavailable }

/// Game rules are independent of SwiftUI, authentication and reward delivery.
/// Every action can be encoded before the next screen or network request starts.
struct AdventureProgress: Codable, Equatable {
    var version = 1
    private(set) var currentNodeID = 0
    private(set) var returnNodeID = 0
    private(set) var checkpointID = 0
    private(set) var clearedNodeIDs: Set<Int> = [0]
    private(set) var deliveredRewardIDs: Set<Int> = []
    private(set) var hp = 100
    private(set) var potions = 0
    private(set) var hasKey = false
    private(set) var hasHat = false
    private(set) var wearsHat = false
    private(set) var battle: AdventureBattle?
    var course: AdventureCourse = .sansu
    // Optional so the existing map saves decode without resetting progress.
    var story: AdventureStoryProgress?

    var currentNode: AdventureNode { AdventureWorld.node(currentNodeID) ?? AdventureWorld.nodes[0] }
    var hasForestLight: Bool { clearedNodeIDs.contains(9) }
    var isChapterComplete: Bool { clearedNodeIDs.contains(10) }
    var earnedCoins: Int { AdventureWorld.nodes.filter { clearedNodeIDs.contains($0.id) }.reduce(0) { $0 + $1.coins } }
    var pendingRewardIDs: [Int] {
        AdventureWorld.nodes.filter { $0.coins > 0 && clearedNodeIDs.contains($0.id) && !deliveredRewardIDs.contains($0.id) }.map(\.id)
    }

    func blockedReason(for id: Int) -> String? {
        guard AdventureWorld.node(id) != nil else { return "行き先が見つかりません" }
        if id == 8 && !hasKey { return "古い祠で鍵を手に入れよう" }
        if id == 10 && !hasForestLight { return "森の主と力を合わせると道が開きます" }
        if route(to: id) == nil { return "手前のマスから道をつなごう" }
        return nil
    }

    /// Only cleared intermediate nodes may be crossed. Unresolved encounters
    /// cannot be used as shortcuts, including after restoring a saved game.
    func route(to target: Int) -> [Int]? {
        guard AdventureWorld.node(target) != nil, battle == nil else { return nil }
        if target == currentNodeID { return [currentNodeID] }
        guard target != 8 || hasKey, target != 10 || hasForestLight else { return nil }
        var queue = [[currentNodeID]]
        var seen: Set<Int> = [currentNodeID]
        var cursor = 0
        while cursor < queue.count {
            let path = queue[cursor]
            cursor += 1
            guard let last = path.last else { continue }
            for next in AdventureWorld.neighbors(of: last) where !seen.contains(next) {
                if last == currentNodeID && !clearedNodeIDs.contains(last) && !clearedNodeIDs.contains(next) { continue }
                let newPath = path + [next]
                if next == target { return newPath }
                if clearedNodeIDs.contains(next) {
                    seen.insert(next)
                    queue.append(newPath)
                }
            }
        }
        return nil
    }

    @discardableResult
    mutating func arrive(at target: Int) -> Bool {
        guard let path = route(to: target) else { return false }
        if path.count > 1 {
            returnNodeID = path[path.count - 2]
            currentNodeID = target
        }
        if currentNode.kind == .road || (currentNode.kind == .bridge && hasKey) || (currentNode.kind == .port && hasForestLight) {
            clearedNodeIDs.insert(target)
        }
        return true
    }

    @discardableResult
    mutating func collectTreasure() -> Bool {
        guard currentNode.kind == .treasure, !clearedNodeIDs.contains(currentNodeID), battle == nil else { return false }
        clearedNodeIDs.insert(currentNodeID)
        if currentNodeID == 7 { hasHat = true; wearsHat = true } else { potions += 1 }
        return true
    }

    @discardableResult
    mutating func collectKey() -> Bool {
        guard currentNode.kind == .shrine, battle == nil, !hasKey else { return false }
        hasKey = true
        clearedNodeIDs.insert(currentNodeID)
        return true
    }

    @discardableResult
    mutating func rest() -> Bool {
        guard [.camp, .village].contains(currentNode.kind), battle == nil else { return false }
        hp = 100
        checkpointID = currentNodeID
        clearedNodeIDs.insert(currentNodeID)
        return true
    }

    @discardableResult
    mutating func usePotion() -> Bool {
        guard potions > 0, hp > 0, hp < 100, battle == nil else { return false }
        potions -= 1
        hp = min(100, hp + 50)
        return true
    }

    mutating func toggleHat() { if hasHat { wearsHat.toggle() } }

    @discardableResult
    mutating func startBattle(questions: [AdventureQuestion]) -> Bool {
        guard currentNode.isBattle, !clearedNodeIDs.contains(currentNodeID), hp > 0 else { return false }
        if battle != nil { return battle?.nodeID == currentNodeID }
        let validQuestions = questions.filter(\.isValid)
        guard !validQuestions.isEmpty else { return false }
        battle = AdventureBattle(nodeID: currentNodeID, questions: validQuestions, enemyHP: currentNode.enemyHP)
        return true
    }

    @discardableResult
    mutating func answer(_ index: Int) -> Bool? {
        guard var next = battle, next.selectedAnswer == nil, next.enemyHP > 0, hp > 0,
              let question = next.currentQuestion, question.choices.indices.contains(index) else { return nil }
        let correct = index == question.correctAnswerIndex
        next.selectedAnswer = index
        if correct { next.enemyHP = max(0, next.enemyHP - 30) } else { hp = max(0, hp - 20) }
        battle = next
        return correct
    }

    mutating func advanceBattle() -> AdventureBattleStep {
        guard var next = battle, next.selectedAnswer != nil else { return .unavailable }
        if hp == 0 {
            battle = nil
            currentNodeID = checkpointID
            returnNodeID = checkpointID
            hp = 100
            return .defeat
        }
        if next.enemyHP == 0 {
            clearedNodeIDs.insert(next.nodeID)
            battle = nil
            return .victory
        }
        next.questionIndex = (next.questionIndex + 1) % next.questions.count
        next.selectedAnswer = nil
        battle = next
        return .question
    }

    mutating func retreat() {
        guard currentNode.isBattle, !clearedNodeIDs.contains(currentNodeID) else { return }
        battle = nil
        currentNodeID = clearedNodeIDs.contains(returnNodeID) ? returnNodeID : checkpointID
    }

    mutating func acknowledgeReward(_ id: Int) {
        guard clearedNodeIDs.contains(id), (AdventureWorld.node(id)?.coins ?? 0) > 0 else { return }
        deliveredRewardIDs.insert(id)
    }

    /// Treat unknown/corrupt saves as errors instead of silently creating a
    /// fresh run that could discard the player's progress.
    var isValid: Bool {
        let ids = Set(AdventureWorld.nodes.map(\.id))
        guard version == 1, ids.contains(currentNodeID), ids.contains(returnNodeID),
              [0, 4].contains(checkpointID), clearedNodeIDs.contains(checkpointID),
              clearedNodeIDs.contains(0), clearedNodeIDs.isSubset(of: ids),
              deliveredRewardIDs.isSubset(of: clearedNodeIDs), (0...100).contains(hp), potions >= 0,
              hasKey == clearedNodeIDs.contains(5), hasHat == clearedNodeIDs.contains(7),
              !wearsHat || hasHat, !clearedNodeIDs.contains(8) || hasKey,
              !clearedNodeIDs.contains(9) || clearedNodeIDs.contains(8),
              !isChapterComplete || hasForestLight,
              story?.bookmark.map({ $0.isValid && $0.scene.isUnlocked(in: self) }) ?? true else { return false }
        if let battle {
            guard battle.nodeID == currentNodeID, currentNode.isBattle, !clearedNodeIDs.contains(currentNodeID),
                  !battle.questions.isEmpty, battle.questions.allSatisfy(\.isValid),
                  let question = battle.currentQuestion, (0...currentNode.enemyHP).contains(battle.enemyHP),
                  battle.selectedAnswer.map({ question.choices.indices.contains($0) }) ?? true else { return false }
        } else if hp == 0 { return false }
        return true
    }
}

enum AdventureSaveError: LocalizedError {
    case unreadable, invalidProgress
    var errorDescription: String? {
        "冒険の記録を読み込めませんでした。記録を残したまま、読み込みをやり直せます。"
    }
}

struct AdventureSaveRepository {
    let defaults: UserDefaults
    let accountID: String
    var key: String { "elementaryStoryAdventure.progress.v1.\(Data(accountID.utf8).base64EncodedString())" }

    func load() throws -> AdventureProgress {
        guard let data = defaults.data(forKey: key) else { return AdventureProgress() }
        guard let progress = try? JSONDecoder().decode(AdventureProgress.self, from: data) else { throw AdventureSaveError.unreadable }
        guard progress.isValid else { throw AdventureSaveError.invalidProgress }
        return progress
    }

    func save(_ progress: AdventureProgress) throws {
        guard progress.isValid else { throw AdventureSaveError.invalidProgress }
        defaults.set(try JSONEncoder().encode(progress), forKey: key)
    }
}
