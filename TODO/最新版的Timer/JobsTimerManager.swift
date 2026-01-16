//
//  JobsTimerManager.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/12/13.
//

import Foundation

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

// MARK: - 统一错误
public enum JobsTimerManagerError: Error, LocalizedError, Sendable {
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

// MARK: - JobsTimerManager
public final class JobsTimerManager {

    public static let shared = JobsTimerManager()

    private let lock = NSLock()
    private var timers: [String: JobsTimerProtocol] = [:]
    private var defaultDedupPolicy: JobsTimerDedupPolicy = .replace

    private init() {}

    // MARK: - Config
    public func setDedupPolicy(_ policy: JobsTimerDedupPolicy) {
        lock.lock()
        defaultDedupPolicy = policy
        lock.unlock()
    }

    // MARK: - Public
    /// 创建并注册一个 timer
    ///
    /// ⚠️ 非 GCD 内核强制：
    /// - 必须主线程调用
    /// - config.runLoop 必须是 .main
    public func create(
        kind: JobsTimerKind,
        identifier: String?,
        config: JobsTimerConfig,
        dedupPolicy: JobsTimerDedupPolicy? = nil,
        onTick: @escaping JobsTimerCallback
    ) throws -> JobsTimerProtocol {

        guard let identifier, !identifier.isEmpty else {
            throw JobsTimerManagerError.identifierRequired
        }

        let policy = dedupPolicy ?? defaultDedupPolicy

        // 先读 existing，避免锁内做 stop/remove 这种可能引发回调的重操作
        let existing: JobsTimerProtocol? = {
            lock.lock()
            defer { lock.unlock() }
            return timers[identifier]
        }()

        if let existing {
            switch policy {
            case .keepExisting:
                return existing
            case .replace:
                existing.stop()
                try remove(identifier: identifier)
            case .error:
                throw JobsTimerManagerError.duplicatedIdentifier(identifier)
            }
        }

        // 关键：Manager 统一治理前后台，避免 timer 自己又监听一遍（UIKit）
        var c = config
        #if canImport(UIKit)
        c.autoManageAppState = false
        #endif

        // ⚠️ 非 GCD 内核依赖 RunLoop/DisplayLink：强制主线程主 RunLoop
        if kind != .gcd {
            precondition(c.runLoop == .main, "JobsTimerManager: kind=\(kind) currently only supports RunLoop.main.")
            precondition(Thread.isMainThread, "JobsTimerManager: create(kind=\(kind)) must be called on main thread.")
        }

        let timer = JobsTimer(kind: kind, config: c, handler: onTick)
        return try register(timer, identifier: identifier, dedupPolicy: policy)
    }

    /// 获取 timer
    public func timer(for identifier: String) -> JobsTimerProtocol? {
        lock.lock()
        defer { lock.unlock() }
        return timers[identifier]
    }

    /// 对某个 timer 执行动作
    @discardableResult
    public func act(_ action: JobsTimerManagerAction, identifier: String) throws -> JobsTimerProtocol {
        guard let t = timer(for: identifier) else { throw JobsTimerManagerError.notFound(identifier) }
        switch action {
        case .start:  t.start()
        case .pause:  t.pause()
        case .resume: t.resume()
        case .stop:   t.stop()
        case .cancel:
            t.stop()
            try remove(identifier: identifier)
        }
        return t
    }

    /// 移除 timer（不自动 stop）
    public func remove(identifier: String) throws {
        lock.lock()
        defer { lock.unlock() }
        guard timers.removeValue(forKey: identifier) != nil else {
            throw JobsTimerManagerError.notFound(identifier)
        }
    }

    /// 清空所有 timer
    public func removeAll(stopAll: Bool = true) {
        lock.lock()
        let all = timers
        timers.removeAll()
        lock.unlock()

        if stopAll {
            all.values.forEach { $0.stop() }
        }
    }

    // MARK: - Private
    private func register(
        _ timer: JobsTimerProtocol,
        identifier: String,
        dedupPolicy: JobsTimerDedupPolicy
    ) throws -> JobsTimerProtocol {

        lock.lock()
        defer { lock.unlock() }

        if timers[identifier] != nil {
            switch dedupPolicy {
            case .keepExisting:
                return timers[identifier]!
            case .replace:
                timers[identifier]?.stop()
                timers[identifier] = timer
            case .error:
                throw JobsTimerManagerError.duplicatedIdentifier(identifier)
            }
        } else {
            timers[identifier] = timer
        }

        return timer
    }
}
