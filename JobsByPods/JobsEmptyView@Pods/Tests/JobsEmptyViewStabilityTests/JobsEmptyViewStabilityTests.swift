//
//  JobsEmptyViewStabilityTests.swift
//  JobsEmptyView
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsByUIKit
import JobsEmptyView

final class JobsEmptyViewStabilityTests: XCTestCase {

    @MainActor
    func testAccessibleRetryInvokesTheCurrentHandlerExactlyOnce() {
        var obsoleteCalls = 0
        var currentCalls = 0
        let view = JobsEmptyView.jobsMake { _ in }
            .byOnTapRetry { obsoleteCalls += 1 }
            .byOnTapRetry { currentCalls += 1 }

        XCTAssertTrue(view.isAccessibilityElement)
        XCTAssertTrue(view.accessibilityTraits.contains(.button))
        XCTAssertTrue(view.accessibilityActivate())
        XCTAssertEqual(currentCalls, 1)
        XCTAssertEqual(obsoleteCalls, 0)
    }
}
