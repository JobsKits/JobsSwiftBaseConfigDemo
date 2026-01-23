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
    /// 几何方向：决定填充从哪边往哪边走
    public enum Direction {
        case leftToRight
        case rightToLeft
        case bottomToTop
        case topToBottom
    }
    /// 数值模式：决定“0~1”是显示为 0→100 还是 100→0
    public enum ValueMode {
        /// 0 → 1 显示为 0% → 100%
        case countUp
        /// 0 → 1 显示为 100% → 0%
        case countDown
    }
    // MARK: - Public API
    /// 进度方向（几何）
    public var direction: Direction = .leftToRight {
        didSet {
            if autoStopOnExternalChange { stopAutoProgress() }
            setNeedsLayout()
        }
    }
    /// 数值模式（0→100 / 100→0）
    public var valueMode: ValueMode = .countUp {
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
    /// 轨道（背景）
    private lazy var trackView: UIView = {
        UIView()
            .byBgColor(JobsCor.systemGray5)
            .byMasksToBounds(true)
            .byAddTo(self)
    }()
    /// 填充（前景）
    private lazy var fillView: UIView = {
        UIView()
            .byBgColor(.systemBlue)
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
        // 使用时触发懒加载
        trackView.byVisible(true)
        fillView.byVisible(true)
        progressLabel.byVisible(true)
    }

    open override var intrinsicContentSize: CGSize {
        // 默认高度给个 40，方便直接用 Auto Layout
        return CGSize(width: UIView.noIntrinsicMetric, height: 40)
    }
    // MARK: - Layout
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutForCurrentState()
    }

    private func layoutForCurrentState() {
        // 标准进度 0~1
        let raw = max(0, min(_progress, 1))

        // 根据数值模式得到“显示用进度”
        // .countUp   : 0 → 1
        // .countDown : 1 → 0
        let p: CGFloat
        switch valueMode {
        case .countUp:
            p = raw
        case .countDown:
            p = 1 - raw
        }

        // 先根据 p 更新文案（很关键，要在 sizeToFit 之前）
        let percent = Int(round(p * 100))
        progressLabel.text = "\(percent)%"

        let horizontalInset: CGFloat = 8
        let verticalInset: CGFloat = 8
        let trackThickness: CGFloat = 6
        let labelOffset: CGFloat = 4

        switch direction {
        case .leftToRight, .rightToLeft:
            // 水平进度条：放在底部
            let trackWidth = max(0, bounds.width - 2 * horizontalInset)
            let trackHeight = trackThickness
            let trackY = bounds.height - trackHeight - verticalInset
            let trackFrame = CGRect(x: horizontalInset,
                                    y: trackY,
                                    width: trackWidth,
                                    height: trackHeight)
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackHeight / 2
            fillView.layer.cornerRadius = trackHeight / 2

            let fillWidth = trackWidth * p

            if direction == .leftToRight {
                fillView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: fillWidth,
                                        height: trackHeight)
            } else {
                fillView.frame = CGRect(x: trackWidth - fillWidth,
                                        y: 0,
                                        width: fillWidth,
                                        height: trackHeight)
            }

            // 更新 Label 尺寸（这时候 text 已经是“xx%”）
            progressLabel.sizeToFit()
            let labelSize = CGSize(width: progressLabel.bounds.width + 8,
                                   height: progressLabel.bounds.height + 4)
            progressLabel.bounds.size = labelSize

            // 端点 x（在 self 坐标系里）
            let endpointX: CGFloat
            if direction == .leftToRight {
                endpointX = trackFrame.minX + fillWidth
            } else {
                endpointX = trackFrame.maxX - fillWidth
            }

            // clamp，防止越界
            var centerX = endpointX
            let minX = trackFrame.minX + labelSize.width / 2
            let maxX = trackFrame.maxX - labelSize.width / 2
            centerX = min(max(centerX, minX), maxX)

            let centerY = trackFrame.minY - labelOffset - labelSize.height / 2
            let finalCenterY = max(labelSize.height / 2, centerY)

            progressLabel.center = CGPoint(x: centerX, y: finalCenterY)

        case .bottomToTop, .topToBottom:
            // 垂直进度条：放在左侧
            let trackWidth = trackThickness
            let trackHeight = max(0, bounds.height - 2 * verticalInset)
            let trackX = horizontalInset
            let trackFrame = CGRect(x: trackX,
                                    y: verticalInset,
                                    width: trackWidth,
                                    height: trackHeight)
            trackView.frame = trackFrame
            trackView.layer.cornerRadius = trackWidth / 2
            fillView.layer.cornerRadius = trackWidth / 2

            let fillHeight = trackHeight * p

            if direction == .bottomToTop {
                let y = trackHeight - fillHeight
                fillView.frame = CGRect(x: 0,
                                        y: y,
                                        width: trackWidth,
                                        height: fillHeight)
            } else {
                fillView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: trackWidth,
                                        height: fillHeight)
            }

            // 更新 Label 尺寸（同样在 text 更新之后）
            progressLabel.sizeToFit()
            let labelSize = CGSize(width: progressLabel.bounds.width + 8,
                                   height: progressLabel.bounds.height + 4)
            progressLabel.bounds.size = labelSize

            // 端点 y（在 self 坐标系里）
            let endpointY: CGFloat
            if direction == .bottomToTop {
                endpointY = trackFrame.minY + (trackHeight - fillHeight)
            } else {
                endpointY = trackFrame.minY + fillHeight
            }

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
    /// 内置自动动画：标准进度从当前值开始向 1.0 递增，直到结束
    ///
    /// - Parameters:
    ///   - fromZero: 是否从 0 开始（默认 true）
    ///   - step: 每次 tick 增量（默认 0.01）
    ///   - interval: tick 间隔（默认 0.03）
    ///   - animated: 每次 setProgress 是否带动画（默认 true）
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

        // ✅ 不对外暴露 JobsTimerKind：内部固定用 .gcd
        let t = JobsTimer(kind: .gcd, config: config) { [weak self] in
            guard let self else { return }
            let next = min(1, max(0, self._progress + self.autoStep))
            self._progress = next
            self._isAutoTick = true
            self.setProgress(next, animated: animated, duration: interval)
            self._isAutoTick = false

            if next >= 1 {
                self.stopAutoProgress()
            }
        }

        autoTimer = t
        t.start()
    }

    /// 停止内置自动动画
    public func stopAutoProgress() {
        autoTimer?.stop()
        autoTimer = nil
    }

    // MARK: - Progress API
    /// 设置标准进度 [0, 1]，内部会结合 valueMode 显示为 0→100 或 100→0
    public func setProgress(_ progress: CGFloat,
                            animated: Bool = true,
                            duration: TimeInterval = 0.25) {
        autoStopIfNeeded()

        let clamped = max(0, min(progress, 1))
        _progress = clamped
        if animated {
            setNeedsLayout()
            UIView.animate(withDuration: duration) {
                self.layoutIfNeeded()
            }
        } else {
            setNeedsLayout()
        }
    }
    /// 按“显示百分比”设置进度 [0, 100]
    ///
    /// - parameter percent: 期望显示的百分比（会自动 clamp 到 0~100）
    ///
    /// - 注意：
    ///   - 在 `.countUp` 模式下：0 → 100 = 0 → 1
    ///   - 在 `.countDown` 模式下：100 → 0 = 0 → 1
    ///   - 所以这里是“显示值”，会根据 `valueMode` 反推内部标准进度。
    func setPercent(_ percent: CGFloat,
                    animated: Bool = true,
                    duration: TimeInterval = 0.25) {
        autoStopIfNeeded()

        let clampedPercent = max(0, min(percent, 100))
        let displayRatio = clampedPercent / 100.0

        let raw: CGFloat
        switch valueMode {
        case .countUp:
            raw = displayRatio          // 显示 = raw
        case .countDown:
            raw = 1 - displayRatio      // 显示 = 1 - raw
        }
        setProgress(raw, animated: animated, duration: duration)
    }
}
// MARK: - DSL
extension JobsProgressBar {
    // MARK: - Direction
    /// 配置进度方向（几何）
    @discardableResult
    public func byDirection(_ direction: Direction) -> Self {
        self.direction = direction
        return self
    }
    // MARK: - ValueMode
    /// 配置数值模式：0→100 / 100→0
    @discardableResult
    public func byValueMode(_ mode: ValueMode) -> Self {
        self.valueMode = mode
        return self
    }
    // MARK: - Progress
    /// 配置当前标准进度 [0, 1]
    @discardableResult
    public func byProgress(_ value: CGFloat,
                           animated: Bool = false,
                           duration: TimeInterval = 0.25) -> Self {
        self.setProgress(value, animated: animated, duration: duration)
        return self
    }
    // MARK: - Track
    /// 配置轨道背景色
    @discardableResult
    public func byTrackColor(_ color: UIColor) -> Self {
        self.trackView.backgroundColor = color
        return self
    }
    /// 配置轨道圆角（不配的话默认按高度一半）
    @discardableResult
    public func byTrackCornerRadius(_ radius: CGFloat) -> Self {
        self.trackView.layer.cornerRadius = radius
        return self
    }
    // MARK: - Label
    /// 配置标签字体
    @discardableResult
    public func byLabelFont(_ font: UIFont) -> Self {
        self.progressLabel.font = font
        return self
    }
    /// 配置标签文字颜色
    @discardableResult
    public func byLabelTextColor(_ color: UIColor) -> Self {
        self.progressLabel.textColor = color
        return self
    }
    /// 配置标签背景色
    @discardableResult
    public func byLabelBackgroundColor(_ color: UIColor) -> Self {
        self.progressLabel.backgroundColor = color
        return self
    }
    /// 配置标签圆角
    @discardableResult
    public func byLabelCornerRadius(_ radius: CGFloat) -> Self {
        self.progressLabel.layer.cornerRadius = radius
        self.progressLabel.layer.masksToBounds = true
        return self
    }
    /// 配置当前显示百分比 [0, 100]
    @discardableResult
    public func byPercent(_ percent: CGFloat,
                          animated: Bool = false,
                          duration: TimeInterval = 0.25) -> Self {
        self.setPercent(percent, animated: animated, duration: duration)
        return self
    }
}
