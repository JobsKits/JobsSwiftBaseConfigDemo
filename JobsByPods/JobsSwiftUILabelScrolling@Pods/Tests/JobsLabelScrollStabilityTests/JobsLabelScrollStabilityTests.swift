//
//  JobsLabelScrollStabilityTests.swift
//  JobsSwiftUILabelScrolling
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftUILabelScrolling

final class JobsLabelScrollStabilityTests: XCTestCase {

    func testNegativeTimingAndSpeedAreClamped() {
        let configuration = JobsLabelScrollConfiguration(mode: .continuous,
                                                          speed: -1,
                                                          spacing: -2,
                                                          startDelay: -3,
                                                          edgePause: -4,
                                                          framesPerSecond: 0)
        XCTAssertEqual(configuration.speed, 0)
        XCTAssertEqual(configuration.spacing, 0)
        XCTAssertEqual(configuration.startDelay, 0)
        XCTAssertEqual(configuration.edgePause, 0)
        XCTAssertEqual(configuration.framesPerSecond, 1)
    }

    func testModeFactoriesPreserveTheirTimingSemantics() {
        let continuous = JobsLabelScrollConfiguration.continuous(framesPerSecond: 240)
        let pingPong = JobsLabelScrollConfiguration.pingPong(edgePause: 1.5)
        XCTAssertEqual(continuous.framesPerSecond, 120)
        XCTAssertEqual(continuous.edgePause, 0)
        XCTAssertEqual(pingPong.spacing, 0)
        XCTAssertEqual(pingPong.edgePause, 1.5)
        XCTAssertTrue(pingPong.respectsReduceMotion)
    }
}
