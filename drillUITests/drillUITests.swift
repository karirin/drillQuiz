//
//  drillUITests.swift
//  drillUITests
//
//  Created by Apple on 2024/09/12.
//

import XCTest

final class WeaknessReviewUITests: XCTestCase {
    func testSubjectSelectionAndReturnToReviewHome() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["-WeaknessReviewPreview"]
        app.launch()
        let focused = app.buttons["review.focusedTraining"]
        XCTAssertTrue(focused.waitForExistence(timeout: 15))
        let homeScreenshot = XCTAttachment(screenshot: app.screenshot())
        homeScreenshot.name = "苦手分野克服ホーム"
        homeScreenshot.lifetime = .keepAlways
        add(homeScreenshot)
        focused.tap()
        let sansu = app.buttons["review.subject.sansu"]
        XCTAssertTrue(sansu.waitForExistence(timeout: 5))
        XCTAssertTrue(sansu.isEnabled)
        XCTAssertTrue(sansu.label.contains("2問を復習"))
        XCTAssertTrue(app.buttons["review.subject.kokugo"].isEnabled)
        XCTAssertFalse(app.buttons["review.subject.shakai"].isEnabled)
        XCTAssertFalse(app.buttons["review.subject.rika"].isEnabled)
        let subjectsScreenshot = XCTAttachment(screenshot: app.screenshot())
        subjectsScreenshot.name = "教科別の集中特訓"
        subjectsScreenshot.lifetime = .keepAlways
        add(subjectsScreenshot)
        app.buttons["閉じる"].tap()
        XCTAssertTrue(focused.waitForExistence(timeout: 5))
        app.buttons["review.mastered"].tap()
        XCTAssertTrue(app.staticTexts["最初の1問を克服しよう"].waitForExistence(timeout: 5))
        app.buttons["閉じる"].tap()
        app.buttons["review.close"].tap()
        XCTAssertTrue(app.staticTexts["苦手分野克服を閉じました"].waitForExistence(timeout: 5))
    }
}

final class drillUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

final class AdventureStoryUITests: XCTestCase {
    override func setUpWithError() throws { continueAfterFailure = false }

    func testConversationResumesAndJournalReplayReturnsToList() {
        let app = XCUIApplication()
        app.launchArguments = ["-StoryAdventurePreview", "-StoryAdventurePreviewFresh"]
        app.launch()
        let next = app.buttons["adventure.story.next"]
        XCTAssertTrue(next.waitForExistence(timeout: 15))
        XCTAssertTrue(app.staticTexts["物語は自動で保存されます"].isHittable)
        next.tap()
        let dialogue = app.staticTexts["adventure.story.dialogue"]
        XCTAssertTrue(dialogue.label.contains("森のみんなと書いた"))
        let screenshot = XCTAttachment(screenshot: app.screenshot())
        screenshot.name = "まっしろな冒険ノート・会話"
        screenshot.lifetime = .keepAlways
        add(screenshot)
        app.terminate()
        app.launchArguments = ["-StoryAdventurePreview"]
        app.launch()
        XCTAssertTrue(next.waitForExistence(timeout: 15))
        XCTAssertTrue(dialogue.label.contains("森のみんなと書いた"))
        app.buttons["adventure.story.previous"].tap()
        XCTAssertTrue(dialogue.label.contains("青空教室"))
        app.buttons["adventure.story.skip"].tap()
        let journal = app.buttons["adventure.journal"]
        XCTAssertTrue(journal.waitForExistence(timeout: 5))
        journal.tap()
        let replay = app.buttons["adventure.story.replay.departure"]
        XCTAssertTrue(replay.waitForExistence(timeout: 5))
        replay.tap()
        XCTAssertTrue(next.waitForExistence(timeout: 5))
        XCTAssertTrue(dialogue.label.contains("青空教室"))
        app.buttons["adventure.story.skip"].tap()
        XCTAssertTrue(replay.waitForExistence(timeout: 5))
        XCTAssertFalse(app.buttons["adventure.story.replay.guardian"].isEnabled)
    }
}
