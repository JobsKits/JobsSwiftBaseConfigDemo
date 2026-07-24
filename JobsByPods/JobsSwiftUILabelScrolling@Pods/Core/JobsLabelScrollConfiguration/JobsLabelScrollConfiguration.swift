//
//  JobsLabelScrollConfiguration.swift
//  JobsSwiftUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

import UIKit
import JobsSwiftTimer

/// CoreText 长文本滚动配置。
public struct JobsLabelScrollConfiguration {
    public var mode: JobsLabelScrollMode
    /// 每秒位移点数。
    public var speed: CGFloat
    /// 连续循环时两份文字之间的间距。
    public var spacing: CGFloat
    /// 第一次开始移动前的停留时间。
    public var startDelay: TimeInterval
    /// 往返模式到达左右边界后的停留时间。
    public var edgePause: TimeInterval
    /// JobsSwiftTimer 的期望刷新频率。
    public var framesPerSecond: Int
    /// 默认使用 JobsSwiftTimer 的 DisplayLink 内核。
    public var timerKind: JobsTimerKind
    /// 开启“减弱动态效果”时保持静态文本。
    public var respectsReduceMotion: Bool

    public init(mode: JobsLabelScrollMode,
                speed: CGFloat = 36,
                spacing: CGFloat = 40,
                startDelay: TimeInterval = 0.8,
                edgePause: TimeInterval = 0.8,
                framesPerSecond: Int = 60,
                timerKind: JobsTimerKind = .displayLink,
                respectsReduceMotion: Bool = true) {
        self.mode = mode
        self.speed = max(0, speed)
        self.spacing = max(0, spacing)
        self.startDelay = max(0, startDelay)
        self.edgePause = max(0, edgePause)
        self.framesPerSecond = min(max(1, framesPerSecond), 120)
        self.timerKind = timerKind
        self.respectsReduceMotion = respectsReduceMotion
    }

    public static func continuous(speed: CGFloat = 36,
                                  spacing: CGFloat = 40,
                                  startDelay: TimeInterval = 0.8,
                                  framesPerSecond: Int = 60,
                                  timerKind: JobsTimerKind = .displayLink,
                                  respectsReduceMotion: Bool = true) -> Self {
        Self(
            mode: .continuous,
            speed: speed,
            spacing: spacing,
            startDelay: startDelay,
            edgePause: 0,
            framesPerSecond: framesPerSecond,
            timerKind: timerKind,
            respectsReduceMotion: respectsReduceMotion
        )
    }

    public static func pingPong(speed: CGFloat = 28,
                                startDelay: TimeInterval = 0.8,
                                edgePause: TimeInterval = 0.8,
                                framesPerSecond: Int = 60,
                                timerKind: JobsTimerKind = .displayLink,
                                respectsReduceMotion: Bool = true) -> Self {
        Self(
            mode: .pingPong,
            speed: speed,
            spacing: 0,
            startDelay: startDelay,
            edgePause: edgePause,
            framesPerSecond: framesPerSecond,
            timerKind: timerKind,
            respectsReduceMotion: respectsReduceMotion
        )
    }
}
