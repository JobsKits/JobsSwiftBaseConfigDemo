//
//  JobsProgressBar.swift
//  JobsProgressBar
//
//  Created by Jobs on 2026年5月13日，星期三.
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

public typealias JobsProgressBubblePlacement = JobsProgressLabelPlacement

public enum JobsProgressBubbleDisplayMode {
    case always
    case whileChanging
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

    /// 默认仅在进度发生变化时显示，避免静止状态长期遮挡内容
    public var progressBubbleDisplayMode: JobsProgressBubbleDisplayMode = .whileChanging {
        didSet {
            progressBubbleHideWorkItem?.cancel()
            progressBubbleHideWorkItem = nil
            isProgressBubbleChangeVisible = false
            setNeedsLayout()
        }
    }

    public var progressBubbleHideDelay: TimeInterval = 0.8

    public var progressBubbleBackgroundColor: UIColor = JobsCor.secondarySystemBackground {
        didSet { setNeedsLayout() }
    }

    public var progressBubbleCornerRadius: CGFloat = 8 {
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
            thumbImageView
                .byImage(thumbImage)
                .byHidden((thumbImage == nil))
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
        didSet { thumbImageView.byContentMode(thumbContentMode) }
    }

    public var thumbCornerRadius: CGFloat? {
        didSet {
            let r = thumbCornerRadius ?? 0
            thumbImageView
                .byCornerRadius(r)
                .byMasksToBounds(r > 0)
            thumbHighlightLayer.byCornerRadius(r)
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
    public var thumbShadowColor: UIColor? = JobsCor.black {
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
    private var baseShadowColor: UIColor? = JobsCor.black
    // MARK: - Private
    private var _progress: CGFloat = 0
    private var autoTimer: JobsSwiftTimerProtocol?
    private var autoStep: CGFloat = 0.01
    private var _isAutoTick: Bool = false
    private var progressBubbleHideWorkItem: DispatchWorkItem?
    private var isProgressBubbleChangeVisible = false
    // MARK: - Views
    private lazy var trackView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemGray5)
            .byMasksToBounds(true)
            .byAddTo(self)
    }()

    private lazy var fillView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBlue)
            .byMasksToBounds(true)
            .byAddTo(trackView)
    }()
    /// 进度条“头”
    private lazy var thumbImageView: UIImageView = {
        UIImageView.jobsMake { _ in }
            .byContentMode(thumbContentMode)
            .byHidden(YES)
            .byClipsToBounds(NO)
            .byAddTo(self)
    }()
    /// 高光圈（按下显示）
    private lazy var thumbHighlightLayer: CALayer = {
        CALayer.jobsMake { _ in }
            .byOpacity(0.0)
            .byMasksToBounds(YES)
            .byBorderColor(JobsCor.white.withAlphaComponent(0.9))
            .byBorderWidth(pressedHighlightWidth)
    }()
    /// 带小三角的进度气泡背景
    private lazy var progressBubbleLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(progressBubbleBackgroundColor)
            .byMasksToBounds(NO)
            .byShadowColor(JobsCor.black)
            .byShadowOpacity(0.18)
            .byShadowRadius(6)
            .byShadowOffset(CGSize(width: 0, height: 2))
            .byHidden(YES)
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
                /// 处理 .began 分支
                case .began:
                    isUserDragging = true
                    setThumbDraggingUI(true)
                    lastDisplayProgress = displayProgressValue(forRaw: _progress)
                    updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: rotDuration)
                    setProgress(newRaw, animated: false)
                    onDragBegan?(newRaw)
                /// 处理 .changed 分支
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
                /// 合并处理 .ended、.cancelled、.failed 分支
                case .ended, .cancelled, .failed:
                    updateRotationDirectionByDisplayDelta(newDisplay: newDisplay, duration: rotDuration)
                    setProgress(newRaw, animated: false)
                    onDragEnded?(newRaw)
                    isUserDragging = false
                    setThumbDraggingUI(false)
                    if isAutoAnimating == false {
                        spinDownAndStop(sign: lastRotationSign)
                    }
                /// 未匹配已知分支时执行兜底处理
                default:
                    break
                }
            }
            .byMaxTouches(1)
    }()

    deinit {
        progressBubbleHideWorkItem?.cancel()
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
        byMasksToBounds(false)
        self.byBackgroundColor(JobsCor.clear)
        trackView.byVisible(true)
        fillView.byVisible(true)
        progressLabel.byHidden(YES)
        if progressBubbleLayer.superlayer == nil {
            layer.byInsertSublayer(progressBubbleLayer, below: progressLabel.layer)
        }
        thumbImageView.byHidden((thumbImage == nil))
        if thumbImageView.layer.sublayers?.contains(thumbHighlightLayer) != true {
            thumbImageView.layer.byAddSublayer(thumbHighlightLayer)
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
        /// 处理 .countUp 分支
        case .countUp:
            displayProgress = raw
        /// 处理 .countDown 分支
        case .countDown:
            displayProgress = 1 - raw
        }
        if lastDisplayProgress == nil { lastDisplayProgress = displayProgress }
        updateProgressLabelText(displayProgress)
        let hInset: CGFloat = max(0, trackHorizontalInset ?? 0)
        let vInset: CGFloat = max(0, trackVerticalInset ?? 0)
        let preferredThickness: CGFloat = trackThickness ?? bounds.height
        switch direction {
        /// 合并处理 .leftToRight、.rightToLeft 分支
        case .leftToRight, .rightToLeft:
            let trackWidth = max(0, bounds.width - 2 * hInset)
            let availableHeight = max(0, bounds.height - 2 * vInset)
            let trackHeight = min(max(0, preferredThickness), availableHeight)
            let trackFrame = CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
            trackView
                .byFrame(trackFrame)
                .byCornerRadius(trackHeight / 2)
            fillView.byCornerRadius(trackHeight / 2)
            let fillWidth = trackWidth * displayProgress
            if direction == .leftToRight {
                fillView.byFrame(CGRect(x: 0, y: 0, width: fillWidth, height: trackHeight))
            } else {
                fillView.byFrame(CGRect(x: trackWidth - fillWidth, y: 0, width: fillWidth, height: trackHeight))
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
        /// 合并处理 .bottomToTop、.topToBottom 分支
        case .bottomToTop, .topToBottom:
            let availableWidth = max(0, bounds.width - 2 * hInset)
            let trackWidth = min(max(0, preferredThickness), availableWidth)
            let trackHeight = max(0, bounds.height - 2 * vInset)
            let trackFrame = CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
            trackView
                .byFrame(trackFrame)
                .byCornerRadius(trackWidth / 2)
            fillView.byCornerRadius(trackWidth / 2)
            let fillHeight = trackHeight * displayProgress
            if direction == .bottomToTop {
                let y = trackHeight - fillHeight
                fillView.byFrame(CGRect(x: 0, y: y, width: trackWidth, height: fillHeight))
            } else {
                fillView.byFrame(CGRect(x: 0, y: 0, width: trackWidth, height: fillHeight))
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

    private func updateProgressBubbleChangeState(from oldValue: CGFloat,
                                                 to newValue: CGFloat) {
        guard abs(newValue - oldValue) > 0.000_001 else { return }
        progressBubbleHideWorkItem?.cancel()
        progressBubbleHideWorkItem = nil
        switch progressBubbleDisplayMode {
        /// 常显模式由布局阶段持续保持可见
        case .always:
            setNeedsLayout()
        /// 变化模式在最后一次更新后延迟隐藏
        case .whileChanging:
            isProgressBubbleChangeVisible = true
            setNeedsLayout()
            let workItem = DispatchWorkItem { [weak self] in
                guard let self else { return }
                self.isProgressBubbleChangeVisible = false
                self.progressBubbleHideWorkItem = nil
                self.setNeedsLayout()
            }
            progressBubbleHideWorkItem = workItem
            DispatchQueue.main.asyncAfter(
                deadline: .now() + max(0.05, progressBubbleHideDelay),
                execute: workItem
            )
        }
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
        let oldProgress = _progress
        _progress = clamped
        updateProgressBubbleChangeState(from: oldProgress, to: clamped)
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
        guard let v = Double(t) else { return nil };return setDisplayPercent(CGFloat(v), animated: animated, duration: duration)
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
        /// 处理 .countUp 分支
        case .countUp:
            raw = displayRatio
        /// 处理 .countDown 分支
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
        /// 合并处理 .leftToRight、.rightToLeft 分支
        case .leftToRight, .rightToLeft:
            let trackWidth = max(0, bounds.width - 2 * hInset)
            let availableHeight = max(0, bounds.height - 2 * vInset)
            let trackHeight = min(max(0, preferredThickness), availableHeight)
            return CGRect(x: hInset, y: vInset, width: trackWidth, height: trackHeight)
        /// 合并处理 .bottomToTop、.topToBottom 分支
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
        /// 处理 .countUp 分支
        case .countUp:
            return clamped
        /// 处理 .countDown 分支
        case .countDown:
            return 1 - clamped
        }
    }

    private func rawProgressValue(fromDisplay display: CGFloat) -> CGFloat {
        let clamped = max(0, min(display, 1))
        switch valueMode {
        /// 处理 .countUp 分支
        case .countUp:
            return clamped
        /// 处理 .countDown 分支
        case .countDown:
            return 1 - clamped
        }
    }

    private func displayProgress(from location: CGPoint) -> CGFloat {
        let tf = currentTrackFrame()
        guard tf.width > 0, tf.height > 0 else { return displayProgressValue(forRaw: _progress) }
        switch direction {
        /// 处理 .leftToRight 分支
        case .leftToRight:
            return max(0, min(1, (location.x - tf.minX) / tf.width))
        /// 处理 .rightToLeft 分支
        case .rightToLeft:
            return max(0, min(1, (tf.maxX - location.x) / tf.width))
        /// 处理 .topToBottom 分支
        case .topToBottom:
            return max(0, min(1, (location.y - tf.minY) / tf.height))
        /// 处理 .bottomToTop 分支
        case .bottomToTop:
            return max(0, min(1, (tf.maxY - location.y) / tf.height))
        }
    }

    private func axisSpeed(from velocity: CGPoint) -> CGFloat {
        switch direction {
        /// 合并处理 .leftToRight、.rightToLeft 分支
        case .leftToRight, .rightToLeft:
            return abs(velocity.x)
        /// 合并处理 .topToBottom、.bottomToTop 分支
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
            UIView.jobsAnimateWithSpring(
                dragging ? 0.12 : 0.18,
                delay: 0,
                dampingRatio: dragging ? 0.85 : 0.92,
                initialVelocity: dragging ? 0.6 : 0.5,
                options: [.beginFromCurrentState, .allowUserInteraction],
                animations: { [weak self] in
                    self?.thumbImageView.transform = target
                }
            )
        }
        guard pressEnhancesShadowAndHighlight else { return }
        let dur: CFTimeInterval = dragging ? 0.12 : 0.18
        CATransaction.begin()
        CATransaction.setAnimationDuration(dur)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: .easeOut))
        if dragging {
            thumbImageView
                .byShadowOpacity(min(1, baseShadowOpacity + pressedShadowOpacityBoost))
                .byShadowRadius(baseShadowRadius + pressedShadowRadiusBoost)
            thumbHighlightLayer.byOpacity(pressedHighlightOpacity)
        } else {
            thumbImageView
                .byShadowOpacity(baseShadowOpacity)
                .byShadowRadius(baseShadowRadius)
            thumbHighlightLayer.byOpacity(0)
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
            thumbImageView.byHidden(true)
            return
        }
        thumbImageView
            .byHidden(false)
            .byContentMode(thumbContentMode)
        let defaultSide = max(0, thickness)
        let size = thumbSize ?? CGSize(width: defaultSide, height: defaultSide)
        thumbImageView.byBounds(CGRect(origin: .zero, size: size))
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
            /// 处理 .leftToRight 分支
            case .leftToRight:
                c.x = max(c.x, trackFrame.minX + halfW)
            /// 处理 .rightToLeft 分支
            case .rightToLeft:
                c.x = min(c.x, trackFrame.maxX - halfW)
            /// 处理 .topToBottom 分支
            case .topToBottom:
                c.y = max(c.y, trackFrame.minY + halfH)
            /// 处理 .bottomToTop 分支
            case .bottomToTop:
                c.y = min(c.y, trackFrame.maxY - halfH)
            }
        } else if displayProgress >= 1 - eps {
            switch direction {
            /// 处理 .leftToRight 分支
            case .leftToRight:
                c.x = min(c.x, trackFrame.maxX - halfW)
            /// 处理 .rightToLeft 分支
            case .rightToLeft:
                c.x = max(c.x, trackFrame.minX + halfW)
            /// 处理 .topToBottom 分支
            case .topToBottom:
                c.y = min(c.y, trackFrame.maxY - halfH)
            /// 处理 .bottomToTop 分支
            case .bottomToTop:
                c.y = max(c.y, trackFrame.minY + halfH)
            }
        }
        // 你原来的 clamp（可保留，避免 thumbOffset 推太离谱）
        c.x = min(max(c.x, bounds.minX - halfW), bounds.maxX + halfW)
        c.y = min(max(c.y, bounds.minY - halfH), bounds.maxY + halfH)
        thumbImageView.byCenter(c)
        thumbHighlightLayer
            .byFrame(thumbImageView.bounds)
            .byCornerRadius(thumbCornerRadius ?? min(size.width, size.height) / 2)
            .byBorderWidth(pressedHighlightWidth)
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
            borderColor = (fillView.backgroundColor ?? JobsCor.clear)
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
        thumbImageView
            .byBackgroundColor(bgColor)
            .byBorderColor(borderColor)
            .byBorderWidth(borderWidth)
            .byShadowColor((shadowColor ?? JobsCor.black))
            .byShadowOpacity(shadowOpacity)
            .byShadowRadius(shadowRadius)
            .byShadowOffset(shadowOffset)
            .byMasksToBounds(false)
        baseShadowColor = shadowColor
        baseShadowOpacity = shadowOpacity
        baseShadowRadius = shadowRadius
        baseShadowOffset = shadowOffset
        if isUserDragging, pressEnhancesShadowAndHighlight {
            thumbImageView
                .byShadowOpacity(min(1, baseShadowOpacity + pressedShadowOpacityBoost))
                .byShadowRadius(baseShadowRadius + pressedShadowRadiusBoost)
            thumbHighlightLayer.byOpacity(pressedHighlightOpacity)
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
        self.trackView.byBackgroundColor(color)
        return self
    }

    @discardableResult
    public func byFillColor(_ color: UIColor) -> Self {
        self.fillView.byBackgroundColor(color)
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
    public func byProgressBubblePlacement(_ placement: JobsProgressBubblePlacement) -> Self {
        self.progressLabelPlacement = placement
        return self
    }

    @discardableResult
    public func byProgressBubbleDisplayMode(_ mode: JobsProgressBubbleDisplayMode) -> Self {
        self.progressBubbleDisplayMode = mode
        return self
    }

    @discardableResult
    public func byProgressBubbleHideDelay(_ delay: TimeInterval) -> Self {
        self.progressBubbleHideDelay = max(0, delay)
        return self
    }

    @discardableResult
    public func byProgressBubbleCornerRadius(_ radius: CGFloat) -> Self {
        self.progressBubbleCornerRadius = max(0, radius)
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
        self.progressLabel.byFont(font)
        return self
    }

    @discardableResult
    public func byLabelTextColor(_ color: UIColor) -> Self {
        self.progressLabel.byTextColor(color)
        return self
    }

    @discardableResult
    public func byLabelBackgroundColor(_ color: UIColor) -> Self {
        self.progressBubbleBackgroundColor = color
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
                              color: UIColor? = JobsCor.black) -> Self {
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
        let v = UILabel.jobsMake { _ in }
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byText("0%")
            .byBackgroundColor(JobsCor.clear)
            .byMasksToBounds(NO)
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
        let anchor = thumbImageView.isHidden
        ? CGPoint(x: endpointX, y: trackFrame.midY)
        : thumbImageView.center
        let headFrame = thumbImageView.isHidden
        ? CGRect(x: endpointX, y: trackFrame.minY, width: 0, height: trackFrame.height)
        : thumbImageView.frame
        layoutProgressBubble(anchor: anchor, headFrame: headFrame)
    }

    fileprivate func layoutProgressLabelForVertical(endpointY: CGFloat,
                                                   trackFrame: CGRect) {
        let anchor = thumbImageView.isHidden
        ? CGPoint(x: trackFrame.midX, y: endpointY)
        : thumbImageView.center
        let headFrame = thumbImageView.isHidden
        ? CGRect(x: trackFrame.minX, y: endpointY, width: trackFrame.width, height: 0)
        : thumbImageView.frame
        layoutProgressBubble(anchor: anchor, headFrame: headFrame)
    }

    private func layoutProgressBubble(anchor: CGPoint,
                                      headFrame: CGRect) {
        progressLabel.sizeToFit()
        let horizontalMargin: CGFloat = 4
        let availableWidth = max(0, bounds.width - horizontalMargin * 2)
        let bubbleWidth = min(
            max(44, progressLabel.bounds.width + 20),
            availableWidth
        )
        let bubbleHeight = max(28, progressLabel.bounds.height + 10)
        let halfBubbleWidth = bubbleWidth / 2
        let minimumCenterX = bounds.minX + horizontalMargin + halfBubbleWidth
        let maximumCenterX = bounds.maxX - horizontalMargin - halfBubbleWidth
        let centerX = maximumCenterX >= minimumCenterX
        ? min(max(anchor.x, minimumCenterX), maximumCenterX)
        : bounds.midX
        let spacing = max(0, progressLabelSpacing)
        let arrowHeight: CGFloat = 6
        let arrowHalfWidth: CGFloat = 5
        let bubbleFrame: CGRect
        let arrowPath: UIBezierPath
        switch progressLabelPlacement {
        /// 气泡位于进度头上方，小三角向下指向进度头
        case .top:
            let arrowTipY = headFrame.minY - spacing
            bubbleFrame = CGRect(
                x: centerX - halfBubbleWidth,
                y: arrowTipY - arrowHeight - bubbleHeight,
                width: bubbleWidth,
                height: bubbleHeight
            )
            let arrowTipX = min(
                max(anchor.x, bubbleFrame.minX + arrowHalfWidth),
                bubbleFrame.maxX - arrowHalfWidth
            )
            arrowPath = UIBezierPath.make()
                .byMove(to: CGPoint(x: arrowTipX - arrowHalfWidth, y: bubbleFrame.maxY))
                .byAddLine(to: CGPoint(x: arrowTipX, y: arrowTipY))
                .byAddLine(to: CGPoint(x: arrowTipX + arrowHalfWidth, y: bubbleFrame.maxY))
                .byClose()
        /// 气泡位于进度头下方，小三角向上指向进度头
        case .bottom:
            let arrowTipY = headFrame.maxY + spacing
            bubbleFrame = CGRect(
                x: centerX - halfBubbleWidth,
                y: arrowTipY + arrowHeight,
                width: bubbleWidth,
                height: bubbleHeight
            )
            let arrowTipX = min(
                max(anchor.x, bubbleFrame.minX + arrowHalfWidth),
                bubbleFrame.maxX - arrowHalfWidth
            )
            arrowPath = UIBezierPath.make()
                .byMove(to: CGPoint(x: arrowTipX - arrowHalfWidth, y: bubbleFrame.minY))
                .byAddLine(to: CGPoint(x: arrowTipX, y: arrowTipY))
                .byAddLine(to: CGPoint(x: arrowTipX + arrowHalfWidth, y: bubbleFrame.minY))
                .byClose()
        /// 隐藏模式保留进度更新，但不绘制气泡
        case .hidden:
            setProgressBubbleVisible(NO)
            return
        }
        let cornerRadius = min(
            max(0, progressBubbleCornerRadius),
            min(bubbleFrame.width, bubbleFrame.height) / 2
        )
        let bubblePath = UIBezierPath
            .make(roundedRect: bubbleFrame, cornerRadius: cornerRadius)
            .byAppend(arrowPath)
        let resolvedBackgroundColor: UIColor
        if #available(iOS 13.0, *) {
            resolvedBackgroundColor = progressBubbleBackgroundColor.resolvedColor(with: traitCollection)
        } else {
            resolvedBackgroundColor = progressBubbleBackgroundColor
        }
        progressLabel.byFrame(bubbleFrame)
        progressBubbleLayer
            .byFrame(bounds)
            .byPath(bubblePath.cgPath)
            .byFillColor(resolvedBackgroundColor)
        setProgressBubbleVisible(shouldShowProgressBubble)
    }

    private var shouldShowProgressBubble: Bool {
        if autoHideLabel, bounds.height < labelMinVisibleHeight { return false }
        switch progressBubbleDisplayMode {
        /// 常显模式只受 placement 和最小高度规则控制
        case .always:
            return true
        /// 变化模式由最近一次进度更新激活
        case .whileChanging:
            return isProgressBubbleChangeVisible
        }
    }

    private func setProgressBubbleVisible(_ visible: Bool) {
        progressLabel.byHidden(!visible)
        progressBubbleLayer.byHidden(!visible)
    }
}
