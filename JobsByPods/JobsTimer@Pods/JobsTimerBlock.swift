//
//  JobsTimerBlock.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/24/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
import JobsSwiftBlock
import JobsSwiftBaseDefines

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
