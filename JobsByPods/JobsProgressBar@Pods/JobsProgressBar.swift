//
//  JobsProgressBar.swift
//  JobsProgressBar
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
import ObjectiveC
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftTimer
import JobsSwiftBaseDefines

// MARK: - Progress Label Placement
public enum JobsProgressLabelPlacement {
    case top
    case bottom
    case hidden
}
// MARK: - JobsProgressBar
open class JobsProgressBar: UIView {
    // MARK: - Public API
    public var direction: JobsAxisDirection = .leftToRight {
        didSet {
            if autoStopOnExternalChange { stopAutoProgress() }
            setNeedsLayout()
        }
    }
    /**
     countUp 0 → 1 显示为 0% → 100%
     countDown 0 → 1 显示为 100% → 0%
     */
    public var valueMode: JobsValueMode = .countUp {
        didSet {
            if autoStopOnExternalChange { stopAutoProgress() }
            setNeedsLayout()
        }
    }
    /// 外部对进度条做「方向 / 模式 / 进度」等变更时，是否自动停止内置 JobsSwiftTimer
    public var autoStopOnExternalChange: Bool = true
    /// 当前进度 [0, 1] —— 始终是“标准进度”：0 = 起点，1 = 终点
    public var progress: CGFloat {
        get { _progress }
        set { setProgress(newValue, animated: false) }
    }
    // MARK: - Track Layout Config
    public var trackThickness: CGFloat? {
        didSet { setNeedsLayout() }
    }
    public var trackHorizontalInset: CGFloat? {
        didSet { setNeedsLayout() }
    }
    public var trackVerticalInset: CGFloat? {
        didSet { setNeedsLayout() }
    }
    // MARK: - Label Config
    public var progressLabelPlacement: JobsProgressLabelPlacement = .top {
        didSet {
            if autoStopOnExternalChange { stopAutoProgress() }
            setNeedsLayout()
        }
    }
    public var progressLabelSpacing: CGFloat = 6 {
        didSet { setNeedsLayout() }
    }

    public var autoHideLabel: Bool = true {
        didSet { setNeedsLayout() }
    }
    public var labelMinVisibleHeight: CGFloat = 18 {
        didSet { setNeedsLayout() }
    }
    // MARK: - Thumb Config
    public var thumbImage: UIImage? {
        didSet {
            thumbImageView.image = thumbImage
            thumbImageView.isHidden = (thumbImage == nil)
            setNeedsLayout()
        }
    }

    public var thumbSize: CGSize? {
        didSet { setNeedsLayout() }
    }

    public var thumbOffset: UIOffset = .zero {
        didSet { setNeedsLayout() }
    }

    public var thumbContentMode: UIView.ContentMode = .scaleAspectFit {
        didSet { thumbImageView.contentMode = thumbContentMode }
    }

    public var thumbCornerRadius: CGFloat? {
        didSet {
            let r = thumbCornerRadius ?? 0
            thumbImageView.layer.cornerRadius = r
            thumbImageView.layer.masksToBounds = (r > 0)
            thumbHighlightLayer.cornerRadius = r
        }
    }

    public var thumbFollowsFillStyle: Bool = false {
        didSet { setNeedsLayout() }
    }

    public var thumbBackgroundColor: UIColor? {
        didSet { setNeedsLayout() }
    }

    public var thumbBorderColor: UIColor? {
        didSet { setNeedsLayout() }
    }

    public var thumbBorderWidth: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    public var thumbShadowOpacity: Float = 0 {
        didSet { setNeedsLayout() }
    }
    public var thumbShadowRadius: CGFloat = 6 {
        didSet { setNeedsLayout() }
    }
    public var thumbShadowOffset: CGSize = .zero {
        didSet { setNeedsLayout() }
    }
    public var thumbShadowColor: UIColor? = UIColor.black {
        didSet { setNeedsLayout() }
    }
    // MARK: - Dragging
    public var isDraggable: Bool = true {
        didSet { updateDragGestureEnabled() }
    }

    public var onDragBegan: ((CGFloat) -> Void)?
    public var onDragChanged: ((CGFloat) -> Void)?
    public var onDragEnded: ((CGFloat) -> Void)?
    public var dragThumbScales: Bool = true
    public var dragThumbScale: CGFloat = 1.08
    // MARK: - Press Feel
    public var pressEnhancesShadowAndHighlight: Bool = true
    public var pressedShadowOpacityBoost: Float = 0.18
    public var pressedShadowRadiusBoost: CGFloat = 2.5
    public var pressedHighlightOpacity: Float = 0.22
    public var pressedHighlightWidth: CGFloat = 1.0
    // MARK: - Rotation (Follow Speed)
    public var rotationFollowsDragSpeed: Bool = true
    public var rotationSlowDuration: CFTimeInterval = 1.15
    public var rotationFastDuration: CFTimeInterval = 0.35
    public var rotationSpeedRange: ClosedRange<CGFloat> = 0...1800
    public var rotationSpeedSmoothing: CGFloat = 0.22
    /// 自动播放时一圈时长
    public var autoRotationDuration: CFTimeInterval = 0.85
    // MARK: - Rotation (Spin Down)
    public var enablesSpinDownOnRelease: Bool = true
    public var spinDownDuration: CFTimeInterval = 0.28
    public var spinDownTurns: CGFloat = 0.35
    // MARK: - ✅ 没滑动就不转：阈值
    /// 拖动中轴向速度低于这个阈值 → 认为“停住”
    public var dragRotationStopSpeedThreshold: CGFloat = 22
    /// 拖动中显示进度变化小于这个阈值 → 认为“没滑动”
    public var dragRotationStopDeltaThreshold: CGFloat = 0.0006

    private let thumbRotationAnimationKey = "jobs.progress.thumb.rotation"
    private let thumbSpinDownAnimationKey = "jobs.progress.thumb.spindown"

    private var isAutoAnimating: Bool = false
    private var isUserDragging: Bool = false

    private var lastDisplayProgress: CGFloat?
    private var lastRotationSign: CGFloat = 1

    private var smoothedDragSpeed: CGFloat = 0

    private var baseShadowOpacity: Float = 0
    private var baseShadowRadius: CGFloat = 0
    private var baseShadowOffset: CGSize = .zero
    private var baseShadowColor: UIColor? = .black
    // MARK: - Private
    private var _progress: CGFloat = 0
    private var autoTimer: JobsSwiftTimerProtocol?
    private var autoStep: CGFloat = 0.01
    private var _isAutoTick: Bool = false
    // MARK: - Views
    private lazy var trackView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemGray5)
            .byMasksToBounds(true)
            .byAddTo(self)
    }()

    private lazy var fillView: UIView = {
        UIView()
            .byBackgroundColor(.systemBlue)
            .byMasksToBounds(true)
            .byAddTo(trackView)
    }()
    /// 进度条“头”
    private lazy var thumbImageView: UIImageView = {
        UIImageView()
            .byContentMode(thumbContentMode)
            .byHidden(YES)
            .byClipsToBounds(NO)
            .byAddTo(self)
    }()
    /// 高光圈（按下显示）
    private lazy var thumbHighlightLayer: CALayer = {
        CALayer()
            .byOpacity(0.0)
            .byMasksToBounds(YES)
            .byBorderColor(.white.withAlphaComponent(0.9))
            .byBorderWidth(pressedHighlightWidth)
    }()

    private lazy var panGesture: UIPanGestureRecognizer = {
        UIPanGestureRecognizer
            .byConfig { [weak self] (gr: UIPanGestureRecognizer) in
                guard let self else { return }
                guard isDraggable else { return }
                guard bounds.width > 0, bounds.height > 0 else { return }

                if autoTimer != nil { stopAutoProgress() }

                let loc = gr.location(in: self)
                let newDisplay = displayProgress(from: loc)
                let newRaw = rawProgressValue(fromDisplay: newDisplay)

                let v = gr.velocity(in: self)
                let axisV = axisSpeed(from: v)

                smoothedDragSpeed = smoothedDragSpeed + (axisV - smoothedDragSpeed) * rotationSpeedSmoothing
                let rotDuration = rotationDuration(forSpeed: smoothedDragSpeed)

                switch gr.state {
                case .began:
                    isUserDragging = true
                    setThumbDraggingUI(true)

                    lastDisplayProgress = displayProgressValue(forRaw: _progress)
                    updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: rotDuration)

                    setProgress(newRaw, animated: false)
                    onDragBegan?(newRaw)

                case .changed:
                    // ✅ 没滑动就不转：用“速度 + 显示进度 delta”双阈值判断
                    let old = lastDisplayProgress ?? newDisplay
                    let deltaAbs = abs(newDisplay - old)

                    if axisV < dragRotationStopSpeedThreshold,
                       deltaAbs < dragRotationStopDeltaThreshold {
                        lastDisplayProgress = newDisplay
                        stopThumbRotation()
                    } else {
                        updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: rotDuration)
                    }

                    setProgress(newRaw, animated: false)
                    onDragChanged?(newRaw)

                case .ended, .cancelled, .failed:
                    updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: rotDuration)

                    setProgress(newRaw, animated: false)
                    onDragEnded?(newRaw)

                    isUserDragging = false
                    setThumbDraggingUI(false)

                    if isAutoAnimating == false {
                        spinDownAndStop(sign: lastRotationSign)
                    }

                default:
                    break
                }
                
            }
            .byMaxTouches(1)
    }()

    deinit {
        stopAutoProgress()
    }
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = false
        layer.masksToBounds = false
        backgroundColor = .clear

        trackView.byVisible(true)
        fillView.byVisible(true)
        progressLabel.byVisible(true)

        thumbImageView.isHidden = (thumbImage == nil)
        if thumbImageView.layer.sublayers?.contains(thumbHighlightLayer) != true {
            thumbImageView.layer.addSublayer(thumbHighlightLayer)
        }
        updateDragGestureEnabled()
    }

    open override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: 40)
    }
    // MARK: - Layout
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutForCurrentState()
    }

    private func layoutForCurrentState() {
        let raw = max(0, min(_progress, 1))
        let displayProgress: CGFloat
        switch valueMode {
        case .countUp:
            displayProgress = raw
        case .countDown:
            displayProgress = 1 - raw
        }
        if lastDisplayProgress == nil { lastDisplayProgress = displayProgress }
        updateProgressLabelText(displayProgress)

        let hInset: CGFloat = max(0, trackHorizontalInset ?? 0)
        let vInset: CGFloat = max(0, trackVerticalInset ?? 0)
        let preferredThickness: CGFloat = trackThickness ?? bounds.height

        switch direction {
        case .leftToRight, .rightToLeft:
            let trackWidth = max(0, bounds.width - 2 * hInset)
            let availableHeight = max(0, bounds.height - 2 * vInset)
            let trackHeight = min(max(0, preferredThickness), availableHeight)

            let trackFrame = CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackHeight / 2
            fillView.layer.cornerRadius = trackHeight / 2

            let fillWidth = trackWidth * displayProgress
            if direction == .leftToRight {
                fillView.frame = CGRect(x: 0, y: 0, width: fillWidth, height: trackHeight)
            } else {
                fillView.frame = CGRect(x: trackWidth - fillWidth, y: 0, width: fillWidth, height: trackHeight)
            }

            let endpointX: CGFloat = (direction == .leftToRight)
            ? (trackFrame.minX + fillWidth)
            : (trackFrame.maxX - fillWidth)

            layoutThumb(
                center: CGPoint(x: endpointX, y: trackFrame.midY),
                thickness: trackHeight,
                displayProgress: displayProgress,
                trackFrame: trackFrame
            )
            layoutProgressLabelForHorizontal(endpointX: endpointX, trackFrame: trackFrame)

        case .bottomToTop, .topToBottom:
            let availableWidth = max(0, bounds.width - 2 * hInset)
            let trackWidth = min(max(0, preferredThickness), availableWidth)
            let trackHeight = max(0, bounds.height - 2 * vInset)

            let trackFrame = CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackWidth / 2
            fillView.layer.cornerRadius = trackWidth / 2

            let fillHeight = trackHeight * displayProgress
            if direction == .bottomToTop {
                let y = trackHeight - fillHeight
                fillView.frame = CGRect(x: 0, y: y, width: trackWidth, height: fillHeight)
            } else {
                fillView.frame = CGRect(x: 0, y: 0, width: trackWidth, height: fillHeight)
            }

            let endpointY: CGFloat = (direction == .bottomToTop)
            ? (trackFrame.minY + (trackHeight - fillHeight))
            : (trackFrame.minY + fillHeight)
            layoutThumb(
                center: CGPoint(x: trackFrame.midX, y: endpointY),
                thickness: trackWidth,
                displayProgress: displayProgress,
                trackFrame: trackFrame
            )
            layoutProgressLabelForVertical(endpointY: endpointY, trackFrame: trackFrame)
        }
    }
    // MARK: - Auto Stop
    private func autoStopIfNeeded() {
        guard autoStopOnExternalChange else { return }
        guard autoTimer != nil else { return }
        guard _isAutoTick == false else { return }
        stopAutoProgress()
    }
    // MARK: - Auto Progress
    @discardableResult
    public func startAutoProgress(fromZero: Bool = true,
                                  step: CGFloat = 0.01,
                                  interval: TimeInterval = 0.03,
                                  animated: Bool = true)  -> Self {
        stopAutoProgress()
        isAutoAnimating = true
        if animated {
            let displayDelta = (valueMode == .countUp) ? step : -step
            startThumbRotationIfNeeded(sign: displayDelta >= 0 ? 1 : -1, duration: autoRotationDuration)
        }
        autoStep = step
        if fromZero {
            _progress = 0
            setProgress(0, animated: false)
        }

        let config = JobsSwiftTimerConfig(
            interval: interval,
            repeats: true,
            tolerance: 0,
            queue: .main
        )
        let t = JobsTimer(kind: .gcd, config: config) { [weak self] in
            onMainAsync(self) { bar in
                let next = min(1, max(0, bar._progress + bar.autoStep))
                bar._progress = next
                bar._isAutoTick = true
                bar.setProgress(next, animated: animated, duration: interval)
                bar._isAutoTick = false
                if next >= 1 {
                    bar.stopAutoProgress()
                }
            }
        }
        autoTimer = t
        t.start()
        return self
    }

    @discardableResult
    public func stopAutoProgress() -> Self {
        isAutoAnimating = false
        if isUserDragging == false {
            stopThumbRotation()
        }
        autoTimer?.stop()
        autoTimer = nil
        return self
    }
    // MARK: - Progress API
    public func setProgress(_ progress: CGFloat,
                            animated: Bool = true,
                            duration: TimeInterval = 0.25) {
        autoStopIfNeeded()
        let clamped = max(0, min(progress, 1))
        _progress = clamped
        if animated {
            let newDisplay = displayProgressValue(forRaw: clamped)
            updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: autoRotationDuration)

            if isAutoAnimating == false && isUserDragging == false {
                DispatchQueue.main.asyncAfter(deadline: .now() + max(0.05, duration)) { [weak self] in
                    guard let self else { return }
                    if self.isAutoAnimating == false && self.isUserDragging == false {
                        self.spinDownAndStop(sign: self.lastRotationSign)
                    }
                }
            }
        } else {
            lastDisplayProgress = displayProgressValue(forRaw: clamped)
        }
        setNeedsLayout()
        guard animated else { return }
        // ⚠️ layoutIfNeeded() 会触发布局引擎求解；如果页面上其他地方有约束冲突，
        // 会被符号断点 UIViewAlertForUnsatisfiableConstraints 捕获，并表现为“总是断在这里”。
        // 这里改为更温和的布局驱动：只对自身做 layoutSubviews 的时机交给系统 runloop，避免强制求解。
        onMainAsync { [weak self] in
            guard let self else { return }
            self.setNeedsLayout()
        }
    }
    // MARK: - Display Percent API
    @discardableResult
    public func setDisplayPercent(text: String?,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.25) -> CGFloat? {
        let t = (text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard let v = Double(t) else { return nil }
        return setDisplayPercent(CGFloat(v), animated: animated, duration: duration)
    }

    @discardableResult
    public func setDisplayPercent(_ percent: CGFloat,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.25) -> CGFloat {
        autoStopIfNeeded()
        let clampedPercent = max(0, min(percent, 100))
        let displayRatio = clampedPercent / 100.0

        let raw: CGFloat
        switch valueMode {
        case .countUp:
            raw = displayRatio
        case .countDown:
            raw = 1 - displayRatio
        }

        setProgress(raw, animated: animated, duration: duration)
        return clampedPercent
    }
}
// MARK: - Drag / Rotation Internals
extension JobsProgressBar {

    private func updateDragGestureEnabled() {
        if isDraggable {
            if panGesture.view == nil { addGestureRecognizer(panGesture) }
        } else {
            if panGesture.view != nil { removeGestureRecognizer(panGesture) }
        }
    }

    private func currentTrackFrame() -> CGRect {
        let hInset: CGFloat = max(0, trackHorizontalInset ?? 0)
        let vInset: CGFloat = max(0, trackVerticalInset ?? 0)
        let preferredThickness: CGFloat = trackThickness ?? bounds.height

        switch direction {
        case .leftToRight, .rightToLeft:
            let trackWidth = max(0, bounds.width - 2 * hInset)
            let availableHeight = max(0, bounds.height - 2 * vInset)
            let trackHeight = min(max(0, preferredThickness), availableHeight)
            return CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)

        case .bottomToTop, .topToBottom:
            let availableWidth = max(0, bounds.width - 2 * hInset)
            let trackWidth = min(max(0, preferredThickness), availableWidth)
            let trackHeight = max(0, bounds.height - 2 * vInset)
            return CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
        }
    }

    fileprivate func displayProgressValue(forRaw raw: CGFloat) -> CGFloat {
        let clamped = max(0, min(raw, 1))
        switch valueMode {
        case .countUp:
            return clamped
        case .countDown:
            return 1 - clamped
        }
    }

    private func rawProgressValue(fromDisplay display: CGFloat) -> CGFloat {
        let clamped = max(0, min(display, 1))
        switch valueMode {
        case .countUp:
            return clamped
        case .countDown:
            return 1 - clamped
        }
    }

    private func displayProgress(from location: CGPoint) -> CGFloat {
        let tf = currentTrackFrame()
        guard tf.width > 0, tf.height > 0 else { return displayProgressValue(forRaw: _progress) }

        switch direction {
        case .leftToRight:
            return max(0, min(1, (location.x - tf.minX) / tf.width))
        case .rightToLeft:
            return max(0, min(1, (tf.maxX - location.x) / tf.width))
        case .topToBottom:
            return max(0, min(1, (location.y - tf.minY) / tf.height))
        case .bottomToTop:
            return max(0, min(1, (tf.maxY - location.y) / tf.height))
        }
    }

    private func axisSpeed(from velocity: CGPoint) -> CGFloat {
        switch direction {
        case .leftToRight, .rightToLeft:
            return abs(velocity.x)
        case .topToBottom, .bottomToTop:
            return abs(velocity.y)
        }
    }

    private func rotationDuration(forSpeed speed: CGFloat) -> CFTimeInterval {
        guard rotationFollowsDragSpeed else { return autoRotationDuration }

        let range = rotationSpeedRange
        let s = max(range.lowerBound, min(range.upperBound, speed))
        let t = (range.upperBound == range.lowerBound) ? 0 : (s - range.lowerBound) / (range.upperBound - range.lowerBound)

        let d = rotationSlowDuration + (rotationFastDuration - rotationSlowDuration) * CFTimeInterval(t)
        return max(0.18, d)
    }
    /// 根据显示进度 delta 推断前进/后退，从而决定顺/逆时针，并启动旋转
    fileprivate func updateRotationDirectionByDisplayDelta(newDisplay: CGFloat,
                                                          duration: CFTimeInterval?) {
        let old = lastDisplayProgress ?? newDisplay
        let delta = newDisplay - old
        let eps: CGFloat = 0.0005

        let sign: CGFloat
        if abs(delta) < eps {
            sign = lastRotationSign
        } else {
            sign = (delta > 0) ? 1 : -1
        }

        lastDisplayProgress = newDisplay
        startThumbRotationIfNeeded(sign: sign, duration: duration)
    }
    // MARK: - Press UI
    private func setThumbDraggingUI(_ dragging: Bool) {
        if dragThumbScales {
            let target = dragging ? CGAffineTransform(scaleX: dragThumbScale, y: dragThumbScale) : .identity
            UIView.animate(withDuration: dragging ? 0.12 : 0.18,
                           delay: 0,
                           usingSpringWithDamping: dragging ? 0.85 : 0.92,
                           initialSpringVelocity: dragging ? 0.6 : 0.5,
                           options: [.beginFromCurrentState, .allowUserInteraction]) { [weak self] in
                self?.thumbImageView.transform = target
            }
        }

        guard pressEnhancesShadowAndHighlight else { return }

        let dur: CFTimeInterval = dragging ? 0.12 : 0.18
        CATransaction.begin()
        CATransaction.setAnimationDuration(dur)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: .easeOut))

        if dragging {
            thumbImageView.layer.shadowOpacity = min(1, baseShadowOpacity + pressedShadowOpacityBoost)
            thumbImageView.layer.shadowRadius = baseShadowRadius + pressedShadowRadiusBoost
            thumbHighlightLayer.opacity = pressedHighlightOpacity
        } else {
            thumbImageView.layer.shadowOpacity = baseShadowOpacity
            thumbImageView.layer.shadowRadius = baseShadowRadius
            thumbHighlightLayer.opacity = 0
        }

        CATransaction.commit()
    }
    // MARK: - Rotation Core
    private func currentRotationZ() -> CGFloat {
        if let p = thumbImageView.layer.presentation(),
           let v = p.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            return v
        }
        if let v = thumbImageView.layer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            return v
        };return 0
    }

    private func startThumbRotationIfNeeded(sign: CGFloat, duration: CFTimeInterval?) {
        guard thumbImage != nil else { return }
        guard thumbImageView.isHidden == false else { return }

        let normalizedSign: CGFloat = (sign >= 0) ? 1 : -1
        let targetDuration = max(0.18, duration ?? autoRotationDuration)

        if let anim = thumbImageView.layer.animation(forKey: thumbRotationAnimationKey) as? CABasicAnimation,
           normalizedSign == lastRotationSign {
            if abs(anim.duration - targetDuration) < 0.08 { return }
        }

        let current = currentRotationZ()
        thumbImageView.layer.removeAnimation(forKey: thumbSpinDownAnimationKey)
        thumbImageView.layer.removeAnimation(forKey: thumbRotationAnimationKey)
        thumbImageView.layer.setValue(current, forKeyPath: "transform.rotation.z")

        thumbImageView.layer.add(
            CABasicAnimation(keyPath: "transform.rotation.z")
                .byFromValue(current)
                .byToValue(current + normalizedSign * (.pi * 2))
                .byDuration(targetDuration)
                .byRepeatCount(.infinity)
                .byRemovedOnCompletion(NO)
                .byFillMode(.forwards)
                .byTimingFunction(CAMediaTimingFunction(name: .linear)),
            forKey: thumbRotationAnimationKey)
        lastRotationSign = normalizedSign
    }

    private func stopThumbRotation() {
        let current = currentRotationZ()
        thumbImageView.layer.removeAnimation(forKey: thumbSpinDownAnimationKey)
        thumbImageView.layer.removeAnimation(forKey: thumbRotationAnimationKey)
        thumbImageView.layer.setValue(current, forKeyPath: "transform.rotation.z")
    }

    private func spinDownAndStop(sign: CGFloat) {
        guard enablesSpinDownOnRelease else {
            stopThumbRotation()
            return
        }
        guard thumbImage != nil, thumbImageView.isHidden == false else { return }

        let normalizedSign: CGFloat = (sign >= 0) ? 1 : -1
        let current = currentRotationZ()

        thumbImageView.layer.removeAnimation(forKey: thumbRotationAnimationKey)
        thumbImageView.layer.setValue(current, forKeyPath: "transform.rotation.z")

        let extra = normalizedSign * (.pi * 2) * max(0, min(1, spinDownTurns))
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let self else { return }
            let end = current + extra
            self.thumbImageView.layer.removeAnimation(forKey: self.thumbSpinDownAnimationKey)
            self.thumbImageView.layer.setValue(end, forKeyPath: "transform.rotation.z")
        }
        thumbImageView.layer.add(
            CABasicAnimation(keyPath: "transform.rotation.z")
                .byFromValue(current)
                .byToValue(current + extra)
                .byDuration(max(0.12, spinDownDuration))
                .byTimingFunction(CAMediaTimingFunction(name: .easeOut))
                .byRemovedOnCompletion(NO)
                .byFillMode(.forwards),
            forKey: thumbSpinDownAnimationKey)
        CATransaction.commit()
    }
}
// MARK: - Thumb Layout + Style
extension JobsProgressBar {

    fileprivate func layoutThumb(center: CGPoint,
                                 thickness: CGFloat,
                                 displayProgress: CGFloat,
                                 trackFrame: CGRect) {
        guard thumbImage != nil else {
            thumbImageView.isHidden = true
            return
        }
        thumbImageView.isHidden = false
        thumbImageView.contentMode = thumbContentMode

        let defaultSide = max(0, thickness)
        let size = thumbSize ?? CGSize(width: defaultSide, height: defaultSide)
        thumbImageView.bounds = CGRect(origin: .zero, size: size)

        applyThumbStyleIfNeeded()

        var c = center
        c.x += thumbOffset.horizontal
        c.y += thumbOffset.vertical

        let halfW = size.width / 2
        let halfH = size.height / 2
        // ✅ 只在边界时，把 thumb 往“里”推，保证完整可见（针对 clipsToBounds = true 特别有效）
        let eps: CGFloat = 0.0001
        if displayProgress <= eps {
            switch direction {
            case .leftToRight:
                c.x = max(c.x, trackFrame.minX + halfW)
            case .rightToLeft:
                c.x = min(c.x, trackFrame.maxX - halfW)
            case .topToBottom:
                c.y = max(c.y, trackFrame.minY + halfH)
            case .bottomToTop:
                c.y = min(c.y, trackFrame.maxY - halfH)
            }
        } else if displayProgress >= 1 - eps {
            switch direction {
            case .leftToRight:
                c.x = min(c.x, trackFrame.maxX - halfW)
            case .rightToLeft:
                c.x = max(c.x, trackFrame.minX + halfW)
            case .topToBottom:
                c.y = min(c.y, trackFrame.maxY - halfH)
            case .bottomToTop:
                c.y = max(c.y, trackFrame.minY + halfH)
            }
        }
        // 你原来的 clamp（可保留，避免 thumbOffset 推太离谱）
        c.x = min(max(c.x, bounds.minX - halfW), bounds.maxX + halfW)
        c.y = min(max(c.y, bounds.minY - halfH), bounds.maxY + halfH)

        thumbImageView.center = c

        thumbHighlightLayer.frame = thumbImageView.bounds
        thumbHighlightLayer.cornerRadius = thumbCornerRadius ?? min(size.width, size.height) / 2
        thumbHighlightLayer.borderWidth = pressedHighlightWidth
    }

    fileprivate func applyThumbStyleIfNeeded() {
        let bgColor: UIColor?
        let borderColor: UIColor?
        let borderWidth: CGFloat

        let shadowColor: UIColor?
        let shadowOpacity: Float
        let shadowRadius: CGFloat
        let shadowOffset: CGSize

        if thumbFollowsFillStyle {
            bgColor = fillView.backgroundColor
            borderColor = (fillView.backgroundColor ?? UIColor.clear)
            borderWidth = max(0, thumbBorderWidth)

            shadowColor = thumbShadowColor
            shadowOpacity = max(0, thumbShadowOpacity)
            shadowRadius = max(0, thumbShadowRadius)
            shadowOffset = thumbShadowOffset
        } else {
            bgColor = thumbBackgroundColor
            borderColor = thumbBorderColor
            borderWidth = max(0, thumbBorderWidth)

            shadowColor = thumbShadowColor
            shadowOpacity = max(0, thumbShadowOpacity)
            shadowRadius = max(0, thumbShadowRadius)
            shadowOffset = thumbShadowOffset
        }

        thumbImageView.backgroundColor = bgColor
        thumbImageView.layer.borderColor = borderColor?.cgColor
        thumbImageView.layer.borderWidth = borderWidth

        thumbImageView.layer.shadowColor = (shadowColor ?? UIColor.black).cgColor
        thumbImageView.layer.shadowOpacity = shadowOpacity
        thumbImageView.layer.shadowRadius = shadowRadius
        thumbImageView.layer.shadowOffset = shadowOffset
        thumbImageView.layer.masksToBounds = false

        baseShadowColor = shadowColor
        baseShadowOpacity = shadowOpacity
        baseShadowRadius = shadowRadius
        baseShadowOffset = shadowOffset

        if isUserDragging, pressEnhancesShadowAndHighlight {
            thumbImageView.layer.shadowOpacity = min(1, baseShadowOpacity + pressedShadowOpacityBoost)
            thumbImageView.layer.shadowRadius = baseShadowRadius + pressedShadowRadiusBoost
            thumbHighlightLayer.opacity = pressedHighlightOpacity
        }
    }
}
// MARK: - DSL
extension JobsProgressBar {

    @discardableResult
    public func byDirection(_ direction: JobsAxisDirection) -> Self {
        self.direction = direction
        return self
    }

    @discardableResult
    public func byValueMode(_ mode: JobsValueMode) -> Self {
        self.valueMode = mode
        return self
    }

    @discardableResult
    public func byProgress(_ value: CGFloat,
                           animated: Bool = false,
                           duration: TimeInterval = 0.25) -> Self {
        self.setProgress(value, animated: animated, duration: duration)
        return self
    }

    @discardableResult
    public func byTrackColor(_ color: UIColor) -> Self {
        self.trackView.backgroundColor = color
        return self
    }

    @discardableResult
    public func byFillColor(_ color: UIColor) -> Self {
        self.fillView.backgroundColor = color
        return self
    }

    @discardableResult
    public func byTrackThickness(_ v: CGFloat?) -> Self {
        self.trackThickness = v
        return self
    }

    @discardableResult
    public func byTrackHorizontalInset(_ v: CGFloat?) -> Self {
        self.trackHorizontalInset = v
        return self
    }

    @discardableResult
    public func byTrackVerticalInset(_ v: CGFloat?) -> Self {
        self.trackVerticalInset = v
        return self
    }

    @discardableResult
    public func byAutoHideLabel(_ v: Bool) -> Self {
        self.autoHideLabel = v
        return self
    }

    @discardableResult
    public func byLabelMinVisibleHeight(_ v: CGFloat) -> Self {
        self.labelMinVisibleHeight = v
        return self
    }

    @discardableResult
    public func byLabelFont(_ font: UIFont) -> Self {
        self.progressLabel.font = font
        return self
    }

    @discardableResult
    public func byLabelTextColor(_ color: UIColor) -> Self {
        self.progressLabel.textColor = color
        return self
    }

    @discardableResult
    public func byLabelBackgroundColor(_ color: UIColor) -> Self {
        self.progressLabel.backgroundColor = color
        return self
    }

    @discardableResult
    public func byDisplayPercent(_ percent: CGFloat,
                                 animated: Bool = false,
                                 duration: TimeInterval = 0.25) -> Self {
        _ = setDisplayPercent(percent, animated: animated, duration: duration)
        return self
    }

    @discardableResult
    public func byDraggable(_ v: Bool) -> Self {
        self.isDraggable = v
        return self
    }

    @discardableResult
    public func byOnDragBegan(_ block: ((CGFloat) -> Void)?) -> Self {
        self.onDragBegan = block
        return self
    }

    @discardableResult
    public func byOnDragChanged(_ block: ((CGFloat) -> Void)?) -> Self {
        self.onDragChanged = block
        return self
    }

    @discardableResult
    public func byOnDragEnded(_ block: ((CGFloat) -> Void)?) -> Self {
        self.onDragEnded = block
        return self
    }

    @discardableResult
    public func byThumbImage(_ img: UIImage?) -> Self {
        self.thumbImage = img
        return self
    }

    @discardableResult
    public func byThumbSize(_ size: CGSize?) -> Self {
        self.thumbSize = size
        return self
    }

    @discardableResult
    public func byThumbOffset(_ offset: UIOffset) -> Self {
        self.thumbOffset = offset
        return self
    }

    @discardableResult
    public func byThumbContentMode(_ mode: UIView.ContentMode) -> Self {
        self.thumbContentMode = mode
        return self
    }

    @discardableResult
    public func byThumbCornerRadius(_ radius: CGFloat?) -> Self {
        self.thumbCornerRadius = radius
        return self
    }

    @discardableResult
    public func byThumbFollowsFillStyle(_ v: Bool) -> Self {
        self.thumbFollowsFillStyle = v
        return self
    }

    @discardableResult
    public func byThumbShadow(opacity: Float,
                              radius: CGFloat = 6,
                              offset: CGSize = .zero,
                              color: UIColor? = .black) -> Self {
        self.thumbShadowOpacity = opacity
        self.thumbShadowRadius = radius
        self.thumbShadowOffset = offset
        self.thumbShadowColor = color
        return self
    }

    @discardableResult
    public func byDragRotationStop(speedThreshold: CGFloat, deltaThreshold: CGFloat) -> Self {
        self.dragRotationStopSpeedThreshold = speedThreshold
        self.dragRotationStopDeltaThreshold = deltaThreshold
        return self
    }
}
// MARK: - Progress Label (Decoupled)
private struct _JobsProgressBarAssociatedKeys {
    static var progressLabelKey: UInt8 = 0
}

extension JobsProgressBar {
    fileprivate var progressLabel: UILabel {
        if let v = objc_getAssociatedObject(self, &_JobsProgressBarAssociatedKeys.progressLabelKey) as? UILabel {
            return v
        }
        let v = UILabel()
            .byFont(.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byText("0%")
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byMasksToBounds(YES)
            .byUserInteractionEnabled(NO)
            .byAddTo(self)
        objc_setAssociatedObject(
            self,
            &_JobsProgressBarAssociatedKeys.progressLabelKey,
            v,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return v
    }

    fileprivate func updateProgressLabelText(_ displayProgress: CGFloat) {
        let percent = Int(round(displayProgress * 100))
        progressLabel.byText("\(percent)%")
    }

    fileprivate func layoutProgressLabelForHorizontal(endpointX: CGFloat,trackFrame: CGRect) {
        switch progressLabelPlacement {
        case .hidden:
            progressLabel.byHidden(YES)
            return
        case .top, .bottom:
            break
        }

        if autoHideLabel, bounds.height < labelMinVisibleHeight {
            progressLabel.byHidden(YES)
            return
        } else {
            progressLabel.byHidden(NO)
        }

        progressLabel.sizeToFit()
        let labelSize = CGSize(
            width: progressLabel.bounds.width + 8,
            height: progressLabel.bounds.height + 4
        )
        progressLabel.bounds.size = labelSize

        var centerX = endpointX
        let minX = trackFrame.minX + labelSize.width / 2
        let maxX = trackFrame.maxX - labelSize.width / 2
        centerX = min(max(centerX, minX), maxX)

        let spacing = max(0, progressLabelSpacing)
        let centerY: CGFloat = {
            switch progressLabelPlacement {
            case .top:
                return trackFrame.minY - spacing - labelSize.height / 2
            case .bottom:
                return trackFrame.maxY + spacing + labelSize.height / 2
            case .hidden:
                return 0
            }
        }()
        progressLabel.byCenter(CGPoint(x: centerX, y: centerY))
    }

    fileprivate func layoutProgressLabelForVertical(endpointY: CGFloat,
                                                   trackFrame: CGRect) {
        switch progressLabelPlacement {
        case .hidden:
            progressLabel.byHidden(YES)
            return
        case .top, .bottom:
            break
        }

        if autoHideLabel, bounds.height < labelMinVisibleHeight {
            progressLabel.byHidden(YES)
            return
        } else {
            progressLabel.byHidden(NO)
        }

        progressLabel.sizeToFit()
        let labelSize = CGSize(
            width: progressLabel.bounds.width + 8,
            height: progressLabel.bounds.height + 4
        )
        progressLabel.bounds.size = labelSize

        let centerX = trackFrame.midX
        let spacing = max(0, progressLabelSpacing)
        let centerY: CGFloat = {
            switch progressLabelPlacement {
            case .top:
                return endpointY - spacing - labelSize.height / 2
            case .bottom:
                return endpointY + spacing + labelSize.height / 2
            case .hidden:
                return 0
            }
        }()
        progressLabel.center = CGPoint(x: centerX, y: centerY)
    }
}
