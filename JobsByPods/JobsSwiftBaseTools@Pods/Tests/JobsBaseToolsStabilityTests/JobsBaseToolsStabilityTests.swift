//
//  JobsBaseToolsStabilityTests.swift
//  JobsSwiftBaseTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftBaseTools
import JobsSwiftBlock

final class JobsBaseToolsStabilityTests: XCTestCase {

    func testSafeIntegerDecodingRejectsOverflowAndKeepsExactBounds() throws {
        let decoder = JSONDecoder.make { _ in }
        for raw in ["1e100", "-1e100", "9223372036854775808", "-9223372036854775809"] {
            let value = try decoder.decode(SafeCodable<Int>.self, from: Data(raw.utf8))
            XCTAssertEqual(value.wrappedValue, 0, raw)
        }
        for boundary in [Int.min, Int.max] {
            let value = try decoder.decode(SafeCodable<Int>.self,
                                           from: Data(String(boundary).utf8))
            XCTAssertEqual(value.wrappedValue, boundary)
        }
    }

    func testSafeDecodingCoercesFractionAndBooleanText() throws {
        let decoder = JSONDecoder.make { _ in }
        let fraction = try decoder.decode(SafeCodable<Int>.self, from: Data("12.9".utf8))
        let enabled = try decoder.decode(SafeCodable<Bool>.self, from: Data(#""yes""#.utf8))
        XCTAssertEqual(fraction.wrappedValue, 12)
        XCTAssertTrue(enabled.wrappedValue)
    }
}
