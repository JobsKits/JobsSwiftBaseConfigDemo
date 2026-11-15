//
//  JobsGraphicCaptchaStabilityTests.swift
//  JobsSwiftGraphicCaptcha
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftGraphicCaptcha

final class JobsGraphicCaptchaStabilityTests: XCTestCase {

    func testValidationTrimsWhitespaceAndHonorsCaseSensitivity() {
        XCTAssertTrue(JobsSwiftGraphicCaptchaGenerator.validate(input: " abC\n",
                                                                captcha: "ABC",
                                                                caseSensitive: false))
        XCTAssertFalse(JobsSwiftGraphicCaptchaGenerator.validate(input: "abC",
                                                                 captcha: "ABC",
                                                                 caseSensitive: true))
        XCTAssertFalse(JobsSwiftGraphicCaptchaGenerator.validate(input: " ",
                                                                 captcha: nil,
                                                                 caseSensitive: false))
    }

    func testCustomAlphabetFiltersEmptyEntriesAndNormalizesLength() {
        let configuration = JobsSwiftGraphicCaptchaConfig(length: 0,
                                                           customCharacters: ["", "汉"])
        XCTAssertEqual(JobsSwiftGraphicCaptchaGenerator.randomText(config: configuration), "汉")
        XCTAssertEqual(JobsSwiftGraphicCaptchaGenerator.characters(for: .number),
                       Array("0123456789").map(String.init))
    }
}
