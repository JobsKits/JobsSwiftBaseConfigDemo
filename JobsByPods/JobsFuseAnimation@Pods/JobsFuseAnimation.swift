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
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
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
        strokeColor: UIColor = JobsCor.white,
        trackColor: UIColor? = JobsCor.white.withAlphaComponent(0.22),
        fillColor: UIColor = JobsCor.clear,
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
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } };return self
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
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } };return self
    }

    /// 手动刷新导火索外圈布局。按钮 bounds 或 cornerRadius 变化后可调用。
    @discardableResult
    public func byFuseOuterRingLayoutIfNeeded() -> Self {
        let work = { [weak self] in self?.jobs_layoutFuseOuterRingLayers() }
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } };return self
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
            path = UIBezierPath.make(
                arcCenter: center,
                radius: r,
                startAngle: -.pi / 2,
                endAngle: 1.5 * .pi,
                clockwise: true
            ).cgPath
        } else {
            path = UIBezierPath.make(roundedRect: rect, cornerRadius: radius).cgPath
        }
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        for layer in [jobs_fuseTrackLayer, ring].compactMap({ $0 }) {
            layer.byFrame(bounds)
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
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } };return self
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
        if Thread.isMainThread { work() } else { DispatchQueue.main.async { work() } };return self
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

// MARK: - 分格充电动画配置
public struct JobsChargingAnimationConfig {
    /// 充电格数，默认 3 格。
    public var segmentCount: Int
    /// 已充格颜色，默认系统绿色。
    public var filledColor: UIColor
    /// 未充格颜色，默认系统三级灰色。
    public var emptyColor: UIColor
    /// 每次前进一格的间隔。
    public var interval: TimeInterval
    /// 单次颜色跃迁时长。
    public var transitionDuration: TimeInterval
    /// 格子间距。
    public var segmentSpacing: CGFloat
    /// 单格圆角。
    public var segmentCornerRadius: CGFloat
    /// 动画视图尺寸。
    public var indicatorSize: CGSize

    public init(
        segmentCount: Int = 3,
        filledColor: UIColor = JobsCor.systemGreen,
        emptyColor: UIColor = JobsCor.systemGray3,
        interval: TimeInterval = 0.45,
        transitionDuration: TimeInterval = 0.18,
        segmentSpacing: CGFloat = 2,
        segmentCornerRadius: CGFloat = 2,
        indicatorSize: CGSize = CGSize(width: 30, height: 14)
    ) {
        self.segmentCount = max(1, segmentCount)
        self.filledColor = filledColor
        self.emptyColor = emptyColor
        self.interval = interval.isFinite ? max(0.05, interval) : 0.45
        self.transitionDuration = transitionDuration.isFinite ? max(0, transitionDuration) : 0.18
        self.segmentSpacing = segmentSpacing.isFinite ? max(0, segmentSpacing) : 2
        self.segmentCornerRadius = segmentCornerRadius.isFinite ? max(0, segmentCornerRadius) : 2
        self.indicatorSize = CGSize(
            width: indicatorSize.width.isFinite ? max(1, indicatorSize.width) : 30,
            height: indicatorSize.height.isFinite ? max(1, indicatorSize.height) : 14
        )
    }
}

// MARK: - 分格充电动画视图
public final class JobsChargingAnimationView: UIView {
    public private(set) var config = JobsChargingAnimationConfig()
    public private(set) var filledSegmentCount = 0

    private var segmentLayers: [CALayer] = []
    private var timer: JobsSwiftTimerProtocol?
    private var wantsRunning = false

    public override init(frame: CGRect) {
        super.init(frame: frame)
        jobs_setupChargingAnimation()
    }

    public convenience init(config: JobsChargingAnimationConfig) {
        self.init(frame: CGRect(origin: .zero, size: config.indicatorSize))
        byConfig(config)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        jobs_setupChargingAnimation()
    }

    deinit {
        timer?.stop()
        NotificationCenter.default.removeObserver(self)
    }

    public override var intrinsicContentSize: CGSize {
        config.indicatorSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        jobs_layoutChargingSegments()
    }

    public override func didMoveToWindow() {
        super.didMoveToWindow()
        jobs_syncChargingTimerState()
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        jobs_applyChargingColors(animated: false)
    }

    /// 更新配置。格数、颜色、间隔、间距和尺寸均可覆盖缺省值。
    @discardableResult
    public func byConfig(_ config: JobsChargingAnimationConfig) -> Self {
        let normalized = JobsChargingAnimationConfig(
            segmentCount: config.segmentCount,
            filledColor: config.filledColor,
            emptyColor: config.emptyColor,
            interval: config.interval,
            transitionDuration: config.transitionDuration,
            segmentSpacing: config.segmentSpacing,
            segmentCornerRadius: config.segmentCornerRadius,
            indicatorSize: config.indicatorSize
        )
        let shouldResume = wantsRunning
        jobs_stopChargingTimer()
        self.config = normalized
        filledSegmentCount = min(filledSegmentCount, normalized.segmentCount)
        jobs_rebuildChargingSegments()
        invalidateIntrinsicContentSize()
        setNeedsLayout()
        if shouldResume { jobs_syncChargingTimerState() };return self
    }

    /// 从 0 格开始播放；每一拍前进 1 格，满格后的下一拍回到 0 格。
    @discardableResult
    public func byStart(reset: Bool = true) -> Self {
        wantsRunning = true
        if reset {
            filledSegmentCount = 0
            jobs_applyChargingColors(animated: false)
        }
        jobs_syncChargingTimerState()
        return self
    }

    /// 暂停并保留当前格数。
    @discardableResult
    public func byPause() -> Self {
        wantsRunning = false
        timer?.pause()
        return self
    }

    /// 从当前格数继续播放。
    @discardableResult
    public func byResume() -> Self {
        wantsRunning = true
        jobs_syncChargingTimerState()
        return self
    }

    /// 停止并销毁内部 JobsSwiftTimer。
    @discardableResult
    public func byStop(reset: Bool = true) -> Self {
        wantsRunning = false
        jobs_stopChargingTimer()
        if reset {
            filledSegmentCount = 0
            jobs_applyChargingColors(animated: false)
        };return self
    }

    /// 手动前进 1 格，便于业务层按自己的节奏驱动。
    @discardableResult
    public func byAdvance(animated: Bool = true) -> Self {
        let advance = { [weak self] in
            guard let self else { return }
            self.filledSegmentCount = self.filledSegmentCount >= self.config.segmentCount
            ? 0
            : self.filledSegmentCount + 1
            self.jobs_applyChargingColors(animated: animated)
        }
        if Thread.isMainThread {
            advance()
        } else {
            DispatchQueue.main.async(execute: advance)
        };return self
    }

    private func jobs_setupChargingAnimation() {
        isUserInteractionEnabled = false
        byBackgroundColor(JobsCor.clear)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(jobs_reduceMotionStatusDidChange),
            name: UIAccessibility.reduceMotionStatusDidChangeNotification,
            object: nil
        )
        jobs_rebuildChargingSegments()
    }

    @objc private func jobs_reduceMotionStatusDidChange() {
        jobs_syncChargingTimerState()
    }

    private func jobs_rebuildChargingSegments() {
        segmentLayers.forEach { $0.removeFromSuperlayer() }
        segmentLayers = (0..<config.segmentCount).map { _ in
            CALayer()
                .byBackgroundColor(config.emptyColor)
                .byCornerRadius(config.segmentCornerRadius)
        }
        segmentLayers.forEach(layer.addSublayer)
        jobs_layoutChargingSegments()
        jobs_applyChargingColors(animated: false)
    }

    private func jobs_layoutChargingSegments() {
        guard !segmentLayers.isEmpty,
              bounds.width > 0,
              bounds.height > 0 else { return }
        let count = CGFloat(segmentLayers.count)
        let totalSpacing = config.segmentSpacing * max(0, count - 1)
        let segmentWidth = max(1, (bounds.width - totalSpacing) / count)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        for (index, segmentLayer) in segmentLayers.enumerated() {
            let originX = CGFloat(index) * (segmentWidth + config.segmentSpacing)
            segmentLayer
                .byFrame(CGRect(x: originX, y: 0, width: segmentWidth, height: bounds.height))
                .byCornerRadius(
                    min(config.segmentCornerRadius, min(segmentWidth, bounds.height) / 2)
                )
        }
        CATransaction.commit()
    }

    private func jobs_applyChargingColors(animated: Bool) {
        for (index, segmentLayer) in segmentLayers.enumerated() {
            let targetColor = index < filledSegmentCount
            ? config.filledColor
            : config.emptyColor
            let currentColor = segmentLayer.presentation()?.backgroundColor
            ?? segmentLayer.backgroundColor
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            segmentLayer.byBackgroundColor(targetColor)
            CATransaction.commit()
            guard animated,
                  config.transitionDuration > 0 else {
                segmentLayer.removeAnimation(forKey: "jobs.charging.color")
                continue
            }
            segmentLayer.add(
                CABasicAnimation(keyPath: "backgroundColor")
                    .byFromValue(currentColor)
                    .byToValue(targetColor.cgColor)
                    .byDuration(config.transitionDuration)
                    .byTimingFunction(CAMediaTimingFunction(name: .easeInEaseOut)),
                forKey: "jobs.charging.color"
            )
        }
    }

    private func jobs_syncChargingTimerState() {
        guard wantsRunning,
              window != nil,
              !UIAccessibility.isReduceMotionEnabled else {
            timer?.pause()
            return
        }
        if let timer {
            timer.resume()
            return
        }
        timer = JobsTimer(
            kind: .gcd,
            config: JobsSwiftTimerConfig(
                interval: config.interval,
                repeats: true,
                tolerance: min(0.03, config.interval * 0.1),
                queue: .main,
                pauseInBackground: true,
                autoManageAppState: true
            )
        ) { [weak self] in
            self?.byAdvance()
        }.start()
    }

    private func jobs_stopChargingTimer() {
        timer?.stop()
        timer = nil
    }
}

// MARK: - UITableViewCell 分格充电动画入口
private var _jobsChargingAnimationViewKey: UInt8 = 0

extension UITableViewCell {
    private var jobs_chargingAnimationView: JobsChargingAnimationView? {
        get {
            objc_getAssociatedObject(
                self,
                &_jobsChargingAnimationViewKey
            ) as? JobsChargingAnimationView
        }
        set {
            objc_setAssociatedObject(
                self,
                &_jobsChargingAnimationViewKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    /// 只驱动当前 cell 的充电视图，不触发 UITableView.reloadData / reloadRows。
    @discardableResult
    public func byChargingAnimationStart(
        _ config: JobsChargingAnimationConfig = .init(),
        reset: Bool = true
    ) -> Self {
        let work = { [weak self] in
            guard let self else { return }
            let chargingView: JobsChargingAnimationView
            if let current = self.jobs_chargingAnimationView {
                chargingView = current.byConfig(config)
            } else {
                chargingView = JobsChargingAnimationView(config: config)
                    .byAddTo(self.contentView)
                chargingView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    chargingView.leadingAnchor.constraint(
                        equalTo: self.contentView.layoutMarginsGuide.leadingAnchor
                    ),
                    chargingView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
                ])
                self.jobs_chargingAnimationView = chargingView
            }
            self.byImage(Self.jobs_chargingPlaceholderImage(size: config.indicatorSize))
            self.contentView.bringSubviewToFront(chargingView)
            chargingView.byStart(reset: reset)
            self.setNeedsLayout()
        }
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        };return self
    }

    /// 暂停当前 cell 的动画，保留格数。
    @discardableResult
    public func byChargingAnimationPause() -> Self {
        jobs_chargingAnimationView?.byPause()
        return self
    }

    /// 恢复当前 cell 的动画。
    @discardableResult
    public func byChargingAnimationResume() -> Self {
        jobs_chargingAnimationView?.byResume()
        return self
    }

    /// 停止当前 cell 的动画；复用前调用可避免旧动画串到其它入口。
    @discardableResult
    public func byChargingAnimationStop(removeFromSuperview: Bool = true) -> Self {
        jobs_chargingAnimationView?.byStop()
        if removeFromSuperview {
            jobs_chargingAnimationView?.removeFromSuperview()
            jobs_chargingAnimationView = nil
        };return self
    }

    private static func jobs_chargingPlaceholderImage(size: CGSize) -> UIImage {
        let normalizedSize = CGSize(
            width: max(1, size.width),
            height: max(1, size.height)
        )
        return UIGraphicsImageRenderer(size: normalizedSize).image { _ in }
    }
}
