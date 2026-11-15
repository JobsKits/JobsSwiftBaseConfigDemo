//
//  JobsToastStabilityTests.swift
//  JobsToast
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsToast

final class JobsToastStabilityTests: XCTestCase {

    @MainActor
    func testFluentConfigurationReturnsAnIndependentValue() {
        let original = JobsToast.Config()
        let configured = original
            .byDuration(3)
            .byBottomOffset(24)
            .byHorizontalPadding(20)
            .byVerticalPadding(12)
            .byCornerRadius(8)
        XCTAssertEqual(original.duration, 1)
        XCTAssertEqual(original.bottomOffset, 120)
        XCTAssertEqual(configured.duration, 3)
        XCTAssertEqual(configured.bottomOffset, 24)
        XCTAssertEqual(configured.horizontalPadding, 20)
        XCTAssertEqual(configured.verticalPadding, 12)
        XCTAssertEqual(configured.cornerRadius, 8)
    }
}
