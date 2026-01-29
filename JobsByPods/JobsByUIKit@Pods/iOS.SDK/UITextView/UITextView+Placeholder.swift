//
//  UITextView+Placeholder.swift
//  Pods
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import SnapKit
import JobsSwiftBaseDefines

private var byPlaceholderLabelKey: UInt8 = 0
private var byPlaceholderObserverKey: UInt8 = 0
private var byPlaceholderSwizzleKey: UInt8 = 0
public extension UITextView {
    // MARK: - Public Chain APIs
    @discardableResult
    func byPlaceHolder(_ text: String?) -> Self {
        by_placeholderLabel.byAttributedString(nil).byText(text)
        by_updatePlaceholderVisibility()
        return self
    }
    /// 按你命名：Cor（= Color）
    @discardableResult
    func byPlaceHolderCor(_ color: UIColor?) -> Self {
        by_placeholderLabel.byTextColor(color ?? JobsCor.placeholderText)
        return self
    }

    @discardableResult
    func byPlaceHolderFont(_ font: UIFont?) -> Self {
        let label = by_placeholderLabel
        label.font = font ?? self.font
        return self
    }

    @discardableResult
    func byPlaceHolderAttributedText(_ attr: NSAttributedString?) -> Self {
        by_placeholderLabel.byText(nil).byAttributedString(attr)
        by_updatePlaceholderVisibility()
        return self
    }
    // MARK: - Internals
    private var by_placeholderLabel: UILabel {
        if let label = objc_getAssociatedObject(self, &byPlaceholderLabelKey) as? UILabel {
            return label
        }
        // 确保 swizzle 只做一次（用来在 layoutSubviews 自动刷新约束）
        UITextView.by_swizzleLayoutSubviewsOnce()
        let label = UILabel().byNumberOfLines(0).byBackgroundColor(.clear)
        addSubview(label)
        sendSubviewToBack(label)
        // 初次布局
        by_makeOrUpdatePlaceholderConstraints(label)
        // 默认样式
        label.font = self.font
        label.textColor = JobsCor.placeholderText
        // 监听 text change（只注册一次）
        let token = NotificationCenter.default.addObserver(
            forName: UITextView.textDidChangeNotification,
            object: self,
            queue: .main
        ) { [weak self] _ in
            self?.by_updatePlaceholderVisibility()
        }
        objc_setAssociatedObject(self, &byPlaceholderObserverKey, token, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &byPlaceholderLabelKey, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        by_updatePlaceholderVisibility()
        return label
    }

    private func by_updatePlaceholderVisibility() {
        let label = objc_getAssociatedObject(self, &byPlaceholderLabelKey) as? UILabel
        label?.isHidden = !(self.text?.isEmpty ?? true)
    }

    private func by_makeOrUpdatePlaceholderConstraints(_ label: UILabel) {
        let left = textContainerInset.left + textContainer.lineFragmentPadding
        let right = textContainerInset.right + textContainer.lineFragmentPadding
        let top = textContainerInset.top
        let bottom = textContainerInset.bottom

        label.snp.remakeConstraints { make in
            make.left.equalToSuperview().inset(left)
            make.right.equalToSuperview().inset(right)
            make.top.equalToSuperview().inset(top)
            // 不强行贴底，避免跟滚动/内容冲突；给个 <= 底部约束保证多行时不炸
            make.bottom.lessThanOrEqualToSuperview().inset(bottom)
        }
    }
    // MARK: - Swizzle layoutSubviews (auto refresh constraints)
    private static func by_swizzleLayoutSubviewsOnce() {
        guard objc_getAssociatedObject(self, &byPlaceholderSwizzleKey) == nil else { return }
        objc_setAssociatedObject(self, &byPlaceholderSwizzleKey, true, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        let cls: AnyClass = UITextView.self

        let original = class_getInstanceMethod(cls, #selector(UITextView.layoutSubviews))
        let swizzled = class_getInstanceMethod(cls, #selector(UITextView.by_layoutSubviews))

        if let original = original, let swizzled = swizzled {
            method_exchangeImplementations(original, swizzled)
        }
    }

    @objc private func by_layoutSubviews() {
        // 先走原始 layoutSubviews（注意：已经交换实现）
        self.by_layoutSubviews()

        // 有 placeholder 才刷新
        if let label = objc_getAssociatedObject(self, &byPlaceholderLabelKey) as? UILabel {
            by_makeOrUpdatePlaceholderConstraints(label)
            by_updatePlaceholderVisibility()
        }
    }
}

