//
//  BRStringPicker.swift
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

public final class BRStringPicker: BRBasePicker<String>, UIPickerViewDelegate, UIPickerViewDataSource {
    private var data: [String] = []
    private var selectedIndex: Int = 0
    private let picker = UIPickerView.jobsMake { _ in }
    private var lastSelected: Int = 0
    private var hasUserInteracted: Bool = false

    @discardableResult public func byDataSource(_ v: [String]) -> Self { data = v; selectedIndex = 0; return self }
    @discardableResult public func bySelectedIndex(_ idx: Int) -> Self { selectedIndex = max(0, min(idx, max(0, data.count-1))); return self }

    public override func buildContentView() -> UIView {
        picker
            .byDelegate(self)
            .byDataSource(self)
        picker.selectRow(selectedIndex, inComponent: 0, animated: false)
        // Default state: no highlight until user scrolls.
        lastSelected = picker.selectedRow(inComponent: 0)
        return picker
    }

    public override func confirmSelection() {
        guard !data.isEmpty else { return }
        let idx = picker.selectedRow(inComponent: 0)
        send(data[idx])
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { data.count }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { theme.pickerHeight / 5.0 }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel.jobsMake { _ in }
        label
            .byTextAlignment(.center)
            .byFont(theme.pickerFont)
            .byTextColor(theme.pickerTextColor)
            .byText(data[row])
            .byBackgroundColor(.clear)
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let old = lastSelected
        lastSelected = row
        hasUserInteracted = true
        br_on_main_async { [weak self] in
            guard let self else { return }
            self.applyRowColor(pickerView, row: old, selected: false)
            self.applyRowColor(pickerView, row: row, selected: self.hasUserInteracted)
        }
        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applyRowColor(_ pickerView: UIPickerView, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: 0) as? UILabel else { return }
        label.byTextColor(selected ? theme.pickerSelectedTextColor : theme.pickerTextColor)
    }
}
