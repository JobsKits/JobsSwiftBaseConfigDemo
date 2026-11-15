//
//  JobsBaseDefinesStabilityTests.swift
//  JobsSwiftBaseDefines
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftBaseDefines
import JobsSwiftBlock

final class JobsBaseDefinesStabilityTests: XCTestCase {

    func testCustomThemeIdentifiersRoundTripWithoutLosingRawValues() throws {
        let style = JobsThemeStyle(rawValue: "brand.midnight")
        let encoded = try JSONEncoder.make { _ in }.encode(style)
        let decoded = try JSONDecoder.make { _ in }.decode(JobsThemeStyle.self, from: encoded)
        XCTAssertEqual(decoded, style)
        XCTAssertEqual(decoded.rawValue, "brand.midnight")
        XCTAssertNotEqual(JobsThemeStyle.light, .dark)
        XCTAssertNotEqual(JobsThemeColorKey.textPrimary, .backgroundPrimary)
    }

    func testMissingThemeResourceDoesNotReplaceCurrentStyle() {
        let center = JobsThemeCenter.shared
        let previous = center.currentStyle
        let missing = "JobsStability-Missing-\(UUID().uuidString)"
        XCTAssertThrowsError(try center.configure(resource: missing)) { error in
            guard case JobsThemeError.resourceNotFound(let resource) = error else {
                return XCTFail("Unexpected theme error: \(error)")
            }
            XCTAssertEqual(resource, "\(missing).json")
        }
        XCTAssertEqual(center.currentStyle, previous)
    }
}
