//
//  JobsRefresherStabilityTests.swift
//  JobsSwiftRefresher
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftRefresher

final class JobsRefresherStabilityTests: XCTestCase {

    @MainActor
    func testHorizontalModeSwitchesRolesWithoutChangingVerticalRoles() {
        let original = JobsRefreshHorizontalMode.refreshRightLoadLeft
        let reversed = JobsRefreshHorizontalMode.loadRightRefreshLeft
        XCTAssertEqual(original.role(for: .left), .refresh)
        XCTAssertEqual(original.role(for: .right), .loadMore)
        XCTAssertEqual(reversed.role(for: .left), .loadMore)
        XCTAssertEqual(reversed.role(for: .right), .refresh)
        XCTAssertEqual(reversed.role(for: .header), .refresh)
        XCTAssertEqual(reversed.role(for: .footer), .loadMore)
    }

    @MainActor
    func testFeedbackTrimsSoundNamesWithoutPlayingAnything() {
        XCTAssertNil(JobsRefreshFeedback(soundFileName: " \n").soundFileName)
        let feedback = JobsRefreshFeedback(enablesHaptics: true,
                                            soundFileName: " finish.aiff \n")
        XCTAssertEqual(feedback.soundFileName, "finish.aiff")
        XCTAssertTrue(feedback.enablesHaptics)
        XCTAssertFalse(JobsRefreshFeedback.disabled.enablesHaptics)
    }
}
