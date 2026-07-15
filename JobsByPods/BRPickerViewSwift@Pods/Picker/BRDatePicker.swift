//
//  BRDatePicker.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public final class BRDatePicker: BRBasePicker<Date>, UIPickerViewDelegate, UIPickerViewDataSource {
    public enum Mode { case ymd, ym, y }

    private var mode: Mode = .ymd
    private var minDate: Date?
    private var maxDate: Date?
    private var selectDate: Date = Date()
    private var allowToNow: Bool = false

    private var years: [Int] = []
    private var months: [Int] = Array(1...12)
    private var days: [Int] = Array(1...31)

    private let picker = UIPickerView()
    private var lastSelectedRow: [Int: Int] = [:]
    /// Only highlight the component(s) that the user has actually scrolled.
    private var touchedComponents: Set<Int> = []

    // MARK: - Fluent
    @discardableResult public func byMode(_ m: Mode) -> Self { mode = m; return self }
    @discardableResult public func byMinDate(_ d: Date?) -> Self { minDate = d; return self }
    @discardableResult public func byMaxDate(_ d: Date?) -> Self { maxDate = d; return self }
    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byAllowToNow(_ v: Bool) -> Self { allowToNow = v; return self }

    // MARK: - Core overrides
    public override func buildContentView() -> UIView {
        configureData()
        picker.dataSource = self
        picker.delegate = self
        // preselect
        preselect()
        // Default state: no highlight until user scrolls.
        for comp in 0..<numberOfComponents(in: picker) {
            lastSelectedRow[comp] = picker.selectedRow(inComponent: comp)
        };return picker
    }

    public override func confirmSelection() {
        if allowToNow {
            // Enterprise hook: if user selects "to now" in future extensions; currently unused
        }
        if let date = makeDate() {
            // enforce bounds
            if let minDate, date < minDate { send(minDate) }
            else if let maxDate, date > maxDate { send(maxDate) }
            else { send(date) }
        }
    }

    // MARK: - Data
    private func configureData() {
        let cal = BRCalendar.gregorian
        let yNow = cal.component(.year, from: Date())
        let minY = minDate.map { cal.component(.year, from: $0) } ?? (yNow - 100)
        let maxY = maxDate.map { cal.component(.year, from: $0) } ?? (yNow + 30)
        years = Array(minY...maxY)
        rebuildDays()
    }

    private func rebuildDays(year: Int? = nil, month: Int? = nil) {
        let cal = BRCalendar.gregorian
        let y = year ?? cal.component(.year, from: selectDate)
        let m = month ?? cal.component(.month, from: selectDate)
        if let date = cal.date(from: DateComponents(year: y, month: m)),
           let range = cal.range(of: .day, in: .month, for: date) {
            days = Array(range)
        } else {
            days = Array(1...30)
        }
    }

    private func preselect() {
        let cal = BRCalendar.gregorian
        let y = cal.component(.year, from: selectDate)
        let m = cal.component(.month, from: selectDate)
        let d = cal.component(.day, from: selectDate)
        func sel(_ comp: Int, _ row: Int) { picker.selectRow(row, inComponent: comp, animated: false) }
        switch mode {
        case .ymd:
            sel(0, years.firstIndex(of: y) ?? 0)
            sel(1, m - 1)
            rebuildDays(year: y, month: m)
            BRiOS12SafePickerReload.reload(picker, component: 2)
            sel(2, min(d - 1, max(0, days.count - 1)))
        case .ym:
            sel(0, years.firstIndex(of: y) ?? 0)
            sel(1, m - 1)
        case .y:
            sel(0, years.firstIndex(of: y) ?? 0)
        }
    }

    private func makeDate() -> Date? {
        var comps = DateComponents()
        let cal = BRCalendar.gregorian
        func s(_ c: Int) -> Int { picker.selectedRow(inComponent: c) }
        switch mode {
        case .ymd:
            comps.year = years[s(0)]
            comps.month = s(1) + 1
            comps.day = days[min(s(2), max(0, days.count - 1))]
        case .ym:
            comps.year = years[s(0)]
            comps.month = s(1) + 1
            comps.day = 1
        case .y:
            comps.year = years[s(0)]
            comps.month = 1
            comps.day = 1
        };return cal.date(from: comps)
    }

    // MARK: - UIPicker DataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch mode {
        case .ymd: return 3
        case .ym: return 2
        case .y: return 1
        }
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch mode {
        case .ymd:
            return component == 0 ? years.count : (component == 1 ? months.count : days.count)
        case .ym:
            return component == 0 ? years.count : months.count
        case .y:
            return years.count
        }
    }

    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        theme.pickerHeight / 5.0
    }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        label.textAlignment = .center
        label.font = theme.pickerFont
        label.textColor = theme.pickerTextColor
        label.backgroundColor = .clear
        switch mode {
        case .ymd:
            if component == 0 { label.text = "\(years[row])年" }
            else if component == 1 { label.text = "\(months[row])月" }
            else { label.text = "\(days[row])日" }
        case .ym:
            label.text = (component == 0) ? "\(years[row])年" : "\(months[row])月"
        case .y:
            label.text = "\(years[row])年"
        }
        // iOS12: no selectedRow checks here (avoid flicker); color updated in didSelect
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // mark user interaction for this component
        touchedComponents.insert(component)
        // store old row for color swap
        let oldRow = lastSelectedRow[component] ?? row
        lastSelectedRow[component] = row
        var needsReloadDays = false
        if mode == .ymd, (component == 0 || component == 1) {
            let y = years[pickerView.selectedRow(inComponent: 0)]
            let m = months[pickerView.selectedRow(inComponent: 1)]
            rebuildDays(year: y, month: m)
            needsReloadDays = true
        }
        // async reload (iOS12 safe)
        br_on_main_async { [weak self] in
            guard let self else { return }
            if needsReloadDays {
                BRiOS12SafePickerReload.reload(pickerView, component: 2)
                // keep day selection in range
                let dayRow = min(pickerView.selectedRow(inComponent: 2), max(0, self.days.count - 1))
                pickerView.selectRow(dayRow, inComponent: 2, animated: false)
            }
            // update colors for just old/new rows in changed component
            self.applyRowColor(pickerView, component: component, row: oldRow, selected: false)
            self.applyRowColor(
                pickerView,
                component: component,
                row: row,
                selected: self.touchedComponents.contains(component)
            )
            if needsReloadDays {
                let dayComp = 2
                let dayRow = pickerView.selectedRow(inComponent: dayComp)
                let oldDay = self.lastSelectedRow[dayComp] ?? dayRow
                self.lastSelectedRow[dayComp] = dayRow
                self.applyRowColor(pickerView, component: dayComp, row: oldDay, selected: false)
                self.applyRowColor(
                    pickerView,
                    component: dayComp,
                    row: dayRow,
                    selected: self.touchedComponents.contains(dayComp)
                )
            }
        }
        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applyRowColor(_ pickerView: UIPickerView, component: Int, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else { return }
        label.textColor = selected ? theme.pickerSelectedTextColor : theme.pickerTextColor
    }
}
