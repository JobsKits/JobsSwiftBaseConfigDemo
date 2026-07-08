//
//  JobsSwiftCalendar.swift
//  JobsSwiftCalendar
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public final class JobsSwiftCalendar: UIView {
    public weak var dataSource: JobsSwiftCalendarDataSource?
    public weak var delegate: JobsSwiftCalendarDelegate?
    public weak var appearanceDelegate: JobsSwiftCalendarDelegateAppearance?
    public private(set) var appearance = JobsSwiftCalendarAppearance()
    public var gregorian: Foundation.Calendar = {
        var calendar = Foundation.Calendar(identifier: .gregorian)
        calendar.locale = .current
        calendar.timeZone = .current
        return calendar
    }()
    public var formatter = DateFormatter()
    public var today: Date?
    public var currentPage: Date {
        get { jobsCurrentPage }
        set { setCurrentPage(newValue, animated: false) }
    }
    public private(set) var minimumDate = Date.distantPast
    public private(set) var maximumDate = Date.distantFuture
    public private(set) var selectedDates: [Date] = []
    public var allowsMultipleSelection = false
    public var isScrollEnabled = true
    public var swipeToChooseEnabled = true
    public var adjustsBoundingRectWhenChangingMonths = true
    public var scope = JobsSwiftCalendarScope.month {
        didSet {
            guard oldValue != scope else { return }
            reloadData()
            jobsNotifyBoundingRectIfNeeded(animated: true)
        }
    }
    public var placeholderType = JobsSwiftCalendarPlaceholderType.fillSixRows {
        didSet {
            guard oldValue != placeholderType else { return }
            reloadData()
        }
    }
    public var jobsAutomaticallyInvalidateLayoutOnBoundsChange = true
    public var jobsReloadDataAfterBoundsChange = true

    private var jobsCurrentPage = Date()
    private var headerLabel = UILabel()
    private var weekdayLabels: [UILabel] = []
    private var dayCells: [JobsSwiftCalendarDayCell] = []
    private var jobsMutableSelectedDates: [Date] = []
    private var jobsVisibleDates: [Date] = []
    private var jobsDayFormatter = DateFormatter()
    private var jobsLastStableBoundsSize = CGSize.zero
    private var jobsPendingBoundsReload = false

    public override init(frame: CGRect) {
        super.init(frame: frame)
        jobsCommonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        jobsCommonInit()
    }

    public override func layoutSubviews() {
        let boundsSize = bounds.size
        let sizeIsValid = boundsSize.width > 0 && boundsSize.height > 0
        let sizeChanged = sizeIsValid && jobsLastStableBoundsSize != boundsSize
        super.layoutSubviews()
        let width = bounds.width
        let height = bounds.height
        let headerHeight = min(appearance.headerHeight, height)
        let weekdayHeight = min(appearance.weekdayHeight, max(0, height - headerHeight))
        let rowCount: CGFloat = scope == .week ? 1 : 6
        let gridY = headerHeight + weekdayHeight
        let rowHeight = rowCount > 0 ? max(0, (height - gridY) / rowCount) : 0
        let columnWidth = width / 7
        headerLabel.frame = CGRect(x: 0,
                                   y: 0,
                                   width: width,
                                   height: headerHeight).offsetBy(dx: appearance.headerTitleOffset.x,
                                                                  dy: appearance.headerTitleOffset.y)
        weekdayLabels.enumerated().forEach { index, label in
            label.frame = CGRect(x: columnWidth * CGFloat(index),
                                 y: headerHeight,
                                 width: columnWidth,
                                 height: weekdayHeight)
        }
        dayCells.enumerated().forEach { index, cell in
            let row = index / 7
            let column = index % 7
            cell.isHidden = CGFloat(row) >= rowCount
            cell.frame = CGRect(x: columnWidth * CGFloat(column),
                                y: gridY + rowHeight * CGFloat(row),
                                width: columnWidth,
                                height: rowHeight)
        }
        if jobsAutomaticallyInvalidateLayoutOnBoundsChange && sizeChanged {
            jobsLastStableBoundsSize = boundsSize
            jobsInvalidateCalendarLayout()
            if jobsReloadDataAfterBoundsChange {
                jobsScheduleBoundsReloadIfNeeded()
            }
        }
    }

    public func reloadData() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.reloadData()
            };return
        }
        jobsReloadCalendarData()
        setNeedsLayout()
    }

    public func setCurrentPage(_ currentPage: Date, animated: Bool) {
        let date = jobsStartOfMonth(currentPage)
        guard !jobsDate(date, isSameMonthAs: jobsCurrentPage) else { return }
        jobsCurrentPage = date
        let updates: () -> Void = { [weak self] in
            self?.reloadData()
        }
        if animated {
            UIView.transition(with: self,
                              duration: 0.2,
                              options: .transitionCrossDissolve,
                              animations: updates,
                              completion: nil)
        } else {
            updates()
        }
        delegate?.calendarCurrentPageDidChange(self)
    }

    public func selectDate(_ date: Date?) {
        guard let date else { return }
        let day = jobsStartOfDay(date)
        guard jobsDateIsSelectable(day) else { return }
        if !allowsMultipleSelection {
            jobsMutableSelectedDates.removeAll()
        }
        if !jobsMutableSelectedDates.contains(where: { jobsDate($0, isSameDayAs: day) }) {
            jobsMutableSelectedDates.append(day)
        }
        selectedDates = jobsMutableSelectedDates
        reloadData()
    }

    public func deselectDate(_ date: Date?) {
        guard let date else { return }
        let day = jobsStartOfDay(date)
        jobsMutableSelectedDates.removeAll { jobsDate($0, isSameDayAs: day) }
        selectedDates = jobsMutableSelectedDates
        reloadData()
    }

    public func boundingRect(for scope: JobsSwiftCalendarScope) -> CGRect {
        let rowCount: CGFloat = scope == .week ? 1 : 6
        let rowHeight: CGFloat = 42
        let height = appearance.headerHeight + appearance.weekdayHeight + rowHeight * rowCount
        return CGRect(x: 0, y: 0, width: bounds.width, height: height)
    }

    public func jobsInvalidateCalendarLayout() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.jobsInvalidateCalendarLayout()
            };return
        }
        setNeedsLayout()
        layoutIfNeeded()
    }

    public func jobsReloadDataSafely() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.jobsReloadDataSafely()
            };return
        }
        reloadData()
    }
}

private extension JobsSwiftCalendar {
    func jobsCommonInit() {
        formatter.calendar = gregorian
        formatter.locale = .current
        jobsDayFormatter.calendar = gregorian
        jobsDayFormatter.locale = .current
        jobsDayFormatter.dateFormat = "dd"
        today = jobsStartOfDay(Date())
        jobsCurrentPage = jobsStartOfMonth(today ?? Date())
        minimumDate = jobsStartOfDay(Date.distantPast)
        maximumDate = jobsStartOfDay(Date.distantFuture)
        clipsToBounds = true
        jobsInstallSubviews()
        jobsInstallGestureRecognizers()
        reloadData()
    }

    func jobsInstallSubviews() {
        headerLabel.textAlignment = .center
        addSubview(headerLabel)
        for _ in 0..<7 {
            let label = UILabel()
            label.textAlignment = .center
            weekdayLabels.append(label)
            addSubview(label)
        }
        for _ in 0..<42 {
            let cell = JobsSwiftCalendarDayCell(frame: .zero)
            cell.addTarget(self, action: #selector(jobsCellClickEvent(_:)), for: .touchUpInside)
            dayCells.append(cell)
            addSubview(cell)
        }
    }

    func jobsInstallGestureRecognizers() {
        let left = UISwipeGestureRecognizer(target: self, action: #selector(jobsSwipeGestureEvent(_:)))
        left.direction = .left
        addGestureRecognizer(left)
        let right = UISwipeGestureRecognizer(target: self, action: #selector(jobsSwipeGestureEvent(_:)))
        right.direction = .right
        addGestureRecognizer(right)
    }

    @objc func jobsSwipeGestureEvent(_ gesture: UISwipeGestureRecognizer) {
        guard isScrollEnabled else { return }
        if gesture.direction == .left {
            jobsMoveCurrentPage(byMonthOffset: 1)
        } else if gesture.direction == .right {
            jobsMoveCurrentPage(byMonthOffset: -1)
        }
    }

    func jobsScheduleBoundsReloadIfNeeded() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in
                self?.jobsScheduleBoundsReloadIfNeeded()
            };return
        }
        guard !jobsPendingBoundsReload else { return }
        jobsPendingBoundsReload = true
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.jobsPendingBoundsReload = false
            self.reloadData()
        }
    }

    func jobsReloadCalendarData() {
        minimumDate = jobsStartOfDay(dataSource?.minimumDate(for: self) ?? Date.distantPast)
        maximumDate = jobsStartOfDay(dataSource?.maximumDate(for: self) ?? Date.distantFuture)
        jobsReloadHeader()
        jobsReloadWeekdayLabels()
        jobsReloadDayCells()
    }

    func jobsReloadHeader() {
        formatter.dateFormat = appearance.headerDateFormat
        var title = formatter.string(from: currentPage)
        if appearance.caseOptions.contains(.headerUsesUpperCase) {
            title = title.uppercased()
        }
        headerLabel.text = title
        headerLabel.font = appearance.headerTitleFont
        headerLabel.textColor = appearance.headerTitleColor
        headerLabel.textAlignment = appearance.headerTitleAlignment
    }

    func jobsReloadWeekdayLabels() {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.calendar = gregorian
        let symbols = formatter.shortWeekdaySymbols ?? []
        let startIndex = max(0, gregorian.firstWeekday - 1)
        let orderedSymbols = (0..<7).map { index -> String in
            guard !symbols.isEmpty else { return "" }
            var symbol = symbols[(startIndex + index) % symbols.count]
            if appearance.caseOptions.contains(.weekdayUsesSingleUpperCase) {
                symbol = symbol.isEmpty ? symbol : String(symbol.prefix(1)).uppercased()
            } else if appearance.caseOptions.contains(.weekdayUsesUpperCase) {
                symbol = symbol.uppercased()
            };return symbol
        }
        weekdayLabels.enumerated().forEach { index, label in
            label.text = orderedSymbols[index]
            label.font = appearance.weekdayFont
            label.textColor = appearance.weekdayTextColor
        }
    }

    func jobsReloadDayCells() {
        let firstDayOfMonth = jobsStartOfMonth(currentPage)
        let firstWeekday = gregorian.component(.weekday, from: firstDayOfMonth)
        let offset = (firstWeekday - gregorian.firstWeekday + 7) % 7
        let firstVisibleDate = jobsDate(byAdding: .day, value: -offset, to: firstDayOfMonth)
        jobsVisibleDates = (0..<42).map { jobsDate(byAdding: .day, value: $0, to: firstVisibleDate) }
        dayCells.enumerated().forEach { index, cell in
            let date = jobsVisibleDates[index]
            let position = jobsMonthPosition(for: date)
            let placeholder = position != .current
            let hiddenByPlaceholder = placeholderType == .none && placeholder
            let title = hiddenByPlaceholder ? nil : (dataSource?.calendar(self, titleFor: date) ?? jobsDayFormatter.string(from: date))
            let subtitle = hiddenByPlaceholder ? nil : dataSource?.calendar(self, subtitleFor: date)
            let image = hiddenByPlaceholder ? nil : dataSource?.calendar(self, imageFor: date)
            let eventsCount = hiddenByPlaceholder ? 0 : (dataSource?.calendar(self, numberOfEventsFor: date) ?? 0)
            cell.date = date
            let selected = selectedDates.contains { jobsDate($0, isSameDayAs: date) }
            let isToday = today.map { jobsDate(date, isSameDayAs: $0) } ?? false
            let enabled = !hiddenByPlaceholder && jobsDateIsSelectable(date)
            cell.jobsConfigure(
                title: title,
                subtitle: subtitle,
                image: image,
                appearance: appearance,
                monthPosition: position,
                enabled: enabled,
                selected: selected,
                today: isToday,
                eventsCount: eventsCount,
                titleDefaultColor: appearanceDelegate?.calendar(self, appearance: appearance, titleDefaultColorFor: date),
                titleSelectionColor: appearanceDelegate?.calendar(self, appearance: appearance, titleSelectionColorFor: date),
                subtitleDefaultColor: appearanceDelegate?.calendar(self, appearance: appearance, subtitleDefaultColorFor: date),
                selectionColor: appearanceDelegate?.calendar(self, appearance: appearance, selectionColorFor: date)
            )
            delegate?.calendar(self, willDisplay: cell, for: date, atMonthPosition: position)
        }
    }

    func jobsMoveCurrentPage(byMonthOffset monthOffset: Int) {
        setCurrentPage(jobsDate(byAdding: .month, value: monthOffset, to: currentPage), animated: true)
    }

    @objc func jobsCellClickEvent(_ cell: JobsSwiftCalendarDayCell) {
        guard let cellDate = cell.date, cell.isEnabled else { return }
        let date = jobsStartOfDay(cellDate)
        let position = jobsMonthPosition(for: date)
        let selected = selectedDates.contains { jobsDate($0, isSameDayAs: date) }
        if selected {
            guard delegate?.calendar(self, shouldDeselect: date, atMonthPosition: position) ?? true else { return }
            deselectDate(date)
            delegate?.calendar(self, didDeselect: date, atMonthPosition: position)
            return
        }
        guard delegate?.calendar(self, shouldSelect: date, atMonthPosition: position) ?? true else { return }
        selectDate(date)
        if position != .current {
            setCurrentPage(date, animated: true)
        }
        delegate?.calendar(self, didSelect: date, atMonthPosition: position)
    }

    func jobsStartOfDay(_ date: Date) -> Date {
        gregorian.startOfDay(for: date)
    }

    func jobsStartOfMonth(_ date: Date) -> Date {
        var components = gregorian.dateComponents([.year, .month], from: date)
        components.day = 1
        return gregorian.date(from: components) ?? date
    }

    func jobsDate(byAdding component: Foundation.Calendar.Component, value: Int, to date: Date) -> Date {
        gregorian.date(byAdding: component, value: value, to: date) ?? date
    }

    func jobsDate(_ date: Date, isSameDayAs otherDate: Date) -> Bool {
        gregorian.isDate(date, inSameDayAs: otherDate)
    }

    func jobsDate(_ date: Date, isSameMonthAs otherDate: Date) -> Bool {
        let left = gregorian.dateComponents([.year, .month], from: date)
        let right = gregorian.dateComponents([.year, .month], from: otherDate)
        return left.year == right.year && left.month == right.month
    }

    func jobsDateIsSelectable(_ date: Date) -> Bool {
        date >= minimumDate && date <= maximumDate
    }

    func jobsMonthPosition(for date: Date) -> JobsSwiftCalendarMonthPosition {
        if jobsDate(date, isSameMonthAs: currentPage) {
            return .current
        };return date < currentPage ? .previous : .next
    }

    func jobsNotifyBoundingRectIfNeeded(animated: Bool) {
        delegate?.calendar(self, boundingRectWillChange: boundingRect(for: scope), animated: animated)
    }
}
