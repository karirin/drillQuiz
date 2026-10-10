//
//  Mission.swift
//  drill
//

import Foundation

enum MissionCategory: String, Codable, CaseIterable {
    case daily
    case weekly
    case normal

    var displayName: String {
        switch self {
        case .daily:
            return "デイリー"
        case .weekly:
            return "ウィークリー"
        case .normal:
            return "通常"
        }
    }

    var completionBonusCoin: Int {
        switch self {
        case .daily:
            return 100
        case .weekly:
            return 500
        case .normal:
            return 0
        }
    }
}

enum MissionType: String, Codable {
    case answer
    case correctAnswer
    case avatar
    case gacha
    case level
    case experience
    case money
    case story
    case login
    case dailyComplete
    case dungeonStep
    case review
}

struct Mission: Identifiable, Codable {
    let id: String
    let type: MissionType
    let category: MissionCategory
    let title: String
    let description: String
    let targetCount: Int
    var currentCount: Int
    let rewardCoin: Int
    let rewardIcon: String
    let rewardItemType: InventoryItemType?
    let rewardItemAmount: Int
    var isCompleted: Bool
    var isClaimed: Bool

    var progressPercentage: Double {
        guard targetCount > 0 else { return 0 }
        return min(Double(currentCount) / Double(targetCount), 1.0)
    }

    var displayIconAssetName: String? {
        if let iconName = Mission.assetIconName(for: rewardIcon) {
            return iconName
        }

        switch type {
        case .answer:
            return "ミッション問題"
        case .correctAnswer:
            return "ミッション正解"
        case .avatar:
            return "ライム"
        case .gacha:
            return "ミッションガチャ"
        case .level:
            return "ミッションレベル"
        case .experience:
            return "ミッション経験値"
        case .money:
            return "ミッションコイン"
        case .login:
            return "ミッションログイン"
        case .dailyComplete:
            return "デイリー全クリア"
        case .dungeonStep:
            return "足場1"
        case .story:
            return nil
        case .review:
            return "ミッション正解"
        }
    }

    var fallbackSystemIconName: String {
        switch type {
        case .answer:
            return "list.bullet.rectangle"
        case .correctAnswer:
            return "checkmark.seal.fill"
        case .avatar:
            return "person.3.fill"
        case .gacha:
            return "sparkles"
        case .level:
            return "arrow.up.circle.fill"
        case .experience:
            return "sparkle.magnifyingglass"
        case .money:
            return "bitcoinsign.circle.fill"
        case .story:
            return "book.fill"
        case .login:
            return "calendar.badge.clock"
        case .dailyComplete:
            return "calendar.badge.checkmark"
        case .dungeonStep:
            return "figure.walk"
        case .review:
            return "arrow.triangle.2.circlepath"
        }
    }

    static func normalizedRewardIcon(_ rewardIcon: String, type: MissionType) -> String {
        if let iconName = assetIconName(for: rewardIcon) {
            return iconName
        }

        switch type {
        case .answer:
            return "ミッション問題"
        case .correctAnswer:
            return "ミッション正解"
        case .avatar:
            return "ライム"
        case .gacha:
            return "ミッションガチャ"
        case .level:
            return "ミッションレベル"
        case .experience:
            return "ミッション経験値"
        case .money:
            return "ミッションコイン"
        case .story:
            return rewardIcon
        case .login:
            return "ミッションログイン"
        case .dailyComplete:
            return "デイリー全クリア"
        case .dungeonStep:
            return "足場1"
        case .review:
            return "ミッション正解"
        }
    }

    init(
        id: String = UUID().uuidString,
        type: MissionType,
        category: MissionCategory = .normal,
        title: String,
        description: String,
        targetCount: Int,
        currentCount: Int = 0,
        rewardCoin: Int,
        rewardIcon: String,
        rewardItemType: InventoryItemType? = nil,
        rewardItemAmount: Int = 0,
        isCompleted: Bool = false,
        isClaimed: Bool = false
    ) {
        self.id = id
        self.type = type
        self.category = category
        self.title = title
        self.description = description
        self.targetCount = targetCount
        self.currentCount = currentCount
        self.rewardCoin = rewardCoin
        self.rewardIcon = rewardIcon
        self.rewardItemType = rewardItemType
        self.rewardItemAmount = rewardItemAmount
        self.isCompleted = isCompleted
        self.isClaimed = isClaimed
    }

    private static func assetIconName(for rewardIcon: String) -> String? {
        switch rewardIcon {
        case "ミッション問題", "list.bullet.rectangle":
            return "ミッション問題"
        case "ミッション正解", "checkmark.seal.fill":
            return "ミッション正解"
        case "ライム", "person.3.fill":
            return "ライム"
        case "ミッションガチャ", "sparkles":
            return "ミッションガチャ"
        case "ミッションレベル", "arrow.up.circle.fill":
            return "ミッションレベル"
        case "ミッション経験値", "sparkle.magnifyingglass":
            return "ミッション経験値"
        case "ミッションコイン", "bitcoinsign.circle.fill":
            return "ミッションコイン"
        case "ミッションログイン", "calendar.badge.clock":
            return "ミッションログイン"
        case "デイリー全クリア", "calendar.badge.checkmark":
            return "デイリー全クリア"
        case "足場1", "figure.walk":
            return "足場1"
        default:
            return nil
        }
    }
}
