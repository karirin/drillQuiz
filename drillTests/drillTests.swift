//
//  drillTests.swift
//  drillTests
//
//  Created by Apple on 2024/09/12.
//

import XCTest
import StoreKit
import StoreKitTest
import UIKit
@testable import drill

final class drillTests: XCTestCase {
    func testReviewSubjectsResolveGradesAndAdventureWithoutGuessingQuestionText() {
        for subject in ReviewSubject.allCases {
            for grade in 1...6 {
                XCTAssertEqual(ReviewSubject.resolve(sourceQuizLevel: "\(subject.rawValue)\(grade)"), subject)
            }
            XCTAssertEqual(ReviewSubject.resolve(sourceQuizLevel: subject.title), subject)
        }
        XCTAssertNil(ReviewSubject.resolve(sourceQuizLevel: nil))
        XCTAssertNil(ReviewSubject.resolve(sourceQuizLevel: "sansu10"))
        XCTAssertNil(ReviewSubject.resolve(sourceQuizLevel: "unknown"))
    }

    func testReviewRestoresInputQuestionAfterFirebaseDropsEmptyChoices() throws {
        let question = QuizQuestion.fillInBlank(question: "3 + 2 は？", answer: "5",
                                                acceptableAnswers: ["５"], explanation: "合わせて5です。")
        var payload = IncorrectAnswer(userId: "test", quiz: question).databasePayload
        payload.removeValue(forKey: "choices")
        let restored = try XCTUnwrap(quizQuestion(fromIncorrectAnswerDict: payload, quizId: "review-id"))
        XCTAssertEqual(restored.id, "review-id")
        XCTAssertEqual(restored.format, .fillInBlank)
        XCTAssertTrue(restored.matchesTextAnswer("５"))
        XCTAssertFalse(restored.matchesTextAnswer("4"))
        XCTAssertEqual(restored.explanation, question.explanation)
    }

    func testReviewRestoresOrderedAnswersAndRejectsInvalidMultipleChoice() throws {
        let question = QuizQuestion.reorder(question: "小さい順に並べよう", choices: ["3", "1", "2"],
                                           orderedChoices: ["1", "2", "3"], explanation: "1、2、3の順です。")
        let payload = IncorrectAnswer(userId: "test", quiz: question).databasePayload
        let restored = try XCTUnwrap(quizQuestion(fromIncorrectAnswerDict: payload, quizId: "ordered"))
        XCTAssertEqual(restored.format, .reorder)
        XCTAssertEqual(restored.orderedChoices, question.orderedChoices)
        XCTAssertNil(quizQuestion(fromIncorrectAnswerDict: [
            "quizQuestion": "壊れた問題", "choices": ["答え"],
            "correctAnswerIndex": 4, "explanation": "解説"
        ], quizId: "invalid"))
    }

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

    func testMissionCompletionBonusMatchesDisplayedReward() {
        XCTAssertEqual(MissionCategory.daily.completionBonusCoin, 100)
        XCTAssertEqual(MissionCategory.weekly.completionBonusCoin, 500)
        XCTAssertEqual(MissionCategory.normal.completionBonusCoin, 0)
    }

    func testAdventureTreasureAndRewardCannotBeClaimedTwice() {
        var progress = AdventureProgress()
        XCTAssertTrue(progress.arrive(at: 1))
        XCTAssertTrue(progress.arrive(at: 2))
        XCTAssertTrue(progress.collectTreasure())
        XCTAssertFalse(progress.collectTreasure())
        XCTAssertEqual(progress.potions, 1)
        XCTAssertEqual(progress.earnedCoins, 80)
        XCTAssertEqual(progress.pendingRewardIDs, [2])
        progress.acknowledgeReward(2)
        progress.acknowledgeReward(2)
        XCTAssertTrue(progress.pendingRewardIDs.isEmpty)
        XCTAssertEqual(AdventureWorld.rewardKey(for: 2), "story-adventure.elementary-forest-v1.node-2")
        XCTAssertTrue(progress.isValid)
    }

    func testAdventureBattleResumeDoesNotApplyAnswerTwice() throws {
        let question = AdventureQuestion(id: "test-sansu", question: "3 + 2 は？", choices: ["4", "5"], correctAnswerIndex: 1, explanation: "5")
        var progress = AdventureProgress()
        XCTAssertTrue(progress.arrive(at: 1))
        XCTAssertTrue(progress.arrive(at: 3))
        XCTAssertTrue(progress.startBattle(questions: [question]))
        XCTAssertEqual(progress.answer(0), false)
        XCTAssertNil(progress.answer(0))
        XCTAssertEqual(progress.hp, 80)

        let snapshot = try JSONEncoder().encode(progress)
        progress = try JSONDecoder().decode(AdventureProgress.self, from: snapshot)
        XCTAssertTrue(progress.isValid)
        XCTAssertEqual(progress.advanceBattle(), .question)
        for step in 0..<2 {
            XCTAssertEqual(progress.answer(1), true)
            XCTAssertEqual(progress.advanceBattle(), step == 0 ? .question : .victory)
        }
        XCTAssertEqual(progress.pendingRewardIDs, [3])
        XCTAssertFalse(progress.startBattle(questions: [question]))
    }

    func testAdventureSaveIsAccountScopedAndPreservesCorruption() throws {
        let suite = "drill-adventure-tests-\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let alice = AdventureSaveRepository(defaults: defaults, accountID: "alice")
        let bob = AdventureSaveRepository(defaults: defaults, accountID: "bob")
        var progress = AdventureProgress()
        XCTAssertTrue(progress.arrive(at: 1))
        try alice.save(progress)
        XCTAssertEqual(try alice.load(), progress)
        XCTAssertEqual(try bob.load().currentNodeID, 0)
        XCTAssertNotEqual(alice.key, bob.key)

        let invalidData = Data("invalid save".utf8)
        defaults.set(invalidData, forKey: alice.key)
        XCTAssertThrowsError(try alice.load())
        XCTAssertEqual(defaults.data(forKey: alice.key), invalidData)
    }

    func testErrorDiagnosticsKeepUnderlyingDomainAndCode() {
        let original = URLError(.notConnectedToInternet)
        let issue = SubscribeError.classify(StoreKitError.networkError(original))
        XCTAssertEqual(issue.reasonCode, "network_error")
        XCTAssertEqual(issue.diagnosticParameters["error_domain"] as? String, NSURLErrorDomain)
        XCTAssertEqual(issue.diagnosticParameters["error_code"] as? Int, original.errorCode)
        XCTAssertEqual(SubscribeError.pending.reasonCode, "pending")
    }
}

@MainActor
final class RewardedCoinClaimTests: XCTestCase {
    func testFailedGrantCanRetryWithoutAnotherAdAndKeepsTheSameReceipt() async {
        let claim = RewardedCoinClaim(placement: .quizResult)
        var attempts: [(key: String, amount: Int)] = []
        var completions: [(Bool, RewardGrantFailure?) -> Void] = []
        let grant: RewardedCoinClaim.Grant = { key, amount, completion in
            attempts.append((key, amount))
            completions.append(completion)
        }

        claim.earned(amount: 75, grant: grant)
        claim.earned(amount: 999, grant: grant)
        XCTAssertEqual(claim.state, .granting)
        XCTAssertEqual(attempts.count, 1)
        XCTAssertEqual(claim.amount, 75)

        completions[0](false, RewardGrantFailure(.transactionError))
        let failureApplied = expectation(description: "grant failure applied")
        DispatchQueue.main.async { failureApplied.fulfill() }
        await fulfillment(of: [failureApplied], timeout: 1)
        XCTAssertEqual(claim.state, .failed)

        claim.retry(grant: grant)
        XCTAssertEqual(claim.state, .granting)
        XCTAssertEqual(attempts.count, 2)
        XCTAssertEqual(attempts[0].key, attempts[1].key)
        XCTAssertEqual(attempts[1].amount, 75)

        completions[1](true, nil)
        let successApplied = expectation(description: "grant success applied")
        DispatchQueue.main.async { successApplied.fulfill() }
        await fulfillment(of: [successApplied], timeout: 1)
        XCTAssertEqual(claim.state, .granted)

        claim.retry(grant: grant)
        claim.earned(amount: 75, grant: grant)
        XCTAssertEqual(attempts.count, 2)
    }
}

@MainActor
final class SubscriptionStateAndTelemetryTests: XCTestCase {
    func testAdsWaitForResolvedEntitlementsAndFollowPurchaseAndExpiry() async {
        var subscribed = true
        var syncedFlags: [Bool] = []
        let state = AppState(startAutomatically: false, premiumSync: { syncedFlags.append($0) },
                             subscriptionStatusProvider: { subscribed })

        XCTAssertFalse(state.shouldShowAds, "Do not show ads to a subscriber while StoreKit is loading")
        await state.refreshSubscriptionState()
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.shouldShowAds)

        subscribed = false
        await state.refreshSubscriptionState()
        XCTAssertFalse(state.isSubscribed)
        XCTAssertTrue(state.shouldShowAds)

        subscribed = true
        await state.refreshSubscriptionState()
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.shouldShowAds, "An approval/restore must suppress already loaded ads")
        XCTAssertEqual(syncedFlags, [true, false, true])
    }

    func testFailedRefreshDoesNotTreatUnknownOrPremiumAsFree() async {
        var shouldFail = true
        var syncedFlags: [Bool] = []
        let state = AppState(startAutomatically: false, premiumSync: { syncedFlags.append($0) },
                             subscriptionStatusProvider: {
            if shouldFail { throw URLError(.notConnectedToInternet) }
            return true
        })
        let firstResult = await state.refreshSubscriptionState()
        XCTAssertNil(firstResult)
        XCTAssertFalse(state.hasResolvedSubscription)
        XCTAssertFalse(state.shouldShowAds)
        XCTAssertTrue(syncedFlags.isEmpty)

        shouldFail = false
        await state.refreshSubscriptionState()
        shouldFail = true
        let offlineResult = await state.refreshSubscriptionState()
        XCTAssertNil(offlineResult)
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.shouldShowAds)
        XCTAssertEqual(syncedFlags, [true])
    }

    func testOlderRefreshCannotRelockFeaturesOrReenableAds() async {
        let firstStarted = expectation(description: "First entitlement refresh suspended")
        var pending: CheckedContinuation<Bool, Error>?
        var requests = 0
        var syncedFlags: [Bool] = []
        let state = AppState(startAutomatically: false, premiumSync: { syncedFlags.append($0) },
                             subscriptionStatusProvider: {
            requests += 1
            if requests == 1 {
                return try await withCheckedThrowingContinuation { continuation in
                    pending = continuation
                    firstStarted.fulfill()
                }
            }
            return true
        })
        let staleRefresh = Task { await state.refreshSubscriptionState() }
        await fulfillment(of: [firstStarted], timeout: 2)
        await state.refreshSubscriptionState()
        pending?.resume(returning: false)
        _ = await staleRefresh.value
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.shouldShowAds)
        XCTAssertEqual(syncedFlags, [true])
    }

    func testReleaseSandboxFailureKeepsEnvironmentAndErrorDetails() async {
        let context = SubscriptionEnvironmentContext()
        await context.resolve { "Sandbox" }
        let error = URLError(.notConnectedToInternet)
        let parameters = context.addingContext(
            to: SubscribeError.classify(error).diagnosticParameters,
            buildType: "release"
        )
        XCTAssertEqual(parameters["environment"] as? String, "Sandbox")
        XCTAssertEqual(parameters["environment_source"] as? String, "app_transaction")
        XCTAssertEqual(parameters["build_type"] as? String, "release")
        XCTAssertEqual(parameters["error_code"] as? Int, error.errorCode)
        XCTAssertEqual(parameters["error_reason"] as? String, "network_error")
    }

    func testUnavailableOrUnverifiedEnvironmentIsNeverAssumedProduction() async {
        let context = SubscriptionEnvironmentContext()
        await context.resolve { throw URLError(.notConnectedToInternet) }
        await context.resolve { nil }
        let parameters = context.addingContext(to: ["error_reason": "purchase_not_allowed"], buildType: "release")
        XCTAssertEqual(parameters["environment"] as? String, "unknown")
        XCTAssertEqual(parameters["environment_source"] as? String, "unavailable")

        await context.resolve { "Production" }
        XCTAssertEqual(context.environment, "Production", "A later attempt can resolve missing context")
    }

    func testPurchaseTransactionEnvironmentOverridesAppEnvironment() async {
        let context = SubscriptionEnvironmentContext()
        await context.resolve { "Sandbox" }
        let parameters = context.addingContext(to: ["environment": "Xcode"], buildType: "debug")
        XCTAssertEqual(parameters["environment"] as? String, "Xcode")
        XCTAssertEqual(parameters["environment_source"] as? String, "transaction")
    }
}

/// Runs against Apple's local StoreKit service; no real purchases or Firebase writes.
///
/// Verified on 2026-09-19 with a standalone single-product probe (iOS 17.2 / 18.3.1):
/// - `SKTestSession.clearTransactions()` puts storekitd into a storefront-notification
///   loop; purchases then take ~18 s or never return, and entitlements/finish/sync hang.
/// - `setSimulatedError(nil, forAPI:)` makes the next purchase throw `StoreKitError.unknown`.
/// - On the iOS 26.5 runtime the session cannot save its configuration at all
///   (`SKInternalErrorDomain` 3) and StoreKit falls back to the real sandbox.
/// - Any SK1 `SKPaymentQueue` transaction observer in the host process (Firebase Analytics
///   registers one at launch for automatic in-app purchase logging) triggers the same loop, and
///   removing it afterwards does not help. drill's own host therefore skips the purchase tests;
///   they run against drill's AppState.swift in a Firebase-free host instead.
/// These tests never call the two APIs above. Transactions persist between tests, so run
/// each test on a freshly erased iOS 17/18 simulator (see reports/subscription-payment-fix).
@MainActor
final class SubscriptionPurchaseTests: XCTestCase {
    private var session: SKTestSession!
    private var state: AppState!
    private var model: SubscriptionViewModel!
    private var syncedFlags: [Bool] = []
    private var defaults: UserDefaults!
    private var defaultsSuite: String!
    private let monthlyID = "drill_premium_monthly_980"
    private let started = Date()

    override func setUp() async throws {
        try await super.setUp()
        XCTAssertTrue(SubscriptionRuntime.isTesting, "The test host must not sync to production Firebase")
        // Do not touch SKPaymentQueue here: creating it registers the same storefront listener.
        guard NSClassFromString("APMInAppPurchaseTransactionReporter") == nil else {
            throw XCTSkip("Firebase Analytics registers an SK1 payment queue observer in this host; StoreKit Testing purchases hang with it.")
        }
        let url = try XCTUnwrap(Bundle(for: Self.self).url(forResource: "StoreKit", withExtension: "storekit"))
        session = try SKTestSession(contentsOf: url)
        session.resetToDefaultState()
        session.disableDialogs = true
        // A broken local StoreKit service keeps the default US storefront instead of the file's JPN.
        guard session.storefront == "JPN" else {
            throw XCTSkip("Local StoreKit Testing did not load StoreKit.storekit (storefront=\(session.storefront)); this runtime cannot run purchase tests.")
        }
        defaultsSuite = "subscription-tests-\(UUID().uuidString)"
        defaults = try XCTUnwrap(UserDefaults(suiteName: defaultsSuite))
        syncedFlags = []
        state = AppState(startAutomatically: false, premiumSync: { [weak self] flag in
            self?.syncedFlags.append(flag)
        }, transactionDefaults: defaults)
        model = SubscriptionViewModel(appState: state)
        // StoreKit purchase(confirmIn:) needs the test host's foreground window.
        try await waitUntil {
            UIApplication.shared.connectedScenes.contains { $0.activationState == .foregroundActive }
        }
    }

    override func tearDown() async throws {
        model = nil
        state = nil
        session?.resetToDefaultState()
        session = nil
        if let defaultsSuite { defaults?.removePersistentDomain(forName: defaultsSuite) }
        try await super.tearDown()
    }

    func testAllThreePlansLoadInJapaneseStorefront() async throws {
        await timed("loadProducts") { await self.model.loadProducts() }
        XCTAssertEqual(model.products.map(\.id), model.productIdList, "sorted weekly, monthly, yearly")
        XCTAssertNil(model.productLoadErrorMessage)
    }

    func testWeeklyPurchaseUnlocksImmediately() async throws {
        try await assertPurchaseUnlocks("drill_premium_weekly_480")
    }

    func testMonthlyPurchaseUnlocksImmediately() async throws {
        try await assertPurchaseUnlocks(monthlyID)
    }

    func testYearlyPurchaseUnlocksImmediately() async throws {
        try await assertPurchaseUnlocks("drill_premium_yearly_9800")
    }

    func testVerifiedPurchaseDoesNotDependOnSecondStatusRequest() async throws {
        let product = try await product(monthlyID)
        try await session.setSimulatedError(.generic(.networkError(URLError(.notConnectedToInternet))), forAPI: .subscriptionStatus)
        await timed("purchaseProduct") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.isBannerVisible)
        let active = await state.refreshSubscriptionState()
        XCTAssertEqual(active, true)
    }

    func testAskToBuyRemainsPendingThenUnlocksWhenApproved() async throws {
        state.startTransactionListener()
        session.askToBuyEnabled = true
        let product = try await product(monthlyID)
        await timed("purchaseProduct(askToBuy)") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertFalse(state.isSubscribed)
        XCTAssertFalse(syncedFlags.contains(true))
        XCTAssertEqual(model.notice?.title, "購入の承認待ちです")
        XCTAssertFalse(model.isProcessing)
        let pending = try XCTUnwrap(session.allTransactions().first { $0.pendingAskToBuyConfirmation })
        try session.approveAskToBuyTransaction(identifier: pending.identifier)
        try await timed("Transaction.updates -> unlocked") { try await self.waitUntil { self.state.isSubscribed } }
        XCTAssertFalse(state.isBannerVisible)
        XCTAssertEqual(syncedFlags.last, true)
    }

    func testCancellationDoesNotUnlockOrShowFailure() async throws {
        let product = try await product(monthlyID)
        try await session.setSimulatedError(.generic(.userCancelled), forAPI: .purchase)
        await timed("purchaseProduct(cancel)") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertFalse(state.isSubscribed)
        XCTAssertFalse(syncedFlags.contains(true))
        XCTAssertNil(model.notice)
        XCTAssertFalse(model.isProcessing)
    }

    func testNetworkFailureShowsRecoveryMessage() async throws {
        let product = try await product(monthlyID)
        try await session.setSimulatedError(.generic(.networkError(URLError(.notConnectedToInternet))), forAPI: .purchase)
        await timed("purchaseProduct(network)") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertFalse(state.isSubscribed)
        XCTAssertTrue(model.notice?.message.contains("通信状態") == true)
        XCTAssertFalse(model.isProcessing)
    }

    func testPurchaseRestrictionExplainsWhyPurchaseCannotProceed() async throws {
        let product = try await product(monthlyID)
        try await session.setSimulatedError(.purchase(.purchaseNotAllowed), forAPI: .purchase)
        await timed("purchaseProduct(notAllowed)") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertFalse(state.isSubscribed)
        XCTAssertTrue(model.notice?.message.contains("購入が制限") == true)
        XCTAssertFalse(model.isProcessing)
    }

    func testRestoreFindsExistingPurchaseAndDistinguishesNoContract() async throws {
        await timed("restore(empty)") { await self.model.restorePurchases(source: "storekit_test") }
        XCTAssertFalse(state.isSubscribed)
        XCTAssertEqual(model.notice?.title, "有効な契約が見つかりませんでした")
        _ = try await session.buyProduct(identifier: monthlyID)
        await timed("restore(after buy)") { await self.model.restorePurchases(source: "storekit_test") }
        XCTAssertTrue(state.isSubscribed)
        XCTAssertFalse(state.isBannerVisible)
        XCTAssertEqual(model.notice?.title, "購入を復元しました")
    }

    func testExpiredSubscriptionDoesNotRetainPremium() async throws {
        _ = try await session.buyProduct(identifier: monthlyID)
        await state.refreshSubscriptionState()
        XCTAssertTrue(state.isSubscribed)
        try session.expireSubscription(productIdentifier: monthlyID)
        // The local service applies the expiry asynchronously (a few ms).
        try await waitUntilAsync { await self.state.refreshSubscriptionState() == false }
        XCTAssertTrue(state.isBannerVisible)
        XCTAssertEqual(syncedFlags.last, false)
    }

    func testRefundRemovesPremium() async throws {
        _ = try await session.buyProduct(identifier: monthlyID)
        await state.refreshSubscriptionState()
        XCTAssertTrue(state.isSubscribed)
        let transaction = try XCTUnwrap(session.allTransactions().first)
        try session.refundTransaction(identifier: transaction.identifier)
        try await waitUntilAsync { await self.state.refreshSubscriptionState() == false }
        XCTAssertTrue(state.isBannerVisible)
    }

    private func assertPurchaseUnlocks(_ id: String) async throws {
        let product = try await product(id)
        await timed("purchaseProduct(\(id))") { await self.model.purchaseProduct(product, source: "storekit_test") }
        XCTAssertEqual(model.notice?.title, "プレミアムプランが有効になりました", model.notice?.message ?? id)
        XCTAssertTrue(state.isSubscribed, id)
        XCTAssertFalse(state.isBannerVisible, id)
        XCTAssertEqual(syncedFlags.last, true, id)
        XCTAssertFalse(model.isProcessing)
        let unfinished = await timed("Transaction.unfinished") { () -> Int in
            var count = 0
            for await _ in Transaction.unfinished { count += 1 }
            return count
        }
        XCTAssertEqual(unfinished, 0, "completeSubscriptionPurchase must finish the transaction")
        let active = await timed("currentEntitlements") { await self.state.refreshSubscriptionState() }
        XCTAssertEqual(active, true, id)
        XCTAssertEqual(session.allTransactions().filter { $0.productIdentifier == id }.count, 1, id)
    }

    private func product(_ id: String) async throws -> Product {
        let products = try await timed("Product.products(\(id))") { try await Product.products(for: [id]) }
        return try XCTUnwrap(products.first, "local StoreKit did not return \(id)")
    }

    /// Timestamped step log so a stall is attributed to one StoreKit call.
    @discardableResult
    private func timed<T>(_ label: String, _ operation: () async throws -> T) async rethrows -> T {
        let begin = Date()
        print(String(format: "STOREKIT +%.3fs BEGIN %@", begin.timeIntervalSince(started), label))
        defer { print(String(format: "STOREKIT +%.3fs END   %@ (%dms)", Date().timeIntervalSince(started), label, Int(Date().timeIntervalSince(begin) * 1000))) }
        return try await operation()
    }

    private func waitUntil(_ condition: @escaping @MainActor () -> Bool) async throws {
        let deadline = Date().addingTimeInterval(10)
        while !condition(), Date() < deadline {
            try await Task.sleep(nanoseconds: 100_000_000)
        }
        XCTAssertTrue(condition(), "Timed out waiting for StoreKit/test host")
    }

    private func waitUntilAsync(_ condition: @escaping @MainActor () async -> Bool) async throws {
        let deadline = Date().addingTimeInterval(10)
        var satisfied = await condition()
        while !satisfied, Date() < deadline {
            try await Task.sleep(nanoseconds: 100_000_000)
            satisfied = await condition()
        }
        XCTAssertTrue(satisfied, "Timed out waiting for StoreKit state change")
    }
}

@MainActor
final class AdventureStoryTests: XCTestCase {
    private var defaults: UserDefaults!
    private var suite: String!

    override func setUp() {
        super.setUp()
        suite = "drill-story-tests-\(UUID().uuidString)"
        defaults = UserDefaults(suiteName: suite)!
    }

    override func tearDown() {
        defaults.removePersistentDomain(forName: suite)
        super.tearDown()
    }

    private func store() -> AdventureStore {
        AdventureStore(accountID: "student", defaults: defaults, isPreview: true)
    }

    private func finish(_ store: AdventureStore) {
        store.finishStory()
        store.storyDidDismiss()
    }

    private func move(_ store: AdventureStore, to node: Int) async throws {
        store.presentation = nil
        store.selectedNodeID = node
        store.move(reduceMotion: true)
        // Allow the store's asynchronous movement task to reach the destination.
        for _ in 0..<100 where store.isMoving { await Task.yield() }
        XCTAssertEqual(store.progress.currentNodeID, node)
        XCTAssertNil(store.loadError)
    }

    func testDialogueResumesOnSavedPageAndPreviousPageIsSaved() throws {
        let first = store()
        first.presentStoryIfNeeded()
        first.advanceStory()
        first.advanceStory()
        first.previousStoryPage()
        XCTAssertEqual(first.progress.story?.bookmark?.page, 1)
        XCTAssertFalse(first.canMove)
        let resumed = store()
        resumed.presentStoryIfNeeded()
        XCTAssertEqual(resumed.storyPlayback?.bookmark.scene, .departure)
        XCTAssertEqual(resumed.storyPlayback?.bookmark.page, 1)
        finish(resumed)
        XCTAssertTrue(resumed.progress.story?.completed.contains(.departure) == true)
        XCTAssertNil(resumed.progress.story?.bookmark)
        XCTAssertEqual(resumed.progress.clearedNodeIDs, [0])
        XCTAssertEqual(resumed.progress.earnedCoins, 0)
    }

    func testOldSaveMigratesWithoutChangingMapLootOrCourse() throws {
        var old = AdventureProgress()
        old.course = .rika
        XCTAssertTrue(old.arrive(at: 1))
        XCTAssertTrue(old.arrive(at: 2))
        XCTAssertTrue(old.collectTreasure())
        let repository = AdventureSaveRepository(defaults: defaults, accountID: "student")
        // A real pre-dialogue JSON document has no `story` member.
        var json = try XCTUnwrap(JSONSerialization.jsonObject(with: JSONEncoder().encode(old)) as? [String: Any])
        json.removeValue(forKey: "story")
        defaults.set(try JSONSerialization.data(withJSONObject: json), forKey: repository.key)
        let migrated = store()
        var mapOnly = migrated.progress
        mapOnly.story = nil
        XCTAssertEqual(mapOnly, old)
        XCTAssertTrue(migrated.progress.story?.completed.contains(.entrance) == true)
        migrated.presentStoryIfNeeded()
        XCTAssertNil(migrated.storyPlayback)
        XCTAssertTrue(AdventureStoryScene.departure.isUnlocked(in: migrated.progress))
        XCTAssertFalse(AdventureStoryScene.guardian.isUnlocked(in: migrated.progress))
    }

    func testReplayDoesNotChangeProgressOrGrantRewards() {
        let game = store()
        game.presentStoryIfNeeded()
        finish(game)
        let before = game.progress
        game.presentation = .journal
        game.replayStory(.departure)
        XCTAssertNil(game.storyPlayback)
        game.eventDidDismiss()
        XCTAssertTrue(game.storyPlayback?.isReplay == true)
        game.advanceStory()
        finish(game)
        XCTAssertEqual(game.progress, before)
        XCTAssertEqual(game.presentation?.id, "journal")
        game.replayStory(.guardianVictory)
        XCTAssertNil(game.storyPlayback)
        game.eventDidDismiss()
        XCTAssertNil(game.storyPlayback)
    }

    func testKeyBossAndEndingFollowSheetDismissals() async throws {
        let game = store()
        game.presentStoryIfNeeded()
        finish(game)
        try await move(game, to: 1)
        XCTAssertEqual(game.storyPlayback?.bookmark.scene, .entrance)
        finish(game)
        try await move(game, to: 2)
        game.openTreasure()
        try await move(game, to: 4)
        try await move(game, to: 5)
        XCTAssertEqual(game.storyPlayback?.bookmark.scene, .shrine)
        finish(game)
        XCTAssertFalse(game.progress.hasKey, "Skipping dialogue must not award the key")
        XCTAssertEqual(game.presentation?.id, "encounter-5")
        game.takeKey()
        XCTAssertTrue(game.progress.hasKey)
        XCTAssertNil(game.storyPlayback, "Wait until the key sheet has dismissed")
        game.eventDidDismiss()
        XCTAssertEqual(game.storyPlayback?.bookmark.scene, .keyAcquired)
        finish(game)
        try await move(game, to: 8)
        finish(game)
        try await move(game, to: 9)
        XCTAssertEqual(game.storyPlayback?.bookmark.scene, .guardian)
        finish(game)
        game.startBattle()
        XCTAssertNotNil(game.progress.battle)
        for _ in 0..<3 {
            let correct = try XCTUnwrap(game.progress.battle?.currentQuestion?.correctAnswerIndex)
            game.answer(correct)
            game.nextQuestion()
        }
        XCTAssertTrue(game.progress.hasForestLight)
        XCTAssertNil(game.storyPlayback)
        game.eventDidDismiss()
        XCTAssertEqual(game.storyPlayback?.bookmark.scene, .guardianVictory)
        let resumed = store()
        resumed.presentStoryIfNeeded()
        XCTAssertEqual(resumed.storyPlayback?.bookmark.scene, .guardianVictory)
        finish(resumed)
        XCTAssertEqual(resumed.presentation?.id, "victory-9")
        let coins = resumed.progress.earnedCoins
        try await move(resumed, to: 10)
        XCTAssertEqual(resumed.storyPlayback?.bookmark.scene, .port)
        finish(resumed)
        XCTAssertTrue(resumed.progress.isChapterComplete)
        XCTAssertEqual(resumed.progress.earnedCoins, coins)
        try await move(resumed, to: 0)
        XCTAssertEqual(resumed.storyPlayback?.bookmark.scene, .villageReturn)
        finish(resumed)
        XCTAssertEqual(resumed.progress.hp, 100)
        XCTAssertTrue(resumed.progress.isValid)
    }

    func testSavedBattleTakesPriorityOverStoryAndKeepsAnsweredDamage() throws {
        var progress = AdventureProgress()
        XCTAssertTrue(progress.arrive(at: 1))
        XCTAssertTrue(progress.arrive(at: 3))
        XCTAssertTrue(progress.startBattle(questions: AdventureQuizBank.preview))
        XCTAssertEqual(progress.answer(0), false)
        try AdventureSaveRepository(defaults: defaults, accountID: "student").save(progress)
        let game = store()
        game.presentStoryIfNeeded()
        XCTAssertNil(game.storyPlayback)
        XCTAssertEqual(game.presentation?.id, "battle")
        XCTAssertEqual(game.progress.hp, 80)
        game.answer(0)
        XCTAssertEqual(game.progress.hp, 80)
    }

    func testAllScenesAndSubjectBanksHaveValidContentAndArtwork() {
        XCTAssertEqual(AdventureStoryScene.journalScenes.count, 10)
        for scene in AdventureStoryScene.allCases {
            XCTAssertFalse(scene.lines.isEmpty)
            XCTAssertTrue(scene.lines.allSatisfy { !$0.text.isEmpty })
            XCTAssertNotNil(UIImage(named: scene.artwork), scene.artwork)
            XCTAssertTrue(AdventureStoryBookmark(scene: scene).isValid)
        }
        for course in AdventureCourse.allCases {
            let questions = AdventureQuizBank.questions(for: course)
            XCTAssertFalse(questions.isEmpty, course.title)
            XCTAssertTrue(questions.allSatisfy(\.isValid))
        }
        XCTAssertEqual(AdventureSpriteAsset.mossSlime.rawValue, "StorySpriteMossSlimeV2")
        XCTAssertEqual(AdventureSpriteAsset.leafGuard.rawValue, "StorySpriteLeafGuardV2")
        XCTAssertEqual(AdventureSpriteAsset.forestGuardian.rawValue, "StorySpriteForestGuardianV2")
        XCTAssertEqual(AdventureSpriteAsset.treasureClosed.rawValue, "StorySpriteTreasureClosedV2")
        XCTAssertEqual(AdventureSpriteAsset.treasureOpen.rawValue, "StorySpriteTreasureOpenV2")
        for asset in [AdventureSpriteAsset.mossSlime, .leafGuard, .forestGuardian, .treasureClosed, .treasureOpen] {
            XCTAssertNotNil(asset.image, asset.rawValue)
        }
        var corrupt = AdventureProgress()
        corrupt.story = AdventureStoryProgress(bookmark: .init(scene: .departure, page: -1))
        XCTAssertFalse(corrupt.isValid)
        corrupt.story = AdventureStoryProgress(bookmark: .init(scene: .guardian))
        XCTAssertFalse(corrupt.isValid)
    }
}

final class ElementaryWeaknessCourseTests: XCTestCase {
    private let now = Date(timeIntervalSince1970: 1_790_000_000)
    private var calendar: Calendar {
        var value = Calendar(identifier: .gregorian)
        value.timeZone = TimeZone(secondsFromGMT: 0)!
        return value
    }

    private func complete(_ state: inout CourseAccountState, topic: WeaknessCourseTopic,
                          at date: Date, unknown: Bool = false) throws -> CourseCompletion {
        let session = try XCTUnwrap(state.begin(topic: topic, subscribed: true, now: date))
        for (offset, question) in session.questions.enumerated() {
            state.activeSession?.answer(unknown && offset == 0 ? -1 : question.correctIndex)
            state.activeSession?.advance()
        }
        return try XCTUnwrap(state.finish(sessionID: session.id, now: date, calendar: calendar))
    }

    func testElementaryCatalogAndExactSourceMapping() throws {
        XCTAssertEqual(WeaknessCourseCatalog.topics.count, 10)
        let questions = WeaknessCourseCatalog.topics.flatMap { $0.practice + $0.checks }
        XCTAssertEqual(questions.count, 50)
        XCTAssertTrue(questions.allSatisfy(\.isValid))
        XCTAssertEqual(Set(questions.map(\.id)).count, 50)
        for source in CourseQuestionIndex.sources {
            let question = source.question
            XCTAssertTrue(question.isValid)
            XCTAssertEqual(WeaknessCourseCatalog.source(prompt: question.prompt, choices: question.choices,
                correctIndex: question.correctIndex, explanation: question.explanation)?.topicID, source.topicID)
            XCTAssertNil(WeaknessCourseCatalog.source(prompt: question.prompt, choices: ["別の答え", "もう1つ"],
                correctIndex: 0, explanation: "別の問題"))
        }
        XCTAssertNil(WeaknessCourseCatalog.topic("dns"))
        XCTAssertNil(WeaknessCourseCatalog.source(prompt: "九九ということばが入るだけの問題",
            choices: ["はい", "いいえ"], correctIndex: 0, explanation: "未分類"))
    }

    func testMasteryRequiresNextDayAndThreeDayCheckups() throws {
        var state = CourseAccountState()
        let topic = try XCTUnwrap(WeaknessCourseCatalog.topic("multiplication"))
        let practice = try complete(&state, topic: topic, at: now)
        XCTAssertEqual(practice.questionCount, 3)
        XCTAssertEqual(practice.progress.stage, .waiting)
        let nextDay = try XCTUnwrap(calendar.date(byAdding: .day, value: 1, to: now))
        XCTAssertEqual(practice.progress.nextReviewAt, nextDay)
        XCTAssertNil(state.begin(topic: topic, subscribed: true, now: nextDay.addingTimeInterval(-1)))
        let first = try complete(&state, topic: topic, at: nextDay)
        XCTAssertEqual(first.questionCount, 2)
        XCTAssertEqual(first.progress.confirmedCount, 1)
        let threeDaysLater = try XCTUnwrap(calendar.date(byAdding: .day, value: 3, to: nextDay))
        XCTAssertEqual(first.progress.nextReviewAt, threeDaysLater)
        XCTAssertNil(state.begin(topic: topic, subscribed: true, now: threeDaysLater.addingTimeInterval(-1)))
        let second = try complete(&state, topic: topic, at: threeDaysLater)
        XCTAssertEqual(second.progress.stage, .mastered)
        XCTAssertEqual(second.progress.masteredAt, threeDaysLater)
        XCTAssertNil(state.begin(topic: topic, subscribed: true, now: threeDaysLater))
    }

    func testUnknownReturnsToPracticeAndCompletionCannotRepeat() throws {
        var state = CourseAccountState()
        let topic = try XCTUnwrap(WeaknessCourseCatalog.topic("water"))
        let session = try XCTUnwrap(state.begin(topic: topic, subscribed: true, now: now))
        state.activeSession?.answer(-1)
        state.activeSession?.answer(session.questions[0].correctIndex)
        XCTAssertEqual(state.activeSession?.answers[session.questions[0].id], -1)
        state.activeSession?.advance()
        for question in session.questions.dropFirst() {
            state.activeSession?.answer(question.correctIndex)
            state.activeSession?.advance()
        }
        XCTAssertEqual(state.finish(sessionID: session.id, now: now)?.progress.stage, .needsPractice)
        XCTAssertNil(state.finish(sessionID: session.id, now: now))
    }

    func testResumeAndHistoricalImportPreserveProgress() throws {
        var state = CourseAccountState()
        let topic = try XCTUnwrap(WeaknessCourseCatalog.topic("addition"))
        let session = try XCTUnwrap(state.begin(topic: topic, subscribed: true, now: now))
        state.activeSession?.answer(session.questions[0].correctIndex)
        let encoded = try JSONEncoder().encode(state)
        state = try JSONDecoder().decode(CourseAccountState.self, from: encoded)
        XCTAssertEqual(state.begin(topic: topic, subscribed: true, now: now)?.id, session.id)
        XCTAssertEqual(state.activeSession?.questionIndex, 0)
        XCTAssertEqual(state.activeSession?.answers.count, 1)
        state.importMistake(topicID: topic.id, question: topic.practice[1], now: now)
        XCTAssertEqual(state.activeSession?.id, session.id)
        state.recordMistake(topicID: topic.id, question: topic.practice[1], selectedIndex: -1, now: now)
        XCTAssertNil(state.activeSession)
        XCTAssertEqual(state.cloud.progress[topic.id]?.stage, .needsPractice)
    }

    func testAccountStorageAndCloudRoundTrip() throws {
        let suite = "elementary-course-tests-\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        var state = CourseAccountState()
        let topic = WeaknessCourseCatalog.topics[0]
        _ = try complete(&state, topic: topic, at: now)
        CourseLocalPersistence.save(state, userID: "alice", defaults: defaults)
        XCTAssertEqual(CourseLocalPersistence.load(userID: "alice", defaults: defaults), state)
        XCTAssertEqual(CourseLocalPersistence.load(userID: "bob", defaults: defaults), CourseAccountState())
        let payload = try XCTUnwrap(CourseCloudCodec.encode(state.cloud))
        XCTAssertEqual(CourseCloudCodec.decode(CourseCloudState.self, from: payload), state.cloud)
        var another = CourseCloudState()
        another.progress["kanji"] = CourseProgress(updatedAt: now)
        XCTAssertEqual(state.cloud.merging(another).progress.count, 2)
    }

    func testHomePriorityAndDailyActivityAccountBoundaries() throws {
        let input = ReviewHomeInput(subscribed: true,
            activeSession: ReviewThemeResume(topicID: "addition", step: .practice, questionIndex: 1, questionCount: 3),
            dueReviewCount: 2, availableReviewCount: 2, availableFinalStageCount: 1, freeRemaining: Int.max,
            dueThemes: [ReviewDueTheme(topicID: "water", checkupNumber: 1)],
            hasReviewHistory: true, hasThemeProgress: true, todayActivities: [], upcoming: [])
        let plan = ReviewHomeResolver.resolve(input)
        XCTAssertEqual(plan.cards.count, 3)
        guard case .continueTheme = plan.state else { return XCTFail("途中のテーマを先に案内する") }
        let suite = "elementary-activity-tests-\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let activity = ReviewDailyActivity(kind: .themePractice, topicID: "addition", answeredCount: 3,
            correctCount: 3, masteredCount: 0, completedAt: now)
        ReviewDailyActivityLog.record(activity, userID: "alice", defaults: defaults)
        XCTAssertEqual(ReviewDailyActivityLog.today(userID: "alice", now: now, defaults: defaults), [activity])
        XCTAssertTrue(ReviewDailyActivityLog.today(userID: "bob", now: now, defaults: defaults).isEmpty)
        XCTAssertTrue(ReviewDailyActivityLog.today(userID: "alice", now: now.addingTimeInterval(86_400), defaults: defaults).isEmpty)
    }
}
