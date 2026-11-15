//
//  JobsTextStabilityTests.swift
//  JobsTextTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsTextTools

final class JobsTextStabilityTests: XCTestCase {

    func testApplyingAttributesDoesNotMutateOriginalText() {
        let key = NSAttributedString.Key("JobsStabilityAttribute")
        let plain = JobsText("中文🙂")
        let styled = plain.applying([key: "first"])
        let replaced = styled.applying([key: "second"])
        XCTAssertTrue(plain.isPlain)
        XCTAssertNil(plain.attributed)
        XCTAssertEqual(styled.asAttributed.attribute(key, at: 0, effectiveRange: nil) as? String, "first")
        XCTAssertEqual(replaced.asAttributed.attribute(key, at: 0, effectiveRange: nil) as? String, "second")
        XCTAssertEqual(replaced.asString, "中文🙂")
    }

    func testMixedConcatenationKeepsTextAndAttributedRange() {
        let key = NSAttributedString.Key("JobsStabilityAttribute")
        let combined = JobsText("A") + JobsText("B").applying([key: "styled"])
        XCTAssertEqual(combined.asString, "AB")
        XCTAssertNil(combined.asAttributed.attribute(key, at: 0, effectiveRange: nil))
        XCTAssertEqual(combined.asAttributed.attribute(key, at: 1, effectiveRange: nil) as? String, "styled")
    }
}
