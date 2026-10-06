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
        set {
            precondition(Thread.isMainThread, "JobsImageRotator configuration belongs to the main thread.")
            tickInterval = Self.normalizedInterval(newValue)
            if timer != nil {
                let paused = isPaused
                start()
                if paused { pause() }
            }
        }
    }

    private weak var targetView: UIView?
    private let baseTransform: CGAffineTransform
    /// 默认每秒一圈，速度与帧率分开。
    public var radiansPerSecond: CGFloat = .pi * 2
    private var lastTick: TimeInterval?
    private var isPaused = false
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
        isPaused = false
        lastTick = ProcessInfo.processInfo.systemUptime
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
        isPaused = true
        lastTick = nil
        timer?.pause()
        return self
    }

    @discardableResult
    public func resume() -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.resume() must be called on the main thread.")
        isPaused = false
        lastTick = ProcessInfo.processInfo.systemUptime
        timer?.resume()
        return self
    }

    @discardableResult
    public func stop(reset: Bool = true) -> Self {
        precondition(Thread.isMainThread, "JobsImageRotator.stop() must be called on the main thread.")
        timer?.stop()
        timer = nil
        lastTick = nil
        isPaused = false
        if reset {
            currentAngle = 0
            targetView?.transform = baseTransform
        };return self
    }

    private func rotateOneTick() {
        precondition(Thread.isMainThread, "JobsImageRotator ticks must be delivered on the main thread.")
        guard let targetView else {
            stop(reset: false)
            return
        }
        let now = ProcessInfo.processInfo.systemUptime
        let elapsed = max(0, now - (lastTick ?? now))
        lastTick = now
        let speed = radiansPerSecond.isFinite ? radiansPerSecond : .pi * 2
        currentAngle += direction.angularMultiplier * speed * CGFloat(elapsed)
        currentAngle.formTruncatingRemainder(dividingBy: CGFloat.pi * 2.0)
        targetView.transform = baseTransform.concatenating(
            CGAffineTransform(rotationAngle: currentAngle)
        )
    }

    private static func normalizedInterval(_ interval: TimeInterval) -> TimeInterval {
        interval.isFinite && interval > 0 ? interval : defaultInterval
    }
}
#endif
