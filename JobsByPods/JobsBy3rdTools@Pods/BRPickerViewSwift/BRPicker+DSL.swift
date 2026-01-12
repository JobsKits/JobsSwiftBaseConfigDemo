//
//  BRPicker+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public extension BRTextPickerView {
    @discardableResult func brMode(_ m: BRTextPickerMode) -> Self { pickerMode = m; return self }
    @discardableResult func brTitle(_ t: String) -> Self { title = t; return self }
    @discardableResult func brStyle(_ edit: (inout BRPickerStyle) -> Void) -> Self { var s = style; edit(&s); style = s; return self }
    @discardableResult func brPanelFillToBottom(_ v: Bool) -> Self { var s = style; s.panelFillToBottom = v; style = s; return self }
    @discardableResult func brPanelBottomOffset(_ v: CGFloat) -> Self { var s = style; s.panelBottomOffset = v; style = s; return self }
    @discardableResult func brDataSource(_ arr: [Any]) -> Self { dataSourceArr = arr; return self }
    @discardableResult func brMultiDataSource(_ arr: [[Any]]) -> Self { multiDataSourceArr = arr; return self }
    @discardableResult func brCascadeData(_ nodes: [TextCascadeNode]) -> Self { cascadeRootNodes = nodes; return self }
    @discardableResult func brSelectIndex(_ idx: Int) -> Self { selectIndex = idx; return self }
    @discardableResult func brSelectIndexs(_ idxs: [Int]) -> Self { selectIndexs = idxs; return self }
    @discardableResult func brCascadeSelectIndexs(_ idxs: [Int]) -> Self { cascadeSelectIndexs = idxs; return self }
    @discardableResult func brOnSingle(_ block: @escaping (BRTextModel?, Int) -> Void) -> Self { singleResultBlock = block; return self }
    @discardableResult func brOnMulti(_ block: @escaping ([BRTextModel], [Int]) -> Void) -> Self { multiResultBlock = block; return self }
    @discardableResult func brOnCascade(_ block: @escaping ([BRTextModel], [Int]) -> Void) -> Self { cascadeResultBlock = block; return self }
    @discardableResult func brPresent(in container: UIView? = nil) -> Self { present(in: container); return self }
}

public extension BRDatePickerView {
    @discardableResult func brMode(_ m: BRDatePickerMode) -> Self { pickerMode = m; return self }
    @discardableResult func brTitle(_ t: String) -> Self { title = t; return self }
    @discardableResult func brStyle(_ edit: (inout BRPickerStyle) -> Void) -> Self { var s = style; edit(&s); style = s; return self }
    @discardableResult func brPanelFillToBottom(_ v: Bool) -> Self { var s = style; s.panelFillToBottom = v; style = s; return self }
    @discardableResult func brPanelBottomOffset(_ v: CGFloat) -> Self { var s = style; s.panelBottomOffset = v; style = s; return self }
    @discardableResult func brMinDate(_ d: Date?) -> Self { minDate = d; return self }
    @discardableResult func brMaxDate(_ d: Date?) -> Self { maxDate = d; return self }
    @discardableResult func brSelectDate(_ d: Date) -> Self { selectDate = d; return self }
    @discardableResult func brAllowToNow(_ v: Bool) -> Self { allowToNow = v; return self }
    @discardableResult func brOnResult(_ block: @escaping (Date?) -> Void) -> Self { resultBlock = block; return self }
    @discardableResult func brPresent(in container: UIView? = nil) -> Self { present(in: container); return self }
}
