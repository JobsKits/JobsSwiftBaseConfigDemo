//
//  JobsFuseBubbleConfig.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月14日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

public struct JobsFuseBubbleConfig {
    public var emissionInterval: TimeInterval
    public var riseDistance: CGFloat
    public var horizontalDrift: CGFloat
    public var duration: TimeInterval
    public var initialScale: CGFloat
    public var peakScale: CGFloat
    public var endScale: CGFloat
    public var maximumRotation: CGFloat
    public var maximumConcurrentCount: Int

    public init(
        emissionInterval: TimeInterval = 0.16,
        riseDistance: CGFloat = 180,
        horizontalDrift: CGFloat = 54,
        duration: TimeInterval = 0.9,
        initialScale: CGFloat = 0.58,
        peakScale: CGFloat = 1.08,
        endScale: CGFloat = 0.84,
        maximumRotation: CGFloat = .pi / 10,
        maximumConcurrentCount: Int = 12
    ) {
        self.emissionInterval = max(0.06, emissionInterval)
        self.riseDistance = max(24, riseDistance)
        self.horizontalDrift = max(0, horizontalDrift)
        self.duration = max(0.2, duration)
        self.initialScale = max(0.01, initialScale)
        self.peakScale = max(0.01, peakScale)
        self.endScale = max(0.01, endScale)
        self.maximumRotation = max(0, maximumRotation)
        self.maximumConcurrentCount = max(1, maximumConcurrentCount)
    }
}
