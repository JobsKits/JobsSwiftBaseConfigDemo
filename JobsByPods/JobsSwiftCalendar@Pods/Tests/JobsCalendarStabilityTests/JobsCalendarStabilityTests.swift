//
//  JobsCalendarStabilityTests.swift
//  JobsSwiftCalendar
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftCalendar

final class JobsCalendarStabilityTests: XCTestCase {

    @MainActor
    func testSelectingTheSameDayDoesNotDuplicateSelection() {
        let calendar = JobsSwiftCalendar(frame: .zero)
        calendar.allowsMultipleSelection = true
        let day = Date(timeIntervalSince1970: 1_700_049_600)
        calendar.selectDate(day)
        calendar.selectDate(day.addingTimeInterval(60))
        XCTAssertEqual(calendar.selectedDates.count, 1)
        calendar.deselectDate(day)
        XCTAssertTrue(calendar.selectedDates.isEmpty)
        calendar.selectDate(nil)
        XCTAssertTrue(calendar.selectedDates.isEmpty)
    }

    @MainActor
    func testMonthAndWeekHeightsDifferByFiveDateRows() {
        let calendar = JobsSwiftCalendar(frame: .zero)
        let month = calendar.boundingRect(for: .month)
        let week = calendar.boundingRect(for: .week)
        XCTAssertEqual(month.height - week.height, 5 * 42)
        XCTAssertGreaterThan(week.height, calendar.appearance.headerHeight)
    }
}
