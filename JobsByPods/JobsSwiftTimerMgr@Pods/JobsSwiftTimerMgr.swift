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
public final class JobsSwiftTimerMgr: @unchecked Sendable {
    private enum PauseState: Sendable {
        case idle
        case running
        case manualPaused
        case autoPaused
        case scopePaused
        case stopped
    }

    private enum ManagedActionResult {
        case performed
        case detached
        case stale
    }

    private enum ApplicationStateSnapshot: Equatable {
        case active
        case inactive
        case background
    }

    private final class ManagedTimer: JobsSwiftTimerProtocol, @unchecked Sendable {
        private weak var manager: JobsSwiftTimerMgr?
        private let identifier: String
        fileprivate let lifecycleTimer: JobsSwiftTimerProtocol

        init(
            manager: JobsSwiftTimerMgr,
            identifier: String,
            lifecycleTimer: JobsSwiftTimerProtocol
        ) {
            self.manager = manager
            self.identifier = identifier
            self.lifecycleTimer = lifecycleTimer
        }

        var isRunning: Bool { lifecycleTimer.isRunning }
        var requiresMainThreadLifecycle: Bool { lifecycleTimer.requiresMainThreadLifecycle }

        @discardableResult
        func start() -> Self {
            perform(.start);return self
        }

        @discardableResult
        func pause() -> Self {
            perform(.pause);return self
        }

        @discardableResult
        func resume() -> Self {
            perform(.resume);return self
        }

        @discardableResult
        func fireOnce() -> Self {
            if let manager {
                switch manager.performManagedFireOnce(
                    identifier: identifier,
                    expectedTimer: lifecycleTimer
                ) {
                /// 合并处理 .performed、.stale 分支
                case .performed, .stale:
                    return self
                /// 处理 .detached 分支
                case .detached:
                    break
                }
            }
            let work = { [lifecycleTimer] in
                _ = lifecycleTimer.fireOnce()
            }
            runOnRequiredThread(work);return self
        }

        @discardableResult
        func stop() -> Self {
            perform(.stop);return self
        }

        @discardableResult
        func onTick(_ block: @escaping JobsTimerCallback) -> Self {
            _ = lifecycleTimer.onTick(block);return self
        }

        @discardableResult
        func onFinish(_ block: @escaping JobsTimerCallback) -> Self {
            _ = lifecycleTimer.onFinish(block);return self
        }

        private func perform(_ action: JobsSwiftTimerMgrAction) {
            if let manager {
                switch manager.performManagedAction(
                    action,
                    identifier: identifier,
                    expectedTimer: lifecycleTimer
                ) {
                /// 合并处理 .performed、.stale 分支
                case .performed, .stale:
                    return
                /// 处理 .detached 分支
                case .detached:
                    break
                }
            }
            let work = { [lifecycleTimer] in
                switch action {
                /// 处理 .start 分支
                case .start:
                    _ = lifecycleTimer.start()
                /// 处理 .pause 分支
                case .pause:
                    _ = lifecycleTimer.pause()
                /// 处理 .resume 分支
                case .resume:
                    _ = lifecycleTimer.resume()
                /// 合并处理 .stop、.cancel 分支
                case .stop, .cancel:
                    _ = lifecycleTimer.stop()
                }
            }
            runOnRequiredThread(work)
        }

        private func runOnRequiredThread(_ work: @escaping () -> Void) {
            if requiresMainThreadLifecycle, !Thread.isMainThread {
                DispatchQueue.main.sync(execute: work)
            } else {
                work()
            }
        }
    }

    private final class Entry: @unchecked Sendable {
        let timer: ManagedTimer
        let lifecycleTimer: JobsSwiftTimerProtocol
        let scopeIdentifier: String?
        let backgroundPolicy: JobsTimerBackgroundPolicy
        let actionLock = NSRecursiveLock()
        var pauseState: PauseState
        init(
            timer: ManagedTimer,
            lifecycleTimer: JobsSwiftTimerProtocol,
            scopeIdentifier: String?,
            backgroundPolicy: JobsTimerBackgroundPolicy,
            pauseState: PauseState = .idle
        ) {
            self.timer = timer
            self.lifecycleTimer = lifecycleTimer
            self.scopeIdentifier = scopeIdentifier
            self.backgroundPolicy = backgroundPolicy
            self.pauseState = pauseState
        }
    }

    public static let shared = JobsSwiftTimerMgr()
    private let lock = NSLock()
    private var entries: [String: Entry] = [:]
    private var pausedScopeIdentifiers: Set<String> = []
    private var defaultDedupPolicy: JobsTimerDedupPolicy = .replace
    private let managesAppState: Bool
    #if canImport(UIKit)
    private var willResignActiveObserver: NSObjectProtocol?
    private var didEnterBackgroundObserver: NSObjectProtocol?
    private var didBecomeActiveObserver: NSObjectProtocol?
    #endif

    public init(managesAppState: Bool = true) {
        self.managesAppState = managesAppState
        if managesAppState {
            setupAppStateObservers()
        }
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
        scopeIdentifier: String? = nil,
        onTick: @escaping JobsTimerCallback
    ) throws -> JobsSwiftTimerProtocol {
        guard let identifier, !identifier.isEmpty else {
            throw JobsSwiftTimerMgrError.identifierRequired
        }
        lock.lock()
        let policy = dedupPolicy ?? defaultDedupPolicy
        lock.unlock()
        let resolvedBackgroundPolicy = backgroundPolicy ?? (config.pauseInBackground ? .pauseAndResume : .ignore)
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
        let lifecycleTimer = JobsTimer(kind: kind, config: c, handler: onTick)
        let timer = ManagedTimer(
            manager: self,
            identifier: identifier,
            lifecycleTimer: lifecycleTimer
        )
        let newEntry = Entry(
            timer: timer,
            lifecycleTimer: lifecycleTimer,
            scopeIdentifier: normalizedScopeIdentifier(scopeIdentifier),
            backgroundPolicy: resolvedBackgroundPolicy
        )
        var selectedTimer: JobsSwiftTimerProtocol = timer
        var replacedEntry: Entry?
        var registrationError: JobsSwiftTimerMgrError?
        lock.lock()
        if let existing = entries[identifier] {
            switch policy {
            /// 处理 .keepExisting 分支
            case .keepExisting:
                selectedTimer = existing.timer
            /// 处理 .replace 分支
            case .replace:
                entries[identifier] = newEntry
                replacedEntry = existing
            /// 处理 .error 分支
            case .error:
                registrationError = .duplicatedIdentifier(identifier)
            }
        } else {
            entries[identifier] = newEntry
        }
        lock.unlock()
        if let registrationError { throw registrationError }
        if let replacedEntry {
            stopDetachedEntry(replacedEntry)
        };return selectedTimer
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
        lock.unlock()
        guard let entry else { throw JobsSwiftTimerMgrError.notFound(identifier) }
        guard performEntryAction(action, identifier: identifier, entry: entry) else {
            throw JobsSwiftTimerMgrError.notFound(identifier)
        };return entry.timer
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
        pausedScopeIdentifiers.removeAll()
        lock.unlock()
        if stopAll {
            all.values.forEach(stopDetachedEntry)
        }
    }

    // iOS 12 及以下：同步
    public func stopAndRemove(identifier: String) {
        stopAndRemoveSync(identifier: identifier)
    }
    /// 仅当 identifier 仍指向 expectedTimer 时才移除，避免旧 Cell 的延迟清理误杀复用后的新 Timer
    @discardableResult
    public func stopAndRemove(
        identifier: String,
        expectedTimer: JobsSwiftTimerProtocol
    ) -> Bool {
        lock.lock()
        let entry = entries[identifier]
        guard let entry, entry.timer === expectedTimer else {
            lock.unlock()
            _ = expectedTimer.stop()
            return false
        }
        entries.removeValue(forKey: identifier)
        lock.unlock()
        stopDetachedEntry(entry);return true
    }
    /// 暂停页面 / 业务域内的 Timer；手动暂停的 Timer 不会被改写为 Scope 暂停
    @discardableResult
    public func pause(scopeIdentifier: String) -> Int {
        guard let scopeIdentifier = normalizedScopeIdentifier(scopeIdentifier) else { return 0 }
        lock.lock()
        pausedScopeIdentifiers.insert(scopeIdentifier)
        let snapshot = entries.filter { $0.value.scopeIdentifier == scopeIdentifier }
        lock.unlock()
        snapshot.forEach { identifier, entry in
            pauseForScope(identifier: identifier, entry: entry)
        };return snapshot.count
    }
    /// 只恢复由 Scope 暂停的 Timer，不会误恢复业务主动暂停的 Timer
    @discardableResult
    public func resume(scopeIdentifier: String) -> Int {
        guard let scopeIdentifier = normalizedScopeIdentifier(scopeIdentifier) else { return 0 }
        lock.lock()
        pausedScopeIdentifiers.remove(scopeIdentifier)
        let snapshot = entries.filter { $0.value.scopeIdentifier == scopeIdentifier }
        lock.unlock()
        snapshot.forEach { identifier, entry in
            resumeFromScope(identifier: identifier, entry: entry)
        };return snapshot.count
    }
    /// 停止并移除页面 / 业务域内的全部 Timer
    @discardableResult
    public func stopAndRemove(scopeIdentifier: String) -> Int {
        guard let scopeIdentifier = normalizedScopeIdentifier(scopeIdentifier) else { return 0 }
        lock.lock()
        let matched = entries.filter { $0.value.scopeIdentifier == scopeIdentifier }
        matched.keys.forEach { entries.removeValue(forKey: $0) }
        pausedScopeIdentifiers.remove(scopeIdentifier)
        lock.unlock()
        matched.values.forEach(stopDetachedEntry);return matched.count
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
        } catch {}
    }

    private func normalizedScopeIdentifier(_ scopeIdentifier: String?) -> String? {
        guard let scopeIdentifier = scopeIdentifier?.trimmingCharacters(in: .whitespacesAndNewlines),
              !scopeIdentifier.isEmpty else { return nil }
        return scopeIdentifier
    }

    private func isScopePaused(_ scopeIdentifier: String?) -> Bool {
        guard let scopeIdentifier else { return false }
        lock.lock()
        defer { lock.unlock() };return pausedScopeIdentifiers.contains(scopeIdentifier)
    }

    private func pauseForScope(identifier: String, entry: Entry) {
        runOnRequiredThread(for: entry.lifecycleTimer) {
            entry.actionLock.lock()
            defer { entry.actionLock.unlock() }
            guard self.isCurrent(identifier: identifier, entry: entry) else { return }
            switch entry.pauseState {
            /// 仅 Scope 接管正在运行或系统自动暂停的 Timer
            case .running, .autoPaused:
                _ = entry.lifecycleTimer.pause()
                entry.pauseState = .scopePaused
            /// 手动暂停、未启动和已停止状态保持原语义
            case .idle, .manualPaused, .scopePaused, .stopped:
                break
            }
        }
    }

    private func resumeFromScope(identifier: String, entry: Entry) {
        let appState = currentApplicationState()
        runOnRequiredThread(for: entry.lifecycleTimer) {
            entry.actionLock.lock()
            defer { entry.actionLock.unlock() }
            guard self.isCurrent(identifier: identifier, entry: entry),
                  entry.pauseState == .scopePaused else { return }
            _ = entry.lifecycleTimer.resume()
            self.applyPostStartState(appState, identifier: identifier, entry: entry)
        }
    }

    private func performManagedAction(
        _ action: JobsSwiftTimerMgrAction,
        identifier: String,
        expectedTimer: JobsSwiftTimerProtocol
    ) -> ManagedActionResult {
        lock.lock()
        let entry = entries[identifier]
        lock.unlock()
        guard let entry else { return .detached }
        guard entry.lifecycleTimer === expectedTimer else { return .stale }
        return performEntryAction(action, identifier: identifier, entry: entry)
            ? .performed
            : .stale
    }

    private func performManagedFireOnce(
        identifier: String,
        expectedTimer: JobsSwiftTimerProtocol
    ) -> ManagedActionResult {
        lock.lock()
        let entry = entries[identifier]
        lock.unlock()
        guard let entry else { return .detached }
        guard entry.lifecycleTimer === expectedTimer else { return .stale }
        let performed = runOnRequiredThread(for: entry.lifecycleTimer) {
            entry.actionLock.lock()
            defer { entry.actionLock.unlock() }
            guard self.removeIfCurrent(identifier: identifier, entry: entry) else { return false }
            _ = entry.lifecycleTimer.fireOnce()
            entry.pauseState = .stopped
            return true
        };return performed ? .performed : .stale
    }

    private func performEntryAction(
        _ action: JobsSwiftTimerMgrAction,
        identifier: String,
        entry: Entry
    ) -> Bool {
        let appState = (action == .start || action == .resume)
            ? currentApplicationState()
            : .active
        return runOnRequiredThread(for: entry.lifecycleTimer) {
            entry.actionLock.lock()
            defer { entry.actionLock.unlock() }
            guard self.isCurrent(identifier: identifier, entry: entry) else { return false }
            switch action {
            /// 处理 .start 分支
            case .start:
                _ = entry.lifecycleTimer.start()
                self.applyPostStartState(appState, identifier: identifier, entry: entry)
            /// 处理 .pause 分支
            case .pause:
                _ = entry.lifecycleTimer.pause()
                if entry.pauseState != .stopped {
                    entry.pauseState = .manualPaused
                }
            /// 处理 .resume 分支
            case .resume:
                _ = entry.lifecycleTimer.resume()
                self.applyPostStartState(appState, identifier: identifier, entry: entry)
            /// 合并处理 .stop、.cancel 分支
            case .stop, .cancel:
                if action == .cancel {
                    _ = self.removeIfCurrent(identifier: identifier, entry: entry)
                }
                _ = entry.lifecycleTimer.stop()
                entry.pauseState = .stopped
            }
            return true
        }
    }

    private func applyPostStartState(
        _ appState: ApplicationStateSnapshot,
        identifier: String,
        entry: Entry
    ) {
        guard entry.lifecycleTimer.isRunning else { return }
        if entry.backgroundPolicy == .cancel, appState == .background {
            _ = removeIfCurrent(identifier: identifier, entry: entry)
            _ = entry.lifecycleTimer.stop()
            entry.pauseState = .stopped
            return
        }
        if isScopePaused(entry.scopeIdentifier) {
            _ = entry.lifecycleTimer.pause()
            entry.pauseState = .scopePaused
            return
        }
        switch entry.backgroundPolicy {
        /// 处理 .ignore 分支
        case .ignore:
            entry.pauseState = .running
        /// 处理 .pauseAndResume 分支
        case .pauseAndResume where appState != .active:
            _ = entry.lifecycleTimer.pause()
            entry.pauseState = .autoPaused
        /// 处理 .cancel 分支
        /// 合并处理 .pauseAndResume、.cancel 分支
        case .pauseAndResume, .cancel:
            entry.pauseState = .running
        }
    }

    private func stopDetachedEntry(_ entry: Entry) {
        runOnRequiredThread(for: entry.lifecycleTimer) {
            entry.actionLock.lock()
            defer { entry.actionLock.unlock() }
            _ = entry.lifecycleTimer.stop()
            entry.pauseState = .stopped
        }
    }

    private func isCurrent(identifier: String, entry: Entry) -> Bool {
        lock.lock()
        defer { lock.unlock() };return entries[identifier] === entry
    }

    private func removeIfCurrent(identifier: String, entry: Entry) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        guard entries[identifier] === entry else { return false }
        entries.removeValue(forKey: identifier)
        return true
    }

    private func runOnRequiredThread<T>(
        for timer: JobsSwiftTimerProtocol,
        _ work: () -> T
    ) -> T {
        if timer.requiresMainThreadLifecycle, !Thread.isMainThread {
            return DispatchQueue.main.sync(execute: work)
        };return work()
    }

    private func setupAppStateObservers() {
        #if canImport(UIKit)
        willResignActiveObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.willResignActiveNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleInactiveState(isBackground: false)
        }
        didEnterBackgroundObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.didEnterBackgroundNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleInactiveState(isBackground: true)
        }
        didBecomeActiveObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleDidBecomeActive()
        }
        #endif
    }

    private func teardownAppStateObservers() {
        #if canImport(UIKit)
        if let willResignActiveObserver {
            NotificationCenter.default.removeObserver(willResignActiveObserver)
            self.willResignActiveObserver = nil
        }
        if let didEnterBackgroundObserver {
            NotificationCenter.default.removeObserver(didEnterBackgroundObserver)
            self.didEnterBackgroundObserver = nil
        }
        if let didBecomeActiveObserver {
            NotificationCenter.default.removeObserver(didBecomeActiveObserver)
            self.didBecomeActiveObserver = nil
        }
        #endif
    }

    private func currentApplicationState() -> ApplicationStateSnapshot {
        guard managesAppState else { return .active }
        #if canImport(UIKit)
        let state: UIApplication.State
        if Thread.isMainThread {
            state = UIApplication.shared.applicationState
        } else {
            state = DispatchQueue.main.sync {
                UIApplication.shared.applicationState
            }
        }
        switch state {
        /// 处理 .active 分支
        case .active:
            return .active
        /// 处理 .inactive 分支
        case .inactive:
            return .inactive
        /// 处理 .background 分支
        case .background:
            return .background
        /// 处理系统后续新增的未知枚举值
        @unknown default:
            return .inactive
        }
        #else
        return .active
        #endif
    }

    private func handleInactiveState(isBackground: Bool) {
        lock.lock()
        let snapshot = entries.map { ($0.key, $0.value) }
        lock.unlock()
        snapshot.forEach { identifier, entry in
            runOnRequiredThread(for: entry.lifecycleTimer) {
                entry.actionLock.lock()
                defer { entry.actionLock.unlock() }
                guard self.isCurrent(identifier: identifier, entry: entry) else { return }
                switch entry.backgroundPolicy {
                /// 处理 .ignore 分支
                case .ignore:
                    break
                /// 处理 .pauseAndResume 分支
                case .pauseAndResume:
                    guard entry.lifecycleTimer.isRunning,
                          entry.pauseState == .running else { break }
                    _ = entry.lifecycleTimer.pause()
                    entry.pauseState = .autoPaused
                /// 处理 .cancel 分支
                case .cancel where isBackground:
                    _ = self.removeIfCurrent(identifier: identifier, entry: entry)
                    _ = entry.lifecycleTimer.stop()
                    entry.pauseState = .stopped
                /// 处理 .cancel 分支
                case .cancel:
                    break
                }
            }
        }
    }

    private func handleDidBecomeActive() {
        lock.lock()
        let snapshot = entries.map { ($0.key, $0.value) }
        lock.unlock()
        snapshot.forEach { identifier, entry in
            runOnRequiredThread(for: entry.lifecycleTimer) {
                entry.actionLock.lock()
                defer { entry.actionLock.unlock() }
                guard self.isCurrent(identifier: identifier, entry: entry),
                      entry.backgroundPolicy == .pauseAndResume,
                      entry.pauseState == .autoPaused else { return }
                _ = entry.lifecycleTimer.resume()
                entry.pauseState = entry.lifecycleTimer.isRunning ? .running : .stopped
            }
        }
    }
}
