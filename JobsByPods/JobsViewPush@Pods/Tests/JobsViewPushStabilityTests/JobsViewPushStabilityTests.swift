//
//  JobsViewPushStabilityTests.swift
//  JobsViewPush
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsViewPush

final class JobsViewPushStabilityTests: XCTestCase {

    @MainActor
    func testDrawerClampsInvalidInteractionThresholds() {
        let configuration = JobsSideDrawerConfiguration(presentedRatio: -2,
                                                         animationDuration: -1,
                                                         interactiveCompletionThreshold: 8,
                                                         interactiveVelocityThreshold: -10,
                                                         interactiveProjectionTime: -1,
                                                         interactiveAxisDominanceRatio: 3)
        XCTAssertEqual(configuration.presentedRatio, 0.1)
        XCTAssertEqual(configuration.animationDuration, 0)
        XCTAssertEqual(configuration.interactiveCompletionThreshold, 0.95)
        XCTAssertEqual(configuration.interactiveVelocityThreshold, 0)
        XCTAssertEqual(configuration.interactiveProjectionTime, 0)
        XCTAssertEqual(configuration.interactiveAxisDominanceRatio, 1)
    }

    @MainActor
    func testOpeningGesturePolicyRemainsCallable() {
        var allowsOpening = false
        let configuration = JobsSideDrawerConfiguration(shouldBeginOpeningGesture: {
            allowsOpening
        })
        XCTAssertEqual(configuration.shouldBeginOpeningGesture?(), false)
        allowsOpening = true
        XCTAssertEqual(configuration.shouldBeginOpeningGesture?(), true)
        XCTAssertTrue(configuration.allowsInteractiveTransition)
    }
}
