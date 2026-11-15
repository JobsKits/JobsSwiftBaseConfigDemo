//
//  JobsLocalNotificationStabilityTests.swift
//  JobsLocalNotification
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsByUIKit
import JobsLocalNotification

final class JobsLocalNotificationStabilityTests: XCTestCase {

    func testBlankIdentifierFailsBeforeContactingTheNotificationCenter() {
        let completed = expectation(description: "identifier validation")
        let model = JobsLocalNotificationModel.jobsMake { _ in }
            .byIdentifier(" \n")
        let scheduler = JobsMakeLocalNotification.jobsMake { _ in }
        scheduler.triggerLocalNotification(model) { result in
            switch result {
            case .success:
                XCTFail("空标识不能提交通知")
            case .failure(let error):
                XCTAssertTrue(error is JobsLocalNotificationError)
                XCTAssertEqual(error.localizedDescription,
                               JobsLocalNotificationError.emptyIdentifier.localizedDescription)
            }
            completed.fulfill()
        }

        wait(for: [completed], timeout: 3)
    }

    func testInvalidIntervalsFailBeforeContactingTheNotificationCenter() {
        let scheduler = JobsMakeLocalNotification.jobsMake { _ in }
        let intervals: [TimeInterval] = [0, -1, .nan, .infinity, 59]
        let completed = intervals.map { interval in
            let completed = expectation(description: "interval \(interval)")
            let model = JobsLocalNotificationModel.jobsMake { _ in }
                .byIdentifier("JobsStability")
                .byTriggerWithTimeInterval(interval)
                .byRepeats(true)
            scheduler.triggerLocalNotification(model) { result in
                switch result {
                case .success:
                    XCTFail("无效重复间隔不能提交通知")
                case .failure(let error):
                    XCTAssertTrue(error is JobsLocalNotificationError)
                    XCTAssertEqual(error.localizedDescription,
                                   JobsLocalNotificationError.invalidInterval.localizedDescription)
                }
                completed.fulfill()
            }
            return completed
        }

        wait(for: completed, timeout: 3)
    }
}
