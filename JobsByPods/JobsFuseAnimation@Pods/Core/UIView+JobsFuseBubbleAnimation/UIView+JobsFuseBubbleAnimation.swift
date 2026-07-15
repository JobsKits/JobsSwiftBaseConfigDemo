//
//  UIView+JobsFuseBubbleAnimation.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC

private var jobsFuseBubbleRunnerKey: UInt8 = 0

private final class JobsFuseBubbleRunner {
    private weak var sourceView: UIView?
    private weak var hostView: UIView?
    private let config: JobsFuseBubbleConfig
    private let bubbleProvider: () -> UIView
    private let emitBlock: (() -> Void)?
    private var timer: Timer?
    private var concurrentCount = 0

    init(
        sourceView: UIView,
        hostView: UIView,
        config: JobsFuseBubbleConfig,
        bubbleProvider: @escaping () -> UIView,
        emitBlock: (() -> Void)?
    ) {
        self.sourceView = sourceView
        self.hostView = hostView
        self.config = config
        self.bubbleProvider = bubbleProvider
        self.emitBlock = emitBlock
    }

    func start() {
        stop()
        emit()
        let timer = Timer(timeInterval: config.emissionInterval, repeats: true) { [weak self] _ in
            self?.emit()
        }
        self.timer = timer
        RunLoop.main.add(timer, forMode: .common)
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

    private func emit() {
        guard
            concurrentCount < config.maximumConcurrentCount,
            let sourceView,
            let hostView,
            sourceView.window != nil
        else { return }
        let bubble = bubbleProvider()
        if bubble.bounds.width <= 0 || bubble.bounds.height <= 0 {
            bubble.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        }
        let sourcePoint = CGPoint(x: sourceView.bounds.midX, y: sourceView.bounds.minY)
        bubble.center = sourceView.convert(sourcePoint, to: hostView)
        bubble.alpha = 0
        bubble.transform = CGAffineTransform(scaleX: config.initialScale, y: config.initialScale)
        hostView.addSubview(bubble)
        concurrentCount += 1
        emitBlock?()
        let reduceMotion = UIAccessibility.isReduceMotionEnabled
        let riseDistance = reduceMotion ? min(28, config.riseDistance) : config.riseDistance
        let drift = reduceMotion ? 0 : CGFloat.random(in: -config.horizontalDrift...config.horizontalDrift)
        let rotation = reduceMotion ? 0 : CGFloat.random(in: -config.maximumRotation...config.maximumRotation)
        let duration = reduceMotion ? min(0.28, config.duration) : config.duration
        let startCenter = bubble.center
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0,
            options: [.calculationModeCubic, .allowUserInteraction]
        ) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.22) {
                bubble.alpha = 1
                bubble.center = CGPoint(
                    x: startCenter.x + drift * 0.18,
                    y: startCenter.y - riseDistance * 0.2
                )
                bubble.transform = CGAffineTransform(rotationAngle: rotation * 0.35)
                    .scaledBy(x: self.config.peakScale, y: self.config.peakScale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.22, relativeDuration: 0.78) {
                bubble.alpha = 0
                bubble.center = CGPoint(
                    x: startCenter.x + drift,
                    y: startCenter.y - riseDistance
                )
                bubble.transform = CGAffineTransform(rotationAngle: rotation)
                    .scaledBy(x: self.config.endScale, y: self.config.endScale)
            }
        } completion: { [weak self, weak bubble] _ in
            bubble?.removeFromSuperview()
            self?.concurrentCount = max(0, (self?.concurrentCount ?? 1) - 1)
        }
    }
}

public extension UIView {
    @discardableResult
    func byFuseBubbleStart(
        in hostView: UIView? = nil,
        config: JobsFuseBubbleConfig = .init(),
        bubbleProvider: @escaping () -> UIView,
        onEmit: (() -> Void)? = nil
    ) -> Self {
        let work = { [weak self, weak hostView] in
            guard let self, let targetView = hostView ?? self.window ?? self.superview else { return }
            self.byFuseBubbleStop()
            let runner = JobsFuseBubbleRunner(
                sourceView: self,
                hostView: targetView,
                config: config,
                bubbleProvider: bubbleProvider,
                emitBlock: onEmit
            )
            objc_setAssociatedObject(
                self,
                &jobsFuseBubbleRunnerKey,
                runner,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            runner.start()
        }
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        };return self
    }

    @discardableResult
    func byFuseBubbleStop() -> Self {
        let work = { [weak self] in
            guard let self else { return }
            let runner = objc_getAssociatedObject(
                self,
                &jobsFuseBubbleRunnerKey
            ) as? JobsFuseBubbleRunner
            runner?.stop()
            objc_setAssociatedObject(
                self,
                &jobsFuseBubbleRunnerKey,
                nil,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        };return self
    }
}
