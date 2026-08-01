//
//  JobsClockIconView.swift
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if os(iOS) || os(tvOS)
public final class JobsClockIconView: UIView {
    /// 默认每 0.1 秒前进 6°，6 秒完成一周。
    public static let defaultInterval: TimeInterval = 0.1

    public var direction: JobsImageRotationDirection {
        get { rotationDirection }
        set {
            rotationDirection = newValue
            rotator?.direction = newValue
        }
    }

    public var interval: TimeInterval {
        get { rotator?.interval ?? tickInterval }
        set {
            tickInterval = newValue
            rotator?.interval = newValue
            tickInterval = rotator?.interval ?? newValue
        }
    }
    public private(set) var isRunning = false

    private let dialLayer = CAShapeLayer()
    private let hourHandLayer = CAShapeLayer()
    private let minuteHandLayer = CAShapeLayer()
    private let centerDotLayer = CAShapeLayer()
    private let minuteHandContainer = UIView()
    private var rotationDirection: JobsImageRotationDirection
    private var tickInterval: TimeInterval
    private var rotator: JobsImageRotator?
    private var hasStarted = false

    public init(
        direction: JobsImageRotationDirection = .clockwise,
        interval: TimeInterval = JobsClockIconView.defaultInterval
    ) {
        self.rotationDirection = direction
        self.tickInterval = interval
        super.init(frame: .zero)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        self.rotationDirection = .clockwise
        self.tickInterval = Self.defaultInterval
        super.init(coder: coder)
        commonInit()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        minuteHandContainer.bounds = CGRect(origin: .zero, size: bounds.size)
        minuteHandContainer.center = CGPoint(x: bounds.midX, y: bounds.midY)
        layoutIcon()
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        applyTintColor()
    }

    @discardableResult
    public func start() -> Self {
        guard !isRunning else { return self }
        rotator?.start()
        hasStarted = true
        isRunning = true
        return self
    }

    @discardableResult
    public func pause() -> Self {
        guard hasStarted, isRunning else { return self }
        rotator?.pause()
        isRunning = false
        return self
    }

    @discardableResult
    public func resume() -> Self {
        guard hasStarted, !isRunning else { return self }
        rotator?.resume()
        isRunning = true
        return self
    }

    @discardableResult
    public func stop(reset: Bool = true) -> Self {
        rotator?.stop(reset: reset)
        hasStarted = false
        isRunning = false
        return self
    }
}

private extension JobsClockIconView {
    func commonInit() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
        layer.addSublayer(dialLayer)
        layer.addSublayer(hourHandLayer)
        addSubview(minuteHandContainer)
        minuteHandContainer.isUserInteractionEnabled = false
        minuteHandContainer.layer.addSublayer(minuteHandLayer)
        layer.addSublayer(centerDotLayer)
        [dialLayer, hourHandLayer, minuteHandLayer].forEach { shapeLayer in
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineCap = .round
            shapeLayer.lineJoin = .round
        }
        rotator = JobsImageRotator(
            targetView: minuteHandContainer,
            direction: rotationDirection,
            interval: tickInterval
        )
        tickInterval = rotator?.interval ?? tickInterval
        applyTintColor()
    }

    func applyTintColor() {
        let color = tintColor ?? UIColor.darkGray
        dialLayer.strokeColor = color.withAlphaComponent(0.72).cgColor
        hourHandLayer.strokeColor = color.cgColor
        minuteHandLayer.strokeColor = color.cgColor
        centerDotLayer.fillColor = color.cgColor
    }

    func layoutIcon() {
        let side = min(bounds.width, bounds.height)
        guard side > 0 else { return }
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let lineWidth = max(1.35, side * 0.075)
        let radius = max(0, side / 2 - lineWidth / 2)

        dialLayer.frame = bounds
        dialLayer.lineWidth = lineWidth
        dialLayer.path = UIBezierPath(
            ovalIn: CGRect(
                x: center.x - radius,
                y: center.y - radius,
                width: radius * 2,
                height: radius * 2
            )
        ).cgPath

        let hourLength = side * 0.22
        let hourAngle = -CGFloat.pi / 3
        let hourPath = UIBezierPath()
        hourPath.move(to: center)
        hourPath.addLine(
            to: CGPoint(
                x: center.x + sin(hourAngle) * hourLength,
                y: center.y - cos(hourAngle) * hourLength
            )
        )
        hourHandLayer.frame = bounds
        hourHandLayer.lineWidth = lineWidth
        hourHandLayer.path = hourPath.cgPath

        let minutePath = UIBezierPath()
        minutePath.move(to: center)
        minutePath.addLine(to: CGPoint(x: center.x, y: center.y - side * 0.34))
        minuteHandLayer.frame = minuteHandContainer.bounds
        minuteHandLayer.lineWidth = max(1.1, lineWidth * 0.72)
        minuteHandLayer.path = minutePath.cgPath

        let dotRadius = max(1.2, lineWidth * 0.72)
        centerDotLayer.frame = bounds
        centerDotLayer.path = UIBezierPath(
            ovalIn: CGRect(
                x: center.x - dotRadius,
                y: center.y - dotRadius,
                width: dotRadius * 2,
                height: dotRadius * 2
            )
        ).cgPath
    }
}
#endif
