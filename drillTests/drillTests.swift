//
//  drillTests.swift
//  drillTests
//
//  Created by Apple on 2024/09/12.
//

import XCTest
@testable import drill

final class drillTests: XCTestCase {
    func testQuizLevelAllCasesContainsEveryElementarySchoolLevel() {
        let descriptions = Set(QuizLevel.allCases.map(\.description))
        let expected = Set(
            ["sansu", "shakai", "rika", "kokugo"].flatMap { subject in
                (1...6).map { "\(subject)\($0)" }
            }
        )

        XCTAssertTrue(expected.isSubset(of: descriptions))
    }

    func testInventoryRewardMergedCombinesSameTypeAndDropsNonPositiveTotals() {
        let rewards = [
            InventoryReward(type: .normalGachaTicket, amount: 2),
            InventoryReward(type: .normalGachaTicket, amount: 3),
            InventoryReward(type: .boostTicket, amount: 0),
            InventoryReward(type: .staminaPotion, amount: -1)
        ]

        XCTAssertEqual(
            InventoryReward.merged(rewards),
            [InventoryReward(type: .normalGachaTicket, amount: 5)]
        )
    }

    func testCoinPurchaseCatalogUsesStableProductIdentifiers() {
        XCTAssertEqual(CoinPurchaseCatalog.coinAmount(for: "Drill.coin1000"), 1_000)
        XCTAssertEqual(CoinPurchaseCatalog.coinAmount(for: "Drill.coin4000"), 4_000)
        XCTAssertEqual(CoinPurchaseCatalog.coinAmount(for: "Drill.coin15000"), 15_000)
        XCTAssertNil(CoinPurchaseCatalog.coinAmount(for: "unknown.product"))
    }

}
