//
//  JXSegmentedBaseDataSource.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 11/12/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(JXSegmentedView)
import JXSegmentedView
extension JXSegmentedBaseDataSource {
    
    @discardableResult
    public func byItemWidth(_ value: CGFloat) -> Self {
        itemWidth = value
        return self
    }

    @discardableResult
    public func byItemWidthIncrement(_ value: CGFloat) -> Self {
        itemWidthIncrement = value
        return self
    }

    @discardableResult
    public func byItemSpacing(_ value: CGFloat) -> Self {
        itemSpacing = value
        return self
    }

    @discardableResult
    public func bySpacingAverage(_ enabled: Bool = true) -> Self {
        isItemSpacingAverageEnabled = enabled
        return self
    }

    @discardableResult
    public func byTransitionEnabled(_ enabled: Bool = true) -> Self {
        isItemTransitionEnabled = enabled
        return self
    }
    /// 选中动画：可顺带改时长
    @discardableResult
    public func bySelectedAnimable(_ on: Bool = true, duration: TimeInterval? = nil) -> Self {
        isSelectedAnimable = on
        if let d = duration { selectedAnimationDuration = d }
        return self
    }

    @discardableResult
    public func byAnimationDuration(_ d: TimeInterval) -> Self {
        selectedAnimationDuration = d
        return self
    }
    /// 宽度缩放：同时可配置 scale 与是否需要缩放动画
    @discardableResult
    public func byItemWidthZoom(enabled: Bool = true,
                                scale: CGFloat? = nil,
                                animable: Bool? = nil) -> Self {
        isItemWidthZoomEnabled = enabled
        if let s = scale { itemWidthSelectedZoomScale = s }
        if let a = animable { isItemWidthZoomAnimable = a }
        return self
    }
    /// 一把梭：把自己挂到 segmentedView，并可设置指示器 + 选中索引
    @discardableResult
    public func byAttach(to segmentedView: JXSegmentedView,
                         selectedIndex: Int = 0,
                         indicators: [JXSegmentedIndicatorProtocol]? = nil) -> Self {
        segmentedView.dataSource = self
        if let ins = indicators { segmentedView.indicators = ins }
        reloadData(selectedIndex: selectedIndex)
        segmentedView.reloadData()
        return self
    }
    /// 纯刷新
    @discardableResult
    public func byReload(selectedIndex: Int = 0) -> Self {
        reloadData(selectedIndex: selectedIndex); return self
    }
}

#endif
