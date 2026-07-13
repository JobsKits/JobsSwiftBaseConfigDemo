//
//  JobsSwiftCalendarAppearance.swift
//  JobsSwiftCalendar
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines

public final class JobsSwiftCalendarAppearance {
    public var headerDateFormat = "yyyy年MM月"
    public var headerTitleFont = JobsFont.systemFont(ofSize: 22, weight: .regular)
    public var headerTitleColor = JobsCor.black
    public var headerTitleAlignment = NSTextAlignment.center
    public var headerTitleOffset = CGPoint.zero
    public var headerHeight: CGFloat = 56
    public var weekdayHeight: CGFloat = 34
    public var headerMinimumDissolvedAlpha: CGFloat = 0
    public var caseOptions: JobsSwiftCalendarCaseOptions = .headerUsesDefaultCase
    public var weekdayFont = JobsFont.systemFont(ofSize: 15, weight: .regular)
    public var weekdayTextColor = JobsCor.systemBlue
    public var titleFont = JobsFont.systemFont(ofSize: 17, weight: .regular)
    public var subtitleFont = JobsFont.systemFont(ofSize: 10, weight: .regular)
    public var titleDefaultColor = JobsCor.black
    public var titlePlaceholderColor = JobsCor.lightGray
    public var titleSelectionColor = JobsCor.white
    public var titleTodayColor = JobsCor.white
    public var subtitleDefaultColor = JobsCor.darkGray
    public var subtitlePlaceholderColor = JobsCor.lightGray
    public var subtitleSelectionColor = JobsCor.white
    public var selectionColor = JobsCor.systemRed
    public var todayColor = JobsCor.systemBlue
    public var eventDefaultColor = JobsCor.systemBlue
    public var eventSelectionColor = JobsCor.white

    public init() {}
}
