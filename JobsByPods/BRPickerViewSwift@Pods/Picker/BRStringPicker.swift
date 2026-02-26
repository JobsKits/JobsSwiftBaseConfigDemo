
import UIKit

public final class BRStringPicker: BRBasePicker<String>, UIPickerViewDelegate, UIPickerViewDataSource {

    private var data: [String] = []
    private var selectedIndex: Int = 0
    private let picker = UIPickerView()
    private var lastSelected: Int = 0

    @discardableResult public func byDataSource(_ v: [String]) -> Self { data = v; selectedIndex = 0; return self }
    @discardableResult public func bySelectedIndex(_ idx: Int) -> Self { selectedIndex = max(0, min(idx, max(0, data.count-1))); return self }

    public override func buildContentView() -> UIView {
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(selectedIndex, inComponent: 0, animated: false)
        br_on_main_async { [weak self] in self?.applySelectionColors() }
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
        let label = (view as? UILabel) ?? UILabel()
        label.textAlignment = .center
        label.font = theme.pickerFont
        label.textColor = theme.pickerTextColor
        label.text = data[row]
        label.backgroundColor = .clear
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let old = lastSelected
        lastSelected = row
        br_on_main_async { [weak self] in
            guard let self else { return }
            self.applyRowColor(pickerView, row: old, selected: false)
            self.applyRowColor(pickerView, row: row, selected: true)
        }
        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applySelectionColors() {
        let r = picker.selectedRow(inComponent: 0)
        lastSelected = r
        applyRowColor(picker, row: r, selected: true)
    }

    private func applyRowColor(_ pickerView: UIPickerView, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: 0) as? UILabel else { return }
        label.textColor = selected ? theme.pickerSelectedTextColor : theme.pickerTextColor
    }
}
