//
//  JobsSwiftTimerMgrDefs.swift
//  JobsSwiftTimerMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

// MARK: - 统一错误
public enum JobsSwiftTimerMgrError: Error,
                                    LocalizedError,
                                    Sendable {
    case identifierRequired
    case duplicatedIdentifier(String)
    case notFound(String)

    public var errorDescription: String? {
        switch self {
        case .identifierRequired:
            return "JobsSwiftTimerMgr: identifier is required."
        case .duplicatedIdentifier(let id):
            return "JobsSwiftTimerMgr: duplicated identifier: \(id)"
        case .notFound(let id):
            return "JobsSwiftTimerMgr: not found: \(id)"
        }
    }
}
// MARK: - 统一动作
public enum JobsSwiftTimerMgrAction: Sendable, Equatable {
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
// MARK: - 前后台策略
public enum JobsTimerBackgroundPolicy: Sendable {
    /// 不处理前后台切换
    case ignore
    /// 失去活跃态自动 pause，重新活跃只恢复自动 pause 的 timer
    case pauseAndResume
    /// 进入后台直接 stop + remove
    case cancel
}
// MARK: - 标识协议（建议用于 Mgr ID 管理）
public protocol JobsSwiftTimerIdentifiable {
    var identifier: String? { get }
}
