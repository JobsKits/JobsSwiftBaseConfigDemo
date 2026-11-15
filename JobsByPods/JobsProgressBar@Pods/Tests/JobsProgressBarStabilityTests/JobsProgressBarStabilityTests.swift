//
//  JobsProgressBarStabilityTests.swift
//  JobsProgressBar
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsProgressBar

final class JobsProgressBarStabilityTests: XCTestCase {

    @MainActor
    func testExternalProgressClampsToClosedUnitInterval() {
        let bar = JobsProgressBar()
        bar.byProgress(-2, animated: false)
        XCTAssertEqual(bar.progress, 0)
        bar.byProgress(3, animated: false)
        XCTAssertEqual(bar.progress, 1)
        bar.byProgress(0.375, animated: false)
        XCTAssertEqual(bar.progress, 0.375)
    }

    @MainActor
    func testConfigurationChainKeepsBarIdentity() {
        let bar = JobsProgressBar()
        let configured = bar
            .byDirection(.rightToLeft)
            .byValueMode(.countDown)
            .byProgress(0.25, animated: false)
        XCTAssertTrue(configured === bar)
        XCTAssertEqual(bar.progress, 0.25)
        XCTAssertEqual(bar.direction, .rightToLeft)
        XCTAssertEqual(bar.valueMode, .countDown)
    }
}
