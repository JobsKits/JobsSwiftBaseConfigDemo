//
//  JobsSwiftBaseConfigDemoUITestsLaunchTests.swift
//  JobsSwiftBaseConfigDemoUITests
//
//  Created by Jobs on 2026年1月18日，星期日.
//

import XCTest

// 用途：按测试配置启动 App 并保留启动截图，供检查不同界面配置下的首屏表现。
// 运行：在 Xcode 测试导航器运行本类，或按 ⌘U 执行 Scheme 中启用的 UI 测试。
// 边界：属于 JobsSwiftBaseConfigDemoUITests；当前 CI 未选择此 Target，截图附件只在测试时生成。

final class JobsSwiftBaseConfigDemoUITestsLaunchTests: XCTestCase {
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
