//
//  JobsSwiftTimerMgr.swift
//  JobsSwiftTimerMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftTimer

// MARK: - JobsSwiftTimerMgr
public final class JobsSwiftTimerMgr {
    private enum PauseState: Sendable {
        case running
        case manualPaused
        case autoPaused
    }

    private final class Entry {
        let timer: JobsSwiftTimerProtocol
        let backgroundPolicy: JobsTimerBackgroundPolicy
        var pauseState: PauseState
        init(
            timer: JobsSwiftTimerProtocol,
            backgroundPolicy: JobsTimerBackgroundPolicy,
            pauseState: PauseState = .running
        ) {
            self.timer = timer
            self.backgroundPolicy = backgroundPolicy
            self.pauseState = pauseState
        }
    }

    public static let shared = JobsSwiftTimerMgr()
    private let lock = NSLock()
    private var entries: [String: Entry] = [:]
    private var defaultDedupPolicy: JobsTimerDedupPolicy = .replace
    #if canImport(UIKit)
    private var didEnterBackgroundObserver: NSObjectProtocol?
    private var willEnterForegroundObserver: NSObjectProtocol?
    #endif

    private init() {
        setupAppStateObservers()
    }

    deinit {
        teardownAppStateObservers()
        removeAll(stopAll: true)
    }
    // MARK: - Config
    public func setDedupPolicy(_ policy: JobsTimerDedupPolicy) {
        lock.lock()
        defaultDedupPolicy = policy
        lock.unlock()
    }
    // MARK: - Public
    /// 创建并注册一个 timer
    ///
    /// 非 GCD 内核强制：
    /// - 必须主线程调用
    /// - config.runLoop 必须是 .main
    public func create(
        kind: JobsTimerKind,
        identifier: String?,
        config: JobsSwiftTimerConfig,
        dedupPolicy: JobsTimerDedupPolicy? = nil,
        backgroundPolicy: JobsTimerBackgroundPolicy? = nil,
        onTick: @escaping JobsTimerCallback
    ) throws -> JobsSwiftTimerProtocol {
        guard let identifier, !identifier.isEmpty else {
            throw JobsSwiftTimerMgrError.identifierRequired
        }
        let policy = dedupPolicy ?? defaultDedupPolicy
        let resolvedBackgroundPolicy = backgroundPolicy ?? (config.pauseInBackground ? .pauseAndResume : .ignore)
        // 先读 existing，避免锁内做 stop/remove 这种可能引发回调的重操作
        let existing: JobsSwiftTimerProtocol? = {
            lock.lock()
            defer { lock.unlock() };return entries[identifier]?.timer
        }()
        if let existing {
            switch policy {
            case .keepExisting:
                return existing
            case .replace:
                existing.stop()
                try remove(identifier: identifier)
            case .error:
                throw JobsSwiftTimerMgrError.duplicatedIdentifier(identifier)
            }
        }
        // Mgr 统一治理前后台，避免 timer 自己又监听一遍（UIKit）
        var c = config
        #if canImport(UIKit)
        c.autoManageAppState = false
        #endif
        // 非 GCD 内核依赖 RunLoop/DisplayLink：强制主线程主 RunLoop
        if kind != .gcd {
            precondition(c.runLoop == .main, "JobsSwiftTimerMgr: kind=\(kind) currently only supports RunLoop.main.")
            precondition(Thread.isMainThread, "JobsSwiftTimerMgr: create(kind=\(kind)) must be called on main thread.")
        }
        let timer = JobsTimer(kind: kind, config: c, handler: onTick)
        return try register(
            timer,
            identifier: identifier,
            dedupPolicy: policy,
            backgroundPolicy: resolvedBackgroundPolicy
        )
    }
    /// 获取 timer
    public func timer(for identifier: String) -> JobsSwiftTimerProtocol? {
        lock.lock()
        defer { lock.unlock() };return entries[identifier]?.timer
    }
    /// 对某个 timer 执行动作
    @discardableResult
    public func act(_ action: JobsSwiftTimerMgrAction, identifier: String) throws -> JobsSwiftTimerProtocol {
        lock.lock()
        let entry = entries[identifier]
        switch action {
        case .start, .resume:
            entry?.pauseState = .running
        case .pause:
            entry?.pauseState = .manualPaused
        case .stop, .cancel:
            break
        }
        lock.unlock()
        guard let entry else { throw JobsSwiftTimerMgrError.notFound(identifier) }
        let t = entry.timer
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
        guard entries.removeValue(forKey: identifier) != nil else {
            throw JobsSwiftTimerMgrError.notFound(identifier)
        }
    }
    /// 清空所有 timer
    public func removeAll(stopAll: Bool = true) {
        lock.lock()
        let all = entries
        entries.removeAll()
        lock.unlock()
        if stopAll {
            all.values.forEach { $0.timer.stop() }
        }
    }

    // iOS 12 及以下：同步
    public func stopAndRemove(identifier: String) {
        stopAndRemoveSync(identifier: identifier)
    }
    // iOS 13+：保留 async 入口（其实内部仍是同步逻辑）
    @available(iOS 13.0, *)
    public func stopAndRemove(identifier: String) async {
        stopAndRemoveSync(identifier: identifier)
    }
    // MARK: - Private
    private func stopAndRemoveSync(identifier: String) {
        do {
            _ = try act(.cancel, identifier: identifier)
        } catch {
            /// TODO
        }
    }

    private func register(
        _ timer: JobsSwiftTimerProtocol,
        identifier: String,
        dedupPolicy: JobsTimerDedupPolicy,
        backgroundPolicy: JobsTimerBackgroundPolicy
    ) throws -> JobsSwiftTimerProtocol {
        lock.lock()
        defer { lock.unlock() }
        let entry = Entry(timer: timer, backgroundPolicy: backgroundPolicy)
        if entries[identifier] != nil {
            switch dedupPolicy {
            case .keepExisting:
                return entries[identifier]!.timer
            case .replace:
                entries[identifier]?.timer.stop()
                entries[identifier] = entry
            case .error:
                throw JobsSwiftTimerMgrError.duplicatedIdentifier(identifier)
            }
        } else {
            entries[identifier] = entry
        };return timer
    }

    private func setupAppStateObservers() {
        #if canImport(UIKit)
        didEnterBackgroundObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.didEnterBackgroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleDidEnterBackground()
        }
        willEnterForegroundObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.willEnterForegroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleWillEnterForeground()
        }
        #endif
    }

    private func teardownAppStateObservers() {
        #if canImport(UIKit)
        if let didEnterBackgroundObserver {
            NotificationCenter.default.removeObserver(didEnterBackgroundObserver)
            self.didEnterBackgroundObserver = nil
        }
        if let willEnterForegroundObserver {
            NotificationCenter.default.removeObserver(willEnterForegroundObserver)
            self.willEnterForegroundObserver = nil
        }
        #endif
    }

    private func handleDidEnterBackground() {
        var toPause: [JobsSwiftTimerProtocol] = []
        var toCancel: [JobsSwiftTimerProtocol] = []
        lock.lock()
        let identifiers = Array(entries.keys)
        for identifier in identifiers {
            guard let entry = entries[identifier] else { continue }
            switch entry.backgroundPolicy {
            case .ignore:
                break
            case .pauseAndResume:
                guard entry.timer.isRunning, entry.pauseState == .running else { break }
                entry.pauseState = .autoPaused
                toPause.append(entry.timer)
            case .cancel:
                toCancel.append(entry.timer)
                entries.removeValue(forKey: identifier)
            }
        }
        lock.unlock()
        toPause.forEach { $0.pause() }
        toCancel.forEach { $0.stop() }
    }

    private func handleWillEnterForeground() {
        var toResume: [JobsSwiftTimerProtocol] = []
        lock.lock()
        for entry in entries.values {
            guard entry.backgroundPolicy == .pauseAndResume,
                  entry.pauseState == .autoPaused else { continue }
            entry.pauseState = .running
            toResume.append(entry.timer)
        }
        lock.unlock()
        toResume.forEach { $0.resume() }
    }
}
