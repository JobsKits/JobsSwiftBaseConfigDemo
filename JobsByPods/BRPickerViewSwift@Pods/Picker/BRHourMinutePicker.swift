//
//  BRHourMinutePicker.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL

public final class BRHourMinutePicker: BRBasePicker<Date>, UIPickerViewDelegate, UIPickerViewDataSource {
    private var selectDate: Date = Date()
    private var minuteInterval: Int = 5

    private let picker = UIPickerView.jobsMake { _ in }
    private var hours: [Int] = Array(0...23)
    private var minutes: [Int] = Array(0...59)

    private var lastSelectedRow: [Int: Int] = [:]
    /// Only highlight the component(s) that the user has actually scrolled.
    private var touchedComponents: Set<Int> = []

    @discardableResult public func bySelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult public func byMinuteInterval(_ v: Int) -> Self { minuteInterval = max(1, min(v, 30)); return self }

    public override func buildContentView() -> UIView {
        picker
            .byDelegate(self)
            .byDataSource(self)
        let cal = BRCalendar.gregorian
        let h = cal.component(.hour, from: selectDate)
        let m = cal.component(.minute, from: selectDate)
        let step = minuteInterval
        let snapped = (m / step) * step
        let minuteRow = snapped / step
        picker.selectRow(h, inComponent: 0, animated: false)
        picker.selectRow(minuteRow, inComponent: 1, animated: false)
        // Default state: no highlight until user scrolls.
        lastSelectedRow[0] = picker.selectedRow(inComponent: 0)
        lastSelectedRow[1] = picker.selectedRow(inComponent: 1)
        return picker
    }

    public override func confirmSelection() {
        let cal = BRCalendar.gregorian
        let y = cal.component(.year, from: selectDate)
        let mo = cal.component(.month, from: selectDate)
        let d = cal.component(.day, from: selectDate)
        let h = hours[picker.selectedRow(inComponent: 0)]
        let step = minuteInterval
        let minuteRow = picker.selectedRow(inComponent: 1)
        let mi = minuteRow * step
        var comps = DateComponents()
        comps.year = y
        comps.month = mo
        comps.day = d
        comps.hour = h
        comps.minute = mi
        comps.second = 0
        if let date = cal.date(from: comps) {
            send(date)
        }
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int { 2 }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { return hours.count };return max(1, minutes.count / minuteInterval)
    }

    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        theme.pickerHeight / 5.0
    }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel.jobsMake { _ in }
        label
            .byTextAlignment(.center)
            .byFont(theme.pickerFont)
            .byTextColor(theme.pickerTextColor)
            .byBackgroundColor(.clear)
        if component == 0 {
            label.byText("\(hours[row])时")
        } else {
            let step = minuteInterval
            label.byText(String(format: "%02d分", row * step))
        };return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let old = lastSelectedRow[component] ?? row
        lastSelectedRow[component] = row
        // mark user interaction for this component
        touchedComponents.insert(component)
        br_on_main_async { [weak self] in
            guard let self else { return }
            self.applyRowColor(pickerView, component: component, row: old, selected: false)
            self.applyRowColor(
                pickerView,
                component: component,
                row: row,
                selected: self.touchedComponents.contains(component)
            )
        }
        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applyRowColor(_ pickerView: UIPickerView, component: Int, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else { return }
        label.byTextColor(selected ? theme.pickerSelectedTextColor : theme.pickerTextColor)
    }
}
