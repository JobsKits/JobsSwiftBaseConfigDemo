//
//  JobsSwiftExcelStyle.swift
//  JobsSwiftExcel
//
//  Created by Jobs on 2026年7月21日，星期二.
//

import UIKit

import JobsSwiftBaseDefines

public struct JobsSwiftExcelStyle {
    public var defaultColumnWidth: CGFloat
    public var headerHeight: CGFloat
    public var rowHeight: CGFloat
    public var gridLineWidth: CGFloat
    public var gridLineColor: UIColor
    public var frozenHeaderBackgroundColor: UIColor
    public var headerBackgroundColor: UIColor
    public var frozenColumnBackgroundColor: UIColor
    public var bodyBackgroundColor: UIColor
    public var frozenHeaderTextColor: UIColor
    public var headerTextColor: UIColor
    public var primaryTextColor: UIColor
    public var secondaryTextColor: UIColor
    public var headerFont: UIFont
    public var bodyFont: UIFont
    public var showsHorizontalScrollIndicator: Bool
    public var bouncesHorizontally: Bool

    public init(
        defaultColumnWidth: CGFloat = 112,
        headerHeight: CGFloat = 46,
        rowHeight: CGFloat = 44,
        gridLineWidth: CGFloat = 0.5,
        gridLineColor: UIColor = JobsCor.separator,
        frozenHeaderBackgroundColor: UIColor = JobsCor.systemIndigo,
        headerBackgroundColor: UIColor = JobsCor.secondarySystemBackground,
        frozenColumnBackgroundColor: UIColor = JobsCor.tertiarySystemBackground,
        bodyBackgroundColor: UIColor = JobsCor.systemBackground,
        frozenHeaderTextColor: UIColor = JobsCor.white,
        headerTextColor: UIColor = JobsCor.label,
        primaryTextColor: UIColor = JobsCor.label,
        secondaryTextColor: UIColor = JobsCor.secondaryLabel,
        headerFont: UIFont = JobsFont.systemFont(ofSize: 14, weight: .semibold),
        bodyFont: UIFont = JobsFont.systemFont(ofSize: 14, weight: .regular),
        showsHorizontalScrollIndicator: Bool = true,
        bouncesHorizontally: Bool = true
    ) {
        self.defaultColumnWidth = max(1, defaultColumnWidth)
        self.headerHeight = headerHeight
        self.rowHeight = rowHeight
        self.gridLineWidth = gridLineWidth
        self.gridLineColor = gridLineColor
        self.frozenHeaderBackgroundColor = frozenHeaderBackgroundColor
        self.headerBackgroundColor = headerBackgroundColor
        self.frozenColumnBackgroundColor = frozenColumnBackgroundColor
        self.bodyBackgroundColor = bodyBackgroundColor
        self.frozenHeaderTextColor = frozenHeaderTextColor
        self.headerTextColor = headerTextColor
        self.primaryTextColor = primaryTextColor
        self.secondaryTextColor = secondaryTextColor
        self.headerFont = headerFont
        self.bodyFont = bodyFont
        self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        self.bouncesHorizontally = bouncesHorizontally
    }
}
