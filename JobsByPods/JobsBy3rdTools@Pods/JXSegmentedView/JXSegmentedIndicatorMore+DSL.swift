//
//  JXSegmentedIndicatorMore+DSL.swift
//  JobsBy3rdTools
//
//  Created by OpenClaw on 2026/03/09.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView

// MARK: - Base indicator missing DSL
extension JXSegmentedIndicatorBaseView {

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

// MARK: - DotLine
extension JXSegmentedIndicatorDotLineView {
    @discardableResult
    public func byLineMaxWidth(_ v: CGFloat) -> Self {
        lineMaxWidth = v
        return self
    }
}

// MARK: - DoubleLine
extension JXSegmentedIndicatorDoubleLineView {
    /// 双线指示器：最细时的线宽比例（0~1）
    @discardableResult
    public func byMinLineWidthPercent(_ v: CGFloat) -> Self {
        minLineWidthPercent = v
        return self
    }
}

// MARK: - RainbowLine
extension JXSegmentedIndicatorRainbowLineView {
    @discardableResult
    public func byIndicatorColors(_ v: [UIColor]) -> Self {
        indicatorColors = v
        return self
    }
}

// MARK: - GradientLine
extension JXSegmentedIndicatorGradientLineView {

    @discardableResult
    public func byColors(_ v: [UIColor]) -> Self {
        colors = v
        return self
    }

    @discardableResult
    public func byStartPoint(_ v: CGPoint) -> Self {
        startPoint = v
        return self
    }

    @discardableResult
    public func byEndPoint(_ v: CGPoint) -> Self {
        endPoint = v
        return self
    }

    @discardableResult
    public func byLocations(_ v: [NSNumber]?) -> Self {
        locations = v
        return self
    }
}

// MARK: - Gradient (background gradient view)
extension JXSegmentedIndicatorGradientView {

    /// 宽度增量（历史命名兼容：gradientViewWidthIncrement 会同步到 indicatorWidthIncrement）
    @discardableResult
    public func byGradientViewWidthIncrement(_ v: CGFloat) -> Self {
        gradientViewWidthIncrement = v
        return self
    }

    @discardableResult
    public func byGradientColors(_ v: [CGColor]) -> Self {
        gradientColors = v
        return self
    }
}

// MARK: - Image
extension JXSegmentedIndicatorImageView {
    @discardableResult
    public func byImage(_ v: UIImage?) -> Self {
        image = v
        return self
    }
}

// MARK: - Background
extension JXSegmentedIndicatorBackgroundView {
    /// 兼容旧命名：backgroundWidthIncrement（内部会同步到 indicatorWidthIncrement）
    @discardableResult
    public func byBackgroundWidthIncrement(_ v: CGFloat) -> Self {
        backgroundWidthIncrement = v
        return self
    }
}

#endif
