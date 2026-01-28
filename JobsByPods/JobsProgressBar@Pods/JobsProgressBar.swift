//
//  JobsProgressBar.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/10/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines
import JobsSwiftTimer
/// 自定义进度条@进度值和前进方向
open class JobsProgressBar: UIView {
    // MARK: - Public API
    /// 进度方向（几何）
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
    /// 默认 true：更符合直觉，也能避免外层忘记 stop 导致的“抢进度”问题。
    public var autoStopOnExternalChange: Bool = true
    /// 当前进度 [0, 1] —— 始终是“标准进度”：0 = 起点，1 = 终点
    ///
    /// 显示时会根据 `valueMode` 做一次映射：
    /// - .countUp   : 直接用 0~1
    /// - .countDown : 用 1 - progress
    public var progress: CGFloat {
        get { _progress }
        set { setProgress(newValue, animated: false) }
    }
    // MARK: - Track Layout Config (外部可控，避免内部写死)
    /// 轨道/蓝条厚度（横向=高度，纵向=宽度）
    /// - nil：自动（默认 = 控件高度，确保“蓝条高度 = JobsProgressBar 高度”）
    public var trackThickness: CGFloat? {
        didSet { setNeedsLayout() }
    }
    /// 轨道水平 inset（左右/横向）
    /// - nil：自动（默认 0）
    public var trackHorizontalInset: CGFloat? {
        didSet { setNeedsLayout() }
    }
    /// 轨道垂直 inset（上下/纵向）
    /// - nil：自动（默认 0）
    public var trackVerticalInset: CGFloat? {
        didSet { setNeedsLayout() }
    }
    // MARK: - Label Visibility Config (小高度自动隐藏 label)
    /// 是否启用“自动隐藏 label”（默认 true）
    public var autoHideLabel: Bool = true {
        didSet { setNeedsLayout() }
    }
    /// 触发自动隐藏的最小高度阈值（默认 18）
    /// JobsProgressBar.height < 18 时隐藏 label（比如 12 高的条就自动隐藏）
    public var labelMinVisibleHeight: CGFloat = 18 {
        didSet { setNeedsLayout() }
    }
    /// 轨道（背景）
    private lazy var trackView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemGray5)
            .byMasksToBounds(true)
            .byAddTo(self)
    }()
    /// 填充（前景）
    private lazy var fillView: UIView = {
        UIView()
            .byBackgroundColor(.systemBlue)
            .byMasksToBounds(true)
            .byAddTo(trackView)
    }()
    /// 显示百分比的标签（跟随移动）
    private lazy var progressLabel: UILabel = {
        UILabel()
            .byFont(.monospacedDigitSystemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byText("0%")
            .byBgCor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byAddTo(self)
    }()
    // MARK: - Private
    /// 标准进度（0~1），不带模式
    private var _progress: CGFloat = 0
    /// 内置自动动画计时器（JobsSwiftTimer）
    private var autoTimer: JobsSwiftTimerProtocol?
    /// 自动动画步进
    private var autoStep: CGFloat = 0.01
    /// 内部自动 tick 标记：用于避免 setProgress 时把自己的 timer 停掉
    private var _isAutoTick: Bool = false

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
        backgroundColor = .clear
        trackView.byVisible(true)
        fillView.byVisible(true)
        progressLabel.byVisible(true)
    }

    open override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 40)
    }
    // MARK: - Layout
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutForCurrentState()
    }

    private func layoutForCurrentState() {
        // ✅ 小高度时自动隐藏 label（避免挡 UI）
        if autoHideLabel, bounds.height < labelMinVisibleHeight {
            progressLabel.isHidden = true
        } else {
            progressLabel.isHidden = false
        }
        // 标准进度 0~1
        let raw = max(0, min(_progress, 1))
        // 根据数值模式得到“显示用进度”
        let p: CGFloat
        switch valueMode {
        case .countUp:
            p = raw
        case .countDown:
            p = 1 - raw
        }
        // 更新文案
        let percent = Int(round(p * 100))
        progressLabel.text = "\(percent)%"
        // ✅ 不再写死：默认厚度 = 自身高度，默认 inset = 0
        let hInset: CGFloat = max(0, trackHorizontalInset ?? 0)
        let vInset: CGFloat = max(0, trackVerticalInset ?? 0)
        // 厚度：横向=高度，纵向=宽度
        let preferredThickness: CGFloat = trackThickness ?? bounds.height
        // Label 偏移（保持原逻辑）
        let labelOffset: CGFloat = 4
        switch direction {
        case .leftToRight, .rightToLeft:
            let trackWidth = max(0, bounds.width - 2 * hInset)
            let availableHeight = max(0, bounds.height - 2 * vInset)
            let trackHeight = min(max(0, preferredThickness), availableHeight)
            // y：默认贴顶(vInset)，不再写死“放底部再减 8”
            let trackY = vInset
            let trackFrame = CGRect(
                x: hInset,
                y: trackY,
                width: trackWidth,
                height: trackHeight
            )
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackHeight / 2
            fillView.layer.cornerRadius = trackHeight / 2
            let fillWidth = trackWidth * p
            if direction == .leftToRight {
                fillView.frame = CGRect(x: 0, y: 0, width: fillWidth, height: trackHeight)
            } else {
                fillView.frame = CGRect(x: trackWidth - fillWidth, y: 0, width: fillWidth, height: trackHeight)
            }
            // label 隐藏时，不再做 label 布局
            guard progressLabel.isHidden == false else { return }
            progressLabel.sizeToFit()
            let labelSize = CGSize(
                width: progressLabel.bounds.width + 8,
                height: progressLabel.bounds.height + 4
            )
            progressLabel.bounds.size = labelSize
            let endpointX: CGFloat = (direction == .leftToRight)
            ? (trackFrame.minX + fillWidth)
            : (trackFrame.maxX - fillWidth)
            var centerX = endpointX
            let minX = trackFrame.minX + labelSize.width / 2
            let maxX = trackFrame.maxX - labelSize.width / 2
            centerX = min(max(centerX, minX), maxX)
            let centerY = trackFrame.minY - labelOffset - labelSize.height / 2
            let finalCenterY = max(labelSize.height / 2, centerY)
            progressLabel.center = CGPoint(x: centerX, y: finalCenterY)
        case .bottomToTop, .topToBottom:
            let availableWidth = max(0, bounds.width - 2 * hInset)
            let trackWidth = min(max(0, preferredThickness), availableWidth)
            let trackHeight = max(0, bounds.height - 2 * vInset)
            let trackX = hInset
            let trackFrame = CGRect(
                x: trackX,
                y: vInset,
                width: trackWidth,
                height: trackHeight
            )
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackWidth / 2
            fillView.layer.cornerRadius = trackWidth / 2
            let fillHeight = trackHeight * p
            if direction == .bottomToTop {
                let y = trackHeight - fillHeight
                fillView.frame = CGRect(x: 0, y: y, width: trackWidth, height: fillHeight)
            } else {
                fillView.frame = CGRect(x: 0, y: 0, width: trackWidth, height: fillHeight)
            }
            // label 隐藏时，不再做 label 布局
            guard progressLabel.isHidden == false else { return }
            progressLabel.sizeToFit()
            let labelSize = CGSize(
                width: progressLabel.bounds.width + 8,
                height: progressLabel.bounds.height + 4
            )
            progressLabel.bounds.size = labelSize
            let endpointY: CGFloat = (direction == .bottomToTop)
            ? (trackFrame.minY + (trackHeight - fillHeight))
            : (trackFrame.minY + fillHeight)
            var centerY = endpointY
            let minY = trackFrame.minY + labelSize.height / 2
            let maxY = trackFrame.maxY - labelSize.height / 2
            centerY = min(max(centerY, minY), maxY)
            let centerX = trackFrame.maxX + labelOffset + labelSize.width / 2
            let minCenterX = labelSize.width / 2
            let maxCenterX = bounds.width - labelSize.width / 2
            progressLabel.center = CGPoint(
                x: min(max(centerX, minCenterX), maxCenterX),
                y: centerY
            )
        }
    }
    // MARK: - Auto Stop Helper
    private func autoStopIfNeeded() {
        guard autoStopOnExternalChange else { return }
        guard autoTimer != nil else { return }
        guard _isAutoTick == false else { return }
        stopAutoProgress()
    }
    // MARK: - Auto Progress (JobsSwiftTimer)
    public func startAutoProgress(fromZero: Bool = true,
                                  step: CGFloat = 0.01,
                                  interval: TimeInterval = 0.03,
                                  animated: Bool = true) {
        stopAutoProgress()
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
            jobsRunOnMain(self) { bar in
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
    }
    
    public func stopAutoProgress() {
        autoTimer?.stop()
        autoTimer = nil
    }
    // MARK: - Progress API
    public func setProgress(_ progress: CGFloat,
                            animated: Bool = true,
                            duration: TimeInterval = 0.25) {
        autoStopIfNeeded()
        let clamped = max(0, min(progress, 1))
        _progress = clamped

        setNeedsLayout()
        guard animated else { return }

        UIView.animate(withDuration: duration) { [weak self] in
            self?.layoutIfNeeded()
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
    public func byTrackCornerRadius(_ radius: CGFloat) -> Self {
        self.trackView.layer.cornerRadius = radius
        return self
    }
    // ✅ Track layout config
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
    // ✅ Label auto-hide config
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
    public func byLabelCornerRadius(_ radius: CGFloat) -> Self {
        self.progressLabel.layer.cornerRadius = radius
        self.progressLabel.layer.masksToBounds = true
        return self
    }

    @discardableResult
    public func byDisplayPercent(_ percent: CGFloat,
                                 animated: Bool = false,
                                 duration: TimeInterval = 0.25) -> Self {
        _ = setDisplayPercent(percent, animated: animated, duration: duration)
        return self
    }
}
