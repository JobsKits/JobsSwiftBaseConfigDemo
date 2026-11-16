//
//  WorldClockDisplayFormatTests.swift
//  JobsSwiftBaseConfigDemoTests
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import Foundation
import XCTest
#if canImport(JobsSwiftBlock)
import JobsSwiftBlock
#endif
#if canImport(JobsSwiftDSL)
import JobsSwiftDSL
#endif
#if canImport(JobsSwiftBaseConfigDemo)
@testable import JobsSwiftBaseConfigDemo
#endif

final class WorldClockDisplayFormatTests: XCTestCase {

    func testMidnightAndNoonHaveExplicitUppercaseAMPM() throws {
        let zone = try XCTUnwrap(TimeZone(secondsFromGMT: 0))
        for locale in ["zh-Hans", "zh-Hant", "en", "ja", "fr", "es", "de", "ru", "ko", "bo"] {
            let formatter = DateFormatter.jobsMake { _ in }
                .byLocale(Locale(identifier: locale))
                .byTimeZone(zone)
            WorldClockDisplayFormat.configure(formatter,
                                               uses12HourFormat: true)
            XCTAssertEqual(formatter.string(from: Date(timeIntervalSince1970: 0)), "12:00:00 AM", locale)
            XCTAssertEqual(formatter.string(from: Date(timeIntervalSince1970: 43_200)), "12:00:00 PM", locale)
            XCTAssertEqual(formatter.string(from: Date(timeIntervalSince1970: 46_861)), "01:01:01 PM", locale)
        }
    }

    func testSwitchingSameFormatterUpdatesBothWaysWithoutChangingTimeZone() throws {
        let zone = try XCTUnwrap(TimeZone(identifier: "Asia/Kathmandu"))
        let formatter = DateFormatter.jobsMake { _ in }
            .byLocale(Locale(identifier: "en_US_POSIX"))
            .byTimeZone(zone)
        let date = Date(timeIntervalSince1970: 43_200)
        WorldClockDisplayFormat.configure(formatter,
                                           uses12HourFormat: false)
        XCTAssertEqual(formatter.string(from: date), "17:30:00")
        WorldClockDisplayFormat.configure(formatter,
                                           uses12HourFormat: true)
        XCTAssertEqual(formatter.string(from: date), "05:30:00 PM")
        WorldClockDisplayFormat.configure(formatter,
                                           uses12HourFormat: false)
        XCTAssertEqual(formatter.string(from: date), "17:30:00")
        XCTAssertEqual(formatter.timeZone.identifier, zone.identifier)
    }
}
