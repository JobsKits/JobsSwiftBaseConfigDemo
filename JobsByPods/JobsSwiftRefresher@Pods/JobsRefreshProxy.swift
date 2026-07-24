//
//  JobsRefreshProxy.swift
//  JobsSwiftRefresher
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsFuseAnimation

@MainActor
final class JobsProxy: NSObject {
    weak var scrollView: UIScrollView?
    private var kvo: NSKeyValueObservation?
    private var panKvo: NSKeyValueObservation?
    var header: JobsSlot?
    var footer: JobsSlot?
    var left:   JobsSlot?
    var right:  JobsSlot?
    // Info visibility
    var showsHeaderInfo: Bool = true
    var showsFooterInfo: Bool = true
    var horizontalMode: JobsRefreshHorizontalMode = .refreshRightLoadLeft
    // Per-slot lottie preference (instance-level default)
    var headerLottiePref: JobsLottiePreference = .inherit
    var footerLottiePref: JobsLottiePreference = .inherit
    var leftLottiePref: JobsLottiePreference = .inherit
    var rightLottiePref: JobsLottiePreference = .inherit
    // Per-slot image preference (instance-level default)
    var headerImagePref: JobsRefreshImagePreference = .inherit
    var footerImagePref: JobsRefreshImagePreference = .inherit
    var leftImagePref: JobsRefreshImagePreference = .inherit
    var rightImagePref: JobsRefreshImagePreference = .inherit
    // MARK: - Human interaction feedback
    /// ScrollView 级默认配置；slot 未单独设置时继承这里。
    var refreshFeedback = JobsRefreshFeedback.disabled
    var headerRefreshFeedback: JobsRefreshFeedback?
    var footerRefreshFeedback: JobsRefreshFeedback?
    var leftRefreshFeedback: JobsRefreshFeedback?
    var rightRefreshFeedback: JobsRefreshFeedback?

    deinit { kvo?.invalidate(); panKvo?.invalidate() }
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init()
        observe()
    }

    private func observe() {
        guard let sv = scrollView else { return }
        kvo = sv.observe(\.contentOffset, options: [.new]) { [weak self] _, _ in
            onMainAsync(self) { _ in self?.tick() }
        }
        panKvo = sv.panGestureRecognizer.observe(\.state, options: [.new]) { [weak self] _, _ in
            onMainAsync(self) { _ in self?.tick() }
        }
    }

    func tick() {
        guard let sv = scrollView else { return }
        header?.handle(with: sv)
        footer?.handle(with: sv)
        left?.handle(with: sv)
        right?.handle(with: sv)
    }

    func role(for position: JobsPosition) -> JobsRefreshRole {
        horizontalMode.role(for: position)
    }

    func refreshFeedback(for position: JobsPosition) -> JobsRefreshFeedback {
        let slotFeedback: JobsRefreshFeedback?
        switch position {
        /// 处理 .header 分支
        case .header: slotFeedback = headerRefreshFeedback
        /// 处理 .footer 分支
        case .footer: slotFeedback = footerRefreshFeedback
        /// 处理 .left 分支
        case .left: slotFeedback = leftRefreshFeedback
        /// 处理 .right 分支
        case .right: slotFeedback = rightRefreshFeedback
        };return slotFeedback ?? refreshFeedback
    }
}

@MainActor
final class JobsSlot {
    let position: JobsPosition
    let role: JobsRefreshRole
    private(set) var view: (UIView & JobsAnimatable)
    let trigger: CGFloat
    var action: (jobsByVoidBlock)?
    weak var container: AnyObject?

    var showsInfo: Bool = true {
        didSet {
            guard state != .removed else { return }
            view.byHidden(!showsInfo)
        }
    }

    var restoreInsetDuration: TimeInterval = 0.25
    private var isEndingAnimation = false
    private(set) var state: JobsState = .idle {
        didSet { view.apply(state: state) }
    }

    init(position: JobsPosition,
         role: JobsRefreshRole,
         view: (UIView & JobsAnimatable),
         trigger: CGFloat,
         container: AnyObject?,
         action: @escaping jobsByVoidBlock) {
        self.position = position
        self.role = role
        self.view = view
        self.trigger = trigger
        self.container = container
        self.action = action
    }

    func attach(to sv: UIScrollView) {
        if view.superview !== sv { view.byAddTo(sv) }
        if state != .removed { view.byHidden(!showsInfo) }
        layout(in: sv)
        if state == .removed { state = .idle }
    }

    func detach() {
        view.removeFromSuperview()
        view.byHidden(true)
        state = .removed
    }

    /// 保留当前 slot、触发距离和刷新状态，只原位替换表现插件。
    func replaceAnimator(_ animator: JobsRefreshAnimatorProtocol,
                         on scrollView: UIScrollView) {
        let previousView = view
        let replacementView = JobsRefreshAnimatorContainerView(
            animator: animator,
            heightOrWidth: previousView.heightOrWidth
        )
        previousView.apply(state: .removed)
        previousView.removeFromSuperview()
        view = replacementView
        replacementView.apply(state: state)
        attach(to: scrollView)
    }

    func layout(in sv: UIScrollView) {
        let h = view.heightOrWidth
        var baseInset = sv.contentInset
        if state == .refreshing || state == .ending {
            switch position {
            /// 处理 .header 分支
            case .header: baseInset.top    = max(0, baseInset.top - h)
            /// 处理 .footer 分支
            case .footer: baseInset.bottom = max(0, baseInset.bottom - h)
            /// 处理 .left 分支
            case .left:   baseInset.left   = max(0, baseInset.left - h)
            /// 处理 .right 分支
            case .right:  baseInset.right  = max(0, baseInset.right - h)
            }
        }
        switch position {
        /// 处理 .header 分支
        case .header:
            view.byFrame(CGRect(x: 0, y: -h - baseInset.top, width: sv.bounds.width, height: h))
        /// 处理 .footer 分支
        case .footer:
            let contentH = max(
                sv.contentSize.height,
                sv.bounds.height - (sv.adjustedContentInset.top + sv.adjustedContentInset.bottom)
            )
            view.byFrame(CGRect(x: 0, y: contentH + baseInset.bottom, width: sv.bounds.width, height: h))
        /// 处理 .left 分支
        case .left:
            view.byFrame(CGRect(x: -h - baseInset.left, y: 0, width: h, height: sv.bounds.height))
        /// 处理 .right 分支
        case .right:
            let contentW = max(
                sv.contentSize.width,
                sv.bounds.width - (sv.adjustedContentInset.left + sv.adjustedContentInset.right)
            )
            view.byFrame(CGRect(x: contentW + baseInset.right, y: 0, width: h, height: sv.bounds.height))
        }
    }

    func handle(with sv: UIScrollView) {
        guard state != .removed, !isEndingAnimation else { return }
        attach(to: sv)
        let inset = sv.adjustedContentInset
        let offset = sv.contentOffset
        let isDragging = sv.isDragging
        switch position {
        /// 处理 .header 分支
        case .header:
            let distance = -(offset.y + inset.top)
            progress(distance: distance, isDragging: isDragging, sv: sv)
        /// 处理 .footer 分支
        case .footer:
            let contentH = max(sv.contentSize.height, sv.bounds.height - (inset.top + inset.bottom))
            let distance = offset.y + sv.bounds.height - contentH - inset.bottom
            progress(distance: distance, isDragging: isDragging, sv: sv, isFooter: true)
        /// 处理 .left 分支
        case .left:
            let distance = -(offset.x + inset.left)
            progress(distance: distance, isDragging: isDragging, sv: sv)
        /// 处理 .right 分支
        case .right:
            let contentW = max(sv.contentSize.width, sv.bounds.width - (inset.left + inset.right))
            let distance = offset.x + sv.bounds.width - contentW - inset.right
            progress(distance: distance, isDragging: isDragging, sv: sv)
        }
    }

    private func progress(distance: CGFloat,
                          isDragging: Bool,
                          sv: UIScrollView,
                          isFooter: Bool = false) {
        guard state != .refreshing,
              state != .ending,
              state != .noMore,
              state != .disabled else { return }
        let p = max(0, min(1, distance / trigger))
        if isDragging {
            state = (p >= 1) ? .ready : .pulling(progress: p)
        } else {
            if state == .ready {
                beginRefreshing(on: sv, isFooter: isFooter)
            } else if case .pulling = state {
                state = .idle
            }
        }
    }

    func beginRefreshing(on sv: UIScrollView, isFooter: Bool = false) {
        guard state != .refreshing,
              state != .ending,
              state != .disabled,
              state != .removed,
              state != .noMore else { return }
        // Human interaction feedback: haptic + sound (configured via DSL on UIScrollView)
        sv.byRefreshFeedback(for: position)
        state = .refreshing
        view.byHidden(!showsInfo)
        let h = view.heightOrWidth
        let oldAdjusted = sv.adjustedContentInset
        var inset = sv.contentInset
        switch position {
        /// 处理 .header 分支
        case .header: inset.top    += h
        /// 处理 .footer 分支
        case .footer: inset.bottom += h
        /// 处理 .left 分支
        case .left:   inset.left   += h
        /// 处理 .right 分支
        case .right:  inset.right  += h
        }
        var targetOffset = sv.contentOffset
        switch position {
        /// 处理 .header 分支
        case .header:
            targetOffset.y = -(oldAdjusted.top + h)
        /// 处理 .footer 分支
        case .footer:
            let contentH = max(sv.contentSize.height, sv.bounds.height - (oldAdjusted.top + oldAdjusted.bottom))
            targetOffset.y = contentH + (oldAdjusted.bottom + h) - sv.bounds.height
        /// 处理 .left 分支
        case .left:
            targetOffset.x = -(oldAdjusted.left + h)
        /// 处理 .right 分支
        case .right:
            let contentW = max(sv.contentSize.width, sv.bounds.width - (oldAdjusted.left + oldAdjusted.right))
            targetOffset.x = contentW + (oldAdjusted.right + h) - sv.bounds.width
        }
        UIView.jobsAnimateWithOptions(
            0.25,
            delay: 0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {
                sv.byContentInset(inset)
                sv.setContentOffset(targetOffset, animated: false)
            }
        )
        action?()
        if container == nil { endRefreshing(on: sv) }
    }

    func endRefreshing(on sv: UIScrollView,
                       backTo targetInsetOpt: UIEdgeInsets? = nil,
                       finalState: JobsState = .idle) {
        guard case .refreshing = state else { return }
        // mark refresh time for header/left
        if role == .refresh {
            (view as? JobsRefreshTimeTrackable)?.markRefreshed(at: Date())
        }
        view.byHidden(!showsInfo)
        let targetInset = targetInsetOpt ?? resetInset(from: sv.contentInset)
        isEndingAnimation = true
        state = .ending
        UIView.jobsAnimateWithOptions(
            restoreInsetDuration,
            delay: 0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {
                sv.byContentInset(targetInset)
                self.layout(in: sv)
            },
            completion: { _ in
                self.layout(in: sv)
                self.state = finalState
                self.isEndingAnimation = false
            }
        )
    }

    func reset(on sv: UIScrollView) {
        if case .refreshing = state {
            endRefreshing(on: sv)
            return
        }
        isEndingAnimation = false
        state = .idle
        view.byHidden(!showsInfo)
        layout(in: sv)
    }

    func fail(on sv: UIScrollView) {
        if case .refreshing = state {
            endRefreshing(on: sv, finalState: .failed)
            return
        }
        state = .failed
        view.byHidden(!showsInfo)
        layout(in: sv)
    }

    func disable(on sv: UIScrollView) {
        if case .refreshing = state {
            endRefreshing(on: sv, finalState: .disabled)
            return
        }
        state = .disabled
        view.byHidden(!showsInfo)
        layout(in: sv)
    }

    func noticeNoMoreData(on sv: UIScrollView) {
        guard role == .loadMore else { return }
        state = .noMore
        view.byHidden(!showsInfo)
        layout(in: sv)
    }

    private func resetInset(from current: UIEdgeInsets) -> UIEdgeInsets {
        var inset = current
        switch position {
        /// 处理 .header 分支
        case .header: inset.top    -= view.heightOrWidth
        /// 处理 .footer 分支
        case .footer: inset.bottom -= view.heightOrWidth
        /// 处理 .left 分支
        case .left:   inset.left   -= view.heightOrWidth
        /// 处理 .right 分支
        case .right:  inset.right  -= view.heightOrWidth
        };return inset
    }
}
