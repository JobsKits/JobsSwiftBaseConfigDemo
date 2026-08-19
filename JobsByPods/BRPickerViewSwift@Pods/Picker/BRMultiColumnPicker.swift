//
//  BRMultiColumnPicker.swift
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

public final class BRMultiColumnPicker: BRBasePicker<[String]>, UIPickerViewDelegate, UIPickerViewDataSource {
    private var columns: [[String]] = []
    private var selectedRows: [Int] = []
    private let picker = UIPickerView.jobsMake { _ in }
    private var lastSelectedRow: [Int: Int] = [:]
    /// Only highlight the component(s) that the user has actually scrolled.
    private var touchedComponents: Set<Int> = []

    @discardableResult
    public func byColumns(_ cols: [[String]]) -> Self {
        columns = cols
        selectedRows = cols.map { _ in 0 };return self
    }

    @discardableResult
    public func bySelectedRows(_ rows: [Int]) -> Self {
        guard !columns.isEmpty else { return self }
        selectedRows = rows.enumerated().map { idx, v in
            let maxRow = max(0, columns[idx].count - 1)
            return max(0, min(v, maxRow))
        };return self
    }

    public override func buildContentView() -> UIView {
        picker
            .byDelegate(self)
            .byDataSource(self)
        for (i,r) in selectedRows.enumerated() {
            picker.selectRow(r, inComponent: i, animated: false)
        }
        // Default state: no highlight until user scrolls.
        for c in 0..<numberOfComponents(in: picker) {
            lastSelectedRow[c] = picker.selectedRow(inComponent: c)
        };return picker
    }

    public override func confirmSelection() {
        guard !columns.isEmpty else { return }
        var out: [String] = []
        for i in 0..<columns.count {
            let r = picker.selectedRow(inComponent: i)
            if columns[i].indices.contains(r) {
                out.append(columns[i][r])
            }
        }
        send(out)
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int { columns.count }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { columns[component].count }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { theme.pickerHeight / 5.0 }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel.jobsMake { _ in }
        label
            .byTextAlignment(.center)
            .byFont(theme.pickerFont)
            .byTextColor(theme.pickerTextColor)
            .byText(columns[component][row])
            .byBackgroundColor(.clear)
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // mark user interaction for this component
        touchedComponents.insert(component)
        let old = lastSelectedRow[component] ?? row
        lastSelectedRow[component] = row
        // update colors only for changed component
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
