//
//  JobsFuseAnimation.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import QuartzCore
import AudioToolbox
import ObjectiveC
import JobsSwiftTimer

// MARK: - 长按导火索外圈配置
public struct JobsFuseOuterRingConfig {
    /// 外圈线宽。注意：这一版默认画在按钮 bounds 内侧，masksToBounds = true 也一定可见。
    public var lineWidth: CGFloat
    /// 进度线颜色。不要和按钮背景色一样，否则肉眼几乎看不出来。
    public var strokeColor: UIColor
    /// 底圈颜色，用来让 0...1 的增长更明显。nil 表示不画底圈。
    public var trackColor: UIColor?
    /// 外圈填充色，默认透明。
    public var fillColor: UIColor
    /// 外圈初始透明度。
    public var fromOpacity: Float
    /// 外圈增长到 1 后的透明度。
    public var toOpacity: Float
    /// 从 0 增长到 1 的时长。
    public var growDuration: TimeInterval
    /// 定时器刷新间隔。1 / 60 基本等同 60fps。
    public var timerInterval: TimeInterval
    /// 是否循环增长。长按按钮建议 false：长按时从 0 增到 1，松手淡出。
    public var repeatsWhileHolding: Bool
    /// 松手后退潮回 0 的时间。
    /// 注意：这不是简单淡出，而是用 JobsSwiftTimer 驱动 strokeEnd 从当前值倒退到 0。
    public var retreatDuration: TimeInterval
    /// 退潮完成后的淡出/移除时间。一般给很短即可，真正的主视觉由 retreatDuration 控制。
    public var fadeOutDuration: TimeInterval
    /// 线圈距离按钮边界的内缩值。默认 1，避免 stroke 被 bounds 裁掉。
    public var inset: CGFloat
    /// 是否从 -90° 开始，也就是 12 点钟方向开始增长。
    public var startsFromTop: Bool

    public init(
        lineWidth: CGFloat = 4,
        strokeColor: UIColor = .white,
        trackColor: UIColor? = UIColor.white.withAlphaComponent(0.22),
        fillColor: UIColor = .clear,
        fromOpacity: Float = 1.0,
        toOpacity: Float = 1.0,
        growDuration: TimeInterval = 1.2,
        timerInterval: TimeInterval = 1.0 / 60.0,
        repeatsWhileHolding: Bool = false,
        retreatDuration: TimeInterval = 0.28,
        fadeOutDuration: TimeInterval = 0.08,
        inset: CGFloat = 1,
        startsFromTop: Bool = true
    ) {
        self.lineWidth = max(0.5, lineWidth)
        self.strokeColor = strokeColor
        self.trackColor = trackColor
        self.fillColor = fillColor
        self.fromOpacity = fromOpacity
        self.toOpacity = toOpacity
        self.growDuration = max(0.001, growDuration)
        self.timerInterval = max(0.001, timerInterval)
        self.repeatsWhileHolding = repeatsWhileHolding
        self.retreatDuration = max(0, retreatDuration)
        self.fadeOutDuration = max(0, fadeOutDuration)
        self.inset = max(0, inset)
        self.startsFromTop = startsFromTop
    }
}

// MARK: - Associated Keys
private var _jobsFuseRingLayerKey: UInt8 = 0
private var _jobsFuseTrackLayerKey: UInt8 = 0
private var _jobsFuseRingTimerKey: UInt8 = 0
private var _jobsFuseRingStartTSKey: UInt8 = 0
private var _jobsFuseRingConfigKey: UInt8 = 0
private var _jobsFuseScaleOriginalTransformKey: UInt8 = 0
private var _jobsFuseScaleActiveKey: UInt8 = 0

private final class _JobsFuseRingConfigBox: NSObject {
    let config: JobsFuseOuterRingConfig
    init(_ config: JobsFuseOuterRingConfig) { self.config = config }
}

private final class _JobsFuseTransformBox: NSObject {
    let transform: CGAffineTransform
    init(_ transform: CGAffineTransform) { self.transform = transform }
}

private final class _JobsFuseTimeBox: NSObject {
    let value: CFTimeInterval
    init(_ value: CFTimeInterval) { self.value = value }
}

// MARK: - 外圈 Layer 自增动画
extension UIView {
    private var jobs_fuseRingLayer: CAShapeLayer? {
        get { objc_getAssociatedObject(self, &_jobsFuseRingLayerKey) as? CAShapeLayer }
        set { objc_setAssociatedObject(self, &_jobsFuseRingLayerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var jobs_fuseTrackLayer: CAShapeLayer? {
        get { objc_getAssociatedObject(self, &_jobsFuseTrackLayerKey) as? CAShapeLayer }
        set { objc_setAssociatedObject(self, &_jobsFuseTrackLayerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var jobs_fuseRingTimer: JobsSwiftTimerProtocol? {
        get { objc_getAssociatedObject(self, &_jobsFuseRingTimerKey) as? JobsSwiftTimerProtocol }
        set { objc_setAssociatedObject(self, &_jobsFuseRingTimerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var jobs_fuseRingStartTS: CFTimeInterval {
        get { (objc_getAssociatedObject(self, &_jobsFuseRingStartTSKey) as? _JobsFuseTimeBox)?.value ?? 0 }
        set { objc_setAssociatedObject(self, &_jobsFuseRingStartTSKey, _JobsFuseTimeBox(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    private var jobs_fuseRingConfig: JobsFuseOuterRingConfig {
        get { (objc_getAssociatedObject(self, &_jobsFuseRingConfigKey) as? _JobsFuseRingConfigBox)?.config ?? .init() }
        set { objc_setAssociatedObject(self, &_jobsFuseRingConfigKey, _JobsFuseRingConfigBox(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// 开始：按钮外圈 Layer 自增。
    ///
    /// v3 关键点：Layer 画在按钮自身 bounds 内侧，而不是 sibling view，也不是超出按钮 bounds。
    /// 这样即使按钮使用 byMasksToBounds(true)，导火索线圈也一定不会被裁掉。
    @discardableResult
    public func byFuseOuterRingStart(_ config: JobsFuseOuterRingConfig = .init()) -> Self {
        let work = { [weak self] in
            guard let self else { return }
            self.layoutIfNeeded()
            self.byFuseOuterRingStop(animated: false)
            guard self.bounds.width > 0, self.bounds.height > 0 else { return }

            self.jobs_fuseRingConfig = config
            self.jobs_fuseRingStartTS = CACurrentMediaTime()

            let trackLayer: CAShapeLayer?
            if let trackColor = config.trackColor {
                let t = CAShapeLayer()
                t.name = "jobs.fuse.outerRing.track"
                t.contentsScale = UIScreen.main.scale
                t.fillColor = config.fillColor.cgColor
                t.strokeColor = trackColor.cgColor
                t.lineWidth = config.lineWidth
                t.lineCap = .round
                t.lineJoin = .round
                t.strokeStart = 0
                t.strokeEnd = 1
                t.opacity = 1
                self.layer.addSublayer(t)
                trackLayer = t
            } else {
                trackLayer = nil
            }

            let ring = CAShapeLayer()
            ring.name = "jobs.fuse.outerRing.progress"
            ring.contentsScale = UIScreen.main.scale
            ring.fillColor = config.fillColor.cgColor
            ring.strokeColor = config.strokeColor.cgColor
            ring.lineWidth = config.lineWidth
            ring.lineCap = .round
            ring.lineJoin = .round
            ring.strokeStart = 0
            ring.strokeEnd = 0.001      // 不是 0，长按 began 的瞬间也能看到起点
            ring.opacity = config.fromOpacity
            self.layer.addSublayer(ring)

            self.jobs_fuseTrackLayer = trackLayer
            self.jobs_fuseRingLayer = ring
            self.jobs_layoutFuseOuterRingLayers()
            self.jobs_updateFuseOuterRing(progress: 0.001)

            let timer = JobsTimer(
                kind: .gcd,
                config: JobsSwiftTimerConfig(
                    interval: config.timerInterval,
                    repeats: true,
                    tolerance: 0,
                    queue: .main,
                    pauseInBackground: true
                )
            ) { [weak self] in
                self?.jobs_updateFuseOuterRingByTimer()
            }
            self.jobs_fuseRingTimer = timer
            timer.start()
        }

        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
        return self
    }

    /// 停止：松手后外圈先按 strokeEnd 倒退回 0，再淡出并移除。
    @discardableResult
    public func byFuseOuterRingStop(animated: Bool = true) -> Self {
        let work = { [weak self] in
            guard let self else { return }

            // 先停掉“增长”定时器。后面如果需要退潮，会重新创建一个 JobsSwiftTimer。
            self.jobs_fuseRingTimer?.stop()
            self.jobs_fuseRingTimer = nil

            guard let ring = self.jobs_fuseRingLayer else { return }
            let track = self.jobs_fuseTrackLayer
            let config = self.jobs_fuseRingConfig

            let removeBlock = { [weak self, weak ring, weak track] in
                ring?.removeAllAnimations()
                track?.removeAllAnimations()
                ring?.removeFromSuperlayer()
                track?.removeFromSuperlayer()
                self?.jobs_fuseRingLayer = nil
                self?.jobs_fuseTrackLayer = nil
            }

            let currentStrokeEnd = CGFloat(
                max(0, min(1, ring.presentation()?.strokeEnd ?? ring.strokeEnd))
            )

            guard animated, config.retreatDuration > 0, currentStrokeEnd > 0.001 else {
                removeBlock()
                return
            }

            // 固定当前展示进度，避免从 presentation layer 切回 model layer 时跳帧。
            let currentRingOpacity = ring.presentation()?.opacity ?? ring.opacity
            let currentTrackOpacity = track?.presentation()?.opacity ?? track?.opacity ?? 1
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            ring.strokeStart = 0
            ring.strokeEnd = currentStrokeEnd
            ring.opacity = currentRingOpacity
            track?.opacity = currentTrackOpacity
            CATransaction.commit()

            let retreatStartTS = CACurrentMediaTime()
            let retreatTimer = JobsTimer(
                kind: .gcd,
                config: JobsSwiftTimerConfig(
                    interval: config.timerInterval,
                    repeats: true,
                    tolerance: 0,
                    queue: .main,
                    pauseInBackground: true
                )
            ) { [weak self, weak ring, weak track] in
                guard let self, let ring else { return }

                let elapsed = max(0, CACurrentMediaTime() - retreatStartTS)
                let raw = min(1.0, elapsed / max(0.001, config.retreatDuration))
                let p = CGFloat(raw)

                // easeOut：一松手先明显回退，后面慢慢收尾，像退潮。
                let eased = 1.0 - pow(1.0 - p, 2.0)
                let strokeEnd = max(0.0001, currentStrokeEnd * (1.0 - CGFloat(eased)))

                CATransaction.begin()
                CATransaction.setDisableActions(true)
                ring.strokeStart = 0
                ring.strokeEnd = strokeEnd
                ring.opacity = currentRingOpacity
                track?.opacity = currentTrackOpacity * Float(1.0 - p)
                CATransaction.commit()

                guard raw >= 1.0 else { return }

                self.jobs_fuseRingTimer?.stop()
                self.jobs_fuseRingTimer = nil

                let fadeDuration = config.fadeOutDuration
                guard fadeDuration > 0 else {
                    removeBlock()
                    return
                }

                let fadeRing = CABasicAnimation(keyPath: "opacity")
                fadeRing.fromValue = ring.presentation()?.opacity ?? ring.opacity
                fadeRing.toValue = 0
                fadeRing.duration = fadeDuration
                fadeRing.fillMode = .forwards
                fadeRing.isRemovedOnCompletion = false

                CATransaction.begin()
                CATransaction.setCompletionBlock(removeBlock)
                ring.add(fadeRing, forKey: "jobs.fuse.outerRing.retreatFadeOut")
                CATransaction.commit()
            }

            self.jobs_fuseRingTimer = retreatTimer
            retreatTimer.start()
        }

        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
        return self
    }

    /// 手动刷新导火索外圈布局。按钮 bounds 或 cornerRadius 变化后可调用。
    @discardableResult
    public func byFuseOuterRingLayoutIfNeeded() -> Self {
        let work = { [weak self] in self?.jobs_layoutFuseOuterRingLayers() }
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
        return self
    }

    private func jobs_layoutFuseOuterRingLayers() {
        guard let ring = jobs_fuseRingLayer else { return }
        let config = jobs_fuseRingConfig
        let inset = config.inset + config.lineWidth / 2.0
        let rect = bounds.insetBy(dx: inset, dy: inset)
        guard rect.width > 0, rect.height > 0 else { return }

        let radius = max(0, min(layer.cornerRadius, min(rect.width, rect.height) / 2.0))
        let path: CGPath
        if config.startsFromTop {
            // 圆形按钮走 arc，可从 12 点钟方向开始增长。
            let center = CGPoint(x: bounds.midX, y: bounds.midY)
            let r = max(0.1, min(rect.width, rect.height) / 2.0)
            path = UIBezierPath(
                arcCenter: center,
                radius: r,
                startAngle: -.pi / 2,
                endAngle: 1.5 * .pi,
                clockwise: true
            ).cgPath
        } else {
            path = UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath
        }

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        for layer in [jobs_fuseTrackLayer, ring].compactMap({ $0 }) {
            layer.frame = bounds
            layer.path = path
            layer.lineWidth = config.lineWidth
        }
        CATransaction.commit()
    }

    private func jobs_updateFuseOuterRingByTimer() {
        let config = jobs_fuseRingConfig
        let elapsed = max(0, CACurrentMediaTime() - jobs_fuseRingStartTS)
        let raw = elapsed / config.growDuration
        let progress: CGFloat
        if config.repeatsWhileHolding {
            progress = CGFloat(raw.truncatingRemainder(dividingBy: 1.0))
        } else {
            progress = CGFloat(min(1.0, raw))
        }
        jobs_updateFuseOuterRing(progress: max(0.001, min(1.0, progress)))
    }

    private func jobs_updateFuseOuterRing(progress: CGFloat) {
        guard let ring = jobs_fuseRingLayer else { return }
        let config = jobs_fuseRingConfig
        let p = max(0.001, min(1.0, progress))
        let opacity = config.fromOpacity + (config.toOpacity - config.fromOpacity) * Float(p)

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        ring.strokeStart = 0
        ring.strokeEnd = p
        ring.opacity = opacity
        CATransaction.commit()
    }
}

// MARK: - 长按放大 / 松手恢复
extension UIView {
    private var jobs_fuseScaleOriginalTransform: CGAffineTransform? {
        get { (objc_getAssociatedObject(self, &_jobsFuseScaleOriginalTransformKey) as? _JobsFuseTransformBox)?.transform }
        set {
            let box = newValue.map { _JobsFuseTransformBox($0) }
            objc_setAssociatedObject(self, &_jobsFuseScaleOriginalTransformKey, box, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private var jobs_fuseScaleActive: Bool {
        get { (objc_getAssociatedObject(self, &_jobsFuseScaleActiveKey) as? NSNumber)?.boolValue ?? false }
        set { objc_setAssociatedObject(self, &_jobsFuseScaleActiveKey, NSNumber(value: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// 开始长按时：按钮放大。
    @discardableResult
    public func byFusePressScaleStart(
        scale: CGFloat = 1.16,
        duration: TimeInterval = 0.16
    ) -> Self {
        let work = { [weak self] in
            guard let self else { return }
            if !self.jobs_fuseScaleActive {
                self.jobs_fuseScaleOriginalTransform = self.transform
            }
            self.jobs_fuseScaleActive = true

            let base = self.jobs_fuseScaleOriginalTransform ?? self.transform
            UIView.animate(
                withDuration: duration,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction, .curveEaseOut]
            ) { [weak self] in
                self?.transform = base.scaledBy(x: max(0.01, scale), y: max(0.01, scale))
            }
        }

        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
        return self
    }

    /// 松手/取消时：按钮恢复原大小。
    @discardableResult
    public func byFusePressScaleStop(
        animated: Bool = true,
        duration: TimeInterval = 0.22,
        damping: CGFloat = 0.72,
        velocity: CGFloat = 0.8
    ) -> Self {
        let work = { [weak self] in
            guard let self else { return }
            let original = self.jobs_fuseScaleOriginalTransform ?? .identity
            self.jobs_fuseScaleActive = false
            self.jobs_fuseScaleOriginalTransform = nil

            guard animated else {
                self.transform = original
                return
            }

            UIView.animate(
                withDuration: duration,
                delay: 0,
                usingSpringWithDamping: max(0.05, min(1, damping)),
                initialSpringVelocity: max(0, velocity),
                options: [.beginFromCurrentState, .allowUserInteraction]
            ) { [weak self] in
                self?.transform = original
            }
        }

        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } }
        return self
    }
}

// MARK: - 组合入口：外圈 + 放大 + 声音
extension UIView {
    /// 长按 began 时直接调用。
    @discardableResult
    public func byFusePressStart(
        ringConfig: JobsFuseOuterRingConfig = .init(),
        scale: CGFloat = 1.16
    ) -> Self {
        byFuseOuterRingStart(ringConfig)
        byFusePressScaleStart(scale: scale)
        return self
    }

    /// 长按 ended/cancelled/failed 时直接调用。
    @discardableResult
    public func byFusePressStop(animated: Bool = true) -> Self {
        byFuseOuterRingStop(animated: animated)
        byFusePressScaleStop(animated: animated)
        return self
    }

    /// 短按播放一个系统音。默认 1104 比较像轻点反馈；如需换音效，传 SystemSoundID。
    @discardableResult
    public func byFusePlaySystemSound(_ soundID: SystemSoundID = 1104) -> Self {
        AudioServicesPlaySystemSound(soundID)
        return self
    }
}
