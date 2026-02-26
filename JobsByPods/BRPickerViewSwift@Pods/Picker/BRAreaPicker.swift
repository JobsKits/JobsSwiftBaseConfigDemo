
import UIKit
import Foundation

public final class BRAreaPicker: BRBasePicker<BRAreaSelection>, UIPickerViewDelegate, UIPickerViewDataSource {

    private var data: [BRAreaNode] = []
    private let picker = UIPickerView()

    private var provinces: [BRAreaNode] = []
    private var cities: [BRAreaNode] = []
    private var districts: [BRAreaNode] = []

    private var lastSelectedRow: [Int: Int] = [:]

    // MARK: - Fluent
    @discardableResult
    public func byDataSource(_ nodes: [BRAreaNode]) -> Self {
        data = nodes
        return self
    }

    /// Optional default selection by names (best-effort)
    @discardableResult
    public func bySelect(_ selection: BRAreaSelection) -> Self {
        // store in temp vars; applied during buildContentView
        _pendingSelection = selection
        return self
    }

    private var _pendingSelection: BRAreaSelection?

    public override func buildContentView() -> UIView {
        picker.delegate = self
        picker.dataSource = self

        provinces = data
        cities = provinces.first?.children ?? []
        districts = cities.first?.children ?? []

        applyPendingSelectionIfNeeded()
        br_on_main_async { [weak self] in self?.applySelectionColors() }
        return picker
    }

    public override func confirmSelection() {
        guard !provinces.isEmpty else { return }
        let p = provinces[picker.selectedRow(inComponent: 0)].name

        let c: String?
        if !cities.isEmpty, picker.selectedRow(inComponent: 1) < cities.count {
            c = cities[picker.selectedRow(inComponent: 1)].name
        } else { c = nil }

        let d: String?
        if !districts.isEmpty, picker.selectedRow(inComponent: 2) < districts.count {
            d = districts[picker.selectedRow(inComponent: 2)].name
        } else { d = nil }

        send(BRAreaSelection(province: p, city: c, district: d))
    }

    // MARK: - Picker DataSource
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { 3 }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return provinces.count
        case 1: return cities.count
        default: return districts.count
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

        switch component {
        case 0: label.text = provinces[row].name
        case 1: label.text = cities[row].name
        default: label.text = districts[row].name
        }
        return label
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let oldRow = lastSelectedRow[component] ?? row
        lastSelectedRow[component] = row

        if component == 0 {
            // province changed -> reset cities & districts
            let p = provinces[row]
            cities = p.children ?? []
            districts = cities.first?.children ?? []
            BRiOS12SafePickerReload.reload(pickerView, component: 1)
            BRiOS12SafePickerReload.reload(pickerView, component: 2)
            pickerView.selectRow(0, inComponent: 1, animated: false)
            pickerView.selectRow(0, inComponent: 2, animated: false)
            lastSelectedRow[1] = 0
            lastSelectedRow[2] = 0
        } else if component == 1 {
            // city changed -> reset districts
            if !cities.isEmpty {
                let c = cities[row]
                districts = c.children ?? []
            } else {
                districts = []
            }
            BRiOS12SafePickerReload.reload(pickerView, component: 2)
            pickerView.selectRow(0, inComponent: 2, animated: false)
            lastSelectedRow[2] = 0
        }

        // colors
        br_on_main_async { [weak self] in
            guard let self else { return }
            self.applyRowColor(pickerView, component: component, row: oldRow, selected: false)
            self.applyRowColor(pickerView, component: component, row: row, selected: true)

            // after reload, ensure selected rows colored
            self.applySelectionColors()
        }

        if theme.autoSelect {
            confirmSelection()
            dismissPanel()
        }
    }

    private func applyPendingSelectionIfNeeded() {
        guard let s = _pendingSelection else { return }
        // province
        if let pIndex = provinces.firstIndex(where: { $0.name == s.province }) {
            picker.selectRow(pIndex, inComponent: 0, animated: false)
            cities = provinces[pIndex].children ?? []
        }
        // city
        if let cityName = s.city, let cIndex = cities.firstIndex(where: { $0.name == cityName }) {
            picker.selectRow(cIndex, inComponent: 1, animated: false)
            districts = cities[cIndex].children ?? []
        } else {
            picker.selectRow(0, inComponent: 1, animated: false)
            districts = cities.first?.children ?? []
        }
        // district
        if let dName = s.district, let dIndex = districts.firstIndex(where: { $0.name == dName }) {
            picker.selectRow(dIndex, inComponent: 2, animated: false)
        } else {
            picker.selectRow(0, inComponent: 2, animated: false)
        }
        BRiOS12SafePickerReload.reload(picker)
        _pendingSelection = nil
    }

    private func applySelectionColors() {
        for c in 0..<3 {
            let r = picker.selectedRow(inComponent: c)
            lastSelectedRow[c] = r
            applyRowColor(picker, component: c, row: r, selected: true)
        }
    }

    private func applyRowColor(_ pickerView: UIPickerView, component: Int, row: Int, selected: Bool) {
        guard let label = pickerView.view(forRow: row, forComponent: component) as? UILabel else { return }
        label.textColor = selected ? theme.pickerSelectedTextColor : theme.pickerTextColor
    }
}
