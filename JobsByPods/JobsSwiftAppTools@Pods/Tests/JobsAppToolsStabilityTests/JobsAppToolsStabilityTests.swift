//
//  JobsAppToolsStabilityTests.swift
//  JobsSwiftAppTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import CoreGraphics
import XCTest

import JobsSwiftAppTools

final class JobsAppToolsStabilityTests: XCTestCase {

    func testProjectionRejectsInvalidRatesAndNonfiniteVelocity() {
        for rate: CGFloat in [-1, 1, .infinity, .nan] {
            XCTAssertEqual(projectDistance(v0: 1000, decelerationRate: rate), 0)
        }
        XCTAssertEqual(projectDistance(v0: .nan, decelerationRate: 0.9), 0)
        XCTAssertEqual(projectDistance(v0: .infinity, decelerationRate: 0.9), 0)
    }

    func testProjectionPreservesDirectionAndStationaryBoundary() {
        XCTAssertEqual(projectDistance(v0: 1000, decelerationRate: 0.9), 9, accuracy: 0.000_001)
        XCTAssertEqual(projectDistance(v0: -1000, decelerationRate: 0.9), -9, accuracy: 0.000_001)
        XCTAssertEqual(projectDistance(v0: 1000, decelerationRate: 0), 0)
    }
}
