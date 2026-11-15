//
//  JobsStandardLibraryStabilityTests.swift
//  JobsSwiftStandardLibrary
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftStandardLibrary

final class JobsStandardLibraryStabilityTests: XCTestCase {

    func testEscapedBuilderCannotMutateReturnedArray() {
        var escaped: [Int].Builder?
        let values: [Int] = .build { builder in
            escaped = builder
            builder.addBy(1).addBy(2)
        }
        escaped?.addBy(3)
        XCTAssertEqual(values, [1, 2])
    }

    func testDurationFormattingClampsNegativeAndPreservesHourBoundary() {
        XCTAssertEqual(Int64.min.byMinuteSecondCN, "0秒")
        XCTAssertEqual(62.byMinuteSecondCN2, "01分02秒")
        XCTAssertEqual(3900.byMinuteSecondCN, "1时05分00秒")
        XCTAssertEqual(3900.byMinuteSecondCNNoHour, "65分00秒")
    }

    func testOptionalFallbackPreservesExistingValues() {
        let missing: Int? = nil
        let present: Int? = 7
        XCTAssertEqual(missing.safelyUnwrapped(), 0)
        XCTAssertEqual(missing.safelyUnwrapped(3), 3)
        XCTAssertEqual(present.safelyUnwrapped(3), 7)
    }
}
