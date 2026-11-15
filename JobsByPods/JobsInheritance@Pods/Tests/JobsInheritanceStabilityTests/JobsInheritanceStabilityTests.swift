//
//  JobsInheritanceStabilityTests.swift
//  JobsInheritance
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsInheritance
import JobsSwiftBlock

final class JobsInheritanceStabilityTests: XCTestCase {

    func testHeterogeneousJSONPreservesBooleanNumberAndNull() throws {
        let value = try JSONDecoder.make { _ in }
            .decode(AnyDecodable.self,
                    from: Data(#"{"flag":true,"count":3,"nested":[null,"中文"]}"#.utf8))
        let object = try XCTUnwrap(value.value as? [String: Any])
        XCTAssertEqual(object["flag"] as? Bool, true)
        XCTAssertEqual(object["count"] as? Int, 3)
        let nested = try XCTUnwrap(object["nested"] as? [Any])
        XCTAssertTrue(nested[0] is NSNull)
        XCTAssertEqual(nested[1] as? String, "中文")
    }

    func testMalformedJSONIsNotSilentlyAccepted() {
        XCTAssertThrowsError(try JSONDecoder.make { _ in }
            .decode(AnyDecodable.self, from: Data("{invalid}".utf8)))
    }
}
