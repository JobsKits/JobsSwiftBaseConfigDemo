//
//  JobsLinkageMenuStabilityTests.swift
//  JobsSwiftLinkageMenuView
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftLinkageMenuView

final class JobsLinkageMenuStabilityTests: XCTestCase {

    @MainActor
    func testExplicitHeightOverridesArrayAndInvalidHeightFallsBack() {
        let configuration = JobsSwiftLinkageMenuViewConfig()
        configuration.defaultMenuItemHeight = 72
        configuration.menuItemHeights = [80, .nan, 100]
        configuration.menuItemHeightMap = [0: 96, 2: -1]
        XCTAssertEqual(configuration.itemHeight(at: 0), 96)
        XCTAssertEqual(configuration.itemHeight(at: 1), 72)
        XCTAssertEqual(configuration.itemHeight(at: 2), 100)
        XCTAssertEqual(configuration.itemHeight(at: -1), 72)
    }

    @MainActor
    func testUnboundedAndInvalidDefaultHeightsAreNormalized() {
        let configuration = JobsSwiftLinkageMenuViewConfig()
        configuration.menuItemHeightMap = [0: 50_000]
        configuration.defaultMenuItemHeight = .infinity
        XCTAssertEqual(configuration.itemHeight(at: 0), 10_000)
        XCTAssertEqual(configuration.itemHeight(at: 3), 56)
    }
}
