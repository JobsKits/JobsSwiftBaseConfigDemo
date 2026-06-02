//
//  JobsRefreshProxy.swift
//  JobsRefresher
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
import JobsSwiftDSL
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
    // Info visibility
    var showsHeaderInfo: Bool = true
    var showsFooterInfo: Bool = true
    // Per-slot lottie preference (instance-level default)
    var headerLottiePref: JobsLottiePreference = .inherit
    var footerLottiePref: JobsLottiePreference = .inherit
    var leftLottiePref: JobsLottiePreference = .inherit
    var rightLottiePref: JobsLottiePreference = .inherit
    // MARK: - Human interaction feedback
    /// Whether to perform haptic feedback when refresh/load is triggered by reaching threshold.
    var enablesHaptics: Bool = false
    /// Optional sound file name. Supports full name (e.g. "Sound.wav") or base name (e.g. "Sound").
    var soundFileName: String? = nil

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
}

@MainActor
final class JobsSlot {
    let position: JobsPosition
    let view: (UIView & JobsAnimatable)
    let trigger: CGFloat
    var action: (jobsByVoidBlock)?
    weak var container: AnyObject?

    var showsInfo: Bool = true {
        didSet {
            guard state != .removed else { return }
            view.isHidden = !showsInfo
        }
    }

    var restoreInsetDuration: TimeInterval = 0.25
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
        if state != .removed { view.isHidden = !showsInfo }
        layout(in: sv)
        if state == .removed { state = .idle }
    }

    func detach() {
        view.removeFromSuperview()
        view.isHidden = true
        state = .removed
    }

    func layout(in sv: UIScrollView) {
        let h = view.heightOrWidth
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
            view.frame = CGRect(x: 0, y: -h - baseInset.top, width: sv.bounds.width, height: h)
        case .footer:
            let contentH = max(
                sv.contentSize.height,
                sv.bounds.height - (sv.adjustedContentInset.top + sv.adjustedContentInset.bottom)
            )
            view.frame = CGRect(x: 0, y: contentH + baseInset.bottom, width: sv.bounds.width, height: h)
        case .left:
            view.frame = CGRect(x: -h - baseInset.left, y: 0, width: h, height: sv.bounds.height)
        case .right:
            let contentW = max(
                sv.contentSize.width,
                sv.bounds.width - (sv.adjustedContentInset.left + sv.adjustedContentInset.right)
            )
            view.frame = CGRect(x: contentW + baseInset.right, y: 0, width: h, height: sv.bounds.height)
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
            progress(distance: distance, isDragging: isDragging, sv: sv)
        case .footer:
            let contentH = max(sv.contentSize.height, sv.bounds.height - (inset.top + inset.bottom))
            let distance = offset.y + sv.bounds.height - contentH - inset.bottom
            progress(distance: distance, isDragging: isDragging, sv: sv, isFooter: true)
        case .left:
            let distance = -(offset.x + inset.left)
            progress(distance: distance, isDragging: isDragging, sv: sv)
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
        guard state != .refreshing && state != .noMore else { return }
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
        guard state != .refreshing else { return }
        // Human interaction feedback: haptic + sound (configured via DSL on UIScrollView)
        sv.byRefreshFeedback(for: position)

        state = .refreshing
        view.isHidden = !showsInfo

        let h = view.heightOrWidth
        let oldAdjusted = sv.adjustedContentInset
        var inset = sv.contentInset
        switch position {
        case .header: inset.top    += h
        case .footer: inset.bottom += h
        case .left:   inset.left   += h
        case .right:  inset.right  += h
        }

        var targetOffset = sv.contentOffset
        switch position {
        case .header:
            targetOffset.y = -(oldAdjusted.top + h)
        case .footer:
            let contentH = max(sv.contentSize.height, sv.bounds.height - (oldAdjusted.top + oldAdjusted.bottom))
            targetOffset.y = contentH + (oldAdjusted.bottom + h) - sv.bounds.height
        case .left:
            targetOffset.x = -(oldAdjusted.left + h)
        case .right:
            let contentW = max(sv.contentSize.width, sv.bounds.width - (oldAdjusted.left + oldAdjusted.right))
            targetOffset.x = contentW + (oldAdjusted.right + h) - sv.bounds.width
        }

        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.allowUserInteraction, .beginFromCurrentState]) {
            sv.contentInset = inset
            sv.setContentOffset(targetOffset, animated: false)
        }

        action?()
        if container == nil { endRefreshing(on: sv) }
    }

    func endRefreshing(on sv: UIScrollView, backTo targetInsetOpt: UIEdgeInsets? = nil) {
        guard case .refreshing = state else { return }
        // mark refresh time for header/left
        if position == .header || position == .left {
            (view as? JobsRefreshTimeTrackable)?.markRefreshed(at: Date())
        }

        view.isHidden = !showsInfo

        let targetInset = targetInsetOpt ?? resetInset(from: sv.contentInset)
        isEndingAnimation = true
        state = .idle

        UIView.animate(withDuration: restoreInsetDuration,
                       delay: 0,
                       options: [.allowUserInteraction, .beginFromCurrentState]) {
            sv.contentInset = targetInset
            self.layout(in: sv)
        } completion: { _ in
            self.layout(in: sv)
            self.isEndingAnimation = false
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
        };return inset
    }
}
