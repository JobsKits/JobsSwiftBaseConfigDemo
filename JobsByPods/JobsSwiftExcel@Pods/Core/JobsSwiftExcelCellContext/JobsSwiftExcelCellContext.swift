//
//  JobsSwiftExcelCellContext.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import Foundation

public struct JobsSwiftExcelCellContext: Equatable {
    public let row: Int
    public let column: Int
    public let value: String

    public init(row: Int, column: Int, value: String) {
        self.row = row
        self.column = column
        self.value = value
    }
}
