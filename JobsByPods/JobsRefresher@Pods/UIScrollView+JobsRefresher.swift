//
//  UIScrollView+JobsRefresher.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/31/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBlock

// MARK: - UIScrollView + Proxy
@MainActor
private struct JobsAssocKeys {
    static var proxy: UInt8 = 0
}

@MainActor
extension UIScrollView {
    var mrk_proxy: JobsProxy {
        if let p = objc_getAssociatedObject(self, &JobsAssocKeys.proxy) as? JobsProxy {
            return p
        }
        let p = JobsProxy(scrollView: self)
        objc_setAssociatedObject(self, &JobsAssocKeys.proxy, p, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return p
    }
}

// MARK: - UIScrollView + API
@MainActor
public struct JobsSideFactory {
    public static func left() -> JobsDefaultIndicatorView {
        let v = JobsDefaultIndicatorView()
        v.position = .left
        return v
    }
    public static func right() -> JobsDefaultIndicatorView {
        let v = JobsDefaultIndicatorView()
        v.position = .right
        return v
    }
}

@MainActor
public extension UIScrollView {

    // MARK: - DSL（是否显示 Header/Footer 信息）
    /// 是否显示“头部信息”（涵盖：竖向 Header + 横向 Left）
    @discardableResult
    func showRefreshHeaderInfo(_ show: Bool) -> Self {
        mrk_proxy.showsHeaderInfo = show
        mrk_proxy.header?.showsInfo = show
        mrk_proxy.left?.showsInfo = show
        return self
    }

    /// 是否显示“尾部信息”（涵盖：竖向 Footer + 横向 Right）
    @discardableResult
    func showRefreshFooterInfo(_ show: Bool) -> Self {
        mrk_proxy.showsFooterInfo = show
        mrk_proxy.footer?.showsInfo = show
        mrk_proxy.right?.showsInfo = show
        return self
    }

    // MARK: Header
    @discardableResult
    func configRefreshHeader(component: (UIView & JobsAnimatable)? = nil,
                             container: AnyObject? = nil,
                             trigger: CGFloat = 60,
                             action: @escaping jobsByVoidBlock) -> Self {
        let c = component ?? JobsDefaultHeader()
        let slot = JobsSlot(position: .header, view: c, trigger: trigger, container: container, action: action)
        slot.showsInfo = mrk_proxy.showsHeaderInfo
        mrk_proxy.header = slot
        slot.attach(to: self)
        return self
    }

    @discardableResult
    func switchRefreshHeader(to state: JobsSwitch) -> Self {
        guard let slot = mrk_proxy.header, let sv = mrk_proxy.scrollView else { return self }
        switch state {
        case .refreshing: slot.beginRefreshing(on: sv)
        case .normal:     slot.endRefreshing(on: sv)
        case .removed:
            slot.detach()
            mrk_proxy.header = nil
        case .noMoreData:
            break
        }
        return self
    }

    // MARK: Footer
    @discardableResult
    func configRefreshFooter(component: (UIView & JobsAnimatable)? = nil,
                             container: AnyObject? = nil,
                             trigger: CGFloat = 60,
                             action: @escaping jobsByVoidBlock) -> Self {
        let c = component ?? JobsDefaultFooter()
        let slot = JobsSlot(position: .footer, view: c, trigger: trigger, container: container, action: action)
        slot.showsInfo = mrk_proxy.showsFooterInfo
        mrk_proxy.footer = slot
        slot.attach(to: self)
        return self
    }

    @discardableResult
    func switchRefreshFooter(to state: JobsSwitch) -> Self {
        guard let slot = mrk_proxy.footer, let sv = mrk_proxy.scrollView else { return self }
        switch state {
        case .refreshing: slot.beginRefreshing(on: sv, isFooter: true)
        case .normal:     slot.endRefreshing(on: sv)
        case .removed:
            slot.detach()
            mrk_proxy.footer = nil
        case .noMoreData: slot.noticeNoMoreData(on: sv)
        }
        return self
    }

    // MARK: Side (Left/Right)
    @discardableResult
    func configSideRefresh(with component: (UIView & JobsAnimatable),
                           container: AnyObject? = nil,
                           at position: JobsPosition,
                           trigger: CGFloat = 60,
                           action: @escaping jobsByVoidBlock) -> Self {
        precondition(position == .left || position == .right, "SideRefresh 仅支持 .left / .right")
        let slot = JobsSlot(position: position, view: component, trigger: trigger, container: container, action: action)
        // 左 = 头部信息；右 = 尾部信息
        slot.showsInfo = (position == .left) ? mrk_proxy.showsHeaderInfo : mrk_proxy.showsFooterInfo
        if position == .left { mrk_proxy.left = slot } else { mrk_proxy.right = slot }
        slot.attach(to: self)
        return self
    }

    @discardableResult
    func switchSideRefresh(_ position: JobsPosition, to state: JobsSwitch) -> Self {
        guard (position == .left || position == .right),
              let sv = mrk_proxy.scrollView else { return self }
        let slot = (position == .left) ? mrk_proxy.left : mrk_proxy.right
        guard let s = slot else { return self }
        switch state {
        case .refreshing: s.beginRefreshing(on: sv)
        case .normal:     s.endRefreshing(on: sv)
        case .removed:
            s.detach()
            if position == .left { mrk_proxy.left = nil } else { mrk_proxy.right = nil }
        case .noMoreData:
            break
        }
        return self
    }
}
