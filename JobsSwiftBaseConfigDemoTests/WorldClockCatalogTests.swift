//
//  WorldClockCatalogTests.swift
//  JobsSwiftBaseConfigDemoTests
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import Foundation
import XCTest
#if canImport(JobsSwiftBaseConfigDemo)
@testable import JobsSwiftBaseConfigDemo
#endif

final class WorldClockCatalogTests: XCTestCase {

    private let winter = Date(timeIntervalSince1970: 1_768_478_400)
    private let summer = Date(timeIntervalSince1970: 1_784_116_800)

    func testEveryEffectiveOffsetHasExactlyOneRepresentative() {
        for date in [winter, summer] {
            let entries = WorldClockCatalog.entries(at: date)
            let expected = Set((TimeZone.knownTimeZoneIdentifiers + ["Etc/GMT+12"]).compactMap {
                TimeZone(identifier: $0)?.secondsFromGMT(for: date)
            })
            XCTAssertEqual(Set(entries.map(\.offset)), expected)
            XCTAssertEqual(entries.count, expected.count)
            XCTAssertEqual(entries.map(\.offset), entries.map(\.offset).sorted())
            XCTAssertEqual(entries.first?.offset, -43_200)
            XCTAssertEqual(entries.last?.offset, 50_400)
        }
    }

    func testParisAndNewYorkRemainRepresentativesAcrossDST() {
        for (date, paris, newYork) in [(winter, 3600, -18000), (summer, 7200, -14400)] {
            let entries = WorldClockCatalog.entries(at: date)
            XCTAssertEqual(entries.first(where: { $0.offset == paris })?.id, "Europe/Paris")
            XCTAssertEqual(entries.first(where: { $0.offset == newYork })?.id, "America/New_York")
        }
    }

    func testHalfAndQuarterHourZonesAndLabelsArePreserved() {
        let entries = WorldClockCatalog.entries(at: winter)
        XCTAssertEqual(entries.first(where: { $0.id == "Asia/Kathmandu" })?.offsetLabel, "UTC+05:45")
        XCTAssertEqual(entries.first(where: { $0.id == "Asia/Kolkata" })?.offsetLabel, "UTC+05:30")
        XCTAssertEqual(entries.first(where: { $0.id == "Australia/Eucla" })?.offsetLabel, "UTC+08:45")
        XCTAssertEqual(entries.first(where: { $0.id == "Pacific/Marquesas" })?.offsetLabel, "UTC−09:30")
        XCTAssertTrue(entries.contains(where: { $0.offset == 49_500 }))
        XCTAssertTrue(WorldClockCatalog.entries(at: summer).contains(where: { $0.offset == 45_900 }))
    }

    func testCurrentTimeZoneIsIndependentOfWorldRepresentatives() throws {
        let zone = try XCTUnwrap(TimeZone(identifier: "Asia/Kathmandu"))
        let local = WorldClockCatalog.localEntry(at: winter,
                                                 timeZone: zone)
        XCTAssertEqual(local.id, "Asia/Kathmandu")
        XCTAssertEqual(local.offset, 20_700)
        XCTAssertTrue(WorldClockCatalog.entries(at: winter).contains(where: { $0.offset == local.offset }))
    }
}
