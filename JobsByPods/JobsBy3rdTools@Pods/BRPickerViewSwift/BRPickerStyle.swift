//
//  BRPickerStyle.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public struct BRPickerStyle {
    public init() {}
    // MARK: - Text
    public var title: String = ""
    public var cancelText: String = "取消".tr
    public var confirmText: String = "完成".tr
    // MARK: - Size
    public var toolBarHeight: CGFloat = 44
    public var pickerHeight: CGFloat = 216
    public var rowHeight: CGFloat = 36
    public var columnWidth: CGFloat? = nil
    public var columnSpacing: CGFloat = 0   // ✅ 你截图里用到了 style.columnSpacing，这个必须有
    // MARK: - System DatePicker
    public var minuteInterval: Int = 1
    public var use12HourClock: Bool = false
    // MARK: - Behavior
    public var isAutoSelect: Bool = false
    // MARK: - UI
    public var maskColor: UIColor = UIColor.black.withAlphaComponent(0.35)
    public var panelBackgroundColor: UIColor = .systemBackground
    public var toolbarBackgroundColor: UIColor = .secondarySystemBackground
    public var titleColor: UIColor = .label
    public var buttonColor: UIColor = .systemBlue
    public var cornerRadius: CGFloat = 16
    // MARK: - ✅ Bottom Layout (全局默认贴底)
    public var panelFillToBottom: Bool = true     // ✅ 默认所有 picker 都贴地
    public var panelBottomOffset: CGFloat = 0     // 需要“更贴底/下挪一点”就把默认改成 6/8
    public var contentBottomInsetExtra: CGFloat = 0
}
