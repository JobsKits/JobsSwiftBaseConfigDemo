//
//  JobsBy3rdToolsStabilityTests.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsBy3rdTools
import JobsByUIKit

final class JobsBy3rdToolsStabilityTests: XCTestCase {

    @MainActor
    func testDashboardBoundsProgressAndRetainsChainIdentity() {
        let dashboard = FTDashboardView.jobsMake { _ in }
        let configured = dashboard.byProgress(-8, animated: false)

        XCTAssertTrue(configured === dashboard)
        XCTAssertEqual(dashboard.progress, 0)
        dashboard.byProgress(8, animated: false)
        XCTAssertEqual(dashboard.progress, 1)
        dashboard.byProgress(0.375, animated: false)
        XCTAssertEqual(dashboard.progress, 0.375)
        XCTAssertEqual(dashboard.valueFormatter(dashboard.progress), "38%")
    }
}
