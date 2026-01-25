//
//  RefreshProxy.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/31/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
import JobsSwiftBaseDefines

@MainActor
final class JobsProxy: NSObject {
    weak var scrollView: UIScrollView?
    private var kvo: NSKeyValueObservation?
    private var panKvo: NSKeyValueObservation?

    var header: JobsSlot?
    var footer: JobsSlot?
    var left:   JobsSlot?
    var right:  JobsSlot?

    init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init()
        observe()
    }

    deinit { kvo?.invalidate(); panKvo?.invalidate() }

    private func observe() {
        guard let sv = scrollView else { return }
        kvo = sv.observe(\.contentOffset, options: [.new]) { [weak self] _, _ in
            jobsRunOnMain(self) { _ in self?.tick() }
        }
        panKvo = sv.panGestureRecognizer.observe(\.state, options: [.new]) { [weak self] _, _ in
            jobsRunOnMain(self) { _ in self?.tick() }
        }
    }

    func tick() {
        guard let sv = scrollView else { return }
        header?.handle(with: sv)
        footer?.handle(with: sv)
        left?.handle(with: sv)
        right?.handle(with: sv)
    }
}

@MainActor
final class JobsSlot {
    let position: JobsPosition
    let view: (UIView & JobsAnimatable)
    let trigger: CGFloat
    var action: (jobsByVoidBlock)?
    weak var container: AnyObject?

    // —— 行为开关 —— //
    /// 结束刷新：指示视图先退场，再让内容区回位
    var retreatAhead: Bool = true
    /// 先退场后再回位之间的停顿（更容易看出“先/后”的时序）
    var retreatAheadDelay: TimeInterval = 0.06
    /// A 段（指示视图退场）时长
    var retreatAnimDuration: TimeInterval = 0.14
    /// B 段（内容回位：contentInset 还原）时长
    var restoreInsetDuration: TimeInterval = 0.25

    /// 先退场阶段屏蔽 tick/布局，避免 KVO 干扰
    private var isEndingAnimation = false

    private(set) var state: JobsState = .idle {
        didSet { view.apply(state: state) }
    }

    init(position: JobsPosition,
         view: (UIView & JobsAnimatable),
         trigger: CGFloat,
         container: AnyObject?,
         action: @escaping jobsByVoidBlock) {
        self.position = position
        self.view = view
        self.trigger = trigger
        self.container = container
        self.action = action
    }

    func attach(to sv: UIScrollView) {
        if view.superview !== sv { sv.addSubview(view) }
        layout(in: sv)
        if state == .removed { state = .idle }
    }

    func detach() {
        view.removeFromSuperview()
        state = .removed
    }

    // MARK: - Layout
    /// 关键修复点：
    /// 原来用 adjustedContentInset 来定位 view，会在 refreshing 时因为 contentInset 被加 h 导致 adjusted 也变大，
    /// 从而把刷新视图再往外推一次 => “刷新中”跑到屏幕外。
    ///
    /// 解决：定位时只使用「基础 contentInset（把 refreshing 额外加的那段减掉）」来算位置。
    func layout(in sv: UIScrollView) {
        let h = view.heightOrWidth

        // 基础 inset：如果当前在 refreshing，把我们额外加的那段减掉（避免 layout 被 inset 变化带跑）
        var baseInset = sv.contentInset
        if case .refreshing = state {
            switch position {
            case .header: baseInset.top    = max(0, baseInset.top - h)
            case .footer: baseInset.bottom = max(0, baseInset.bottom - h)
            case .left:   baseInset.left   = max(0, baseInset.left - h)
            case .right:  baseInset.right  = max(0, baseInset.right - h)
            }
        }

        switch position {
        case .header:
            view.frame = CGRect(
                x: 0,
                y: -h - baseInset.top,
                width: sv.bounds.width,
                height: h
            )

        case .footer:
            // footer 的锚定应该基于内容高度 + 基础 bottom inset
            let contentH = max(sv.contentSize.height,
                               sv.bounds.height - (sv.adjustedContentInset.top + sv.adjustedContentInset.bottom))
            view.frame = CGRect(
                x: 0,
                y: contentH + baseInset.bottom,
                width: sv.bounds.width,
                height: h
            )

        case .left:
            view.frame = CGRect(
                x: -h - baseInset.left,
                y: 0,
                width: h,
                height: sv.bounds.height
            )

        case .right:
            let contentW = max(sv.contentSize.width,
                               sv.bounds.width - (sv.adjustedContentInset.left + sv.adjustedContentInset.right))
            view.frame = CGRect(
                x: contentW + baseInset.right,
                y: 0,
                width: h,
                height: sv.bounds.height
            )
        }
    }

    func handle(with sv: UIScrollView) {
        guard state != .removed, !isEndingAnimation else { return }
        attach(to: sv)

        let inset = sv.adjustedContentInset
        let offset = sv.contentOffset
        let isDragging = sv.isDragging

        switch position {
        case .header:
            let distance = -(offset.y + inset.top)
            progress(distance: distance, axis: .vertical, isDragging: isDragging, sv: sv)

        case .footer:
            let contentH = max(sv.contentSize.height, sv.bounds.height - (inset.top + inset.bottom))
            let distance = offset.y + sv.bounds.height - contentH - inset.bottom
            progress(distance: distance, axis: .vertical, isDragging: isDragging, sv: sv, isFooter: true)

        case .left:
            let distance = -(offset.x + inset.left)
            progress(distance: distance, axis: .horizontal, isDragging: isDragging, sv: sv)

        case .right:
            let contentW = max(sv.contentSize.width, sv.bounds.width - (inset.left + inset.right))
            let distance = offset.x + sv.bounds.width - contentW - inset.right
            progress(distance: distance, axis: .horizontal, isDragging: isDragging, sv: sv)
        }
    }

    private func progress(distance: CGFloat,
                          axis: JobsAxis,
                          isDragging: Bool,
                          sv: UIScrollView,
                          isFooter: Bool = false) {
        guard state != .refreshing && state != .noMore else { return }

        let p = max(0, min(1, distance / trigger))
        if isDragging {
            state = (p >= 1) ? .ready : .pulling(progress: p)
        } else {
            if state == .ready {
                beginRefreshing(on: sv, axis: axis, isFooter: isFooter)
            } else if case .pulling = state {
                state = .idle
            }
        }
    }

    // MARK: - Begin Refreshing
    /// 关键修复点：
    /// 进入 refreshing 时，除了改 contentInset，还必须同步拉 contentOffset，
    /// 否则松手后的回弹/减速会把“刷新中”挤到屏幕外。
    func beginRefreshing(on sv: UIScrollView, axis: JobsAxis? = nil, isFooter: Bool = false) {
        guard state != .refreshing else { return }
        state = .refreshing

        let h = view.heightOrWidth
        let oldAdjusted = sv.adjustedContentInset

        var inset = sv.contentInset
        switch position {
        case .header: inset.top    += h
        case .footer: inset.bottom += h
        case .left:   inset.left   += h
        case .right:  inset.right  += h
        }

        // 目标 offset：让刷新视图进入 refreshing 后一定在可视区域内
        var targetOffset = sv.contentOffset
        switch position {
        case .header:
            targetOffset.y = -(oldAdjusted.top + h)

        case .footer:
            let contentH = max(sv.contentSize.height,
                               sv.bounds.height - (oldAdjusted.top + oldAdjusted.bottom))
            targetOffset.y = contentH + (oldAdjusted.bottom + h) - sv.bounds.height

        case .left:
            targetOffset.x = -(oldAdjusted.left + h)

        case .right:
            let contentW = max(sv.contentSize.width,
                               sv.bounds.width - (oldAdjusted.left + oldAdjusted.right))
            targetOffset.x = contentW + (oldAdjusted.right + h) - sv.bounds.width
        }

        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.allowUserInteraction, .beginFromCurrentState]) {
            sv.contentInset = inset
            sv.setContentOffset(targetOffset, animated: false)
        }

        action?()
        if container == nil { endRefreshing(on: sv) } // 容器释放时兜底
    }

    // MARK: - End Refreshing
    func endRefreshing(on sv: UIScrollView, backTo targetInsetOpt: UIEdgeInsets? = nil) {
        guard case .refreshing = state else { return }
        state = .idle

        let h = view.heightOrWidth
        let targetInset = targetInsetOpt ?? resetInset(from: sv.contentInset)

        // 旧行为：直接还原 inset（同步回位）
        guard retreatAhead else {
            UIView.animate(withDuration: restoreInsetDuration,
                           delay: 0,
                           options: [.allowUserInteraction, .beginFromCurrentState]) {
                sv.contentInset = targetInset
            } completion: { _ in
                self.layout(in: sv)
            }
            return
        }

        // —— 新行为：A 先退场 → (delay) → B 内容回位 —— //
        isEndingAnimation = true
        let oldEnabled = sv.isScrollEnabled
        sv.isScrollEnabled = false   // 钉住内容，避免系统减速/回弹干扰 A 段

        let retreatTransform: CGAffineTransform = {
            switch position {
            case .header: return CGAffineTransform(translationX: 0, y: -h)
            case .footer: return CGAffineTransform(translationX: 0, y:  h)
            case .left:   return CGAffineTransform(translationX: -h, y: 0)
            case .right:  return CGAffineTransform(translationX:  h, y: 0)
            }
        }()

        // A 段：指示视图先退场（不动 contentInset）
        UIView.animate(withDuration: retreatAnimDuration,
                       delay: 0,
                       options: [.curveEaseOut, .beginFromCurrentState]) {
            self.view.transform = retreatTransform
            self.view.alpha = 0
        } completion: { _ in
            // 明确隐藏，避免 B 段 inset 变化时闪一下
            self.view.isHidden = true

            // 小停顿，强化“先/后”的感知
            let delay = self.retreatAheadDelay
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                // B 段：开始让内容回位（还原 inset）
                UIView.animate(withDuration: self.restoreInsetDuration,
                               delay: 0,
                               options: [.allowUserInteraction, .beginFromCurrentState]) {
                    sv.contentInset = targetInset
                } completion: { _ in
                    // 复原指示视图，准备下次使用
                    self.view.isHidden = false
                    self.view.transform = .identity
                    self.view.alpha = 1
                    self.layout(in: sv)

                    sv.isScrollEnabled = oldEnabled
                    self.isEndingAnimation = false
                }
            }
        }
    }

    func noticeNoMoreData(on sv: UIScrollView) {
        guard position == .footer else { return }
        state = .noMore
    }

    private func resetInset(from current: UIEdgeInsets) -> UIEdgeInsets {
        var inset = current
        switch position {
        case .header: inset.top    -= view.heightOrWidth
        case .footer: inset.bottom -= view.heightOrWidth
        case .left:   inset.left   -= view.heightOrWidth
        case .right:  inset.right  -= view.heightOrWidth
        }
        return inset
    }
}
