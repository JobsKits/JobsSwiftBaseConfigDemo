//
//  JobsSwiftExcelColumn.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import JobsSwiftUILabelScrolling

public struct JobsSwiftExcelColumn {
    public var header: JobsSwiftExcelCell
    /// 小于等于 0 时使用 JobsSwiftExcelStyle.defaultColumnWidth。
    public var width: CGFloat

    public init(
        title: String,
        width: CGFloat = 0,
        textDisplayMode: JobsLabelTextDisplayMode = .singleLineTailTruncation
    ) {
        self.header = JobsSwiftExcelCell(text: title, textDisplayMode: textDisplayMode)
        self.width = width
    }

    public init(header: JobsSwiftExcelCell, width: CGFloat = 0) {
        self.header = header
        self.width = width
    }
}
