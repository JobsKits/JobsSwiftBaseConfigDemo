//
//  JobsSplashStabilityTests.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftSplash

final class JobsSplashStabilityTests: XCTestCase {

    func testCountdownNormalizesNegativeValuesAndAllowsNoCountdown() {
        let configuration = JobsSplashConfiguration(content: .localImage(name: "unused"))
        XCTAssertTrue(configuration.byCountdownSeconds(-8) === configuration)
        XCTAssertEqual(configuration.countdownSeconds, 0)
        configuration.byCountdownSeconds(nil)
        XCTAssertNil(configuration.countdownSeconds)
    }

    func testSkipConfigurationKeepsFluentIdentity() {
        let configuration = JobsSplashConfiguration(content: .localImage(name: "unused"))
        let configured = configuration
            .bySkipButtonVisible(false)
            .bySkipButtonFrame(nil)
            .byTapAction(.none)
            .byShakeAction(.none)
        XCTAssertTrue(configured === configuration)
        XCTAssertFalse(configuration.isSkipButtonVisible)
        XCTAssertNil(configuration.skipButtonFrame)
        if case .none = configuration.tapAction {
        } else {
            XCTFail("点击行为应保持关闭")
        }
    }
}
