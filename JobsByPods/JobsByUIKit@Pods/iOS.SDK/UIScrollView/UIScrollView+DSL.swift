//
//  UIScrollView+DSL.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/2/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock

extension UIScrollView {
    /// Basics
    @discardableResult
    public func byContentSize(_ size: CGSize) -> Self {
        self.contentSize = size
        return self
    }

    @discardableResult
    public func byContentOffsetBy(_ offset: CGPoint) -> Self {
        self.setContentOffset(offset, animated: false)
        return self
    }

    @discardableResult
    public func byContentOffsetByAnimated(_ offset: CGPoint) -> Self {
        self.setContentOffset(offset, animated: true)
        return self
    }

    @discardableResult
    public func byShowsVerticalScrollIndicator(_ show: Bool) -> Self {
        self.showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    public func byShowsHorizontalScrollIndicator(_ show: Bool) -> Self {
        self.showsHorizontalScrollIndicator = show
        return self
    }

    @discardableResult
    public func byBounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }

    @discardableResult
    public func byAlwaysBounceVertical(_ enable: Bool) -> Self {
        self.alwaysBounceVertical = enable
        return self
    }

    @discardableResult
    public func byAlwaysBounceHorizontal(_ enable: Bool) -> Self {
        self.alwaysBounceHorizontal = enable
        return self
    }

    @discardableResult
    public func byPagingEnabled(_ enabled: Bool) -> Self {
        self.isPagingEnabled = enabled
        return self
    }

    @discardableResult
    public func byScrollEnabled(_ enabled: Bool) -> Self {
        self.isScrollEnabled = enabled
        return self
    }

    @discardableResult
    public func byDirectionalLockEnabled(_ enabled: Bool) -> Self {
        self.isDirectionalLockEnabled = enabled
        return self
    }

    @discardableResult
    public func byScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.scrollIndicatorInsets = insets
        return self
    }

    @discardableResult
    public func byContentInset(_ insets: UIEdgeInsets) -> Self {
        self.contentInset = insets
        return self
    }

    @discardableResult
    public func byIndicatorStyle(_ style: UIScrollView.IndicatorStyle) -> Self {
        self.indicatorStyle = style
        return self
    }
    /// 改为可选，便于置空
    @discardableResult
    public func byDelegate(_ delegate: UIScrollViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    @discardableResult
    public func byKeyboardDismissMode(_ mode: UIScrollView.KeyboardDismissMode) -> Self {
        self.keyboardDismissMode = mode
        return self
    }

    @discardableResult
    public func byRefreshControl(_ control: UIRefreshControl?) -> Self {
        self.refreshControl = control
        return self
    }

    @discardableResult
    public func byDecelerationRate(_ rate: UIScrollView.DecelerationRate) -> Self {
        self.decelerationRate = rate
        return self
    }

    @discardableResult
    public func byScrollsToTop(_ enabled: Bool) -> Self {
        self.scrollsToTop = enabled
        return self
    }
    /// Insets & Adjustment
    /// iOS 11.0+ 内容 inset 自动调整行为
    @available(iOS 11.0, *)
    @discardableResult
    public func byContentInsetAdjustmentBehavior(_ behavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        self.contentInsetAdjustmentBehavior = behavior
        return self
    }
    /// iOS 13.0+ 自动调整滚动条 inset
    @available(iOS 13.0, *)
    @discardableResult
    public func byAutomaticallyAdjustsScrollIndicatorInsets(_ enable: Bool) -> Self {
        self.automaticallyAdjustsScrollIndicatorInsets = enable
        return self
    }
    /// iOS 11.1+ 垂直滚动条 inset
    @available(iOS 11.1, *)
    @discardableResult
    public func byVerticalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.verticalScrollIndicatorInsets = insets
        return self
    }
    /// iOS 11.1+ 水平滚动条 inset
    @available(iOS 11.1, *)
    @discardableResult
    public func byHorizontalScrollIndicatorInsets(_ insets: UIEdgeInsets) -> Self {
        self.horizontalScrollIndicatorInsets = insets
        return self
    }
    /// Keyboard Scrolling
    /// iOS 17.0+ 允许键盘方向键滚动
    @available(iOS 17.0, *)
    @discardableResult
    public func byAllowsKeyboardScrolling(_ enable: Bool) -> Self {
        self.allowsKeyboardScrolling = enable
        return self
    }
    /// iOS 17.4+ 属性组
    /// iOS 17.4+ 内容对齐点
    @available(iOS 17.4, *)
    @discardableResult
    public func byContentAlignmentPoint(_ point: CGPoint) -> Self {
        self.contentAlignmentPoint = point
        return self
    }
    /// iOS 17.4+ 水平回弹
    @available(iOS 17.4, *)
    @discardableResult
    public func byBouncesHorizontally(_ enable: Bool) -> Self {
        self.bouncesHorizontally = enable
        return self
    }
    /// iOS 17.4+ 垂直回弹
    @available(iOS 17.4, *)
    @discardableResult
    public func byBouncesVertically(_ enable: Bool) -> Self {
        self.bouncesVertically = enable
        return self
    }
    /// iOS 17.4+ 是否将水平滚动交给父级
    @available(iOS 17.4, *)
    @discardableResult
    public func byTransfersHorizontalScrollingToParent(_ enable: Bool) -> Self {
        self.transfersHorizontalScrollingToParent = enable
        return self
    }
    /// iOS 17.4+ 是否将垂直滚动交给父级
    @available(iOS 17.4, *)
    @discardableResult
    public func byTransfersVerticalScrollingToParent(_ enable: Bool) -> Self {
        self.transfersVerticalScrollingToParent = enable
        return self
    }
    /// iOS 17.4+ 滚动 offset 变化时强制显示滚动条
    @available(iOS 17.4, *)
    @discardableResult
    public func byWithScrollIndicatorsShownForContentOffsetChanges(_ changes: jobsByVoidBlock) -> Self {
        self.withScrollIndicatorsShown(forContentOffsetChanges: changes)
        return self
    }
    /// iOS 17.4+ 立即停止滚动与缩放动画
    @available(iOS 17.4, *)
    @discardableResult
    public func byStopScrollingAndZooming() -> Self {
        self.stopScrollingAndZooming()
        return self
    }
    /// Touch Behavior
    @discardableResult
    public func byDelaysContentTouches(_ enable: Bool) -> Self {
        self.delaysContentTouches = enable
        return self
    }

    @discardableResult
    public func byCanCancelContentTouches(_ enable: Bool) -> Self {
        self.canCancelContentTouches = enable
        return self
    }
    /// Zoom
    @discardableResult
    public func byMinimumZoomScale(_ scale: CGFloat) -> Self {
        self.minimumZoomScale = scale
        return self
    }

    @discardableResult
    public func byMaximumZoomScale(_ scale: CGFloat) -> Self {
        self.maximumZoomScale = scale
        return self
    }

    @discardableResult
    public func byZoomScale(_ scale: CGFloat, animated: Bool = false) -> Self {
        if animated {
            self.setZoomScale(scale, animated: true)
        } else {
            self.zoomScale = scale
        };return self
    }

    @discardableResult
    public func byBouncesZoom(_ enable: Bool) -> Self {
        self.bouncesZoom = enable
        return self
    }

    @discardableResult
    public func byZoom(to rect: CGRect, animated: Bool) -> Self {
        self.zoom(to: rect, animated: animated)
        return self
    }
    /// Indicators
    @discardableResult
    public func byShowsIndicators(vertical: Bool? = nil, horizontal: Bool? = nil) -> Self {
        if let v = vertical { self.showsVerticalScrollIndicator = v }
        if let h = horizontal { self.showsHorizontalScrollIndicator = h }
        return self
    }

    @discardableResult
    public func byFlashScrollIndicators() -> Self {
        self.flashScrollIndicators()
        return self
    }
    /// Visible Rect
    @discardableResult
    public func byScrollRectToVisible(_ rect: CGRect, animated: Bool) -> Self {
        self.scrollRectToVisible(rect, animated: animated)
        return self
    }
    /// Index Display
    @discardableResult
    public func byIndexDisplayMode(_ mode: UIScrollView.IndexDisplayMode) -> Self {
        self.indexDisplayMode = mode
        return self
    }
    /// Gesture Config
    @discardableResult
    public func byPanGesture(_ config: (UIPanGestureRecognizer) -> Void) -> Self {
        config(self.panGestureRecognizer)
        return self
    }

    @available(iOS 5.0, *)
    @discardableResult
    public func byPinchGesture(_ config: (UIPinchGestureRecognizer) -> Void) -> Self {
        if let pinch = self.pinchGestureRecognizer {
            config(pinch)
        };return self
    }

    @discardableResult
    public func byDirectionalPressGesture(_ config: (UIGestureRecognizer) -> Void) -> Self {
        config(self.directionalPressGestureRecognizer)
        return self
    }
    /// iOS 26.0+ Scroll Edge Effects
    @available(iOS 26.0, *)
    @discardableResult
    public func byTopEdgeEffect(_ config: (UIScrollEdgeEffect) -> Void) -> Self {
        config(self.topEdgeEffect)
        return self
    }

    @available(iOS 26.0, *)
    @discardableResult
    public func byLeftEdgeEffect(_ config: (UIScrollEdgeEffect) -> Void) -> Self {
        config(self.leftEdgeEffect)
        return self
    }

    @available(iOS 26.0, *)
    @discardableResult
    public func byBottomEdgeEffect(_ config: (UIScrollEdgeEffect) -> Void) -> Self {
        config(self.bottomEdgeEffect)
        return self
    }

    @available(iOS 26.0, *)
    @discardableResult
    public func byRightEdgeEffect(_ config: (UIScrollEdgeEffect) -> Void) -> Self {
        config(self.rightEdgeEffect)
        return self
    }
}
// MARK: - 初始位置（同步滚动条）
extension UIScrollView {
    /// contentInset（内部同步滚动条insets）
    @discardableResult
    public func byContentInsetTop(_ v: CGFloat) -> Self {
        contentInset.top = v
        byIndicatorInsetTop(v)
        return self
    }

    @discardableResult
    public func byContentInsetLeft(_ v: CGFloat) -> Self {
        contentInset.left = v
        byIndicatorInsetLeft(v)
        return self
    }

    @discardableResult
    public func byContentInsetBottom(_ v: CGFloat) -> Self {
        contentInset.bottom = v
        byIndicatorInsetBottom(v)
        return self
    }

    @discardableResult
    public func byContentInsetRight(_ v: CGFloat) -> Self {
        contentInset.right = v
        byIndicatorInsetRight(v)
        return self
    }
    /// scrollIndicatorInsets（单独暴露：iOS13+兼容）
    /// 顶部滚动条inset（iOS13+ 用 verticalScrollIndicatorInsets，避免 scrollIndicatorInsets getter 的废弃警告）
    @discardableResult
    public func byIndicatorInsetTop(_ v: CGFloat) -> Self {
        if #available(iOS 13.0, *) {
            var inset = verticalScrollIndicatorInsets
            inset.top = v
            verticalScrollIndicatorInsets = inset
        } else {
            var inset = scrollIndicatorInsets
            inset.top = v
            scrollIndicatorInsets = inset
        };return self
    }
    /// 左侧滚动条inset（iOS13+ 用 horizontalScrollIndicatorInsets）
    @discardableResult
    public func byIndicatorInsetLeft(_ v: CGFloat) -> Self {
        if #available(iOS 13.0, *) {
            var inset = horizontalScrollIndicatorInsets
            inset.left = v
            horizontalScrollIndicatorInsets = inset
        } else {
            var inset = scrollIndicatorInsets
            inset.left = v
            scrollIndicatorInsets = inset
        };return self
    }
    /// 底部滚动条inset（iOS13+ 用 verticalScrollIndicatorInsets）
    @discardableResult
    public func byIndicatorInsetBottom(_ v: CGFloat) -> Self {
        if #available(iOS 13.0, *) {
            var inset = verticalScrollIndicatorInsets
            inset.bottom = v
            verticalScrollIndicatorInsets = inset
        } else {
            var inset = scrollIndicatorInsets
            inset.bottom = v
            scrollIndicatorInsets = inset
        };return self
    }
    /// 右侧滚动条inset（iOS13+ 用 horizontalScrollIndicatorInsets）
    @discardableResult
    public func byIndicatorInsetRight(_ v: CGFloat) -> Self {
        if #available(iOS 13.0, *) {
            var inset = horizontalScrollIndicatorInsets
            inset.right = v
            horizontalScrollIndicatorInsets = inset
        } else {
            var inset = scrollIndicatorInsets
            inset.right = v
            scrollIndicatorInsets = inset
        };return self
    }
    /// 仅增加“垂直”可滑动距离：底部加大（常用）
    /// - Parameter extra: 要额外增加的距离（<=0 会按 0 处理）
    public func byExpandVerticalScrollDistance(_ extra: CGFloat) -> Self {
        let extra = max(0, extra)
        var inset = self.contentInset
        inset.bottom += extra
        self.contentInset = inset
        var indicator = self.scrollIndicatorInsets
        indicator.bottom += extra
        self.scrollIndicatorInsets = indicator
        return self
    }
    /// 仅增加“横向”可滑动距离：右侧加大（常用）
    /// - Parameter extra: 要额外增加的距离（<=0 会按 0 处理）
    public func byExpandHorizontalScrollDistance(_ extra: CGFloat) -> Self {
        let extra = max(0, extra)
        var inset = self.contentInset
        inset.right += extra
        self.contentInset = inset
        var indicator = self.scrollIndicatorInsets
        indicator.right += extra
        self.scrollIndicatorInsets = indicator
        return self
    }
}
