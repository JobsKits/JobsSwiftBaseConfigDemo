//
//  JobsDebugPanelStabilityTests.swift
//  JobsDebugPanel
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsDebugPanel

final class JobsDebugPanelStabilityTests: XCTestCase {

    func testEnvironmentTrimsURLAndPreservesChainIdentity() {
        let environment = JobsDebugEnvironment()
        let result = environment
            .byIdentifier("staging")
            .byTitle("测试环境")
            .byBaseURL("  https://example.com/api\n")

        XCTAssertTrue(result === environment)
        XCTAssertEqual(result.identifier, "staging")
        XCTAssertEqual(result.title, "测试环境")
        XCTAssertEqual(result.baseURL?.absoluteString, "https://example.com/api")
    }

    func testEnvironmentRejectsCredentialsAndNonHTTPAddresses() {
        for candidate in ["file:///tmp/private", "javascript:alert(1)",
                          "https://user:password@example.com", "https://"] {
            XCTAssertNil(JobsDebugEnvironment().byURL(candidate).url, candidate)
        }
    }
}
