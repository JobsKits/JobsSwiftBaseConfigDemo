import UIKit
import Foundation

// MARK: - System UIDatePicker wrappers (iOS 12+)
public final class BRSystemDatePicker: BRBasePicker<Date> {

    private var selectDate: Date = Date()
    private var minDate: Date?
    private var maxDate: Date?
    private var minuteInterval: Int = 1
    private var locale: Locale = .current

    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byMinDate(_ d: Date?) -> Self { minDate = d; return self }
    @discardableResult public func byMaxDate(_ d: Date?) -> Self { maxDate = d; return self }
    @discardableResult public func byMinuteInterval(_ v: Int) -> Self { minuteInterval = max(1, min(v, 30)); return self }
    @discardableResult public func byLocale(_ v: Locale) -> Self { locale = v; return self }

    private let picker = UIDatePicker()

    public override func buildContentView() -> UIView {
        picker.datePickerMode = .date
        if #available(iOS 13.4, *) { picker.preferredDatePickerStyle = .wheels }
        picker.locale = locale
        picker.minuteInterval = minuteInterval
        picker.date = selectDate
        picker.minimumDate = minDate
        picker.maximumDate = maxDate
        picker.backgroundColor = theme.panelBackgroundColor
        return picker
    }

    public override func confirmSelection() {
        send(picker.date)
    }
}

public final class BRSystemDateTimePicker: BRBasePicker<Date> {

    private var selectDate: Date = Date()
    private var minDate: Date?
    private var maxDate: Date?
    private var minuteInterval: Int = 1
    private var locale: Locale = .current

    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byMinDate(_ d: Date?) -> Self { minDate = d; return self }
    @discardableResult public func byMaxDate(_ d: Date?) -> Self { maxDate = d; return self }
    @discardableResult public func byMinuteInterval(_ v: Int) -> Self { minuteInterval = max(1, min(v, 30)); return self }
    @discardableResult public func byLocale(_ v: Locale) -> Self { locale = v; return self }

    private let picker = UIDatePicker()

    public override func buildContentView() -> UIView {
        picker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) { picker.preferredDatePickerStyle = .wheels }
        picker.locale = locale
        picker.minuteInterval = minuteInterval
        picker.date = selectDate
        picker.minimumDate = minDate
        picker.maximumDate = maxDate
        picker.backgroundColor = theme.panelBackgroundColor
        return picker
    }

    public override func confirmSelection() {
        send(picker.date)
    }
}

public final class BRSystemTimePicker: BRBasePicker<Date> {

    private var selectDate: Date = Date()
    private var minuteInterval: Int = 1
    private var locale: Locale = .current
    private var use12HourClock: Bool = false

    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byMinuteInterval(_ v: Int) -> Self { minuteInterval = max(1, min(v, 30)); return self }
    @discardableResult public func byLocale(_ v: Locale) -> Self { locale = v; return self }
    @discardableResult public func byUse12HourClock(_ v: Bool) -> Self { use12HourClock = v; return self }

    private let picker = UIDatePicker()

    public override func buildContentView() -> UIView {
        picker.datePickerMode = .time
        if #available(iOS 13.4, *) { picker.preferredDatePickerStyle = .wheels }
        picker.minuteInterval = minuteInterval
        picker.date = selectDate
        picker.locale = use12HourClock ? Locale(identifier: "en_US_POSIX") : locale
        picker.backgroundColor = theme.panelBackgroundColor
        return picker
    }

    public override func confirmSelection() {
        send(picker.date)
    }
}

public final class BRSystemCountDownPicker: BRBasePicker<Date> {

    private var countDownDuration: TimeInterval = 0 // seconds
    private var minuteInterval: Int = 1

    /// Convenience: allow old callsites that pass Date() to keep working.
    @discardableResult public func bySelectDate(_ _: Date) -> Self { return self }

    /// Recommended: set duration explicitly (seconds)
    @discardableResult public func byCountDownDuration(_ seconds: TimeInterval) -> Self {
        countDownDuration = max(0, seconds)
        return self
    }

    /// Recommended: set duration by hours/minutes
    @discardableResult public func byCountDown(hours: Int, minutes: Int) -> Self {
        let h = max(0, hours)
        let m = max(0, minutes)
        countDownDuration = TimeInterval(h * 3600 + m * 60)
        return self
    }

    @discardableResult public func byMinuteInterval(_ v: Int) -> Self { minuteInterval = max(1, min(v, 30)); return self }

    private let picker = UIDatePicker()

    public override func buildContentView() -> UIView {
        picker.datePickerMode = .countDownTimer
        if #available(iOS 13.4, *) { picker.preferredDatePickerStyle = .wheels }
        picker.minuteInterval = minuteInterval
        picker.countDownDuration = countDownDuration
        picker.backgroundColor = theme.panelBackgroundColor
        return picker
    }

    public override func confirmSelection() {
        // Return Date-like value so existing demo fmt(HH:mm) works.
        send(Date(timeIntervalSince1970: picker.countDownDuration))
    }
}
