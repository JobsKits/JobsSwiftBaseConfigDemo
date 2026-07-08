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

public final class JobsSwiftCalendarAppearance {
    public var headerDateFormat = "yyyy年MM月"
    public var headerTitleFont = UIFont.systemFont(ofSize: 22, weight: .regular)
    public var headerTitleColor = UIColor.black
    public var headerTitleAlignment = NSTextAlignment.center
    public var headerTitleOffset = CGPoint.zero
    public var headerHeight: CGFloat = 56
    public var weekdayHeight: CGFloat = 34
    public var headerMinimumDissolvedAlpha: CGFloat = 0
    public var caseOptions: JobsSwiftCalendarCaseOptions = .headerUsesDefaultCase
    public var weekdayFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    public var weekdayTextColor = UIColor.systemBlue
    public var titleFont = UIFont.systemFont(ofSize: 17, weight: .regular)
    public var subtitleFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    public var titleDefaultColor = UIColor.black
    public var titlePlaceholderColor = UIColor.lightGray
    public var titleSelectionColor = UIColor.white
    public var titleTodayColor = UIColor.white
    public var subtitleDefaultColor = UIColor.darkGray
    public var subtitlePlaceholderColor = UIColor.lightGray
    public var subtitleSelectionColor = UIColor.white
    public var selectionColor = UIColor.systemRed
    public var todayColor = UIColor.systemBlue
    public var eventDefaultColor = UIColor.systemBlue
    public var eventSelectionColor = UIColor.white

    public init() {}
}
