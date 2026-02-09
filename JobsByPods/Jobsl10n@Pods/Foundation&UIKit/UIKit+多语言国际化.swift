//
//  UIKit+多语言国际化.swift
//  Pods
//
//  Created by Jobs on 9/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - High frequency UI one-liners (small set, big coverage)
// ===== UILabel =====
public extension UILabel {
    /// 直接把 ".tr" 的结果丢进来即可；会自动从线程标记里拿 key 并注册刷新
    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { v, text in
            v.text = text
        };return self
    }
    /// 富文本不做自动注册（如需支持：自己用 TRBind 绑定“富文本工厂”）
    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UIButton =====
public extension UIButton {
    @discardableResult
    func tr_setTitle(_ string: String, for state: UIControl.State) -> Self {
        TRBind.bind(self, translated: string) { btn, text in
            btn.setTitle(text, for: state)
        };return self
    }

    @discardableResult
    func tr_setAttributedTitle(_ attr: NSAttributedString, for state: UIControl.State) -> Self {
        self.setAttributedTitle(attr, for: state)
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UITextField =====
public extension UITextField {
    @discardableResult
    func tr_setPlaceholder(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tf, text in
            tf.placeholder = text
        };return self
    }

    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tf, text in
            tf.text = text
        };return self
    }

    @discardableResult
    func tr_setAttributedPlaceholder(_ attr: NSAttributedString) -> Self {
        self.attributedPlaceholder = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }

    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UITextView =====
public extension UITextView {
    @discardableResult
    func tr_setText(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { tv, text in
            tv.text = text
        };return self
    }

    @discardableResult
    func tr_setAttributedText(_ attr: NSAttributedString) -> Self {
        self.attributedText = attr
        TRBind.consumeMarkerIfNeeded()
        return self
    }
}
// ===== UIBarButtonItem =====
public extension UIBarButtonItem {
    @discardableResult
    func tr_setTitle(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
}
// MARK: - Common "container" text (still low API count)
// ===== UINavigationItem =====
public extension UINavigationItem {
    @discardableResult
    func tr_setTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
    /// 主标题上面那一行小字
    @discardableResult
    func tr_setPrompt(_ string: String?) -> Self {
        guard let string else {
            self.prompt = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.prompt = text
        };return self
    }
    /// 返回按钮文字
    @discardableResult
    func tr_setBackButtonTitle(_ string: String?) -> Self {
        guard let string else {
            self.backButtonTitle = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.backButtonTitle = text
        };return self
    }
}
// ===== UITabBarItem =====
public extension UITabBarItem {
    @discardableResult
    func tr_setTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { item, text in
            item.title = text
        };return self
    }
}
// ===== UISegmentedControl =====
public extension UISegmentedControl {
    @discardableResult
    func tr_setTitle(_ string: String, forSegmentAt index: Int) -> Self {
        TRBind.bind(self, translated: string) { seg, text in
            seg.setTitle(text, forSegmentAt: index)
        };return self
    }
}
// ===== UISearchBar =====
public extension UISearchBar {
    @discardableResult
    func tr_setPlaceholder(_ string: String?) -> Self {
        guard let string else {
            self.placeholder = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { bar, text in
            bar.placeholder = text
        };return self
    }

    @discardableResult
    func tr_setPrompt(_ string: String?) -> Self {
        guard let string else {
            self.prompt = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { bar, text in
            bar.prompt = text
        };return self
    }
}
// MARK: - Alert (avoid inheritance name conflicts)
/// 注意：不扩 UIViewController 的 tr_setTitle，避免和 UIAlertController 这种子类写同名 API 冲突
public extension UIAlertController {
    @discardableResult
    func tr_setAlertTitle(_ string: String?) -> Self {
        guard let string else {
            self.title = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { alert, text in
            alert.title = text
        };return self
    }

    @discardableResult
    func tr_setMessage(_ string: String?) -> Self {
        guard let string else {
            self.message = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { alert, text in
            alert.message = text
        };return self
    }
}
// MARK: - Accessibility (minimal, non-conflicting)
public extension UIView {
    /// A11y label 也需要跟语言切换刷新
    @discardableResult
    func tr_setA11yLabel(_ string: String?) -> Self {
        guard let string else {
            self.accessibilityLabel = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { v, text in
            v.accessibilityLabel = text
        };return self
    }
    /// A11y hint 也需要跟语言切换刷新
    @discardableResult
    func tr_setA11yHint(_ string: String?) -> Self {
        guard let string else {
            self.accessibilityHint = nil
            TRBind.consumeMarkerIfNeeded()
            return self
        }
        TRBind.bind(self, translated: string) { v, text in
            v.accessibilityHint = text
        };return self
    }
}
