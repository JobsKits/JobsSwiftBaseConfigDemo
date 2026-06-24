//
//  JXSegmentedIndicatorBaseView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
/// 共用：基类可链式配置
extension JXSegmentedIndicatorBaseView {
    
    @discardableResult
    public func byIndicatorColor(_ v: UIColor) -> Self {
        indicatorColor = v
        return self
    }
    
    @discardableResult
    public func byIndicatorHeight(_ v: CGFloat) -> Self {
        indicatorHeight = v
        return self
    }
    
    @discardableResult
    public func byIndicatorWidth(_ v: CGFloat) -> Self {
        indicatorWidth = v
        return self
    }
    
    @discardableResult
    public func byVerticalOffset(_ v: CGFloat) -> Self {
        verticalOffset = v
        return self
    }
    
    @discardableResult
    public func byPosition(_ p: JXSegmentedIndicatorPosition) -> Self {
        indicatorPosition = p
        return self
    }
    /// 传具体数值；如需“自动圆角=高度/2”，传 JXSegmentedViewAutomaticDimension
    @discardableResult
    public func byIndicatorCornerRadius(_ v: CGFloat) -> Self {
        indicatorCornerRadius = v
        return self
    }
    /// 宽度增量：最终宽度 = indicatorWidth + indicatorWidthIncrement
    @discardableResult
    public func byIndicatorWidthIncrement(_ v: CGFloat) -> Self {
        indicatorWidthIncrement = v
        return self
    }
    /// 指示器是否跟随 contentScrollView 滚动（部分指示器需要）
    @discardableResult
    public func byScrollEnabled(_ on: Bool = true) -> Self {
        isScrollEnabled = on
        return self
    }
    /// 是否把 indicator 的 frame 转换到 itemFrame 坐标系（嵌套/特殊布局时可能用到）
    @discardableResult
    public func byConvertToItemFrameEnabled(_ on: Bool = true) -> Self {
        isIndicatorConvertToItemFrameEnabled = on
        return self
    }

    @discardableResult
    public func byScrollAnimationDuration(_ d: TimeInterval) -> Self {
        scrollAnimationDuration = d
        return self
    }
    /// 指示器宽度是否以 itemContentWidth 作为基准（而不是 itemFrame.width）
    @discardableResult
    public func byWidthSameAsItemContent(_ on: Bool = true) -> Self {
        isIndicatorWidthSameAsItemContent = on
        return self
    }
}
#endif
