//
//  JobsTaskCenterStabilityTests.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftTaskCenter

final class JobsTaskCenterStabilityTests: XCTestCase {

    func testPeriodsClampInvalidValuesAndArithmeticUnderflow() {
        for invalid: Double in [-1, .nan, .infinity, -.infinity] {
            XCTAssertEqual(JobsPeriod(invalid), .zero)
        }
        XCTAssertEqual(JobsPeriod(.greatestFiniteMagnitude).timeInterval, 1_000_000_000)
        XCTAssertEqual(JobsPeriod.second - .minute, .zero)
        XCTAssertEqual(JobsPeriod.second / 0, .zero)
        XCTAssertEqual(JobsPeriod.millisecond * 1000, .second)
    }

    func testPlanHasIndependentIteratorsAndFiniteRepeatBoundary() {
        let plan = JobsPlan.every(JobsPeriod(2),
                                  initialDelay: JobsPeriod(5),
                                  repeatCount: 4,
                                  fireImmediately: true)
        XCTAssertEqual(Array(plan).map(\.timeInterval), [0, 5, 2, 2])
        XCTAssertEqual(Array(plan).map(\.timeInterval), [0, 5, 2, 2])
        XCTAssertTrue(Array(JobsPlan.every(.second, repeatCount: 0)).isEmpty)
        let combined = JobsPlan.after(JobsPeriod(3))
            .concat(.every(JobsPeriod(2), repeatCount: 2))
        XCTAssertEqual(Array(combined).map(\.timeInterval), [3, 2, 2])
    }
}
