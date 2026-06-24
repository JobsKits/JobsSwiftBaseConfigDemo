//
//  UIBarButtonItemAppearance.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

@available(iOS 13.0, *)
extension UIBarButtonItemAppearance {
    /// 快速配置不同状态的文本与颜色
    @discardableResult
    public func byTitleColor(_ color: UIColor, for state: UIControl.State = .normal) -> Self {
        switch state {
        case .normal:
            self.normal.titleTextAttributes[.foregroundColor] = color
        case .highlighted:
            self.highlighted.titleTextAttributes[.foregroundColor] = color
        case .disabled:
            self.disabled.titleTextAttributes[.foregroundColor] = color
        case .focused:
            self.focused.titleTextAttributes[.foregroundColor] = color
        default:
            self.normal.titleTextAttributes[.foregroundColor] = color
        };return self
    }

    @discardableResult
    public func byFont(_ font: UIFont, for state: UIControl.State = .normal) -> Self {
        switch state {
        case .normal:
            self.normal.titleTextAttributes[.font] = font
        case .highlighted:
            self.highlighted.titleTextAttributes[.font] = font
        case .disabled:
            self.disabled.titleTextAttributes[.font] = font
        case .focused:
            self.focused.titleTextAttributes[.font] = font
        default:
            self.normal.titleTextAttributes[.font] = font
        };return self
    }
}
