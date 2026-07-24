//
//  JobsRefreshAnimatorContainerView.swift
//  JobsSwiftRefresher
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsFuseAnimation
import JobsSwiftBaseDefines
import SnapKit

/// 把 JobsFuseAnimation 插件适配到 JobsSwiftRefresher 槽位，不承载刷新状态机。
@MainActor
public final class JobsRefreshAnimatorContainerView: UIView, JobsAnimatable {
    public private(set) var animator: JobsRefreshAnimatorProtocol
    public var heightOrWidth: CGFloat

    private var currentState = JobsState.idle

    public init(animator: JobsRefreshAnimatorProtocol,
                heightOrWidth: CGFloat = 60) {
        self.animator = animator
        self.heightOrWidth = heightOrWidth.isFinite ? max(1, heightOrWidth) : 60
        super.init(frame: .zero)
        byBackgroundColor(JobsCor.clear)
            .byUserInteractionEnabled(false)
        jobs_mountAnimatorView()
        apply(state: .idle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 原位替换动画插件，并立即同步当前刷新阶段。
    @discardableResult
    public func byAnimator(_ animator: JobsRefreshAnimatorProtocol) -> Self {
        self.animator.refreshAnimatorApply(phase: .inactive, progress: 0)
        self.animator.refreshAnimatorView.removeFromSuperview()
        self.animator = animator
        jobs_mountAnimatorView()
        apply(state: currentState)
        return self
    }

    public func apply(state: JobsState) {
        currentState = state
        switch state {
        /// 空闲态隐藏动画插件
        case .idle:
            animator.refreshAnimatorApply(phase: .idle, progress: 0)
        /// 将下拉进度透传给动画插件
        case .pulling(let progress):
            animator.refreshAnimatorApply(phase: .pulling, progress: progress)
        /// 达到刷新阈值
        case .ready:
            animator.refreshAnimatorApply(phase: .ready, progress: 1)
        /// 刷新中启动插件循环
        case .refreshing:
            animator.refreshAnimatorApply(phase: .refreshing, progress: 1)
        /// 回弹阶段通知插件收尾
        case .ending:
            animator.refreshAnimatorApply(phase: .ending, progress: 1)
        /// 非活跃状态统一停止并隐藏插件
        case .failed, .disabled, .noMore, .removed:
            animator.refreshAnimatorApply(phase: .inactive, progress: 0)
        }
    }

    private func jobs_mountAnimatorView() {
        let animatorView = animator.refreshAnimatorView
        let preferredSize = animator.refreshAnimatorPreferredSize
        animatorView.removeFromSuperview()
        animatorView.byAddTo(self) { make in
            make.center.equalToSuperview()
            make.size.equalTo(preferredSize)
        }
    }
}
