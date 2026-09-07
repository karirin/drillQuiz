//
//  LoginBonusConfig.swift
//  drill
//
//  連続ログインボーナスの報酬計算エンジン（500日対応）
//  - 基本: 50コインずつ増加
//  - 5日ごと: 特別ボーナス（通常の2倍）
//  - 50日ごと: 超特別ボーナス（3倍）
//  - 100日ごと: 超超特別ボーナス（5倍）
//

import SwiftUI

// MARK: - LoginBonusConfig
struct LoginBonusConfig {

    static let maxDay = 500

    /// 指定日のボーナスコイン数を計算
    static func coinAmount(for day: Int) -> Int {
        let clampedDay = min(max(day, 1), maxDay)
        let base = clampedDay * 50

        if clampedDay % 100 == 0 { return base * 5 }
        if clampedDay % 50 == 0  { return base * 3 }
        if clampedDay % 5 == 0   { return base * 2 }
        return base
    }

    static func isMilestone(day: Int) -> Bool      { day % 5 == 0 }
    static func isSuperMilestone(day: Int) -> Bool { day % 50 == 0 }
    static func isUltraMilestone(day: Int) -> Bool { day % 100 == 0 }

    static func milestoneRank(day: Int) -> MilestoneRank {
        if day % 100 == 0 { return .ultra }
        if day % 50 == 0  { return .super_ }
        if day % 5 == 0   { return .normal }
        return .none
    }

    static func totalCoins(upTo day: Int) -> Int {
        (1...min(max(day, 1), maxDay)).reduce(0) { $0 + coinAmount(for: $1) }
    }

    static func itemRewards(for day: Int) -> [InventoryReward] {
        let clampedDay = min(max(day, 1), maxDay)

        if clampedDay % 100 == 0 {
            return [
                InventoryReward(type: .staminaPotion, amount: 5),
                InventoryReward(type: .boostTicket, amount: 2)
            ]
        }

        if clampedDay % 50 == 0 {
            return [
                InventoryReward(type: .staminaPotion, amount: 3),
                InventoryReward(type: .boostTicket, amount: 1)
            ]
        }

        if clampedDay % 30 == 0 {
            return []
        }

        if clampedDay % 20 == 0 {
            return [InventoryReward(type: .boostTicket, amount: 1)]
        }

        if clampedDay % 15 == 0 {
            return []
        }

        if clampedDay % 10 == 0 {
            return [InventoryReward(type: .staminaPotion, amount: 2)]
        }

        if clampedDay % 5 == 0 {
            return []
        }

        return []
    }

    static func itemRewardText(for day: Int) -> String {
        let rewards = itemRewards(for: day)
        guard !rewards.isEmpty else { return "" }
        let labels = rewards.map { "\($0.type.shortName)x\($0.amount)" }
        if labels.count <= 2 {
            return labels.joined(separator: " / ")
        }
        return labels.prefix(2).joined(separator: " / ") + " / +\(labels.count - 2)種"
    }

    static func currentPage(for day: Int) -> Int { (day - 1) / 5 }

    static func dayRange(for page: Int) -> ClosedRange<Int> {
        let start = page * 5 + 1
        let end = min(start + 4, maxDay)
        return start...end
    }

    static func icon(for day: Int) -> String {
        let rank = milestoneRank(day: day)
        switch rank {
        case .ultra:  return "crown.fill"
        case .super_: return "diamond.fill"
        case .normal: return "star.circle.fill"
        case .none:
            switch (day - 1) % 5 {
            case 0: return "star.fill"
            case 1: return "flame.fill"
            case 2: return "bolt.fill"
            case 3: return "sparkles"
            default: return "star.circle.fill"
            }
        }
    }

    static func color(for day: Int) -> Color {
        let rank = milestoneRank(day: day)
        switch rank {
        case .ultra:  return Color(red: 1.0, green: 0.84, blue: 0.0)
        case .super_: return Color(red: 0.6, green: 0.3, blue: 1.0)
        case .normal: return Color(red: 1.0, green: 0.5, blue: 0.2)
        case .none:
            switch (day - 1) % 5 {
            case 0: return Color(red: 0.4, green: 0.7, blue: 1.0)
            case 1: return Color(red: 0.5, green: 0.8, blue: 0.4)
            case 2: return Color(red: 1.0, green: 0.6, blue: 0.3)
            case 3: return Color(red: 0.9, green: 0.4, blue: 0.6)
            default: return .blue
            }
        }
    }

    enum MilestoneRank {
        case none, normal, super_, ultra
    }
}
