//
//  JXSegmentedView.swift
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
extension JXSegmentedView {
    // MARK: 绑定对象
    @discardableResult
    public func byDataSource(_ ds: JXSegmentedViewDataSource) -> Self {
        self.dataSource = ds
        return self
    }

    @discardableResult
    public func byDelegate(_ d: JXSegmentedViewDelegate?) -> Self {
        self.delegate = d
        return self
    }
    /// 绑定 JXSegmentedListContainerView（其实现了 JXSegmentedViewListContainer 协议）
    @discardableResult
    public func byListContainer(_ container: JXSegmentedViewListContainer, defaultIndex: Int? = nil) -> Self {
        if let i = defaultIndex { self.defaultSelectedIndex = i }
        self.listContainer = container
        return self
    }
    /// 直接绑定一个外部的内容滚动视图（不用 listContainer 的场景）
    @discardableResult
    public func byContentScrollView(_ scrollView: UIScrollView,
                             clickAnimation: Bool? = nil) -> Self {
        self.contentScrollView = scrollView
        if let v = clickAnimation {
            self.isContentScrollViewClickTransitionAnimationEnabled = v
        }
        return self
    }
    // MARK: 视觉/行为
    @discardableResult
    public func byIndicators(_ views: [JXSegmentedIndicatorProtocol]) -> Self {
        self.indicators = views
        return self
    }

    @discardableResult
    public func byDefaultSelectedIndex(_ index: Int) -> Self {
        self.defaultSelectedIndex = index
        return self
    }
    /// 代码选中某个 index（等价于 `selectItemAt(index:)`）
    @discardableResult
    public func bySelectIndex(_ index: Int) -> Self {
        self.selectItemAt(index: index)
        return self
    }

    @discardableResult
    public func byClickTransitionAnimationEnabled(_ enabled: Bool) -> Self {
        self.isContentScrollViewClickTransitionAnimationEnabled = enabled
        return self
    }
    /// 内容左右边距（传 `JXSegmentedViewAutomaticDimension` 表示跟随 itemSpacing）
    @discardableResult
    public func byContentEdgeInsets(left: CGFloat, right: CGFloat) -> Self {
        self.contentEdgeInsetLeft = left
        self.contentEdgeInsetRight = right
        return self
    }
    
    @discardableResult
    public func byContentEdgeInsetLeft(_ left: CGFloat) -> Self {
        self.contentEdgeInsetLeft = left
        return self
    }
    
    @discardableResult
    public func byContentEdgeInsetRight(_ right: CGFloat) -> Self {
        self.contentEdgeInsetRight = right
        return self
    }
    /// 快捷 reload
    @discardableResult
    public func byReload() -> Self {
        self.reloadData()
        return self
    }
}
#endif
