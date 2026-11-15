//
//  JobsBluetoothStabilityTests.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsBluetooth

final class JobsBluetoothStabilityTests: XCTestCase {

    func testCommandChainClampsRetryAndTimeoutAndKeepsMatcher() {
        let payload = Data([1, 2, 3])
        let command = JobsBluetoothCommand()
        let result = command
            .byPayload(payload)
            .byTimeout(-1)
            .byRetryCount(-4)
            .byPriority(8)
            .byResponseMatcher { $0 == payload }
        XCTAssertTrue(result === command)
        XCTAssertEqual(command.timeout, 0)
        XCTAssertEqual(command.retryCount, 0)
        XCTAssertEqual(command.priority, 8)
        XCTAssertEqual(command.responseMatcher?(payload), true)
        XCTAssertEqual(command.responseMatcher?(Data([9])), false)
    }

    @MainActor
    func testInjectedMockCompletesReliableCommandWithoutBluetoothHardware() async throws {
        let transport = JobsBluetoothMockTransport().byLatency(0.001)
        let manager = JobsBluetoothManager(profile: JobsBluetoothProfile(), mockTransport: transport)
        let peripheral = try XCTUnwrap(transport.advertisements().first)
        manager.connect(identifier: peripheral.identifier)
        defer {
            manager.disconnect()
        }
        XCTAssertEqual(manager.state, .ready)
        let payload = Data([4, 5, 6])
        let completed = expectation(description: "mock application response")
        completed.assertForOverFulfill = true
        manager.sendReliably(JobsBluetoothCommand().byPayload(payload).byTimeout(1)) { result in
            switch result {
            case .success(let receipt):
                XCTAssertEqual(receipt.data, payload)
                XCTAssertEqual(receipt.confirmation, .applicationResponse)
            case .failure(let error):
                XCTFail("Injected mock failed: \(error)")
            }
            completed.fulfill()
        }
        await fulfillment(of: [completed], timeout: 3)
    }
}
