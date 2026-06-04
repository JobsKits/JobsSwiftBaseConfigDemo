//
//  BRPickerTheme.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public final class BRPickerTheme {

    // Panel
    public var panelBackgroundColor: UIColor = .white
    public var cornerRadius: CGFloat = 14
    public var maskColor: UIColor = UIColor.black.withAlphaComponent(0.55)

    // Toolbar
    public var toolbarBackgroundColor: UIColor = .white
    public var titleColor: UIColor = .black
    public var buttonColor: UIColor = .systemBlue
    public var titleFont: UIFont = .boldSystemFont(ofSize: 16)
    public var buttonFont: UIFont = .systemFont(ofSize: 16)

    // Picker text
    public var pickerTextColor: UIColor = UIColor(white: 0.3, alpha: 1)
    public var pickerSelectedTextColor: UIColor = .black
    public var pickerFont: UIFont = .systemFont(ofSize: 20)

    // Layout
    public var toolBarHeight: CGFloat = 44
    public var pickerHeight: CGFloat = 216
    public var panelBottomOffset: CGFloat = 0
    public var maxPanelHeight: CGFloat? = nil   // nil = auto based on content

    // Behavior
    public var hapticsOnConfirm: Bool = true
    public var tapMaskToDismiss: Bool = true
    public var autoSelect: Bool = false // if true, picker emits on change (string/area). DatePicker uses confirm by default.

    public init() {}

    @discardableResult
    public func byLight() -> Self {
        panelBackgroundColor = .white
        toolbarBackgroundColor = .white
        titleColor = .black
        buttonColor = .systemBlue
        maskColor = UIColor.black.withAlphaComponent(0.55)
        pickerTextColor = UIColor(white: 0.45, alpha: 1)
        pickerSelectedTextColor = UIColor(white: 0.1, alpha: 1)
        return self
    }

    @discardableResult
    public func byDark() -> Self {
        panelBackgroundColor = UIColor(white: 0.12, alpha: 1)
        toolbarBackgroundColor = UIColor(white: 0.12, alpha: 1)
        titleColor = .white
        buttonColor = .white
        maskColor = UIColor.black.withAlphaComponent(0.7)
        pickerTextColor = UIColor(white: 0.55, alpha: 1)
        pickerSelectedTextColor = .white
        return self
    }

    // Fluent setters (enterprise-friendly)
    @discardableResult public func byPanelBackgroundColor(_ v: UIColor) -> Self { panelBackgroundColor = v; return self }
    @discardableResult public func byToolbarBackgroundColor(_ v: UIColor) -> Self { toolbarBackgroundColor = v; return self }
    @discardableResult public func byTitleColor(_ v: UIColor) -> Self { titleColor = v; return self }
    @discardableResult public func byButtonColor(_ v: UIColor) -> Self { buttonColor = v; return self }
    @discardableResult public func byMaskColor(_ v: UIColor) -> Self { maskColor = v; return self }
    @discardableResult public func byPickerTextColor(_ v: UIColor) -> Self { pickerTextColor = v; return self }
    @discardableResult public func byPickerSelectedTextColor(_ v: UIColor) -> Self { pickerSelectedTextColor = v; return self }
    @discardableResult public func byPickerFont(_ v: UIFont) -> Self { pickerFont = v; return self }
    @discardableResult public func byCornerRadius(_ v: CGFloat) -> Self { cornerRadius = v; return self }
    @discardableResult public func byPickerHeight(_ v: CGFloat) -> Self { pickerHeight = v; return self }
    @discardableResult public func byToolBarHeight(_ v: CGFloat) -> Self { toolBarHeight = v; return self }
    @discardableResult public func byPanelBottomOffset(_ v: CGFloat) -> Self { panelBottomOffset = v; return self }
    @discardableResult public func byMaxPanelHeight(_ v: CGFloat?) -> Self { maxPanelHeight = v; return self }
    @discardableResult public func byAutoSelect(_ v: Bool) -> Self { autoSelect = v; return self }
    @discardableResult public func byTapMaskToDismiss(_ v: Bool) -> Self { tapMaskToDismiss = v; return self }
    @discardableResult public func byHapticsOnConfirm(_ v: Bool) -> Self { hapticsOnConfirm = v; return self }
}
