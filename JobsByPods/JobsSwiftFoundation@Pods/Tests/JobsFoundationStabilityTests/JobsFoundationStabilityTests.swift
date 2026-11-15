//
//  JobsFoundationStabilityTests.swift
//  JobsSwiftFoundation
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftFoundation

final class JobsFoundationStabilityTests: XCTestCase {

    func testDecimalRoundingDistinguishesHalfUpAndBankers() throws {
        let value = try XCTUnwrap(Decimal(string: "1.005"))
        XCTAssertEqual(value.rounded(scale: 2, mode: .plain), Decimal(string: "1.01"))
        XCTAssertEqual(value.rounded(scale: 2, mode: .bankers), Decimal(string: "1.00"))
        XCTAssertEqual(value, Decimal(string: "1.005"))
    }

    func testSignedRoundingHonorsTowardAndAwayFromZero() throws {
        let value = try XCTUnwrap(Decimal(string: "-12.345"))
        XCTAssertEqual(value.rounded(scale: 2, mode: .towardZero), Decimal(string: "-12.34"))
        XCTAssertEqual(value.rounded(scale: 2, mode: .awayFromZero), Decimal(string: "-12.35"))
        var mutable = value
        mutable.round(scale: 1, mode: .towardZero)
        XCTAssertEqual(mutable, Decimal(string: "-12.3"))
    }
}
