//
//  JobsTImerDef.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import JobsSwiftBaseDefines
/// JobsTimer 专用回调类型：可跨并发域安全传递
public typealias JobsTimerCallback = @Sendable () -> Void
public typealias jobsByOpenResultBlock = (JobsOpenResult) -> Void
public typealias TimerStateChangeHandler = (_ button: UIButton,
                                            _ old: TimerState,
                                            _ new: TimerState) -> Void

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
// MARK: - 统一错误
public enum JobsTimerManagerError: Error,
                                   LocalizedError,
                                   Sendable {
    case identifierRequired
    case duplicatedIdentifier(String)
    case notFound(String)

    public var errorDescription: String? {
        switch self {
        case .identifierRequired:
            return "JobsTimerManager: identifier is required."
        case .duplicatedIdentifier(let id):
            return "JobsTimerManager: duplicated identifier: \(id)"
        case .notFound(let id):
            return "JobsTimerManager: not found: \(id)"
        }
    }
}
// MARK: - 统一动作
public enum JobsTimerManagerAction: Sendable {
    case start
    case pause
    case resume
    case stop
    case cancel
}
// MARK: - 去重策略
/// 当 `identifier` 已存在时的处理策略。
public enum JobsTimerDedupPolicy: Sendable {
    /// 保留旧 timer，直接返回旧对象（不会修改其 handler/config/policy）
    case keepExisting
    /// 替换旧 timer：旧 timer 会 stop + remove，再创建新 timer
    case replace
    /// 报错：拒绝创建
    case error
}
// MARK: - Timer Kind
public enum JobsTimerKind: Sendable {
    case gcd          // 不依赖 RunLoop，不强制主线程、回调在 `config.queue` 上执行、适合后台任务、非 UI、精准调度
    case foundation
    case displayLink
    case runLoop
}

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
