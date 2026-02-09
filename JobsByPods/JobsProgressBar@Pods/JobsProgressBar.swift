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
import ObjectiveC
#endif

import JobsSwiftBaseDefines
import JobsSwiftTimer

/// 进度标签显示位置
public enum JobsProgressLabelPlacement {
    /// 在进度条上方（水平/垂直通用）
    case top
    /// 在进度条下方（水平/垂直通用）
    case bottom
    /// 隐藏
    case hidden
}

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

    /// 进度百分比标签显示位置（默认 .top）
    public var progressLabelPlacement: JobsProgressLabelPlacement = .top {
        didSet {
            if autoStopOnExternalChange { stopAutoProgress() }
            setNeedsLayout()
        }
    }
    /// 标签与进度条之间的间距（默认 6）
    public var progressLabelSpacing: CGFloat = 6 {
        didSet { setNeedsLayout() }
    }

    public var autoHideLabel: Bool = true {
        didSet { setNeedsLayout() }
    }
    /// 触发自动隐藏的最小高度阈值（默认 18）
    /// JobsProgressBar.height < 18 时隐藏 label（比如 12 高的条就自动隐藏）
    public var labelMinVisibleHeight: CGFloat = 18 {
        didSet { setNeedsLayout() }
    }

#if os(iOS) || os(tvOS)
// MARK: - Thumb Config（进度条“头”）
/// 进度条“头”的图片（UIImageView）
/// - nil：不显示
public var thumbImage: UIImage? {
    didSet {
        thumbImageView.image = thumbImage
#if os(iOS) || os(tvOS)
        thumbImageView.isHidden = (thumbImage == nil)
#endif
        setNeedsLayout()
    }
}

/// 进度条“头”的尺寸
/// - nil：默认 = 轨道厚度（横向=高度，纵向=宽度），即正方形
public var thumbSize: CGSize? {
    didSet { setNeedsLayout() }
}

/// 进度条“头”相对“端点”的偏移（默认 .zero）
public var thumbOffset: UIOffset = .zero {
    didSet { setNeedsLayout() }
}

/// 进度条“头”的 contentMode（默认 .scaleAspectFit）
public var thumbContentMode: UIView.ContentMode = .scaleAspectFit {
    didSet { thumbImageView.contentMode = thumbContentMode }
}

/// 进度条“头”的圆角（默认 nil：不处理）
public var thumbCornerRadius: CGFloat? {
    didSet {
        let r = thumbCornerRadius ?? 0
        thumbImageView.layer.cornerRadius = r
        thumbImageView.layer.masksToBounds = (r > 0)
    }
}

/// ✅ 让“头”跟随 fillView 样式（颜色 / 描边 / 阴影）
public var thumbFollowsFillStyle: Bool = false {
    didSet { setNeedsLayout() }
}

/// Thumb 背景色（当 thumbFollowsFillStyle == false 时生效）
public var thumbBackgroundColor: UIColor? {
    didSet { setNeedsLayout() }
}

/// Thumb 描边颜色（当 thumbFollowsFillStyle == false 时生效）
public var thumbBorderColor: UIColor? {
    didSet { setNeedsLayout() }
}

/// Thumb 描边宽度（当 thumbFollowsFillStyle == false 时生效）
public var thumbBorderWidth: CGFloat = 0 {
    didSet { setNeedsLayout() }
}

/// Thumb 阴影（当 thumbFollowsFillStyle == false 时生效）
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


#endif
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
    /// 显示百分比的标签（通过 extension 挂载，避免污染“可视主体”）
#if os(iOS) || os(tvOS)
/// 进度条“头”（图片）
/// - ✅ 放在 self 上，不在 trackView 内，因此不会被 track 裁切
private lazy var thumbImageView: UIImageView = {
    let v = UIImageView()
    v.isHidden = true
    v.contentMode = thumbContentMode
    v.clipsToBounds = false
    self.addSubview(v)
    return v
}()

    // ================================== Thumb Rotation ==================================
    /// thumb 在“进度动画进行中”是否旋转（默认 true）
    public var thumbRotatesWhileAnimating: Bool = true {
        didSet {
            if thumbRotatesWhileAnimating == false {
                stopThumbRotation()
            }
        }
    }
    /// thumb 旋转一圈时长（秒，默认 0.85），数值越小转得越快
    public var thumbRotationDuration: CFTimeInterval = 0.85

    private let thumbRotationAnimationKey = "jobs.progress.thumb.rotation"
    private var isAutoAnimating: Bool = false
    private var lastDisplayProgress: CGFloat?
    private var lastRotationSign: CGFloat = 1

    private func displayProgressValue(forRaw raw: CGFloat) -> CGFloat {
        let clamped = max(0, min(raw, 1))
        switch valueMode {
        case .countUp:
            return clamped
        case .countDown:
            return 1 - clamped
        }
    }

    /// sign: +1 = 顺时针，-1 = 逆时针
    private func startThumbRotationIfNeeded(sign: CGFloat) {
        guard thumbRotatesWhileAnimating else { return }
        guard thumbImage != nil else { return }
        guard thumbImageView.isHidden == false else { return }

        let normalizedSign: CGFloat = (sign >= 0) ? 1 : -1

        // 方向没变且已在转：不重复 add
        if thumbImageView.layer.animation(forKey: thumbRotationAnimationKey) != nil,
           normalizedSign == lastRotationSign {
            return
        }

        // 取当前角度（用于无缝衔接、避免“跳回 0 度”）
        var current: CGFloat = 0
        if let p = thumbImageView.layer.presentation(),
           let v = p.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            current = v
        } else if let v = thumbImageView.layer.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            current = v
        }

        // 固化当前角度，确保 removeAnimation 不会回弹
        thumbImageView.layer.removeAnimation(forKey: thumbRotationAnimationKey)
        thumbImageView.layer.setValue(current, forKeyPath: "transform.rotation.z")

        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = current
        anim.toValue = current + normalizedSign * (.pi * 2)
        anim.duration = max(0.25, thumbRotationDuration)
        anim.repeatCount = .infinity
        anim.isRemovedOnCompletion = false
        anim.fillMode = .forwards
        anim.timingFunction = CAMediaTimingFunction(name: .linear)

        thumbImageView.layer.add(anim, forKey: thumbRotationAnimationKey)
        lastRotationSign = normalizedSign
    }

    private func stopThumbRotation() {
        // 固化当前角度后再移除，避免停止时“跳一下”
        if let p = thumbImageView.layer.presentation(),
           let v = p.value(forKeyPath: "transform.rotation.z") as? CGFloat {
            thumbImageView.layer.setValue(v, forKeyPath: "transform.rotation.z")
        }
        thumbImageView.layer.removeAnimation(forKey: thumbRotationAnimationKey)
    }

    private func stopThumbRotation(after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            // 自动播放期间不允许被“短动画”提前停掉
            if self.isAutoAnimating == false {
                self.stopThumbRotation()
            }
        }
    }

#endif


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
        // 允许 progressLabel 超出自身 bounds 显示在上/下方
        clipsToBounds = false
        layer.masksToBounds = false
        backgroundColor = .clear
        trackView.byVisible(true)
        fillView.byVisible(true)
        progressLabel.byVisible(true)
#if os(iOS) || os(tvOS)
        thumbImageView.isHidden = (thumbImage == nil)
#endif
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
        // 更新文案（label 由 extension 挂载）
        updateProgressLabelText(p)
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

            // 终点（用于 thumb/label 跟随）
            let endpointX: CGFloat = (direction == .leftToRight)
            ? (trackFrame.minX + fillWidth)
            : (trackFrame.maxX - fillWidth)
#if os(iOS) || os(tvOS)
            // ✅ 进度条“头”（永远不被 track 裁切）
            layoutThumb(center: CGPoint(x: endpointX, y: trackFrame.midY),
                        thickness: trackHeight)
#endif


                        // label（外挂）：在进度条上/下方展示，不再挤在轨道内部
            layoutProgressLabelForHorizontal(endpointX: endpointX, trackFrame: trackFrame)
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

            // 终点（用于 thumb/label 跟随）
            let endpointY: CGFloat = (direction == .bottomToTop)
            ? (trackFrame.minY + (trackHeight - fillHeight))
            : (trackFrame.minY + fillHeight)
#if os(iOS) || os(tvOS)
            // ✅ 进度条“头”（永远不被 track 裁切）
            layoutThumb(center: CGPoint(x: trackFrame.midX, y: endpointY),
                        thickness: trackWidth)
#endif


                        // label（外挂）：在进度条上/下方展示
            layoutProgressLabelForVertical(endpointY: endpointY, trackFrame: trackFrame)
        }
    }

#if os(iOS) || os(tvOS)
/// 布局进度条“头”
/// - ✅ Thumb 在 self 上，不受 trackView.masksToBounds 影响，因此允许超出 track
private func layoutThumb(center: CGPoint,
                         thickness: CGFloat) {
    guard thumbImage != nil else {
        thumbImageView.isHidden = true
        return
    }
    thumbImageView.isHidden = false
    thumbImageView.contentMode = thumbContentMode

    // 默认 size = 轨道厚度（正方形）
    let defaultSide = max(0, thickness)
    let size = thumbSize ?? CGSize(width: defaultSide, height: defaultSide)
    thumbImageView.bounds = CGRect(origin: .zero, size: size)

    // 样式同步（可选）
    applyThumbStyleIfNeeded()

    var c = center
    c.x += thumbOffset.horizontal
    c.y += thumbOffset.vertical

    // ✅ 允许超出 track；同时避免完全飞出控件：保留半个可见
    let halfW = size.width / 2
    let halfH = size.height / 2
    c.x = min(max(c.x, bounds.minX - halfW), bounds.maxX + halfW)
    c.y = min(max(c.y, bounds.minY - halfH), bounds.maxY + halfH)

    thumbImageView.center = c
}

/// 让 Thumb 跟随 fillView 样式（或使用自定义样式）
private func applyThumbStyleIfNeeded() {
    if thumbFollowsFillStyle {
        thumbImageView.backgroundColor = fillView.backgroundColor
        thumbImageView.layer.borderColor = (fillView.backgroundColor ?? UIColor.clear).cgColor
        thumbImageView.layer.borderWidth = max(0, thumbBorderWidth)

        thumbImageView.layer.shadowColor = (thumbShadowColor ?? UIColor.black).cgColor
        thumbImageView.layer.shadowOpacity = max(0, thumbShadowOpacity)
        thumbImageView.layer.shadowRadius = max(0, thumbShadowRadius)
        thumbImageView.layer.shadowOffset = thumbShadowOffset
        thumbImageView.layer.masksToBounds = false
    } else {
        thumbImageView.backgroundColor = thumbBackgroundColor
        thumbImageView.layer.borderColor = thumbBorderColor?.cgColor
        thumbImageView.layer.borderWidth = max(0, thumbBorderWidth)

        thumbImageView.layer.shadowColor = (thumbShadowColor ?? UIColor.black).cgColor
        thumbImageView.layer.shadowOpacity = max(0, thumbShadowOpacity)
        thumbImageView.layer.shadowRadius = max(0, thumbShadowRadius)
        thumbImageView.layer.shadowOffset = thumbShadowOffset
        thumbImageView.layer.masksToBounds = false
    }
}

#endif

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
        #if os(iOS) || os(tvOS)
        isAutoAnimating = true
        if animated {
            // 以“显示进度”的变化方向判断：往前跑=顺时针；往后跑=逆时针
            let displayDelta = (valueMode == .countUp) ? step : -step
            startThumbRotationIfNeeded(sign: displayDelta >= 0 ? 1 : -1)
        }
        #endif

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
        #if os(iOS) || os(tvOS)
        isAutoAnimating = false
        stopThumbRotation()
        #endif
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


        #if os(iOS) || os(tvOS)
        // 动画期间根据“进度是往前跑还是往后退”决定旋转方向（顺时针/逆时针）
        if animated {
            let newDisplay = displayProgressValue(forRaw: clamped)
            let oldDisplay = lastDisplayProgress ?? newDisplay
            let delta = newDisplay - oldDisplay
            let eps: CGFloat = 0.0005
            let sign: CGFloat
            if abs(delta) < eps {
                sign = lastRotationSign
            } else {
                sign = (delta > 0) ? 1 : -1
            }
            lastDisplayProgress = newDisplay
            startThumbRotationIfNeeded(sign: sign)

            // 非自动播放：短动画结束后停转（保留当前角度）
            if isAutoAnimating == false {
                stopThumbRotation(after: max(0.05, duration))
            }
        } else {
            // 非动画更新也要同步记录，避免下一次 delta 判定抖动
            lastDisplayProgress = displayProgressValue(forRaw: clamped)
        }
        #endif

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
    public func byFillColor(_ color: UIColor) -> Self {
        self.fillView.backgroundColor = color
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


#if os(iOS) || os(tvOS)
// MARK: - Thumb DSL
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
public func byThumbBackgroundColor(_ c: UIColor?) -> Self {
    self.thumbBackgroundColor = c
    return self
}

@discardableResult
public func byThumbBorder(_ width: CGFloat, color: UIColor?) -> Self {
    self.thumbBorderWidth = width
    self.thumbBorderColor = color
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

#endif

    @discardableResult
    public func byDisplayPercent(_ percent: CGFloat,
                                 animated: Bool = false,
                                 duration: TimeInterval = 0.25) -> Self {
        _ = setDisplayPercent(percent, animated: animated, duration: duration)
        return self
    }
}



// MARK: - Progress Label (Decoupled via Extension)
private struct _JobsProgressBarAssociatedKeys {
    static var progressLabelKey: UInt8 = 0
}

extension JobsProgressBar {

    fileprivate var progressLabel: UILabel {
        if let v = objc_getAssociatedObject(self, &_JobsProgressBarAssociatedKeys.progressLabelKey) as? UILabel {
            return v
        }
        let v = UILabel()
        v.font = .monospacedDigitSystemFont(ofSize: 12, weight: .medium)
        v.textColor = JobsCor.label
        v.textAlignment = .center
        v.text = "0%"
        v.backgroundColor = JobsCor.secondarySystemBackground
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        v.isUserInteractionEnabled = false
        // ✅ 作为 JobsProgressBar 的“外挂”视图：仍由进度条负责驱动，但不侵入 track/fill 主体结构
        self.addSubview(v)
        objc_setAssociatedObject(self, &_JobsProgressBarAssociatedKeys.progressLabelKey, v, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return v
    }

    fileprivate func updateProgressLabelText(_ displayProgress: CGFloat) {
        let percent = Int(round(displayProgress * 100))
        progressLabel.text = "\(percent)%"
    }

    fileprivate func layoutProgressLabelForHorizontal(endpointX: CGFloat,
                                                     trackFrame: CGRect) {
        // placement 决定显示/隐藏
        switch progressLabelPlacement {
        case .hidden:
            progressLabel.isHidden = true
            return
        case .top, .bottom:
            break
        }

        // 小高度时自动隐藏（避免挡 UI）
        if autoHideLabel, bounds.height < labelMinVisibleHeight {
            progressLabel.isHidden = true
            return
        } else {
            progressLabel.isHidden = false
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

        progressLabel.center = CGPoint(x: centerX, y: centerY)
    }

    fileprivate func layoutProgressLabelForVertical(endpointY: CGFloat,
                                                   trackFrame: CGRect) {
        switch progressLabelPlacement {
        case .hidden:
            progressLabel.isHidden = true
            return
        case .top, .bottom:
            break
        }

        if autoHideLabel, bounds.height < labelMinVisibleHeight {
            progressLabel.isHidden = true
            return
        } else {
            progressLabel.isHidden = false
        }

        progressLabel.sizeToFit()
        let labelSize = CGSize(
            width: progressLabel.bounds.width + 8,
            height: progressLabel.bounds.height + 4
        )
        progressLabel.bounds.size = labelSize

        // ✅ 垂直方向也统一为“上/下”展示：x 居中到轨道
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
