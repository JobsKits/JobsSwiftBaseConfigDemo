//
//  JobsIconfontStabilityTests.swift
//  JobsIconfont
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsIconfont

final class JobsIconfontStabilityTests: XCTestCase {

    func testExplicitCancellationAndDeinitializationCancelOnlyOnce() {
        var calls = 0
        var token: JobsIconfontLoadToken? = JobsIconfontLoadToken { calls += 1 }
        token?.cancel()
        token?.cancel()
        token = nil

        XCTAssertEqual(calls, 1)
    }

    func testDeinitializationCancelsAnUnfinishedLoad() {
        var calls = 0
        var token: JobsIconfontLoadToken? = JobsIconfontLoadToken { calls += 1 }

        XCTAssertNotNil(token)
        token = nil
        XCTAssertEqual(calls, 1)
    }
}
