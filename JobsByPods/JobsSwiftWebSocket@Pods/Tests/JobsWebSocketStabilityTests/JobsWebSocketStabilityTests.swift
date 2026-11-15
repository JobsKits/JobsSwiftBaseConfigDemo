//
//  JobsWebSocketStabilityTests.swift
//  JobsSwiftWebSocket
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftWebSocket

final class JobsWebSocketStabilityTests: XCTestCase {

    func testSendingBeforeConnectReturnsFailureWithoutCreatingConnection() async {
        let client = JobsSwiftWebSocketClient()
        XCTAssertEqual(client.state, .idle)
        let completed = expectation(description: "not connected error")
        completed.assertForOverFulfill = true
        client.send(text: "fixture") { result in
            switch result {
            case .success:
                XCTFail("Sending without a connection must fail")
            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "JobsSwiftWebSocket")
                XCTAssertEqual((error as NSError).code, -1)
            }
            completed.fulfill()
        }
        await fulfillment(of: [completed], timeout: 3)
        XCTAssertEqual(client.state, .idle)
    }

    func testNonWebSocketSchemeFailsValidationBeforeNetworkAccess() async throws {
        let client = JobsSwiftWebSocketClient()
        let completed = expectation(description: "invalid scheme")
        completed.assertForOverFulfill = true
        client.onStateChange = { state in
            guard case .failed(let message) = state else {
                return
            }
            XCTAssertTrue(message.contains("ws/wss"))
            completed.fulfill()
        }
        client.connect(to: try XCTUnwrap(URL(string: "https://example.invalid/socket")))
        await fulfillment(of: [completed], timeout: 3)
        guard case .failed = client.state else {
            return XCTFail("Invalid URL must leave the client failed")
        }
    }
}
