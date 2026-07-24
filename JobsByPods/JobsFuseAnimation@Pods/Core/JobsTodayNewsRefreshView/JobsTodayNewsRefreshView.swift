//
//  JobsTodayNewsRefreshView.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import QuartzCore
import JobsByUIKit
import JobsSwiftDSL

/// 按真实录屏还原的今日头条红色闭合轮廓刷新动画。
public final class JobsTodayNewsRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public private(set) var config: JobsTodayNewsRefreshConfig
    public private(set) var isAnimating = false

    private let contentLayer = CALayer()
    private let markLayer = CAShapeLayer()
    private var wantsAnimating = false
    private var pausedTime: CFTimeInterval = 0
    private var lastAnimationBounds = CGRect.null

    public override init(frame: CGRect) {
        config = JobsTodayNewsRefreshConfig()
        super.init(frame: frame)
        jobs_setupTodayNewsRefreshView()
    }

    public convenience init(config: JobsTodayNewsRefreshConfig) {
        self.init(frame: CGRect(origin: .zero, size: config.indicatorSize))
        byConfig(config)
    }

    required init?(coder: NSCoder) {
        config = JobsTodayNewsRefreshConfig()
        super.init(coder: coder)
        jobs_setupTodayNewsRefreshView()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    public override var intrinsicContentSize: CGSize {
        config.indicatorSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        jobs_layoutMark()
        guard wantsAnimating,
              window != nil,
              !UIAccessibility.isReduceMotionEnabled,
              lastAnimationBounds != bounds else { return }
        jobs_installAnimations()
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        jobs_syncAnimationState()
    }

    /// 更新颜色、尺寸和节奏；若当前正在播放，则使用新配置重新开始一轮。
    @discardableResult
    public func byConfig(_ config: JobsTodayNewsRefreshConfig) -> Self {
        let shouldRestart = wantsAnimating
        jobs_removeAnimations()
        self.config = JobsTodayNewsRefreshConfig(
            strokeColor: config.strokeColor,
            lineWidth: config.lineWidth,
            triangleWidth: config.triangleWidth,
            triangleHeight: config.triangleHeight,
            centerGap: config.centerGap,
            cycleDuration: config.cycleDuration
        )
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        if shouldRestart {
            wantsAnimating = true
            layoutIfNeeded()
            jobs_syncAnimationState()
        };return self
    }

    /// 开始循环；重复调用不会叠加动画。
    @discardableResult
    public func byStart() -> Self {
        wantsAnimating = true
        jobs_syncAnimationState()
        return self
    }

    /// 暂停并保留当前画面。
    @discardableResult
    public func byPause() -> Self {
        wantsAnimating = false
        jobs_pauseAnimations()
        return self
    }

    /// 从暂停位置继续；没有可恢复动画时会重新开始。
    @discardableResult
    public func byResume() -> Self {
        wantsAnimating = true
        jobs_syncAnimationState()
        return self
    }

    /// 停止并恢复为完整蝴蝶结轮廓。
    @discardableResult
    public func byStop() -> Self {
        wantsAnimating = false
        jobs_removeAnimations()
        jobs_layoutMark()
        jobs_applyPullProgress(1)
        return self
    }

    public var refreshAnimatorView: UIView {
        self
    }

    public var refreshAnimatorPreferredSize: CGSize {
        config.indicatorSize
    }

    public func refreshAnimatorApply(phase: JobsRefreshAnimatorPhase,
                                     progress: CGFloat) {
        let normalizedProgress = min(1, max(0, progress))
        switch phase {
        /// 下拉过程中按进度描边并缩放
        case .pulling:
            byHidden(false)
            wantsAnimating = false
            jobs_removeAnimations()
            jobs_applyPullProgress(normalizedProgress)
        /// 达到阈值时展示完整静态轮廓
        case .ready:
            byHidden(false)
            wantsAnimating = false
            jobs_removeAnimations()
            jobs_applyPullProgress(1)
        /// 刷新中循环播放路径形变
        case .refreshing:
            byHidden(false)
                .byAlpha(1)
                .byTransform(.identity)
            byStart()
        /// 回弹阶段停止循环并保留完成态
        case .ending:
            byHidden(false)
            byStop()
        /// 空闲、失效或被替换时隐藏并清理动画
        case .idle, .inactive:
            byStop()
                .byAlpha(0)
                .byHidden(true)
        }
    }

    private func jobs_setupTodayNewsRefreshView() {
        byUserInteractionEnabled(false)
        isAccessibilityElement = true
        accessibilityLabel = "刷新中"
        layer.addSublayer(contentLayer)
        contentLayer.addSublayer(markLayer)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(jobs_environmentDidChange),
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(jobs_environmentDidChange),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(jobs_applicationDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        jobs_layoutMark()
        jobs_applyPullProgress(0)
    }

    @objc private func jobs_environmentDidChange() {
        jobs_syncAnimationState()
    }

    @objc private func jobs_applicationDidEnterBackground() {
        guard wantsAnimating else { return }
        jobs_pauseAnimations()
    }

    private func jobs_syncAnimationState() {
        guard wantsAnimating,
              window != nil,
              UIApplication.shared.applicationState == .active,
              !UIAccessibility.isReduceMotionEnabled else {
            if UIAccessibility.isReduceMotionEnabled {
                jobs_removeAnimations()
                jobs_applyPullProgress(1)
            } else if isAnimating {
                jobs_pauseAnimations()
            };return
        }
        layoutIfNeeded()
        guard bounds.width > 0, bounds.height > 0 else { return }
        if markLayer.animation(forKey: "jobs.todaynews.path") == nil {
            jobs_installAnimations()
        } else {
            jobs_resumeAnimations()
        }
    }

    private func jobs_layoutMark() {
        let indicatorSize = config.indicatorSize
        let origin = CGPoint(
            x: (bounds.width - indicatorSize.width) / 2,
            y: (bounds.height - indicatorSize.height) / 2
        )
        let inset = config.lineWidth
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        contentLayer.frame = CGRect(origin: origin, size: indicatorSize)
        markLayer.frame = CGRect(
            x: inset,
            y: inset,
            width: indicatorSize.width - inset * 2,
            height: indicatorSize.height - inset * 2
        )
        markLayer.fillColor = UIColor.clear.cgColor
        markLayer.strokeColor = config.strokeColor.cgColor
        markLayer.lineWidth = config.lineWidth
        markLayer.lineCap = .round
        markLayer.lineJoin = .round
        markLayer.path = jobs_bowtiePath().cgPath
        markLayer.opacity = 1
        CATransaction.commit()
    }

    private func jobs_applyPullProgress(_ progress: CGFloat) {
        let normalizedProgress = min(1, max(0, progress))
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        markLayer.path = jobs_bowtiePath().cgPath
        markLayer.strokeStart = 0
        markLayer.strokeEnd = normalizedProgress
        contentLayer.transform = CATransform3DIdentity
        CATransaction.commit()
        byAlpha(0.25 + normalizedProgress * 0.75)
            .byTransform(CGAffineTransform(
                scaleX: 0.72 + normalizedProgress * 0.28,
                y: 0.72 + normalizedProgress * 0.28
            ))
    }

    private func jobs_installAnimations() {
        jobs_removeAnimations()
        jobs_layoutMark()
        jobs_applyPullProgress(1)
        let paths = [
            jobs_bowtiePath(),
            jobs_leftPointPath(),
            jobs_rectanglePath(),
            jobs_rectanglePath(),
            jobs_rightPointPath(),
            jobs_bowtiePath(),
            jobs_bowtiePath()
        ]
        let linear = CAMediaTimingFunction(name: .linear)
        let pathAnimation = CAKeyframeAnimation(keyPath: "path")
        pathAnimation.values = paths.map { $0.cgPath }
        pathAnimation.keyTimes = [0, 0.15, 0.38, 0.46, 0.69, 0.85, 1]
        pathAnimation.timingFunctions = [linear, linear, linear, linear, linear, linear]
        pathAnimation.duration = config.cycleDuration
        pathAnimation.repeatCount = .infinity
        pathAnimation.calculationMode = .linear
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.fillMode = .both
        markLayer.add(pathAnimation, forKey: "jobs.todaynews.path")
        lastAnimationBounds = bounds
        pausedTime = 0
        isAnimating = true
    }

    private func jobs_bowtiePath() -> UIBezierPath {
        let width = markLayer.bounds.width
        let height = markLayer.bounds.height
        let center = CGPoint(x: width / 2, y: height / 2)
        return jobs_path(with: [
            .zero,
            center,
            CGPoint(x: width, y: 0),
            CGPoint(x: width, y: height),
            center,
            CGPoint(x: 0, y: height)
        ])
    }

    private func jobs_leftPointPath() -> UIBezierPath {
        let width = markLayer.bounds.width
        let height = markLayer.bounds.height
        let leftPoint = CGPoint(x: 0, y: height / 2)
        return jobs_path(with: [
            leftPoint,
            leftPoint,
            CGPoint(x: width, y: 0),
            CGPoint(x: width, y: height),
            leftPoint,
            leftPoint
        ])
    }

    private func jobs_rectanglePath() -> UIBezierPath {
        let width = markLayer.bounds.width
        let height = markLayer.bounds.height
        let leftTop = CGPoint.zero
        let leftBottom = CGPoint(x: 0, y: height)
        return jobs_path(with: [
            leftTop,
            leftTop,
            CGPoint(x: width, y: 0),
            CGPoint(x: width, y: height),
            leftBottom,
            leftBottom
        ])
    }

    private func jobs_rightPointPath() -> UIBezierPath {
        let width = markLayer.bounds.width
        let height = markLayer.bounds.height
        let leftTop = CGPoint.zero
        let leftBottom = CGPoint(x: 0, y: height)
        let rightPoint = CGPoint(x: width, y: height / 2)
        return jobs_path(with: [
            leftTop,
            leftTop,
            rightPoint,
            rightPoint,
            leftBottom,
            leftBottom
        ])
    }

    private func jobs_path(with points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath.make()
        guard let firstPoint = points.first else { return path }
        path.byMove(to: firstPoint)
        points.dropFirst().forEach { point in
            path.byAddLine(to: point)
        };return path.byClose()
    }

    private func jobs_pauseAnimations() {
        guard isAnimating,
              markLayer.speed != 0 else { return }
        pausedTime = markLayer.convertTime(CACurrentMediaTime(), from: nil)
        markLayer.speed = 0
        markLayer.timeOffset = pausedTime
    }

    private func jobs_resumeAnimations() {
        guard isAnimating,
              markLayer.speed == 0 else { return }
        let pausedTime = markLayer.timeOffset
        markLayer.speed = 1
        markLayer.timeOffset = 0
        markLayer.beginTime = 0
        markLayer.beginTime = markLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.pausedTime = 0
    }

    private func jobs_removeAnimations() {
        contentLayer.removeAllAnimations()
        markLayer.removeAllAnimations()
        markLayer.speed = 1
        markLayer.timeOffset = 0
        markLayer.beginTime = 0
        pausedTime = 0
        lastAnimationBounds = .null
        isAnimating = false
    }
}
