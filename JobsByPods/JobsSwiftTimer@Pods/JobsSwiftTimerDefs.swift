//
//  JobsSwiftTimerDefs.swift
//  JobsSwiftTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

public enum JobsOpenResult {
    case opened                 // 成功触发了系统打开
    case cannotOpen             // 系统认为不能打开（未安装/被限制）
    case invalidInput           // 入参不是一个有效的 URL/电话
}

public enum TimerState: Int, Sendable {
    case idle
    case running
    case paused
    case stopped
}

public enum _TimerMode: Sendable {
    case countUp(elapsed: Int)
    case countdown(remain: Int, total: Int)

    public var isCountdown: Bool {
        if case .countdown = self { return true }
        return false
    }
}
// MARK: - Timer Kind
public enum JobsTimerKind: Sendable {
    case gcd          // 不依赖 RunLoop，不强制主线程、回调在 `config.queue` 上执行、适合后台任务、非 UI、精准调度
    case foundation
    case displayLink
    case runLoop
}
/// JobsTimer 专用回调类型：可跨并发域安全传递
public typealias JobsTimerCallback = @Sendable () -> Void
public typealias jobsByOpenResultBlock = (JobsOpenResult) -> Void
public typealias TimerStateChangeHandler = (_ button: UIButton,
                                            _ old: TimerState,
                                            _ new: TimerState) -> Void

public extension JobsTimerKind {
    var displayName: String {
        switch self {
        case .gcd:          return "GCD"
        case .foundation:   return "NSTimer"
        case .displayLink:  return "DisplayLink"
        case .runLoop:      return "RunLoop"
        @unknown default:   return "Unknown"
        }
    }
}
