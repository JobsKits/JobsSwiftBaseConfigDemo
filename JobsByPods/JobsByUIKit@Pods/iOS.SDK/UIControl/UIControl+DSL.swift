//
//  UIControl+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

extension UIControl {
    // MARK: - 基础状态
    @discardableResult
    public func byEnabled(_ on: Bool?) -> Self { self.isEnabled = on ?? false; return self }
    @discardableResult
    public func bySelected(_ on: Bool?) -> Self { self.isSelected = on ?? false; return self }
    @discardableResult
    public func byHighlighted(_ on: Bool?) -> Self { self.isHighlighted = on ?? false; return self }
    // MARK: - 内容对齐（你关心的 contentHorizontalAlignment / contentVerticalAlignment）
    /// ✅ 单独设置 contentHorizontalAlignment
    @discardableResult
    public func byContentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = alignment
        return self
    }
    /// ✅ 单独设置 contentVerticalAlignment
    @discardableResult
    public func byContentVerticalAlignment(_ alignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = alignment
        return self
    }
    /// 兼容你原来的“同时设置”写法（保留）
    @discardableResult
    public func byContentAlignment(horizontal: UIControl.ContentHorizontalAlignment? = nil,
                            vertical: UIControl.ContentVerticalAlignment? = nil) -> Self {
        if let h = horizontal { self.contentHorizontalAlignment = h }
        if let v = vertical { self.contentVerticalAlignment = v }
        return self
    }
    /// effectiveContentHorizontalAlignment 是只读属性：这里只能提供读取（无法 DSL set）
    @discardableResult
    public func onEffectiveContentHorizontalAlignment(_ block: (UIControl.ContentHorizontalAlignment) -> Void) -> Self {
        block(self.effectiveContentHorizontalAlignment)
        return self
    }
    // MARK: - Target-Action（传统）
    @discardableResult
    public func byAddTarget(_ target: Any?, action: Selector, for events: UIControl.Event) -> Self {
        addTarget(target, action: action, for: events); return self
    }
    @discardableResult
    public func byRemoveTarget(_ target: Any?, action: Selector? = nil, for events: UIControl.Event) -> Self {
        removeTarget(target, action: action, for: events); return self
    }
    /// 触发指定事件（比如 .touchUpInside）
    @discardableResult
    public func bySendActions(for events: UIControl.Event) -> Self {
        sendActions(for: events); return self
    }
    // MARK: - UIAction（iOS 14+）
    /// 直接加一个 UIAction；identifier 相同会被替换
    @available(iOS 14.0, *)
    @discardableResult
    public func byAddAction(_ action: UIAction, for events: UIControl.Event) -> Self {
        addAction(action, for: events); return self
    }
    /// 移除指定实例的 UIAction
    @available(iOS 14.0, *)
    @discardableResult
    public func byRemoveAction(_ action: UIAction, for events: UIControl.Event) -> Self {
        removeAction(action, for: events); return self
    }
    /// 根据 identifier 移除 UIAction
    @available(iOS 14.0, *)
    @discardableResult
    public func byRemoveAction(identifiedBy id: UIAction.Identifier, for events: UIControl.Event) -> Self {
        removeAction(identifiedBy: id, for: events); return self
    }
    /// 便捷：闭包形式 UIAction（建议你平时就用这个）
    @available(iOS 14.0, *)
    @discardableResult
    public func byOn(_ events: UIControl.Event,
              id: UIAction.Identifier? = nil,
              _ handler: @escaping (UIAction) -> Void) -> Self {
        let action = UIAction(identifier: id, handler: handler)
        addAction(action, for: events)
        return self
    }
    /// 便捷：primaryActionTriggered
    @available(iOS 14.0, *)
    @discardableResult
    public func byOnPrimaryAction(id: UIAction.Identifier? = nil,
                           _ handler: @escaping (UIAction) -> Void) -> Self {
        byOn(.primaryActionTriggered, id: id, handler)
    }
    // MARK: - Primary Action（iOS 17.4+）
    @available(iOS 17.4, *)
    @discardableResult
    public func byPerformPrimaryAction() -> Self {
        performPrimaryAction(); return self
    }
    // MARK: - Context Menu（iOS 14+）
    /// 开启/关闭把菜单作为主操作（touch-down 展开）
    @available(iOS 14.0, *)
    @discardableResult
    public func byShowsMenuAsPrimaryAction(_ on: Bool) -> Self {
        self.showsMenuAsPrimaryAction = on; return self
    }
    /// 启用/禁用上下文菜单交互
    @available(iOS 14.0, *)
    @discardableResult
    public func byContextMenuEnabled(_ on: Bool) -> Self {
        self.isContextMenuInteractionEnabled = on; return self
    }
    // MARK: - ToolTip（iOS 15+）
    @available(iOS 15.0, *)
    @discardableResult
    public func byToolTip(_ text: String?) -> Self {
        self.toolTip = text; return self
    }
    // MARK: - SF Symbol 动画（iOS 17+）
    @available(iOS 17.0, *)
    @discardableResult
    public func bySymbolAnimationEnabled(_ on: Bool) -> Self {
        self.isSymbolAnimationEnabled = on; return self
    }
}
