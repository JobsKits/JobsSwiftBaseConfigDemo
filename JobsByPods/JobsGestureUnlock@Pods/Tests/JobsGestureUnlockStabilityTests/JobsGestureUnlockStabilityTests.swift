//
//  JobsGestureUnlockStabilityTests.swift
//  JobsGestureUnlock
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
@testable import JobsGestureUnlock

final class JobsGestureUnlockStabilityTests: XCTestCase {

    func testPatternHashMatchesKnownSHA256VectorAndIncludesSalt() {
        let pattern = GesturePattern(indices: [0, 4, 8])

        XCTAssertEqual(pattern.string, "0-4-8")
        XCTAssertEqual(pattern.sha256Hex(salt: "Jobs"),
                       "471798522208dbb3c8e1a60fe801768d8cea1a6f5eed2e0366d9d59f32c8b9a5")
        XCTAssertNotEqual(pattern.sha256Hex(salt: "Jobs"), pattern.sha256Hex(salt: "Other"))
    }

    func testConfigurationBoundsGridAndRepairsInvalidGeometry() {
        var config = GestureUnlockConfiguration()
        config.gridDimension = Int.max
        config.minimumPatternLength = Int.max
        config.nodeDiameter = .nan
        config.lineWidth = -1
        let normalized = config.normalized

        XCTAssertEqual(normalized.gridDimension, 10)
        XCTAssertEqual(normalized.minimumPatternLength, 100)
        XCTAssertEqual(normalized.nodeDiameter, 56)
        XCTAssertEqual(normalized.lineWidth, 6)
    }
}
