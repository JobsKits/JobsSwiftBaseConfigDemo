//
//  JobsTimerManagerStabilityTests.swift
//  JobsSwiftTimerMgr
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftTimer
import JobsSwiftTimerMgr

final class JobsTimerManagerStabilityTests: XCTestCase {

    private var configuration: JobsSwiftTimerConfig {
        JobsSwiftTimerConfig(interval: 60,
                             pauseInBackground: false,
                             autoManageAppState: false)
    }

    func testRegistrationRejectsMissingIdentifiers() {
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        for identifier: String? in [nil, ""] {
            XCTAssertThrowsError(try manager.create(kind: .gcd,
                                                     identifier: identifier,
                                                     config: configuration) {}) { error in
                guard case JobsSwiftTimerMgrError.identifierRequired = error else {
                    return XCTFail("Unexpected registration error: \(error)")
                }
            }
        }
    }

    func testKeepExistingAndErrorPoliciesPreserveOriginalRegistration() throws {
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        let original = try manager.create(kind: .gcd,
                                           identifier: "same",
                                           config: configuration) {}
        let kept = try manager.create(kind: .gcd,
                                       identifier: "same",
                                       config: configuration,
                                       dedupPolicy: .keepExisting) {}
        XCTAssertTrue(original === kept)
        XCTAssertThrowsError(try manager.create(kind: .gcd,
                                                 identifier: "same",
                                                 config: configuration,
                                                 dedupPolicy: .error) {})
        XCTAssertTrue(manager.timer(for: "same") === original)
        XCTAssertFalse(original.isRunning)
    }

    func testStaleCleanupCannotRemoveReplacementTimer() throws {
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        let original = try manager.create(kind: .gcd,
                                           identifier: "same",
                                           config: configuration) {}
        let replacement = try manager.create(kind: .gcd,
                                              identifier: "same",
                                              config: configuration,
                                              dedupPolicy: .replace) {}
        XCTAssertFalse(original === replacement)
        XCTAssertFalse(manager.stopAndRemove(identifier: "same", expectedTimer: original))
        XCTAssertTrue(manager.timer(for: "same") === replacement)
        XCTAssertTrue(manager.stopAndRemove(identifier: "same", expectedTimer: replacement))
        XCTAssertNil(manager.timer(for: "same"))
    }
}
