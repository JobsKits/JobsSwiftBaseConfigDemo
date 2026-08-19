//
//  JobsInstrumentPanelView.swift
//  JobsBy3rdTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsSwiftStandardLibrary
import SnapKit

public final class FTDashboardView: UIView {
    /// 0.0 ~ 1.0
    public private(set) var progress: CGFloat = 0
    /// 起始角度（弧度制：默认 -225°）
    public var startAngle: CGFloat = CGFloat(-225).degreesToRadians { didSet { setNeedsLayout() } }
    /// 结束角度（弧度制：默认 45°）
    public var endAngle: CGFloat = CGFloat(45).degreesToRadians { didSet { setNeedsLayout() } }
    public var lineWidth: CGFloat = 14 { didSet { setNeedsLayout() } }
    public var trackColor: UIColor = UIColor(white: 1.0, alpha: 0.20) { didSet { trackLayer.strokeColor = trackColor.cgColor } }
    public var progressColor: UIColor = JobsCor.systemGreen { didSet { progressLayer.strokeColor = progressColor.cgColor } }
    public var tickColor: UIColor = UIColor(white: 1.0, alpha: 0.45) { didSet { tickLayer.strokeColor = tickColor.cgColor } }
    public var tickCount: Int = 11 { didSet { setNeedsLayout() } }
    public var tickLength: CGFloat = 8 { didSet { setNeedsLayout() } }
    public var tickWidth: CGFloat = 2 { didSet { setNeedsLayout() } }
    public var needleColor: UIColor = JobsCor.white { didSet { needleLayer.strokeColor = needleColor.cgColor } }
    public var needleWidth: CGFloat = 3 { didSet { setNeedsLayout() } }
    /// 指针起点离中心的比例（越大越不容易穿过中间数字）
    public var needleInnerRadiusRatio: CGFloat = 0.35 { didSet { setNeedsLayout() } }
    /// 指针终点距圆弧内侧留白
    public var needleOuterInset: CGFloat = 10 { didSet { setNeedsLayout() } }
    public var centerDotColor: UIColor = JobsCor.white { didSet { centerDotLayer.fillColor = centerDotColor.cgColor } }
    public var centerDotRadius: CGFloat = 8 { didSet { setNeedsLayout() } }
    public var valueTextColor: UIColor = JobsCor.white { didSet { valueLabel.byTextColor(valueTextColor) } }
    public var valueFont: UIFont = .boldSystemFont(ofSize: 26) { didSet { valueLabel.byFont(valueFont) } }
    /// 进度文本格式化：默认显示百分比
    public var valueFormatter: (CGFloat) -> String = { p in
        let v = Int(round(p * 100))
        return "\(v)%"
    }
    /// 是否允许在仪表盘上直接拖动指针
    public var isDraggable: Bool = false { didSet { updateDragGestureEnabled() } }

    private var progressChangedAction: ((CGFloat) -> Void)?

    private lazy var valueLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byTextAlignment(.center)
            .byTextColor(valueTextColor)
            .byFont(valueFont)
            .byText(valueFormatter(progress))
            .byAddTo(self) { [unowned self] make in
                make.centerY.equalToSuperview().offset(22)
                make.centerX.equalToSuperview()
        }
    }()

    private lazy var trackLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(JobsCor.clear)
            .byStrokeColor(trackColor)
            .byLineCap(.round)
            .byAddTo(self.layer)
    }()

    private lazy var progressLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(JobsCor.clear)
            .byStrokeColor(progressColor)
            .byLineCap(.round)
            .byStrokeEnd(0)
            .byAddTo(self.layer)
    }()

    private lazy var tickLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(JobsCor.clear)
            .byStrokeColor(tickColor)
            .byLineCap(.round)
            .byAddTo(self.layer)
    }()
    /// 关键：容器层（锁死中心），只旋转它
    private lazy var needleContainerLayer: CALayer = {
        CALayer.jobsMake { _ in }.byAddTo(self.layer)
    }()

    private lazy var needleLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(JobsCor.clear)
            .byStrokeColor(needleColor)
            .byLineCap(.round)
            .byAddTo( self.needleContainerLayer)
    }()

    private lazy var centerDotLayer: CAShapeLayer = {
        CAShapeLayer.jobsMake { _ in }
            .byFillColor(centerDotColor)
            .byAddTo(self.layer)
    }()

    private lazy var panGesture: UIPanGestureRecognizer = {
        UIPanGestureRecognizer
            .byConfig { [weak self] (gesture: UIPanGestureRecognizer) in
                self?.handlePan(gesture)
            }
            .byMinTouches(1)
            .byMaxTouches(1)
            .byCancelsTouchesInView(YES)
    }()
    /// 设置进度
    public func setProgress(_ value: CGFloat, animated: Bool = true, duration: CFTimeInterval = 0.6) {
        // 通过 .byVisible(YES) 触发懒加载 + 显示（符合项目的调用习惯）
        valueLabel.byVisible(YES)
        let clamped = max(0, min(1, value))
        progress = clamped
        valueLabel.byText(valueFormatter(clamped))
        // strokeEnd
        if animated {
            let anim = CABasicAnimation(keyPath: "strokeEnd")
            anim
                .byFromValue(progressLayer.presentation()?.strokeEnd ?? progressLayer.strokeEnd)
                .byToValue(clamped)
            anim.duration = duration
            anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            progressLayer.byStrokeEnd(clamped)
            progressLayer.add(anim, forKey: "ft.strokeEnd")
        } else {
            progressLayer.removeAnimation(forKey: "ft.strokeEnd")
            progressLayer.byStrokeEnd(clamped)
        }
        // needle (关键：只旋转 needleContainerLayer，避免乱飞)
        let angle = needleAngle(for: clamped)
        let toTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        needleContainerLayer.removeAnimation(forKey: "ft.needle")
        if animated {
            let anim = CABasicAnimation(keyPath: "transform")
            anim
                .byFromValue(needleContainerLayer.presentation()?.transform ?? needleContainerLayer.transform)
                .byToValue(toTransform)
            anim.duration = duration
            anim.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            needleContainerLayer.byTransform(toTransform)
            needleContainerLayer.add(anim, forKey: "ft.needle")
        } else {
            needleContainerLayer.byTransform(toTransform)
        }
    }

    private func layoutLayers() {
        let b = bounds
        guard b.width > 0, b.height > 0 else { return }
        trackLayer.byHidden(NO)
        progressLayer.byHidden(NO)
        tickLayer.byHidden(NO)
        needleContainerLayer.byHidden(NO)
        needleLayer.byHidden(NO)
        centerDotLayer.byHidden(NO)
        let center = CGPoint(x: b.midX, y: b.midY)
        // radius
        let safeInset = max(lineWidth, tickLength) + 10
        let radius = max(1, min(b.width, b.height) * 0.5 - safeInset)
        // arc path
        let arcPath = UIBezierPath.make(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        ).cgPath
        // 禁用隐式动画，避免 layout 时抖动
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        trackLayer
            .byFrame(b)
            .byLineWidth(lineWidth)
            .byPath(arcPath)
        progressLayer
            .byFrame(b)
            .byLineWidth(lineWidth)
            .byPath(arcPath)
            .byStrokeEnd(progress)
        tickLayer
            .byFrame(b)
            .byLineWidth(tickWidth)
            .byPath(makeTicksPath(center: center, radius: radius).cgPath)
        // ===== needle container 固定几何（关键：锁死旋转中心）=====
        needleContainerLayer
            .byBounds(b)
            .byPosition(CGPoint(x: b.midX, y: b.midY))
            .byAnchorPoint(CGPoint(x: 0.5, y: 0.5))
        // needleLayer 只负责画“水平基准指针”，容器负责旋转
        needleLayer
            .byFrame(b)
            .byLineWidth(needleWidth)
            .byPath(makeNeedleBasePath(center: center, radius: radius).cgPath)
        needleContainerLayer.byTransform(CATransform3DMakeRotation(needleAngle(for: progress), 0, 0, 1))
        // center dot
        centerDotLayer.byFrame(b)
        let dotRect = CGRect(
            x: center.x - centerDotRadius,
            y: center.y - centerDotRadius,
            width: centerDotRadius * 2,
            height: centerDotRadius * 2
        )
        centerDotLayer.byPath(UIBezierPath.make(ovalIn: dotRect).cgPath)
        CATransaction.commit()
    }

    private func makeTicksPath(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath.make()
        let count = max(2, tickCount)
        let sweep = endAngle - startAngle
        let baseR = radius + lineWidth * 0.5 + 2
        for i in 0..<count {
            let t = CGFloat(i) / CGFloat(count - 1)
            let ang = startAngle + sweep * t
            let outer = CGPoint(
                x: center.x + cos(ang) * baseR,
                y: center.y + sin(ang) * baseR
            )
            let inner = CGPoint(
                x: center.x + cos(ang) * (baseR - tickLength),
                y: center.y + sin(ang) * (baseR - tickLength)
            )
            path
                .byMove(to: inner)
                .byAddLine(to: outer)
        };return path
    }
    /// 基准指针：水平向右（0 弧度），旋转交给 needleContainerLayer
    private func makeNeedleBasePath(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath.make()
        let inner = max(18, radius * needleInnerRadiusRatio)
        let outer = max(inner + 8, radius - lineWidth * 0.5 - needleOuterInset)
        let p1 = CGPoint(x: center.x + inner, y: center.y)
        let p2 = CGPoint(x: center.x + outer, y: center.y)
        path
            .byMove(to: p1)
            .byAddLine(to: p2)
        return path
    }

    private func needleAngle(for progress: CGFloat) -> CGFloat {
        let p = max(0, min(1, progress))
        return startAngle + (endAngle - startAngle) * p
    }

    private func updateDragGestureEnabled() {
        if panGesture.view !== self {
            jobs_addGesture(panGesture)
        }
        panGesture.byEnabled(isDraggable)
    }

    private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard isDraggable else { return }
        switch gesture.state {
        /// 合并处理 .began、.changed、.ended 分支
        case .began, .changed, .ended:
            updateProgress(at: gesture.location(in: self))
        /// 未匹配已知分支时执行兜底处理
        default:
            break
        }
    }

    private func updateProgress(at location: CGPoint) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offsetX = location.x - center.x
        let offsetY = location.y - center.y
        guard hypot(offsetX, offsetY) > max(centerDotRadius, 12) else { return }
        let fullCircle = CGFloat.pi * 2
        let rawSweep = endAngle - startAngle
        let normalizedSweep = normalizedAngle(rawSweep)
        let sweep = abs(rawSweep) >= fullCircle ? fullCircle : normalizedSweep
        guard sweep > .ulpOfOne else { return }
        let touchAngle = atan2(offsetY, offsetX)
        let delta = normalizedAngle(touchAngle - startAngle)
        let newProgress: CGFloat
        if delta <= sweep {
            newProgress = delta / sweep
        } else {
            let distanceToEnd = delta - sweep
            let distanceToStart = fullCircle - delta
            newProgress = distanceToStart < distanceToEnd ? 0 : 1
        }
        setProgress(newProgress, animated: false)
        progressChangedAction?(newProgress)
    }

    private func normalizedAngle(_ angle: CGFloat) -> CGFloat {
        let fullCircle = CGFloat.pi * 2
        let value = angle.truncatingRemainder(dividingBy: fullCircle)
        return value >= 0 ? value : value + fullCircle
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutLayers()
    }
}

public extension FTDashboardView {
    // MARK: - Progress (read-only property)
    /// 0.0 ~ 1.0
    /// progress 是 private(set)，只能通过此方法设置
    @discardableResult
    func byProgress(_ value: CGFloat,
                    animated: Bool = true,
                    duration: CFTimeInterval = 0.6) -> Self {
        setProgress(value, animated: animated, duration: duration)
        return self
    }
    // MARK: - Interaction
    @discardableResult
    func byDraggable(_ value: Bool) -> Self {
        isDraggable = value
        return self
    }

    @discardableResult
    func onProgressChanged(_ action: @escaping (CGFloat) -> Void) -> Self {
        progressChangedAction = action
        return self
    }
    // MARK: - Angles (Radians)
    /// 起始角度（弧度）
    @discardableResult
    func byStartAngle(_ radians: CGFloat) -> Self {
        startAngle = radians
        return self
    }
    /// 结束角度（弧度）
    @discardableResult
    func byEndAngle(_ radians: CGFloat) -> Self {
        endAngle = radians
        return self
    }
    /// 起止角（弧度）
    @discardableResult
    func byRange(start startRadians: CGFloat, end endRadians: CGFloat) -> Self {
        startAngle = startRadians
        endAngle = endRadians
        return self
    }
    // MARK: - Angles (Degrees)
    /// 起始角度（角度）
    @discardableResult
    func byStartAngleDegrees(_ degrees: CGFloat) -> Self {
        startAngle = degrees.ftDegreesToRadians
        return self
    }
    /// 结束角度（角度）
    @discardableResult
    func byEndAngleDegrees(_ degrees: CGFloat) -> Self {
        endAngle = degrees.ftDegreesToRadians
        return self
    }
    /// 起止角（角度）
    @discardableResult
    func byRangeDegrees(start startDegrees: CGFloat, end endDegrees: CGFloat) -> Self {
        startAngle = startDegrees.ftDegreesToRadians
        endAngle = endDegrees.ftDegreesToRadians
        return self
    }
    // MARK: - Line
    @discardableResult
    func byLineWidth(_ value: CGFloat) -> Self {
        lineWidth = value
        return self
    }
    // MARK: - Track / Progress Color
    @discardableResult
    func byTrackColor(_ color: UIColor) -> Self {
        trackColor = color
        return self
    }

    @discardableResult
    func byProgressColor(_ color: UIColor) -> Self {
        progressColor = color
        return self
    }
    // MARK: - Tick
    @discardableResult
    func byTickColor(_ color: UIColor) -> Self {
        tickColor = color
        return self
    }

    @discardableResult
    func byTickCount(_ value: Int) -> Self {
        tickCount = value
        return self
    }

    @discardableResult
    func byTickLength(_ value: CGFloat) -> Self {
        tickLength = value
        return self
    }

    @discardableResult
    func byTickWidth(_ value: CGFloat) -> Self {
        tickWidth = value
        return self
    }
    // MARK: - Needle
    @discardableResult
    func byNeedleColor(_ color: UIColor) -> Self {
        needleColor = color
        return self
    }

    @discardableResult
    func byNeedleWidth(_ value: CGFloat) -> Self {
        needleWidth = value
        return self
    }
    /// 指针起点离中心的比例（越大越不容易穿过中间数字）
    @discardableResult
    func byNeedleInnerRadiusRatio(_ value: CGFloat) -> Self {
        needleInnerRadiusRatio = value
        return self
    }
    /// 指针终点距圆弧内侧留白
    @discardableResult
    func byNeedleOuterInset(_ value: CGFloat) -> Self {
        needleOuterInset = value
        return self
    }
    // MARK: - Center Dot
    @discardableResult
    func byCenterDotColor(_ color: UIColor) -> Self {
        centerDotColor = color
        return self
    }

    @discardableResult
    func byCenterDotRadius(_ value: CGFloat) -> Self {
        centerDotRadius = value
        return self
    }
    // MARK: - Value label
    @discardableResult
    func byValueTextColor(_ color: UIColor) -> Self {
        valueTextColor = color
        return self
    }

    @discardableResult
    func byValueFont(_ font: UIFont) -> Self {
        valueFont = font
        return self
    }
    /// 进度文本格式化
    @discardableResult
    func byValueFormatter(_ formatter: @escaping (CGFloat) -> String) -> Self {
        valueFormatter = formatter
        return self
    }
    // MARK: - Helpers
    /// 任意配置钩子
    @discardableResult
    func byConfig(_ block: (FTDashboardView) -> Void) -> Self {
        block(self)
        return self
    }
    /// 一把梭：快速配置（可选）
    @discardableResult
    func byStyle(
        startAngleDegrees: CGFloat? = nil,
        endAngleDegrees: CGFloat? = nil,
        lineWidth: CGFloat? = nil,
        trackColor: UIColor? = nil,
        progressColor: UIColor? = nil,
        tickColor: UIColor? = nil,
        tickCount: Int? = nil,
        tickLength: CGFloat? = nil,
        tickWidth: CGFloat? = nil,
        needleColor: UIColor? = nil,
        needleWidth: CGFloat? = nil,
        needleInnerRadiusRatio: CGFloat? = nil,
        needleOuterInset: CGFloat? = nil,
        centerDotColor: UIColor? = nil,
        centerDotRadius: CGFloat? = nil,
        valueTextColor: UIColor? = nil,
        valueFont: UIFont? = nil,
        valueFormatter: ((CGFloat) -> String)? = nil
    ) -> Self {
        if let v = startAngleDegrees { self.startAngle = v.ftDegreesToRadians }
        if let v = endAngleDegrees { self.endAngle = v.ftDegreesToRadians }
        if let v = lineWidth { self.lineWidth = v }
        if let v = trackColor { self.trackColor = v }
        if let v = progressColor { self.progressColor = v }
        if let v = tickColor { self.tickColor = v }
        if let v = tickCount { self.tickCount = v }
        if let v = tickLength { self.tickLength = v }
        if let v = tickWidth { self.tickWidth = v }
        if let v = needleColor { self.needleColor = v }
        if let v = needleWidth { self.needleWidth = v }
        if let v = needleInnerRadiusRatio { self.needleInnerRadiusRatio = v }
        if let v = needleOuterInset { self.needleOuterInset = v }
        if let v = centerDotColor { self.centerDotColor = v }
        if let v = centerDotRadius { self.centerDotRadius = v }
        if let v = valueTextColor { self.valueTextColor = v }
        if let v = valueFont { self.valueFont = v }
        if let v = valueFormatter { self.valueFormatter = v };return self
    }
}

private extension CGFloat {
    var ftDegreesToRadians: CGFloat { self * .pi / 180.0 }
}
