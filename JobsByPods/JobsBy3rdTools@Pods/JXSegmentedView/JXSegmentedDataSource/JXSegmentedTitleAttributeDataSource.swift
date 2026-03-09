//
//  JXSegmentedTitleAttributeDataSource.swift
//  Pods
//
//  Created by Jobs on 9/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
extension JXSegmentedTitleAttributeDataSource {
    @discardableResult
    public func byTitleNumberOfLines(_ lines: Int) -> Self {
        titleNumberOfLines = lines
        return self
    }

    @discardableResult
    public func byAttributedTitles(_ value: [NSAttributedString]) -> Self {
        attributedTitles = value
        return self
    }

    @discardableResult
    public func bySelectedAttributedTitles(_ value: [NSAttributedString]?) -> Self {
        selectedAttributedTitles = value
        return self
    }
    /// 富文本宽度缓存/计算（影响 cell 宽度 & indicator 对齐）
    @discardableResult
    public func byWidthForTitle(_ block: @escaping (NSAttributedString) -> CGFloat) -> Self {
        widthForTitleClosure = block
        return self
    }

    @discardableResult
    public func byItemSpacingAverageEnabled(_ enabled: Bool = true) -> Self {
        isItemSpacingAverageEnabled = enabled
        return self
    }
}
#endif
