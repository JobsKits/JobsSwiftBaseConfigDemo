//
//  JobsLottieRefreshView.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import Lottie
import SnapKit

/// Lottie 刷新插件；拖拽进度同步到动画进度，刷新态自动循环。
public final class JobsLottieRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public private(set) var animationName: String
    public var indicatorSize: CGSize {
        didSet {
            indicatorSize = CGSize(
                width: max(1, indicatorSize.width),
                height: max(1, indicatorSize.height)
            )
            invalidateIntrinsicContentSize()
        }
    }

    private let lottieView: LottieAnimationView
    private var wantsAnimating = false

    public init(animationNamed animationName: String,
                bundle: Bundle = .main,
                indicatorSize: CGSize = CGSize(width: 24, height: 24)) {
        self.animationName = animationName
        self.indicatorSize = indicatorSize
        let normalizedName = (animationName as NSString).deletingPathExtension
        lottieView = LottieAnimationView(
            animation: LottieAnimation.named(normalizedName, bundle: bundle)
        )
        super.init(frame: CGRect(origin: .zero, size: indicatorSize))
        jobs_setupLottieRefreshView()
    }

    public init(animationPath: String,
                indicatorSize: CGSize = CGSize(width: 24, height: 24)) {
        animationName = animationPath
        self.indicatorSize = indicatorSize
        lottieView = LottieAnimationView(
            animation: animationPath.isEmpty ? nil : LottieAnimation.filepath(animationPath)
        )
        super.init(frame: CGRect(origin: .zero, size: indicatorSize))
        jobs_setupLottieRefreshView()
    }

    required init?(coder: NSCoder) {
        animationName = ""
        indicatorSize = CGSize(width: 24, height: 24)
        lottieView = LottieAnimationView(animation: nil)
        super.init(coder: coder)
        jobs_setupLottieRefreshView()
    }

    public override var intrinsicContentSize: CGSize {
        indicatorSize
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if wantsAnimating, window != nil {
            byResume()
        } else if window == nil {
            lottieView.pause()
        }
    }

    @discardableResult
    public func byStart() -> Self {
        wantsAnimating = true
        byHidden(false)
        if UIAccessibility.isReduceMotionEnabled {
            lottieView.stop()
            lottieView.currentProgress = 1
        } else {
            lottieView.loopMode = .loop
            lottieView.play()
        };return self
    }

    @discardableResult
    public func byPause() -> Self {
        wantsAnimating = false
        lottieView.pause()
        return self
    }

    @discardableResult
    public func byResume() -> Self {
        byStart()
    }

    @discardableResult
    public func byStop() -> Self {
        wantsAnimating = false
        lottieView.stop()
        lottieView.currentProgress = 0
        return self
    }

    public var refreshAnimatorView: UIView {
        self
    }

    public var refreshAnimatorPreferredSize: CGSize {
        indicatorSize
    }

    public func refreshAnimatorApply(phase: JobsRefreshAnimatorPhase,
                                     progress: CGFloat) {
        let normalizedProgress = min(1, max(0, progress))
        switch phase {
        /// 下拉进度直接驱动 Lottie 进度
        case .pulling:
            wantsAnimating = false
            lottieView.pause()
            lottieView.currentProgress = normalizedProgress
            byHidden(false)
                .byAlpha(0.35 + normalizedProgress * 0.65)
        /// 达到阈值后停在末帧
        case .ready:
            wantsAnimating = false
            lottieView.pause()
            lottieView.currentProgress = 1
            byHidden(false)
                .byAlpha(1)
        /// 刷新中循环播放
        case .refreshing:
            byAlpha(1)
            byStart()
        /// 回弹阶段暂停当前帧
        case .ending:
            byPause()
                .byHidden(false)
                .byAlpha(1)
        /// 空闲、失效或被替换时停止并隐藏
        case .idle, .inactive:
            byStop()
                .byHidden(true)
                .byAlpha(0)
        }
    }

    private func jobs_setupLottieRefreshView() {
        byUserInteractionEnabled(false)
        lottieView
            .byContentMode(.scaleAspectFit)
            .byUserInteractionEnabled(false)
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
        lottieView.loopMode = .loop
        lottieView.backgroundBehavior = .pauseAndRestore
    }
}
