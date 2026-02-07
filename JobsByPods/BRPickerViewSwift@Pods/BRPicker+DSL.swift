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
    /// 设置样式：函数式（传入旧 style，返回新 style）
    @discardableResult
    func brStyle(_ transform: (BRPickerStyle) -> BRPickerStyle) -> Self {
        style = transform(style)
        return self
    }
    /// 设置模式：单列/多列/联动
    @discardableResult
    func brMode(_ m: BRTextPickerMode) -> Self {
        pickerMode = m
        return self
    }
    /// 设置标题
    @discardableResult
    func brTitle(_ t: String) -> Self {
        title = t
        return self
    }
    /// 设置样式：inout（直接改 style 属性）
    @discardableResult
    func brStyle(_ edit: (inout BRPickerStyle) -> Void) -> Self {
        var s = style
        edit(&s)
        style = s
        return self
    }
    /// 是否面板贴底
    @discardableResult
    func brPanelFillToBottom(_ v: Bool) -> Self {
        var s = style
        s.panelFillToBottom = v
        style = s
        return self
    }
    /// 面板底部偏移
    @discardableResult
    func brPanelBottomOffset(_ v: CGFloat) -> Self {
        var s = style
        s.panelBottomOffset = v
        style = s
        return self
    }
    /// 单列数据源
    @discardableResult
    func brDataSource(_ arr: [Any]) -> Self {
        dataSourceArr = arr
        return self
    }
    /// 多列数据源
    @discardableResult
    func brMultiDataSource(_ arr: [[Any]]) -> Self {
        multiDataSourceArr = arr
        return self
    }
    /// 联动数据源（树结构）
    @discardableResult
    func brCascadeData(_ nodes: [TextCascadeNode]) -> Self {
        cascadeRootNodes = nodes
        return self
    }
    /// 单列默认选中索引
    @discardableResult
    func brSelectIndex(_ idx: Int) -> Self {
        selectIndex = idx
        return self
    }
    /// 多列默认选中索引
    @discardableResult
    func brSelectIndexs(_ idxs: [Int]) -> Self {
        selectIndexs = idxs
        return self
    }
    /// 联动默认选中索引
    @discardableResult
    func brCascadeSelectIndexs(_ idxs: [Int]) -> Self {
        cascadeSelectIndexs = idxs
        return self
    }
    /// 单列结果回调
    @discardableResult
    func brOnSingle(_ block: @escaping (BRTextModel?, Int) -> Void) -> Self {
        singleResultBlock = block
        return self
    }
    /// 多列结果回调
    @discardableResult
    func brOnMulti(_ block: @escaping ([BRTextModel], [Int]) -> Void) -> Self {
        multiResultBlock = block
        return self
    }
    /// 联动结果回调
    @discardableResult
    func brOnCascade(_ block: @escaping ([BRTextModel], [Int]) -> Void) -> Self {
        cascadeResultBlock = block
        return self
    }
    /// 弹出显示（可指定容器）
    @discardableResult
    func brPresent(in container: UIView? = nil) -> Self {
        present(in: container)
        return self
    }
}

public extension BRDatePickerView {
    /// 设置样式：函数式（传入旧 style，返回新 style）
    @discardableResult
    func brStyle(_ transform: (BRPickerStyle) -> BRPickerStyle) -> Self {
        style = transform(style)
        return self
    }
    /// 设置日期模式
    @discardableResult
    func brMode(_ m: BRDatePickerMode) -> Self {
        pickerMode = m
        return self
    }
    /// 设置标题
    @discardableResult
    func brTitle(_ t: String) -> Self {
        title = t
        return self
    }
    /// 设置样式：inout（直接改 style 属性）
    @discardableResult
    func brStyle(_ edit: (inout BRPickerStyle) -> Void) -> Self {
        var s = style
        edit(&s)
        style = s
        return self
    }
    /// 是否面板贴底
    @discardableResult
    func brPanelFillToBottom(_ v: Bool) -> Self {
        var s = style
        s.panelFillToBottom = v
        style = s
        return self
    }
    /// 面板底部偏移
    @discardableResult
    func brPanelBottomOffset(_ v: CGFloat) -> Self {
        var s = style
        s.panelBottomOffset = v
        style = s
        return self
    }
    /// 设置最小日期
    @discardableResult
    func brMinDate(_ d: Date?) -> Self {
        minDate = d
        return self
    }
    /// 设置最大日期
    @discardableResult
    func brMaxDate(_ d: Date?) -> Self {
        maxDate = d
        return self
    }
    /// 设置默认选中日期
    @discardableResult
    func brSelectDate(_ d: Date) -> Self {
        selectDate = d
        return self
    }
    /// 是否允许选择到当前时间
    @discardableResult
    func brAllowToNow(_ v: Bool) -> Self {
        allowToNow = v
        return self
    }
    /// 结果回调
    @discardableResult
    func brOnResult(_ block: @escaping (Date?) -> Void) -> Self {
        resultBlock = block
        return self
    }
    /// 弹出显示（可指定容器）
    @discardableResult
    func brPresent(in container: UIView? = nil) -> Self {
        present(in: container)
        return self
    }
}
