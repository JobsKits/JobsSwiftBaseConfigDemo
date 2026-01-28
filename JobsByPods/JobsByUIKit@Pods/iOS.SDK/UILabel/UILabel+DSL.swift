//
//  UILabel+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/3/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsTextTools
extension UILabel {
    @discardableResult
    public func byJobsAttributedText(_ text: JobsText?) -> Self {
        guard let text else { return self }
        self.attributedText = text.asAttributed
        return self
    }
    @discardableResult
    public func byJobsText(_ text: JobsText?) -> Self {
        guard let text else { return self }
        self.text = text.asString
        return self
    }
    @discardableResult
    public func byText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    @discardableResult
    public func byTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    @discardableResult
    public func byFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    @discardableResult
    public func byTextAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
    @discardableResult
    public func byNumberOfLines(_ lines: Int) -> Self {
        self.numberOfLines = lines
        return self
    }
    @discardableResult
    public func byLineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    @discardableResult
    public func byBgCor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    @discardableResult
    public func byAttributedString(_ attributed: NSAttributedString?) -> Self {
        self.attributedText = attributed
        return self
    }
    @discardableResult
    public func byNextText(_ str: String?) -> Self {
        self.text = (self.text ?? "") + (str ?? "")
        return self
    }
    @discardableResult
    public func byNextAttributedText(_ attributed: NSAttributedString?) -> Self {
        if let current = self.attributedText {
            let result = NSMutableAttributedString(attributedString: current)
            if let attributed { result.append(attributed) }
            self.attributedText = result
        } else {
            self.attributedText = attributed
        };return self
    }
    @discardableResult
    public func byHugging(_ priority: UILayoutPriority,
                   axis: NSLayoutConstraint.Axis = .horizontal) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    /// 双轴便捷
    @discardableResult
    public func byHugging(_ horizontal: UILayoutPriority, _ vertical: UILayoutPriority) -> Self {
        setContentHuggingPriority(horizontal, for: .horizontal)
        setContentHuggingPriority(vertical, for: .vertical)
        return self
    }

    @discardableResult
    public func byCompressionResistance(_ priority: UILayoutPriority,
                                 axis: NSLayoutConstraint.Axis = .horizontal) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    /// 双轴便捷
    @discardableResult
    public func byCompressionResistance(_ horizontal: UILayoutPriority, _ vertical: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(horizontal, for: .horizontal)
        setContentCompressionResistancePriority(vertical, for: .vertical)
        return self
    }

    // MARK: 背景图 → 平铺色
    @discardableResult
    public func bgImage(_ image: UIImage?) -> Self {
        if let img = image {
            self.backgroundColor = UIColor(patternImage: img)
        };return self
    }

    // 高亮 / 交互 / 启用
    @discardableResult
    public func byHighlightedTextColor(_ color: UIColor?) -> Self { self.highlightedTextColor = color; return self }

    @discardableResult
    public func byIsHighlighted(_ v: Bool) -> Self { self.isHighlighted = v; return self }

    @discardableResult
    public func byEnabled(_ v: Bool) -> Self { self.isEnabled = v; return self }
    // 文本压缩/缩放策略
    @discardableResult
    public func byAdjustsFontSizeToFitWidth(_ v: Bool) -> Self { self.adjustsFontSizeToFitWidth = v; return self }

    @discardableResult
    public func byBaselineAdjustment(_ v: UIBaselineAdjustment) -> Self { self.baselineAdjustment = v; return self }

    @discardableResult
    public func byMinimumScaleFactor(_ v: CGFloat) -> Self { self.minimumScaleFactor = v; return self }

    @discardableResult
    public func byAllowsDefaultTighteningForTruncation(_ v: Bool) -> Self { self.allowsDefaultTighteningForTruncation = v; return self }

    @available(iOS 14.0, *)
    @discardableResult
    public func byLineBreakStrategy(_ s: NSParagraphStyle.LineBreakStrategy) -> Self { self.lineBreakStrategy = s; return self }
    // AutoLayout
    @discardableResult
    public func byPreferredMaxLayoutWidth(_ w: CGFloat) -> Self { self.preferredMaxLayoutWidth = w; return self }
    // iOS 17
    @available(iOS 17.0, *)
    @discardableResult
    public func byPreferredVibrancy(_ v: UILabelVibrancy) -> Self { self.preferredVibrancy = v; return self }

    @available(iOS 17.0, *)
    @discardableResult
    public func byShowsExpansionTextWhenTruncated(_ v: Bool) -> Self { self.showsExpansionTextWhenTruncated = v; return self }
}
