//
//  JobsSwiftCalendarDefines.swift
//  JobsSwiftCalendar
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public enum JobsSwiftCalendarMonthPosition {
    case notFound
    case previous
    case current
    case next
}

public enum JobsSwiftCalendarScope {
    case month
    case week
}

public enum JobsSwiftCalendarPlaceholderType {
    case none
    case fillHeadTail
    case fillSixRows
}

public struct JobsSwiftCalendarCaseOptions: OptionSet {
    public let rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    public static let headerUsesDefaultCase: JobsSwiftCalendarCaseOptions = []
    public static let headerUsesUpperCase = JobsSwiftCalendarCaseOptions(rawValue: 1 << 0)
    public static let weekdayUsesUpperCase = JobsSwiftCalendarCaseOptions(rawValue: 1 << 1)
    public static let weekdayUsesSingleUpperCase = JobsSwiftCalendarCaseOptions(rawValue: 1 << 2)
}

public protocol JobsSwiftCalendarDataSource: AnyObject {
    func calendar(_ calendar: JobsSwiftCalendar, titleFor date: Date) -> String?
    func calendar(_ calendar: JobsSwiftCalendar, subtitleFor date: Date) -> String?
    func calendar(_ calendar: JobsSwiftCalendar, imageFor date: Date) -> UIImage?
    func minimumDate(for calendar: JobsSwiftCalendar) -> Date
    func maximumDate(for calendar: JobsSwiftCalendar) -> Date
    func calendar(_ calendar: JobsSwiftCalendar,
                  cellFor date: Date,
                  atMonthPosition position: JobsSwiftCalendarMonthPosition) -> JobsSwiftCalendarDayCell?
    func calendar(_ calendar: JobsSwiftCalendar, numberOfEventsFor date: Date) -> Int
}

public extension JobsSwiftCalendarDataSource {
    func calendar(_ calendar: JobsSwiftCalendar, titleFor date: Date) -> String? { nil }
    func calendar(_ calendar: JobsSwiftCalendar, subtitleFor date: Date) -> String? { nil }
    func calendar(_ calendar: JobsSwiftCalendar, imageFor date: Date) -> UIImage? { nil }
    func minimumDate(for calendar: JobsSwiftCalendar) -> Date { Date.distantPast }
    func maximumDate(for calendar: JobsSwiftCalendar) -> Date { Date.distantFuture }
    func calendar(_ calendar: JobsSwiftCalendar,
                  cellFor date: Date,
                  atMonthPosition position: JobsSwiftCalendarMonthPosition) -> JobsSwiftCalendarDayCell? { nil }
    func calendar(_ calendar: JobsSwiftCalendar, numberOfEventsFor date: Date) -> Int { 0 }
}

public protocol JobsSwiftCalendarDelegate: AnyObject {
    func calendar(_ calendar: JobsSwiftCalendar,
                  shouldSelect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) -> Bool
    func calendar(_ calendar: JobsSwiftCalendar,
                  didSelect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition)
    func calendar(_ calendar: JobsSwiftCalendar,
                  shouldDeselect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) -> Bool
    func calendar(_ calendar: JobsSwiftCalendar,
                  didDeselect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition)
    func calendar(_ calendar: JobsSwiftCalendar,
                  boundingRectWillChange bounds: CGRect,
                  animated: Bool)
    func calendar(_ calendar: JobsSwiftCalendar,
                  willDisplay cell: JobsSwiftCalendarDayCell,
                  for date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition)
    func calendarCurrentPageDidChange(_ calendar: JobsSwiftCalendar)
}

public extension JobsSwiftCalendarDelegate {
    func calendar(_ calendar: JobsSwiftCalendar,
                  shouldSelect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) -> Bool { true }
    func calendar(_ calendar: JobsSwiftCalendar,
                  didSelect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) {}
    func calendar(_ calendar: JobsSwiftCalendar,
                  shouldDeselect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) -> Bool { true }
    func calendar(_ calendar: JobsSwiftCalendar,
                  didDeselect date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) {}
    func calendar(_ calendar: JobsSwiftCalendar,
                  boundingRectWillChange bounds: CGRect,
                  animated: Bool) {}
    func calendar(_ calendar: JobsSwiftCalendar,
                  willDisplay cell: JobsSwiftCalendarDayCell,
                  for date: Date,
                  atMonthPosition monthPosition: JobsSwiftCalendarMonthPosition) {}
    func calendarCurrentPageDidChange(_ calendar: JobsSwiftCalendar) {}
}

public protocol JobsSwiftCalendarDelegateAppearance: AnyObject {
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor?
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  titleSelectionColorFor date: Date) -> UIColor?
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  subtitleDefaultColorFor date: Date) -> UIColor?
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  selectionColorFor date: Date) -> UIColor?
}

public extension JobsSwiftCalendarDelegateAppearance {
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor? { nil }
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  titleSelectionColorFor date: Date) -> UIColor? { nil }
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  subtitleDefaultColorFor date: Date) -> UIColor? { nil }
    func calendar(_ calendar: JobsSwiftCalendar,
                  appearance: JobsSwiftCalendarAppearance,
                  selectionColorFor date: Date) -> UIColor? { nil }
}
