//
//  JobsTimerManager.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/12/13.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
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
        };return t
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
    
    // iOS 12 及以下：同步
    public func stopAndRemove(identifier: String) {
        do {
            _ = try act(.cancel, identifier: identifier)
        } catch {
            /// TODO
        }
    }
    // iOS 13+：保留 async 入口（其实内部仍是同步逻辑）
    @available(iOS 13.0, *)
    public func stopAndRemove(identifier: String) async {
        await stopAndRemove(identifier: identifier)
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
        };return timer
    }
}
