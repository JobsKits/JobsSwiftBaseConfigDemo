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
        };return self
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
/// 把 JXSegmentedViewDelegate 做成 closure 版，方便链式写回调
public final class JobsSegmentedViewDelegateProxy: NSObject, JXSegmentedViewDelegate {

    public var didSelected: ((JXSegmentedView, Int) -> Void)?
    public var didClickSelected: ((JXSegmentedView, Int) -> Void)?
    public var didScrollSelected: ((JXSegmentedView, Int) -> Void)?
    public var scrolling: ((JXSegmentedView, Int, Int, CGFloat) -> Void)?
    public var canClick: ((JXSegmentedView, Int) -> Bool)?

    public func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        didSelected?(segmentedView, index)
    }

    public func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        didClickSelected?(segmentedView, index)
    }

    public func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {
        didScrollSelected?(segmentedView, index)
    }

    public func segmentedView(_ segmentedView: JXSegmentedView,
                              scrollingFrom leftIndex: Int,
                              to rightIndex: Int,
                              percent: CGFloat) {
        scrolling?(segmentedView, leftIndex, rightIndex, percent)
    }

    public func segmentedView(_ segmentedView: JXSegmentedView, canClickItemAt index: Int) -> Bool {
        canClick?(segmentedView, index) ?? true
    }
}
private var _jobs_jx_delegate_proxy_key: UInt8 = 0
extension JXSegmentedView {

    private var jobs_delegateProxy: JobsSegmentedViewDelegateProxy {
        if let p = objc_getAssociatedObject(self, &_jobs_jx_delegate_proxy_key) as? JobsSegmentedViewDelegateProxy {
            return p
        }
        let p = JobsSegmentedViewDelegateProxy()
        objc_setAssociatedObject(self, &_jobs_jx_delegate_proxy_key, p, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return p
    }
    /// 安装 closure delegate（会覆盖 segmentedView.delegate）
    @discardableResult
    public func byDelegateProxy(_ build: (JobsSegmentedViewDelegateProxy) -> Void) -> Self {
        let p = jobs_delegateProxy
        build(p)
        delegate = p
        return self
    }

    @discardableResult
    public func byDidSelected(_ block: ((JXSegmentedView, Int) -> Void)?) -> Self {
        jobs_delegateProxy.didSelected = block
        delegate = jobs_delegateProxy
        return self
    }

    @discardableResult
    public func byDidClickSelected(_ block: ((JXSegmentedView, Int) -> Void)?) -> Self {
        jobs_delegateProxy.didClickSelected = block
        delegate = jobs_delegateProxy
        return self
    }

    @discardableResult
    public func byDidScrollSelected(_ block: ((JXSegmentedView, Int) -> Void)?) -> Self {
        jobs_delegateProxy.didScrollSelected = block
        delegate = jobs_delegateProxy
        return self
    }

    @discardableResult
    public func byScrolling(_ block: ((JXSegmentedView, Int, Int, CGFloat) -> Void)?) -> Self {
        jobs_delegateProxy.scrolling = block
        delegate = jobs_delegateProxy
        return self
    }

    @discardableResult
    public func byCanClick(_ block: ((JXSegmentedView, Int) -> Bool)?) -> Self {
        jobs_delegateProxy.canClick = block
        delegate = jobs_delegateProxy
        return self
    }
}
#endif
