//
//  JobsDouyinRefreshView.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import QuartzCore
import JobsByUIKit

/// 红、绿双球交叉换位并错峰跳跃的刷新动画视图。
public final class JobsDouyinRefreshView: UIView, JobsRefreshAnimatorProtocol {
    public private(set) var config: JobsDouyinRefreshConfig
    public private(set) var isAnimating = false

    private let redDotLayer = CAShapeLayer()
    private let greenDotLayer = CAShapeLayer()
    private var wantsAnimating = false
    private var pausedTime: CFTimeInterval = 0
    private var lastAnimationBounds = CGRect.null

    public override init(frame: CGRect) {
        config = JobsDouyinRefreshConfig()
        super.init(frame: frame)
        jobs_setupDouyinRefreshView()
    }

    public convenience init(config: JobsDouyinRefreshConfig) {
        self.init(frame: CGRect(origin: .zero, size: config.indicatorSize))
        byConfig(config)
    }

    required init?(coder: NSCoder) {
        config = JobsDouyinRefreshConfig()
        super.init(coder: coder)
        jobs_setupDouyinRefreshView()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    public override var intrinsicContentSize: CGSize {
        config.indicatorSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        jobs_layoutDots()
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
    public func byConfig(_ config: JobsDouyinRefreshConfig) -> Self {
        let shouldRestart = wantsAnimating
        jobs_removeAnimations()
        self.config = JobsDouyinRefreshConfig(
            redColor: config.redColor,
            greenColor: config.greenColor,
            dotDiameter: config.dotDiameter,
            horizontalTravel: config.horizontalTravel,
            jumpHeight: config.jumpHeight,
            cycleDuration: config.cycleDuration
        )
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        if shouldRestart {
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

    /// 停止并恢复为红左、绿右的静态初始状态。
    @discardableResult
    public func byStop() -> Self {
        wantsAnimating = false
        jobs_removeAnimations()
        jobs_layoutDots()
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
        /// 下拉过程中渐显并按进度缩放双球
        case .pulling:
            byHidden(false)
            byStop()
                .byAlpha(0.35 + normalizedProgress * 0.65)
                .byTransform(CGAffineTransform(
                    scaleX: 0.72 + normalizedProgress * 0.28,
                    y: 0.72 + normalizedProgress * 0.28
                ))
        /// 达到阈值时展示完整静态双球
        case .ready:
            byHidden(false)
            byStop()
                .byAlpha(1)
                .byTransform(.identity)
        /// 刷新中循环播放双球交叉动画
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

    private func jobs_setupDouyinRefreshView() {
        isUserInteractionEnabled = false
        isAccessibilityElement = true
        accessibilityLabel = "刷新中"
        layer.addSublayer(redDotLayer)
        layer.addSublayer(greenDotLayer)
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
        jobs_layoutDots()
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
                jobs_layoutDots()
            } else if isAnimating {
                jobs_pauseAnimations()
            };return
        }
        layoutIfNeeded()
        guard bounds.width > 0, bounds.height > 0 else { return }
        if redDotLayer.animation(forKey: "jobs.douyin.refresh") == nil ||
            greenDotLayer.animation(forKey: "jobs.douyin.refresh") == nil {
            jobs_installAnimations()
        } else {
            jobs_resumeAnimations()
        }
    }

    private func jobs_layoutDots() {
        let diameter = config.dotDiameter
        let midY = bounds.midY
        let redCenter = CGPoint(x: bounds.midX - config.horizontalTravel / 2, y: midY)
        let greenCenter = CGPoint(x: bounds.midX + config.horizontalTravel / 2, y: midY)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        redDotLayer.bounds = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        redDotLayer.position = redCenter
        redDotLayer.path = UIBezierPath.make(ovalIn: redDotLayer.bounds).cgPath
        redDotLayer.fillColor = config.redColor.cgColor
        redDotLayer.transform = CATransform3DIdentity
        redDotLayer.opacity = 1
        redDotLayer.zPosition = 1
        greenDotLayer.bounds = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        greenDotLayer.position = greenCenter
        greenDotLayer.path = UIBezierPath.make(ovalIn: greenDotLayer.bounds).cgPath
        greenDotLayer.fillColor = config.greenColor.cgColor
        greenDotLayer.transform = CATransform3DIdentity
        greenDotLayer.opacity = 1
        greenDotLayer.zPosition = 0
        CATransaction.commit()
    }

    private func jobs_installAnimations() {
        jobs_removeAnimations()
        jobs_layoutDots()
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let halfTravel = config.horizontalTravel / 2
        let redPositions = [
            CGPoint(x: center.x - halfTravel, y: center.y),
            CGPoint(x: center.x, y: center.y - config.jumpHeight),
            CGPoint(x: center.x + halfTravel, y: center.y),
            CGPoint(x: center.x, y: center.y + config.jumpHeight * 0.55),
            CGPoint(x: center.x - halfTravel, y: center.y)
        ]
        let greenPositions = [
            CGPoint(x: center.x + halfTravel, y: center.y),
            CGPoint(x: center.x, y: center.y + config.jumpHeight * 0.55),
            CGPoint(x: center.x - halfTravel, y: center.y),
            CGPoint(x: center.x, y: center.y - config.jumpHeight),
            CGPoint(x: center.x + halfTravel, y: center.y)
        ]
        let redAnimation = jobs_animationGroup(
            positions: redPositions,
            scales: [0.84, 1.12, 0.84, 0.72, 0.84],
            opacities: [0.88, 1, 0.88, 0.74, 0.88],
            zPositions: [1, 2, 1, 0, 1]
        )
        let greenAnimation = jobs_animationGroup(
            positions: greenPositions,
            scales: [0.84, 0.72, 0.84, 1.12, 0.84],
            opacities: [0.88, 0.74, 0.88, 1, 0.88],
            zPositions: [0, 0, 1, 2, 0]
        )
        redDotLayer.add(redAnimation, forKey: "jobs.douyin.refresh")
        greenDotLayer.add(greenAnimation, forKey: "jobs.douyin.refresh")
        lastAnimationBounds = bounds
        pausedTime = 0
        isAnimating = true
    }

    private func jobs_animationGroup(
        positions: [CGPoint],
        scales: [CGFloat],
        opacities: [Float],
        zPositions: [CGFloat]
    ) -> CAAnimationGroup {
        let keyTimes: [NSNumber] = [0, 0.25, 0.5, 0.75, 1]
        let timing = CAMediaTimingFunction(controlPoints: 0.45, 0, 0.2, 1)
        let position = CAKeyframeAnimation(keyPath: "position")
        position.values = positions.map { NSValue(cgPoint: $0) }
        position.keyTimes = keyTimes
        position.timingFunctions = [timing, timing, timing, timing]
        let scale = CAKeyframeAnimation(keyPath: "transform.scale")
        scale.values = scales
        scale.keyTimes = keyTimes
        scale.timingFunctions = [timing, timing, timing, timing]
        let opacity = CAKeyframeAnimation(keyPath: "opacity")
        opacity.values = opacities
        opacity.keyTimes = keyTimes
        opacity.timingFunctions = [timing, timing, timing, timing]
        let zPosition = CAKeyframeAnimation(keyPath: "zPosition")
        zPosition.values = zPositions
        zPosition.keyTimes = keyTimes
        zPosition.calculationMode = .discrete
        let group = CAAnimationGroup()
        group.animations = [position, scale, opacity, zPosition]
        group.duration = config.cycleDuration
        group.repeatCount = .infinity
        group.isRemovedOnCompletion = false
        return group
    }

    private func jobs_pauseAnimations() {
        guard isAnimating,
              redDotLayer.speed != 0 else { return }
        pausedTime = redDotLayer.convertTime(CACurrentMediaTime(), from: nil)
        for dotLayer in [redDotLayer, greenDotLayer] {
            dotLayer.speed = 0
            dotLayer.timeOffset = pausedTime
        }
    }

    private func jobs_resumeAnimations() {
        guard isAnimating,
              redDotLayer.speed == 0 else { return }
        let pausedTime = redDotLayer.timeOffset
        for dotLayer in [redDotLayer, greenDotLayer] {
            dotLayer.speed = 1
            dotLayer.timeOffset = 0
            dotLayer.beginTime = 0
            dotLayer.beginTime = dotLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        }
        self.pausedTime = 0
    }

    private func jobs_removeAnimations() {
        for dotLayer in [redDotLayer, greenDotLayer] {
            dotLayer.removeAllAnimations()
            dotLayer.speed = 1
            dotLayer.timeOffset = 0
            dotLayer.beginTime = 0
        }
        pausedTime = 0
        lastAnimationBounds = .null
        isAnimating = false
    }
}
