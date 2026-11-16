//
//  RootWorldClockUITests.swift
//  JobsSwiftBaseConfigDemoUITests
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import XCTest

final class RootWorldClockUITests: XCTestCase {

    @MainActor
    func testHomeClockFinalColorSnapshot() {
        continueAfterFailure = false
        let app = XCUIApplication(bundleIdentifier: "com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo")
        app.launchArguments = ["--jobs-coverage-route", "RootListVC"]
        app.launch()
        dismissSystemAlerts()
        let clock = app.buttons["jobs.root.time"]
        XCTAssertTrue(clock.waitForExistence(timeout: 20))
        XCTAssertTrue(clock.isHittable)
        for (name, screenshot) in [("UIKit final home clock deep blue", clock.screenshot()),
                                    ("UIKit final home first layout", app.screenshot())] {
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.name = name
            attachment.lifetime = .keepAlways
            add(attachment)
        }
        let menuButton = app.buttons["jobs.root.functionMenu.open"]
        XCTAssertTrue(menuButton.waitForExistence(timeout: 5))
        menuButton.tap()
        let menu = app.tables["jobs.root.functionMenu.panel"]
        XCTAssertTrue(menu.waitForExistence(timeout: 5))
        XCTAssertEqual(menu.cells.count, 3)
        XCTAssertGreaterThanOrEqual(menu.frame.minY, menuButton.frame.maxY)
        XCTAssertGreaterThanOrEqual(menu.frame.minX, app.frame.minX)
        XCTAssertLessThanOrEqual(menu.frame.maxX, app.frame.maxX)
        XCTAssertLessThanOrEqual(menu.frame.maxY, app.frame.maxY)
        let expandedMenu = XCTAttachment(screenshot: app.screenshot())
        expandedMenu.name = "UIKit final home anchored menu"
        expandedMenu.lifetime = .keepAlways
        add(expandedMenu)
    }

    @MainActor
    func testClockDragNavigationAnd12HourPersistence() {
        continueAfterFailure = false
        let app = XCUIApplication(bundleIdentifier: "com.jobs.JobsSwiftBaseConfigDemo.JobsSwiftBaseConfigDemo")
        app.launchArguments = ["--jobs-coverage-route", "RootListVC"]
        app.launch()
        dismissSystemAlerts()
        let clock = app.buttons["jobs.root.time"]
        XCTAssertTrue(clock.waitForExistence(timeout: 20))
        XCTAssertTrue(clock.isHittable)
        let originalFrame = clock.frame
        let start = clock.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let destination = app.coordinate(withNormalizedOffset: CGVector(dx: 0.8, dy: 0.6))
        start.press(forDuration: 0.7,
                    thenDragTo: destination)
        XCTAssertFalse(app.tables["jobs.worldClock.list"].exists)
        XCTAssertGreaterThan(abs(clock.frame.minX - originalFrame.minX)
                              + abs(clock.frame.minY - originalFrame.minY), 20)
        let movedClock = clock.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let inNavigation = app.coordinate(withNormalizedOffset: CGVector(dx: 0.45, dy: 0.10))
        movedClock.press(forDuration: 0.7,
                         thenDragTo: inNavigation)
        XCTAssertLessThan(clock.frame.minY, originalFrame.minY)
        XCTAssertFalse(app.tables["jobs.worldClock.list"].exists)
        let dockedFrame = clock.frame
        clock.tap()
        let table = app.tables["jobs.worldClock.list"]
        XCTAssertTrue(table.waitForExistence(timeout: 10))
        let titles = ["世界时钟", "世界時鐘", "World Clock", "世界時計", "Horloge mondiale", "Reloj mundial",
                      "Weltzeituhr", "Мировые часы", "세계 시계", "འཛམ་གླིང་ཆུ་ཚོད།", "Orasan ng Mundo"]
        XCTAssertTrue(app.staticTexts.matching(NSPredicate(format: "label IN %@", titles as NSArray)).firstMatch.waitForExistence(timeout: 5))
        XCTAssertFalse(app.staticTexts["RootWorldClockVC"].exists)
        let toggle = app.switches["jobs.worldClock.format12"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 5))
        let initiallyOn = toggle.value as? String == "1"
        if !initiallyOn {
            toggle.tap()
        }
        XCTAssertEqual(toggle.value as? String, "1")
        let amPM = table.staticTexts.matching(NSPredicate(format: "label CONTAINS 'AM' OR label CONTAINS 'PM'")).firstMatch
        XCTAssertTrue(amPM.waitForExistence(timeout: 5))
        table.swipeUp()
        table.swipeUp()
        XCTAssertTrue(amPM.waitForExistence(timeout: 5))
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "0")
        let removedAMPM = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"),
                                                    object: amPM)
        XCTAssertEqual(XCTWaiter.wait(for: [removedAMPM], timeout: 5), .completed)
        table.swipeDown()
        table.swipeDown()
        XCTAssertFalse(amPM.exists)
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "1")
        XCTAssertTrue(amPM.waitForExistence(timeout: 5))
        let screenshot = XCTAttachment(screenshot: app.screenshot())
        screenshot.name = "World clock with uppercase AM PM"
        screenshot.lifetime = .keepAlways
        add(screenshot)

        app.navigationBars.firstMatch.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(clock.waitForExistence(timeout: 5))
        XCTAssertEqual(clock.frame.minX, dockedFrame.minX, accuracy: 1)
        XCTAssertEqual(clock.frame.minY, dockedFrame.minY, accuracy: 1)
        clock.tap()
        XCTAssertTrue(table.waitForExistence(timeout: 5))
        XCTAssertEqual(toggle.value as? String, "1")
        XCTAssertTrue(amPM.waitForExistence(timeout: 5))

        app.terminate()
        app.launchArguments = ["--jobs-coverage-route", "RootWorldClockVC"]
        app.launch()
        dismissSystemAlerts()
        XCTAssertTrue(toggle.waitForExistence(timeout: 15))
        XCTAssertEqual(toggle.value as? String, "1")
        XCTAssertTrue(amPM.waitForExistence(timeout: 5))
        if !initiallyOn {
            toggle.tap()
        }
        XCTAssertEqual(toggle.value as? String, initiallyOn ? "1" : "0")
    }

    @MainActor
    private func dismissSystemAlerts() {
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        for _ in 0..<3 {
            let alert = springboard.alerts.firstMatch
            guard alert.waitForExistence(timeout: 1),
                  let button = alert.buttons.allElementsBoundByIndex.last else {
                return
            }
            button.tap()
        }
    }
}
