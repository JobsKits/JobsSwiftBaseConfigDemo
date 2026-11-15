//
//  JobsExcelStabilityTests.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftExcel

final class JobsExcelStabilityTests: XCTestCase {

    func testRowsPreserveEmptyAndUnicodeCellsInOrder() {
        let row = JobsSwiftExcelRow(values: ["", "藏文 བོད་", "42"])
        XCTAssertEqual(row.cells.map(\.text), ["", "藏文 བོད་", "42"])
        XCTAssertTrue(JobsSwiftExcelRow(values: []).cells.isEmpty)
    }

    func testEditingCopiedRowDoesNotMutateOriginalRow() {
        let original = JobsSwiftExcelRow(values: ["原值"])
        var copy = original
        copy.cells[0].text = "新值"
        XCTAssertEqual(original.cells[0].text, "原值")
        XCTAssertEqual(copy.cells[0].text, "新值")
        let column = JobsSwiftExcelColumn(title: "标题", width: 128)
        XCTAssertEqual(column.header.text, "标题")
        XCTAssertEqual(column.width, 128)
    }
}
