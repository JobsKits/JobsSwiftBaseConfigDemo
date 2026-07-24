//
//  JobsImageRotator.swift
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftTimer

#if os(iOS) || os(tvOS)
public final class JobsImageRotator: @unchecked Sendable {
    public static let defaultInterval: TimeInterval = 1.0 / 60.0

    public var direction: JobsImageRotationDirection
    public var interval: TimeInterval {
        get { tickInterval }
        set { tickInterval = Self.normalizedInterval(newValue) }
    }

    private weak var targetView: UIView?
    private let baseTransform: CGAffineTransform
    private let radiansPerTick = CGFloat.pi * 2.0 / 60.0
    private var tickInterval: TimeInterval
    private var currentAngle: CGFloat = 0
    private var timer: JobsSwiftTimerProtocol?

    public init(
        targetView: UIView,
        direction: JobsImageRotationDirection = .clockwise,
        interval: TimeInterval = JobsImageRotator.defaultInterval
    ) {
        self.targetView = targetView
        self.direction = direction
        self.tickInterval = Self.normalizedInterval(interval)
        self.baseTransform = targetView.transform
    }

    deinit {
        timer?.stop()
    }

    @discardableResult
    public func start() -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.start() must be called on the main thread.")
        timer?.stop()
        let config = JobsSwiftTimerConfig(
            interval: tickInterval,
            repeats: true,
            tolerance: 0,
            queue: .main
        )
        let nextTimer = JobsTimer(kind: .gcd, config: config) { [weak self] in
            self?.rotateOneTick()
        }
        timer = nextTimer
        nextTimer.start()
        return self
    }

    @discardableResult
    public func pause() -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.pause() must be called on the main thread.")
        timer?.pause()
        return self
    }

    @discardableResult
    public func resume() -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.resume() must be called on the main thread.")
        timer?.resume()
        return self
    }

    @discardableResult
    public func stop(reset: Bool = true) -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.stop() must be called on the main thread.")
        timer?.stop()
        timer = nil
        if reset {
            currentAngle = 0
            targetView?.transform = baseTransform
        };return self
    }

    private func rotateOneTick() {
        precondition(Thread.isMainThread, "JobsImageRotator ticks must be delivered on the main thread.")
        currentAngle += direction.angularMultiplier * radiansPerTick
        currentAngle.formTruncatingRemainder(dividingBy: CGFloat.pi * 2.0)
        targetView?.transform = baseTransform.concatenating(
            CGAffineTransform(rotationAngle: currentAngle)
        )
    }

    private static func normalizedInterval(_ interval: TimeInterval) -> TimeInterval {
        interval.isFinite && interval > 0 ? interval : defaultInterval
    }
}
#endif
