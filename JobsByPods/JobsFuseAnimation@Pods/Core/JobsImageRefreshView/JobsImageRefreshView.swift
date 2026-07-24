//
//  JobsImageRefreshView.swift
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
import JobsSwiftTimer
import SnapKit

/// 单图静态展示；多图由 JobsTimer 定时轮播形成刷新动画。
public final class JobsImageRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public private(set) var images: [UIImage]
    public private(set) var frameInterval: TimeInterval
    public var indicatorSize: CGSize {
        didSet {
            indicatorSize = CGSize(
                width: max(1, indicatorSize.width),
                height: max(1, indicatorSize.height)
            )
            invalidateIntrinsicContentSize()
        }
    }

    private let imageView = UIImageView()
    private var frameTimer: JobsTimer?
    private var frameIndex = 0
    private var wantsAnimating = false

    public convenience init(image: UIImage) {
        self.init(images: [image])
    }

    public init(images: [UIImage],
                frameInterval: TimeInterval = 0.08) {
        self.images = images
        self.frameInterval = frameInterval.isFinite ? max(0.02, frameInterval) : 0.08
        let firstSize = images.first?.size ?? CGSize(width: 20, height: 20)
        indicatorSize = CGSize(width: max(1, firstSize.width), height: max(1, firstSize.height))
        super.init(frame: CGRect(origin: .zero, size: indicatorSize))
        jobs_setupImageRefreshView()
    }

    required init?(coder: NSCoder) {
        images = []
        frameInterval = 0.08
        indicatorSize = CGSize(width: 20, height: 20)
        super.init(coder: coder)
        jobs_setupImageRefreshView()
    }

    deinit {
        frameTimer?.stop()
    }

    public override var intrinsicContentSize: CGSize {
        indicatorSize
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        if wantsAnimating, window != nil {
            jobs_startTimerIfNeeded()
        } else if window == nil {
            frameTimer?.pause()
        }
    }

    @discardableResult
    public func byStart() -> Self {
        wantsAnimating = true
        byHidden(false)
        jobs_startTimerIfNeeded()
        return self
    }

    @discardableResult
    public func byPause() -> Self {
        wantsAnimating = false
        frameTimer?.pause()
        return self
    }

    @discardableResult
    public func byResume() -> Self {
        wantsAnimating = true
        byHidden(false)
        if let frameTimer {
            frameTimer.resume()
        } else {
            jobs_startTimerIfNeeded()
        };return self
    }

    @discardableResult
    public func byStop() -> Self {
        wantsAnimating = false
        frameTimer?.stop()
        frameTimer = nil
        frameIndex = 0
        jobs_showFrame(at: 0)
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
        /// 下拉过程展示首帧并渐显缩放
        case .pulling:
            byStop()
                .byHidden(false)
                .byAlpha(0.35 + normalizedProgress * 0.65)
                .byTransform(CGAffineTransform(
                    scaleX: 0.78 + normalizedProgress * 0.22,
                    y: 0.78 + normalizedProgress * 0.22
                ))
        /// 达到阈值后展示完整首帧
        case .ready:
            byStop()
                .byHidden(false)
                .byAlpha(1)
                .byTransform(.identity)
        /// 单图保持静态，多图启动定时轮播
        case .refreshing:
            byAlpha(1)
                .byTransform(.identity)
            byStart()
        /// 回弹阶段停止轮播并回到首帧
        case .ending:
            byStop()
                .byHidden(false)
                .byAlpha(1)
                .byTransform(.identity)
        /// 空闲、失效或被替换时隐藏并释放计时器
        case .idle, .inactive:
            byStop()
                .byHidden(true)
                .byAlpha(0)
                .byTransform(.identity)
        }
    }

    private func jobs_setupImageRefreshView() {
        byUserInteractionEnabled(false)
        imageView
            .byContentMode(.scaleAspectFit)
            .byUserInteractionEnabled(false)
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
        jobs_showFrame(at: 0)
    }

    private func jobs_startTimerIfNeeded() {
        guard window != nil,
              images.count > 1,
              !UIAccessibility.isReduceMotionEnabled else {
            jobs_showFrame(at: 0)
            return
        }
        if let frameTimer {
            frameTimer.resume()
            return
        }
        let timerConfig = JobsSwiftTimerConfig(
            interval: frameInterval,
            repeats: true,
            queue: .main,
            pauseInBackground: true,
            autoManageAppState: true
        )
        let timer = JobsTimer(kind: .gcd, config: timerConfig) { [weak self] in
            Task { @MainActor [weak self] in
                self?.jobs_advanceFrame()
            }
        }
        frameTimer = timer
        timer.start()
    }

    private func jobs_advanceFrame() {
        guard !images.isEmpty else { return }
        frameIndex = (frameIndex + 1) % images.count
        jobs_showFrame(at: frameIndex)
    }

    private func jobs_showFrame(at index: Int) {
        guard !images.isEmpty else {
            imageView.byImage(nil)
            return
        }
        let safeIndex = min(max(0, index), images.count - 1)
        imageView.byImage(images[safeIndex])
    }
}
