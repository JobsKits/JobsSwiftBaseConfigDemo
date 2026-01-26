//
//  UIScrollView+JobsRefresher.swift
//  JobsSwiftBaseConfigDemo
//
//  DSL additions:
//  - showRefreshHeaderInfo / showRefreshFooterInfo
//  - per-slot Lottie preference overrides global
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBlock

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

@MainActor
public extension UIScrollView {

    // MARK: - Info visibility (group)
    /// 头部信息：竖向 Header + 横向 Left
    @discardableResult
    func showRefreshHeaderInfo(_ show: Bool) -> Self {
        mrk_proxy.showsHeaderInfo = show
        mrk_proxy.header?.showsInfo = show
        mrk_proxy.left?.showsInfo = show
        return self
    }

    /// 尾部信息：竖向 Footer + 横向 Right
    @discardableResult
    func showRefreshFooterInfo(_ show: Bool) -> Self {
        mrk_proxy.showsFooterInfo = show
        mrk_proxy.footer?.showsInfo = show
        mrk_proxy.right?.showsInfo = show
        return self
    }

    // MARK: - Lottie per-slot (instance override > global)
    @discardableResult
    func setHeaderLottie(_ pref: JobsLottiePreference) -> Self {
        mrk_proxy.headerLottiePref = pref
        (mrk_proxy.header?.view as? JobsLottieConfigurable)?.lottiePreference = pref
        return self
    }

    @discardableResult
    func setFooterLottie(_ pref: JobsLottiePreference) -> Self {
        mrk_proxy.footerLottiePref = pref
        (mrk_proxy.footer?.view as? JobsLottieConfigurable)?.lottiePreference = pref
        return self
    }

    @discardableResult
    func setLeftLottie(_ pref: JobsLottiePreference) -> Self {
        mrk_proxy.leftLottiePref = pref
        (mrk_proxy.left?.view as? JobsLottieConfigurable)?.lottiePreference = pref
        return self
    }

    @discardableResult
    func setRightLottie(_ pref: JobsLottiePreference) -> Self {
        mrk_proxy.rightLottiePref = pref
        (mrk_proxy.right?.view as? JobsLottieConfigurable)?.lottiePreference = pref
        return self
    }

    // MARK: - Config header/footer/side

    @discardableResult
    func configRefreshHeader(component: (UIView & JobsAnimatable)? = nil,
                             container: AnyObject? = nil,
                             trigger: CGFloat = 60,
                             action: @escaping jobsByVoidBlock) -> Self {
        let c = component ?? JobsDefaultHeader()
        if let v = c as? JobsLottieConfigurable {
            v.lottiePreference = mrk_proxy.headerLottiePref
        }
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

    @discardableResult
    func configRefreshFooter(component: (UIView & JobsAnimatable)? = nil,
                             container: AnyObject? = nil,
                             trigger: CGFloat = 60,
                             action: @escaping jobsByVoidBlock) -> Self {
        let c = component ?? JobsDefaultFooter()
        if let v = c as? JobsLottieConfigurable {
            v.lottiePreference = mrk_proxy.footerLottiePref
        }
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

    @discardableResult
    func configSideRefresh(with component: (UIView & JobsAnimatable),
                           container: AnyObject? = nil,
                           at position: JobsPosition,
                           trigger: CGFloat = 60,
                           action: @escaping jobsByVoidBlock) -> Self {
        precondition(position == .left || position == .right, "SideRefresh 仅支持 .left / .right")

        // apply per-slot pref
        if let v = component as? JobsLottieConfigurable {
            v.lottiePreference = (position == .left) ? mrk_proxy.leftLottiePref : mrk_proxy.rightLottiePref
        }

        let slot = JobsSlot(position: position, view: component, trigger: trigger, container: container, action: action)
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
