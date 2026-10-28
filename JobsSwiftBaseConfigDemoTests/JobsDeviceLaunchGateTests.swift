//
//  JobsDeviceLaunchGateTests.swift
//  JobsSwiftBaseConfigDemoTests
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import UIKit
import XCTest
import JobsByUIKit
import JobsSwiftDeviceGuard
@testable import JobsSwiftBaseConfigDemo

#if DEBUG
@MainActor
final class JobsDeviceLaunchGateTests: XCTestCase {

    func testDecisionIsEvaluatedOnceAndCannotBeReconfigured() {
        let report = JobsDeviceGuard.inspect()
        var inspections = 0
        var policyCalls = 0
        var policyResult = true
        let gate = JobsDeviceLaunchGate.makeForTesting(inspection: {
            inspections += 1
            return report
        })
        XCTAssertFalse(gate.allowsBusinessInitialization)
        XCTAssertTrue(gate.configureBeforeLaunch(policy: { _ in
            policyCalls += 1
            return policyResult
        }))
        XCTAssertTrue(gate.evaluateAtLaunch().isDeviceBlocked)
        policyResult = false
        XCTAssertFalse(gate.configureBeforeLaunch(policy: { _ in
            false
        }))
        XCTAssertTrue(gate.evaluateAtLaunch().isDeviceBlocked)
        XCTAssertTrue(gate.isDeviceBlocked)
        XCTAssertEqual(inspections,
                       1)
        XCTAssertEqual(policyCalls,
                       1)
    }

    func testDefaultPolicyUsesJailbrokenInsteadOfShouldRestrict() {
        let report = JobsDeviceGuard.inspect()
        let gate = JobsDeviceLaunchGate.makeForTesting(inspection: {
            report
        })
        let decision = gate.evaluateAtLaunch()
        XCTAssertEqual(decision.isDeviceBlocked,
                       report.isJailbroken)
        if report.verdict == .unsupported {
            XCTAssertTrue(report.shouldRestrict)
            XCTAssertFalse(decision.isDeviceBlocked)
            XCTAssertTrue(gate.allowsBusinessInitialization)
        }
        XCTAssertEqual(gate.makeBlockedViewController() == nil,
                       !report.isJailbroken)
    }

    func testBlockedFactoryProducesIndependentUnloadedControllers() throws {
        let report = JobsDeviceGuard.inspect()
        let gate = JobsDeviceLaunchGate.makeForTesting(inspection: {
            report
        },
                                                       policy: { _ in
            true
        })
        gate.evaluateAtLaunch()
        let first = try XCTUnwrap(gate.makeBlockedViewController())
        let second = try XCTUnwrap(gate.makeBlockedViewController())
        XCTAssertFalse(first === second)
        XCTAssertTrue(first is JobsDeviceBlockedVC)
        XCTAssertTrue(second is JobsDeviceBlockedVC)
        XCTAssertNil(first.viewIfLoaded)
        XCTAssertNil(second.viewIfLoaded)
    }

    func testParentedCustomControllerFallsBackWithoutChangingItsLoadedView() throws {
        let report = JobsDeviceGuard.inspect()
        let reused = UIViewController.jobsMake { _ in }
        let parent = UIViewController.jobsMake { controller in
            controller.addChildVC(reused)
        }
        let previousView = reused.viewIfLoaded
        let gate = JobsDeviceLaunchGate.makeForTesting(inspection: {
            report
        },
                                                       policy: { _ in
            true
        },
                                                       blockedViewControllerFactory: { _ in
            reused
        })
        gate.evaluateAtLaunch()
        let actual = try XCTUnwrap(gate.makeBlockedViewController())
        XCTAssertTrue(reused.parent === parent)
        XCTAssertFalse(actual === reused)
        XCTAssertTrue(actual is JobsDeviceBlockedVC)
        XCTAssertTrue(reused.viewIfLoaded === previousView)
    }

    func testBlockedApplicationCallbacksFinishWithoutStartingBusinessOrFlutter() throws {
        guard JobsDeviceLaunchGate.shared.isDeviceBlocked else {
            throw XCTSkip("使用 DEBUG + JOBS_DEVICE_GUARD_FORCE_BLOCK_TESTING 验证真实阻断回调。")
        }
        let delegate = try XCTUnwrap(UIApplication.shared.delegate as? AppDelegate)
        XCTAssertFalse(delegate.debugDidInitializeBusiness)
        var backgroundCompletions = 0
        var shortcutCompletions = 0
        var restorationCompletions = 0
        #if canImport(Flutter)
        XCTAssertFalse(delegate.debugDidCreateFlutterEngine)
        XCTAssertFalse(delegate.application(UIApplication.shared,
                                            open: URL(string: "jobs-test://blocked")!))
        delegate.application(UIApplication.shared,
                             handleEventsForBackgroundURLSession: "blocked") {
            backgroundCompletions += 1
        }
        delegate.application(UIApplication.shared,
                             performActionFor: makeShortcut()) { handled in
            XCTAssertFalse(handled)
            shortcutCompletions += 1
        }
        XCTAssertFalse(delegate.application(UIApplication.shared,
                                            continue: makeActivity()) { restored in
            XCTAssertNil(restored)
            restorationCompletions += 1
        })
        XCTAssertEqual(backgroundCompletions,
                       1)
        XCTAssertEqual(shortcutCompletions,
                       1)
        XCTAssertEqual(restorationCompletions,
                       1)
        XCTAssertFalse(delegate.debugDidCreateFlutterEngine)
        #endif
    }

    func testBlockedSceneCallbacksDoNotCreateFlutterForwarder() throws {
        guard JobsDeviceLaunchGate.shared.isDeviceBlocked else {
            throw XCTSkip("使用阻断测试构建验证 Scene 回调。")
        }
        let delegate = SceneDelegate()
        var checkedScenes = 0
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else {
                continue
            }
            checkedScenes += 1
            delegate.sceneDidBecomeActive(scene)
            delegate.sceneWillEnterForeground(scene)
            delegate.sceneWillResignActive(scene)
            delegate.sceneDidEnterBackground(scene)
            delegate.scene(scene,
                           continue: makeActivity())
            delegate.scene(scene,
                           restoreInteractionStateWith: makeActivity())
            XCTAssertNil(delegate.stateRestorationActivity(for: scene))
            var completions = 0
            delegate.windowScene(windowScene,
                                 performActionFor: makeShortcut()) { handled in
                XCTAssertFalse(handled)
                completions += 1
            }
            XCTAssertEqual(completions,
                           1)
        }
        XCTAssertGreaterThan(checkedScenes,
                             0)
        XCTAssertFalse(delegate.debugDidCreateFlutterSceneDelegate)
    }

    private func makeShortcut() -> UIApplicationShortcutItem {
        UIApplicationShortcutItem(type: "launchGate.test",
                                  localizedTitle: "Blocked")
    }

    private func makeActivity() -> NSUserActivity {
        NSUserActivity.make(activityType: "launchGate.test") { _ in }
    }
}
#endif
