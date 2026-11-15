//
//  JobsToolsStabilityTests.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftBlock
@testable import JobsSwiftTools

final class JobsToolsStabilityTests: XCTestCase {

    private struct Payload: Decodable {

        @DecodableDefault.DefaultInt var count: Int
        @DecodableDefault.EmptyString var title: String
        @DecodableDefault.False var enabled: Bool
    }

    func testMissingAndNullFieldsReceiveDeclaredDefaults() throws {
        let decoder = JSONDecoder.make { _ in }
        for raw in ["{}", #"{"count":null,"title":null,"enabled":null}"#] {
            let payload = try decoder.decode(Payload.self, from: Data(raw.utf8))
            XCTAssertEqual(payload.count, 0)
            XCTAssertEqual(payload.title, "")
            XCTAssertFalse(payload.enabled)
        }
    }

    func testExplicitValuesSurviveAndTypeMismatchStillThrows() throws {
        let decoder = JSONDecoder.make { _ in }
        let payload = try decoder.decode(Payload.self,
                                         from: Data(#"{"count":9,"title":"Jobs","enabled":true}"#.utf8))
        XCTAssertEqual(payload.count, 9)
        XCTAssertEqual(payload.title, "Jobs")
        XCTAssertTrue(payload.enabled)
        XCTAssertThrowsError(try decoder.decode(Payload.self,
                                                from: Data(#"{"count":"invalid"}"#.utf8)))
    }
}
