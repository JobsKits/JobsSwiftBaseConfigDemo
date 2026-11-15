//
//  JobsNetworkingStabilityTests.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsNetworking

final class JobsNetworkingStabilityTests: XCTestCase {

    private func key(_ query: [String: JobsValue], rawBody: Data? = nil) -> JobsCacheKey {
        JobsCacheKey.make(method: .post,
                          url: URL(string: "https://example.invalid/data")!,
                          query: query,
                          body: nil,
                          version: "v1",
                          userScope: "fixture",
                          rawBody: rawBody)
    }

    func testCacheKeyKeepsTypesSeparatorsAndBodyIdentity() {
        XCTAssertNotEqual(key(["a": JobsValue("x&b=y")]),
                          key(["a": JobsValue("x"), "b": JobsValue("y")]))
        XCTAssertNotEqual(key(["a": JobsValue("1")]), key(["a": JobsValue(1)]))
        XCTAssertNotEqual(key([:], rawBody: Data([1])), key([:], rawBody: Data([2])))
        XCTAssertEqual(key(["a": JobsValue(["x": 1, "y": 2])]),
                       key(["a": JobsValue(["y": 2, "x": 1])]))
    }

    func testCancelIsIdempotentAndLateHandlerRunsImmediately() {
        let token = JobsRequestToken()
        var calls = 0
        token.setCancel { calls += 1 }
        token.cancel()
        token.cancel()
        XCTAssertTrue(token.isCancelled)
        XCTAssertEqual(calls, 1)
        let alreadyCancelled = JobsRequestToken()
        alreadyCancelled.cancel()
        alreadyCancelled.setCancel { calls += 1 }
        alreadyCancelled.cancel()
        XCTAssertEqual(calls, 2)
    }

    func testNonfiniteJSONValuesAreRejectedBeforeTransport() {
        XCTAssertNotNil(JobsValue(Double.nan).validationError)
        XCTAssertNotNil(JobsValue(Double.infinity).validationError)
        XCTAssertNil(JobsValue(["count": 1]).validationError)
    }
}
