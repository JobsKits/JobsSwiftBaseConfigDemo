//
//  JXSegmentedViewDelegate+DSL.swift
//  JobsBy3rdTools
//
//  Created by OpenClaw on 2026/03/09.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC

#if canImport(JXSegmentedView)
import JXSegmentedView

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
