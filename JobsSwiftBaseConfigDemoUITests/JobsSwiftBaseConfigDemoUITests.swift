//
//  JobsSwiftBaseConfigDemoUITests.swift
//  JobsSwiftBaseConfigDemoUITests
//
//  Created by Jobs on 2026年1月18日，星期日.
//

import XCTest

// 用途：通过独立 UI 测试进程启动 App，检查悬浮熔断按钮长按不崩溃，并测量启动性能。
// 运行：在 Xcode 测试导航器选择 JobsSwiftBaseConfigDemoUITests，或按 ⌘U 运行 Scheme 中启用的测试。
// 边界：属于 UI 测试 Target；当前 CI 仅选择单元测试 Target，本文件不会随普通 App 启动执行。

final class JobsSwiftBaseConfigDemoUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testSuspendFuseButtonLongPressDoesNotCrash() throws {
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons["RootListVC.suspendFuseBtn"]
        XCTAssertTrue(button.waitForExistence(timeout: 10))
        button.press(forDuration: 5.0)
        XCTAssertEqual(app.state, .runningForeground)
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
