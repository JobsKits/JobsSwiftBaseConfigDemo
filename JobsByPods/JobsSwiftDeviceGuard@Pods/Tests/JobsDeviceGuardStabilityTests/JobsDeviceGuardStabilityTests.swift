//
//  JobsDeviceGuardStabilityTests.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

@testable import JobsSwiftDeviceGuard

final class JobsDeviceGuardStabilityTests: XCTestCase {

    func testRepeatedEvidenceWithinOneCategoryRemainsSuspicious() {
        let report = JobsDeviceGuardReport(platform: "fixture",
                                            supported: true,
                                            checks: [
                                                .init(category: .fileSystem, state: .detected, evidence: ["a"]),
                                                .init(category: .fileSystem, state: .detected, evidence: ["b"])
                                            ],
                                            minimumDetectedCategories: 1)
        XCTAssertEqual(report.minimumDetectedCategories, 2)
        XCTAssertEqual(report.detectedCategories, [.fileSystem])
        XCTAssertEqual(report.verdict, .suspicious)
        XCTAssertFalse(report.isJailbroken)
    }

    func testIndependentCategoriesReachThresholdAndUnsupportedTakesPrecedence() {
        let checks: [JobsDeviceGuardCheck] = [
            .init(category: .fileSystem, state: .detected),
            .init(category: .runtime, state: .detected)
        ]
        let supported = JobsDeviceGuardReport(platform: "fixture",
                                               supported: true,
                                               checks: checks,
                                               minimumDetectedCategories: 2)
        let unsupported = JobsDeviceGuardReport(platform: "fixture",
                                                 supported: false,
                                                 checks: checks,
                                                 minimumDetectedCategories: 2)
        XCTAssertEqual(supported.verdict, .jailbroken)
        XCTAssertTrue(supported.shouldRestrict)
        XCTAssertEqual(unsupported.verdict, .unsupported)
        XCTAssertFalse(unsupported.isJailbroken)
    }

    func testUnavailableChecksDoNotProduceCleanVerdict() {
        let report = JobsDeviceGuardReport(platform: "fixture",
                                            supported: true,
                                            checks: [.init(category: .sandbox, state: .unavailable)],
                                            minimumDetectedCategories: 99)
        XCTAssertEqual(report.minimumDetectedCategories, 3)
        XCTAssertEqual(report.verdict, .indeterminate)
        XCTAssertTrue(report.hasUnavailableChecks)
        XCTAssertTrue(report.shouldRestrict)
    }
}
