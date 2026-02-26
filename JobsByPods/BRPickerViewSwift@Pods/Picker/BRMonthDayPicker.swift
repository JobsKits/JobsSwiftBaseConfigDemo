import UIKit
import Foundation

public final class BRMonthDayPicker: BRBasePicker<Date>, UIPickerViewDelegate, UIPickerViewDataSource {

    private var selectDate: Date = Date()
    private var minDate: Date?
    private var maxDate: Date?

    private var months: [Int] = Array(1...12)
    private var days: [Int] = Array(1...31)

    private let picker = UIPickerView()
    private var lastSelectedRow: [Int: Int] = [:]

    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byMinDate(_ d: Date?) -> Self { minDate = d; return self }
    @discardableResult public func byMaxDate(_ d: Date?) -> Self { maxDate = d; return self }

    public override func buildContentView() -> UIView {
        picker.delegate = self
        picker.dataSource = self
        rebuildDays(month: BRCalendar.gregorian.component(.month, from: selectDate))

        let m = BRCalendar.gregorian.component(.month, from: selectDate)
        let d = BRCalendar.gregorian.component(.day, from: selectDate)
        picker.selectRow(m - 1, inComponent: 0, animated: false)
        BRiOS12SafePickerReload.reload(picker, component: 1)
        picker.selectRow(min(d - 1, max(0, days.count - 1)), inComponent: 1, animated: false)

        br_on_main_async { [weak self] in self?.applySelectionColors() }
        return picker
    }

    public override func confirmSelection() {
        let m = months[picker.selectedRow(inComponent: 0)]
        let d = days[min(picker.selectedRow(inComponent: 1), max(0, days.count - 1))]

        var comps = DateComponents()
        comps.year = BRCalendar.gregorian.component(.year, from: selectDate)
        comps.month = m
        comps.day = d
        comps.hour = 0
        comps.minute = 0
        comps.second = 0

        if let date = BRCalendar.gregorian.date(from: comps) {
            if let minDate, date < minDate { send(minDate) }
            else if let maxDate, date > maxDate { send(maxDate) }
            else { send(date) }
        }
    }

    private func rebuildDays(month: Int) {
        let y = BRCalendar.gregorian.component(.year, from: selectDate)
        if let date = BRCalendar.gregorian.date(from: DateComponents(year: y, month: month)),
           let range = BRCalendar.gregorian.range(of: .day, in: .month, for: date) {
            days = Array(range)
        } else {
            days = Array(1...30)
        }
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int { 2 }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        component == 0 ? months.count : days.count
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
        label.text = component == 0 ? "\(months[row])月" : "\(days[row])日"
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let old = lastSelectedRow[component] ?? row
        lastSelectedRow[component] = row

        if component == 0 {
            let m = months[row]
            rebuildDays(month: m)
            BRiOS12SafePickerReload.reload(pickerView, component: 1)
            let dayRow = min(pickerView.selectedRow(inComponent: 1), max(0, days.count - 1))
            pickerView.selectRow(dayRow, inComponent: 1, animated: false)
            lastSelectedRow[1] = dayRow
        }

        br_on_main_async { [weak self] in
            guard let self else { return }
            self.applyRowColor(pickerView, component: component, row: old, selected: false)
            self.applyRowColor(pickerView, component: component, row: row, selected: true)
            self.applySelectionColors()
        }

        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applySelectionColors() {
        for comp in 0..<2 {
            let r = picker.selectedRow(inComponent: comp)
            lastSelectedRow[comp] = r
            applyRowColor(picker, component: comp, row: r, selected: true)
        }
    }

    private func applyRowColor(_ pickerView: UIPickerView, component: Int, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else { return }
        label.textColor = selected ? theme.pickerSelectedTextColor : theme.pickerTextColor
    }
}
