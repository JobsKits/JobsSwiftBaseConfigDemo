//
//  JobsSwiftExcelCell.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import JobsSwiftUILabelScrolling

public struct JobsSwiftExcelCell {
    public var text: String
    public var textDisplayMode: JobsLabelTextDisplayMode
    public var minimumScaleFactor: CGFloat
    public var maximumNumberOfLines: Int
    public var scrollConfiguration: JobsLabelScrollConfiguration

    public init(
        text: String,
        textDisplayMode: JobsLabelTextDisplayMode = .singleLineTailTruncation,
        minimumScaleFactor: CGFloat = 0.5,
        maximumNumberOfLines: Int = 2,
        scrollConfiguration: JobsLabelScrollConfiguration = .continuous()
    ) {
        self.text = text
        self.textDisplayMode = textDisplayMode
        self.minimumScaleFactor = minimumScaleFactor
        self.maximumNumberOfLines = maximumNumberOfLines
        self.scrollConfiguration = scrollConfiguration
    }
}
