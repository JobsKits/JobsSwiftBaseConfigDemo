//
//  BRTextPickerView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsSwiftBaseDefines

public final class BRTextPickerView: NSObject {
    public var pickerMode: BRTextPickerMode = .single
    public var title: String?
    public var style = BRPickerStyle()
    /// 单列
    public var dataSourceArr: [Any] = []
    public var selectIndex: Int = 0
    public var singleResultBlock: ((BRTextModel?, Int) -> Void)?
    /// 多列
    public var multiDataSourceArr: [[Any]] = []
    public var selectIndexs: [Int] = []
    public var multiResultBlock: (([BRTextModel], [Int]) -> Void)?
    /// 级联
    public var cascadeRootNodes: [TextCascadeNode] = []
    public var cascadeSelectIndexs: [Int] = []
    public var cascadeResultBlock: (([BRTextModel], [Int]) -> Void)?

    private var panel: BRPickerPanel?
    private let picker = UIPickerView()
    public override init() { super.init() }
    /// 消失
    public func dismiss() { panel?.dismiss() }
    /// 公开展示（避免与链式同名）
    public func present(in container: UIView? = nil) {
        style.title = title ?? style.title
        let panel = BRPickerPanel(style: style)
        self.panel = panel
        panel.contentContainer.addSubview(picker)
        picker.dataSource = self
        picker.delegate = self
        picker.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.greaterThanOrEqualTo(max(216, style.rowHeight * 5))
        }
        // 预选
        switch pickerMode {
        case .single:
            picker.reloadAllComponents()
            if rows(in: 0) > 0 {
                picker.selectRow(selectIndex.clamped(0...(rows(in: 0)-1)), inComponent: 0, animated: false)
            }
        case .multi:
            picker.reloadAllComponents()
            for c in 0..<componentsCount() {
                let idx = (c < selectIndexs.count) ? selectIndexs[c] : 0
                if rows(in: c) > 0 { picker.selectRow(idx.clamped(0...(rows(in: c)-1)), inComponent: c, animated: false) }
            }
        case .cascade:
            picker.reloadAllComponents()
            for c in 0..<componentsCount() {
                let idx = (c < cascadeSelectIndexs.count) ? cascadeSelectIndexs[c] : 0
                if rows(in: c) > 0 { picker.selectRow(idx.clamped(0...(rows(in: c)-1)), inComponent: c, animated: false) }
            }
        }

        panel.onConfirm = { [weak self] in self?.emitResult() }
        if style.isAutoSelect { panel.onConfirm = nil }
        panel.onCancel = { [weak self] in self?.panel = nil }
        panel.present(in: container)
    }
}

extension BRTextPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { componentsCount() }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { rows(in: component) }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { style.rowHeight }
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        style.columnWidth ?? max(0, pickerView.bounds.width - CGFloat(componentsCount() - 1) * style.columnSpacing) / CGFloat(componentsCount())
    }
    public func pickerView(_ pickerView: UIPickerView,
                           viewForRow row: Int,
                           forComponent component: Int,
                           reusing view: UIView?) -> UIView {
        ((view as? UILabel) ?? UILabel())
            .byTextAlignment(.center)
            .byFont(style.pickerTextFont)
            .byTextColor((row == pickerView.selectedRow(inComponent: component)) ?
                         (style.pickerTextSelectedColor ?? style.pickerTextColor) : style.pickerTextColor)
            .byText(modelAt(component: component, row: row)?.text)
    }
    public func pickerView(_ pickerView: UIPickerView,
                           didSelectRow row: Int,
                           inComponent component: Int) {
        pickerView.reloadComponent(component)
        if pickerMode == .cascade {
            let total = componentsCount()
            if component < total - 1 {
                for c in (component+1)..<total {
                    pickerView.reloadComponent(c)
                    if rows(in: c) > 0 { pickerView.selectRow(0, inComponent: c, animated: true) }
                }
            }
        }
        if style.isAutoSelect { emitResult() }
    }
}

private extension BRTextPickerView {
    
    func componentsCount() -> Int {
        switch pickerMode {
        case .single: return 1
        case .multi:  return max(multiDataSourceArr.count, 1)
        case .cascade: return max(depth(of: cascadeRootNodes), 1)
        }
    }
    
    func rows(in component: Int) -> Int {
        switch pickerMode {
        case .single: return dataSourceArr.count
        case .multi:  return component < multiDataSourceArr.count ? multiDataSourceArr[component].count : 0
        case .cascade: return cascadeRows(for: component).count
        }
    }
    
    func modelAt(component: Int, row: Int) -> BRTextModel? {
        switch pickerMode {
        case .single:  return normalize(dataSourceArr[safe: row])
        case .multi:   return normalize(multiDataSourceArr[safe: component]?[safe: row])
        case .cascade: return normalize(cascadeRows(for: component)[safe: row])
        }
    }
    
    func normalize(_ any: Any?) -> BRTextModel? {
        if let m = any as? BRTextModel { return m }
        if let s = any as? String     { return BRTextModel(s) }
        if let n = any as? TextCascadeNode { return BRTextModel(n.text, value: n.value) }
        return nil
    }
    
    func depth(of nodes: [TextCascadeNode]) -> Int {
        guard let f = nodes.first else { return 0 }
        return 1 + depth(of: f.children)
    }
    
    func cascadeRows(for component: Int) -> [TextCascadeNode] {
        var cur = cascadeRootNodes
        for c in 0..<component {
            let sel = picker.selectedRow(inComponent: c)
            cur = cur[safe: sel]?.children ?? []
        }
        return cur
    }

    func emitResult() {
        switch pickerMode {
        case .single:
            let row = picker.selectedRow(inComponent: 0)
            singleResultBlock?(modelAt(component: 0, row: row), row)
        case .multi:
            var ms: [BRTextModel] = []; var idxs: [Int] = []
            for c in 0..<componentsCount() {
                let r = picker.selectedRow(inComponent: c)
                ms.append(modelAt(component: c, row: r) ?? BRTextModel(""))
                idxs.append(r)
            }
            multiResultBlock?(ms, idxs)
        case .cascade:
            var ms: [BRTextModel] = []; var idxs: [Int] = []
            for c in 0..<componentsCount() {
                let r = picker.selectedRow(inComponent: c)
                ms.append(modelAt(component: c, row: r) ?? BRTextModel(""))
                idxs.append(r)
            }
            cascadeResultBlock?(ms, idxs)
        }
        panel = nil
    }
}
