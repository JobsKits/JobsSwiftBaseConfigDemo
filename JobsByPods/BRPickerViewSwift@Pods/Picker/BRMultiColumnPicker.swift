
import UIKit

public final class BRMultiColumnPicker: BRBasePicker<[String]>, UIPickerViewDelegate, UIPickerViewDataSource {

    private var columns: [[String]] = []
    private var selectedRows: [Int] = []
    private let picker = UIPickerView()

    @discardableResult
    public func byColumns(_ cols: [[String]]) -> Self {
        columns = cols
        selectedRows = cols.map { _ in 0 }
        return self
    }

    @discardableResult
    public func bySelectedRows(_ rows: [Int]) -> Self {
        guard !columns.isEmpty else { return self }
        selectedRows = rows.enumerated().map { idx, v in
            let maxRow = max(0, columns[idx].count - 1)
            return max(0, min(v, maxRow))
        }
        return self
    }

    public override func buildContentView() -> UIView {
        picker.delegate = self
        picker.dataSource = self
        for (i,r) in selectedRows.enumerated() {
            picker.selectRow(r, inComponent: i, animated: false)
        }
        br_on_main_async { [weak self] in self?.applySelectionColors() }
        return picker
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
        let label = (view as? UILabel) ?? UILabel()
        label.textAlignment = .center
        label.font = theme.pickerFont
        label.textColor = theme.pickerTextColor
        label.text = columns[component][row]
        label.backgroundColor = .clear
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
        // color update (minimal)
        br_on_main_async { [weak self] in self?.applySelectionColors() }
    }

    private func applySelectionColors() {
        for c in 0..<numberOfComponents(in: picker) {
            let r = picker.selectedRow(inComponent: c)
            if let label = picker.view(forRow: r, forComponent: c) as? UILabel {
                label.textColor = theme.pickerSelectedTextColor
            }
        }
    }
}
