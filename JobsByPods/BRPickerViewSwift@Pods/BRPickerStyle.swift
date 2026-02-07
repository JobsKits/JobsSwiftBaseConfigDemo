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

import JobsByUIKit
import JobsSwiftBaseDefines

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
    public var panelBackgroundColor: UIColor = JobsCor.systemBackground
    public var toolbarBackgroundColor: UIColor = JobsCor.secondarySystemBackground
    public var titleColor: UIColor = JobsCor.label
    public var buttonColor: UIColor = .systemBlue
    public var pickerTextColor: UIColor = JobsCor.label      // 行文字颜色
    public var pickerTextFont: UIFont = .systemFont(ofSize: 17) // 行文字字体
    public var pickerTextSelectedColor: UIColor? = nil       // 选中行文字颜色（可选）
    public var cornerRadius: CGFloat = 16
    // MARK: - ✅ Bottom Layout (全局默认贴底)
    public var panelFillToBottom: Bool = true     // ✅ 默认所有 picker 都贴地
    public var panelBottomOffset: CGFloat = 0     // 需要“更贴底/下挪一点”就把默认改成 6/8
    public var contentBottomInsetExtra: CGFloat = 0
}

extension BRPickerStyle {
    // MARK: - 通用工具
    /// 用闭包批量修改样式，返回新的 style（值类型安全）
    @inline(__always)
    public func with(_ edit: (inout BRPickerStyle) -> Void) -> BRPickerStyle {
        var s = self
        edit(&s)
        return s
    }
    // MARK: - 文本相关
    /// 设置标题文本
    @discardableResult
    public func byTitle(_ v: String) -> BRPickerStyle {
        return with { style in
            style.title = v
        }
    }
    /// 设置“取消”按钮文本
    @discardableResult
    public func byCancelText(_ v: String) -> BRPickerStyle {
        return with { style in
            style.cancelText = v
        }
    }
    /// 设置“完成/确定”按钮文本
    @discardableResult
    public func byConfirmText(_ v: String) -> BRPickerStyle {
        return with { style in
            style.confirmText = v
        }
    }
    // MARK: - 尺寸相关
    /// 设置顶部工具条高度
    @discardableResult
    public func byToolBarHeight(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.toolBarHeight = v
        }
    }
    /// 设置 picker 滚轮区域高度
    @discardableResult
    public func byPickerHeight(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.pickerHeight = v
        }
    }
    /// 设置每一行高度
    @discardableResult
    public func byRowHeight(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.rowHeight = v
        }
    }
    /// 设置列宽（nil=自动）
    @discardableResult
    public func byColumnWidth(_ v: CGFloat?) -> BRPickerStyle {
        return with { style in
            style.columnWidth = v
        }
    }
    /// 设置多列之间的间距
    @discardableResult
    public func byColumnSpacing(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.columnSpacing = v
        }
    }
    // MARK: - System DatePicker - 系统时间选择器
    /// 设置分钟步长（1/5/10/15…）
    @discardableResult
    public func byMinuteInterval(_ v: Int) -> BRPickerStyle {
        return with { style in
            style.minuteInterval = v
        }
    }
    /// 是否使用 12 小时制
    @discardableResult
    public func byUse12HourClock(_ v: Bool) -> BRPickerStyle {
        return with { style in
            style.use12HourClock = v
        }
    }
    // MARK: - Behavior - 行为控制
    /// 滚动时是否自动回调选中
    @discardableResult
    public func byAutoSelect(_ v: Bool) -> BRPickerStyle {
        return with { style in
            style.isAutoSelect = v
        }
    }
    // MARK: - 外观相关
    /// 设置蒙层背景色（弹出时的遮罩）
    @discardableResult
    public func byMaskColor(_ v: UIColor) -> BRPickerStyle {
        return with { style in
            style.maskColor = v
        }
    }
    /// 设置底部面板背景色
    @discardableResult
    public func byPanelBackgroundColor(_ v: UIColor) -> BRPickerStyle {
        return with { style in
            style.panelBackgroundColor = v
        }
    }
    /// 设置顶部工具条背景色
    @discardableResult
    public func byToolbarBackgroundColor(_ v: UIColor) -> BRPickerStyle {
        return with { style in
            style.toolbarBackgroundColor = v
        }
    }
    /// 设置标题文字颜色
    @discardableResult
    public func byTitleColor(_ v: UIColor) -> BRPickerStyle {
        return with { style in
            style.titleColor = v
        }
    }
    /// 设置取消/完成按钮颜色
    @discardableResult
    public func byButtonColor(_ v: UIColor) -> BRPickerStyle {
        return with { style in
            style.buttonColor = v
        }
    }
    /// 设置 picker 行文字颜色（未选中）
    @discardableResult
    public func byPickerTextColor(_ v: UIColor) -> BRPickerStyle {
        return with { $0.pickerTextColor = v }
    }
    /// 设置 picker 行文字字体
    @discardableResult
    public func byPickerTextFont(_ v: UIFont) -> BRPickerStyle {
        return with { $0.pickerTextFont = v }
    }
    /// 设置 picker 选中行文字颜色（nil=跟随 pickerTextColor）
    @discardableResult
    public func byPickerTextSelectedColor(_ v: UIColor?) -> BRPickerStyle {
        return with { $0.pickerTextSelectedColor = v }
    }
    /// 设置面板圆角
    @discardableResult
    public func byCornerRadius(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.cornerRadius = v
        }
    }
    // MARK: - 底部布局
    /// 是否强制贴底显示（适配全面屏）
    @discardableResult
    public func byPanelFillToBottom(_ v: Bool) -> BRPickerStyle {
        return with { style in
            style.panelFillToBottom = v
        }
    }
    /// 面板距离底部的额外偏移
    @discardableResult
    public func byPanelBottomOffset(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.panelBottomOffset = v
        }
    }
    /// 内容区域额外底部 inset
    @discardableResult
    public func byContentBottomInsetExtra(_ v: CGFloat) -> BRPickerStyle {
        return with { style in
            style.contentBottomInsetExtra = v
        }
    }
}

