//
//  JobsSwiftExcelRow.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import Foundation

import JobsSwiftUILabelScrolling

public struct JobsSwiftExcelRow {
    public var cells: [JobsSwiftExcelCell]

    public init(cells: [JobsSwiftExcelCell]) {
        self.cells = cells
    }

    public init(
        values: [String],
        textDisplayMode: JobsLabelTextDisplayMode = .singleLineTailTruncation
    ) {
        self.cells = values.map {
            JobsSwiftExcelCell(text: $0, textDisplayMode: textDisplayMode)
        }
    }
}
