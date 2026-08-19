//
//  JobsProgressBarByUIKit.swift
//  JobsProgressBar
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import SnapKit

extension UIView {
    @discardableResult
    func byMasksToBounds(_ masksToBounds: Bool?) -> Self {
        layer.masksToBounds = masksToBounds ?? false
        return self
    }

    @discardableResult
    func byAddTo(_ superview: UIView,
                 _ closure: ((ConstraintMaker) -> Void)? = nil) -> Self {
        superview.addSubview(self)
        if let closure {
            self.snp.makeConstraints(closure)
        };return self
    }
    /// 统一圆角：按钮走 UIButton.Configuration 方案，其他视图保持原始 layer 逻辑
    @discardableResult
    func byCornerRadius(_ radius: CGFloat?) -> Self {
        let r = max(0, radius ?? 0.0)
        // === 按钮：套用 byBtnCornerRadius 的实现（maskedCorners=nil, isContinuous=true） ===
        if let btn = self as? UIButton {
            if #available(iOS 15.0, *), var cfg = btn.configuration {
                cfg.cornerStyle = .fixed
                var bg = cfg.background
                bg.cornerRadius = r
                cfg.background = bg
                btn.byConfiguration(cfg)
            }
            btn.byCornerRadius(r)
            if #available(iOS 13.0, *) {
                btn.layer.byCornerCurve(.continuous)
            }
            // maskedCorners 默认不传（等同 nil），因此这里不改 maskedCorners
            btn.byClipsToBounds((r > 0))
            return self
        }
        // === 非按钮 ===
        self.layer.cornerRadius = r
        return self
    }

    @discardableResult
    func byHidden(_ hidden: Bool) -> Self {
        isHidden = hidden
        return self
    }

    @discardableResult
    func byAlpha(_ a: CGFloat) -> Self {
        alpha = a
        return self
    }

    @MainActor
    @discardableResult
    func byVisible(_ visible: Bool) -> Self {
        self
            .byHidden(!visible)
            .byAlpha(visible ? 1 : 0)
        return self
    }
}

extension UILabel {
    @discardableResult
    func byFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    @discardableResult
    func byTextAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }

    @discardableResult
    func byText(_ text: String?) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func byBgCor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
}
