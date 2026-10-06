//
//  JobsTask.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTimer

/// JobsTask - Jobs 系列任务管理核心类
/// 提供基于计划（Plan）的可取消、可暂停/恢复的定时任务执行能力
/// 线程安全：使用 NSLock 保护内部状态，标记为 @unchecked Sendable
public final class JobsTask: @unchecked Sendable {
    public typealias Lifecycle = JobsTaskLifecycle
    public typealias Action = @Sendable (JobsTask) -> Void
    public typealias LifecycleObserver = @Sendable (JobsTaskLifecycle) -> Void
    public typealias ErrorHandler = @Sendable (Error, JobsTask) -> Void

    private let lock = NSLock()
    private let queue: DispatchQueue
    private let runLoopMode: RunLoop.Mode?
    private var iterator: AnyIterator<JobsPeriod>
    private var actions: [UUID: Action] = [:]
    private var lifecycleObservers: [UUID: LifecycleObserver] = [:]
    private var errorHandler: ErrorHandler?
    private var timer: JobsSwiftTimerProtocol?
    private var state: JobsTaskLifecycle = .idle
    private var generation: UInt64 = 0
    private var _executionCount: Int = 0
    private var _estimatedNextExecutionDate: Date?
    private struct Waiter {
        let target: Int?
        let continuation: CheckedContinuation<Int, Never>
    }
    private var waiters: [UUID: Waiter] = [:]
    private var asyncExecutions: [UUID: Task<Void, Never>] = [:]
    private var activeAsyncIDs: Set<UUID> = []
    private var activeSynchronousExecutions = 0
    private var pendingExecutionRequests = 0
    private var isDrainingExecutions = false
    private var planExhausted = false
    private var suspendedNextInterval: JobsPeriod?

    // 性能指标追踪
    private let creationDate: Date = Date()
    private var firstExecutionDate: Date?
    private var lastExecutionDate: Date?

    public var lifecycle: JobsTaskLifecycle {
        lock.lock()
        defer { lock.unlock() };return state
    }

    public var executionCount: Int {
        lock.lock()
        defer { lock.unlock() };return _executionCount
    }

    public var estimatedNextExecutionDate: Date? {
        lock.lock()
        defer { lock.unlock() };return _estimatedNextExecutionDate
    }

    public var isRunning: Bool { lifecycle == .running }
    public var isSuspended: Bool { lifecycle == .suspended }
    public var isCancelled: Bool { lifecycle == .cancelled }
    public var isFinished: Bool { lifecycle == .finished }

    public var actionCount: Int {
        lock.lock()
        defer { lock.unlock() };return actions.count
    }

    /// 获取任务的性能指标
    public var metrics: JobsTaskMetrics {
        lock.lock()
        defer { lock.unlock() }
        let totalDuration = Date().timeIntervalSince(creationDate)
        var averageInterval: TimeInterval?
        if _executionCount > 1, let first = firstExecutionDate, let last = lastExecutionDate {
            let executionDuration = last.timeIntervalSince(first)
            averageInterval = executionDuration / Double(_executionCount - 1)
        };return JobsTaskMetrics(
            totalExecutions: _executionCount,
            creationDate: creationDate,
            firstExecutionDate: firstExecutionDate,
            lastExecutionDate: lastExecutionDate,
            totalDuration: totalDuration,
            averageInterval: averageInterval,
            currentLifecycle: state
        )
    }

    public init(
        plan: JobsPlan,
        queue: DispatchQueue? = nil,
        runLoopMode: RunLoop.Mode? = nil,
        action: @escaping Action
    ) {
        self.iterator = plan.makeIterator()
        self.queue = queue ?? .main
        self.runLoopMode = runLoopMode
        let token = UUID()
        self.actions[token] = action
        scheduleInitialIfNeeded()
    }

    deinit {
        cancel()
    }
}

extension JobsTask {
    @discardableResult
    public func addAction(_ action: @escaping Action) -> UUID {
        let id = UUID()
        lock.lock()
        actions[id] = action
        lock.unlock()
        return id
    }

    public func removeAction(_ id: UUID) {
        lock.lock()
        actions.removeValue(forKey: id)
        lock.unlock()
    }

    @discardableResult
    public func addLifecycleObserver(_ observer: @escaping LifecycleObserver) -> UUID {
        let id = UUID()
        lock.lock()
        lifecycleObservers[id] = observer
        lock.unlock()
        return id
    }

    public func removeLifecycleObserver(_ id: UUID) {
        lock.lock()
        lifecycleObservers.removeValue(forKey: id)
        lock.unlock()
    }

    /// 设置错误处理器
    /// - Parameter handler: 当 action 执行抛出错误时调用的处理器
    /// - Returns: self，支持链式调用
    @discardableResult
    public func onError(_ handler: @escaping ErrorHandler) -> Self {
        lock.lock()
        defer { lock.unlock() }
        errorHandler = handler
        return self
    }

    public func suspend() {
        let timer: JobsSwiftTimerProtocol?
        let didChange = updateState(to: .suspended, allowed: { $0 == .running })
        lock.lock()
        timer = self.timer
        // 暂停时清除预估时间，因为恢复时间未知
        _estimatedNextExecutionDate = nil
        lock.unlock()
        guard didChange else { return }
        timer?.pause()
    }

    public func resume() {
        lock.lock()
        let current = state
        if current == .suspended {
            state = .running
            let next = suspendedNextInterval
            suspendedNextInterval = nil
            let currentTimer = timer
            let token = generation
            let observers = Array(lifecycleObservers.values)
            if let next {
                _estimatedNextExecutionDate = Date().adding(next)
            }
            lock.unlock()
            observers.forEach { $0(.running) }
            if let next {
                installTimer(after: next, generation: token)
            } else {
                currentTimer?.resume()
            }
        } else {
            lock.unlock()
            if current == .idle {
                scheduleInitialIfNeeded()
            }
        }
    }

    public func cancel() {
        lock.lock()
        guard !state.isTerminated else {
            lock.unlock()
            return
        }
        state = .cancelled
        generation &+= 1
        let timerToStop = timer
        timer = nil
        _estimatedNextExecutionDate = nil
        let observers = Array(lifecycleObservers.values)
        let pending = Array(waiters.values)
        waiters.removeAll()
        let count = _executionCount
        let handles = Array(asyncExecutions.values)
        asyncExecutions.removeAll()
        activeAsyncIDs.removeAll()
        pendingExecutionRequests = 0
        suspendedNextInterval = nil
        lock.unlock()
        timerToStop?.stop()
        handles.forEach { $0.cancel() }
        pending.forEach { $0.continuation.resume(returning: count) }
        observers.forEach { $0(.cancelled) }
    }

    /// 立即执行所有已注册的 action
    /// 
    /// 注意：
    /// - 此方法会增加 executionCount
    /// - Actions 在锁外执行，以避免死锁
    /// - 即使 action 中调用 addAction/removeAction 也是安全的
    /// - 如果任务已取消，此方法会静默返回
    public func executeNow() {
        lock.lock()
        guard !state.isTerminated else {
            lock.unlock()
            return
        }
        pendingExecutionRequests += 1
        guard !isDrainingExecutions else {
            lock.unlock()
            return
        }
        isDrainingExecutions = true
        lock.unlock()
        drainExecutionRequests()
    }

    /// 正在执行时只登记请求，避免跨任务同步调用互相等待；业务代码始终在锁外。
    private func drainExecutionRequests() {
        while true {
            lock.lock()
            guard pendingExecutionRequests > 0, !state.isTerminated else {
                pendingExecutionRequests = 0
                isDrainingExecutions = false
                lock.unlock()
                finishIfDrained()
                return
            }
            pendingExecutionRequests -= 1
            _executionCount += 1
            activeSynchronousExecutions += 1
            let now = Date()
            if firstExecutionDate == nil {
                firstExecutionDate = now
            }
            lastExecutionDate = now
            let snapshot = Array(actions.values)
            lock.unlock()
            snapshot.forEach { $0(self) }
            lock.lock()
            activeSynchronousExecutions -= 1
            let count = _executionCount
            let reached = waiters.filter { $0.value.target.map { count >= $0 } ?? false }
            reached.keys.forEach { waiters.removeValue(forKey: $0) }
            lock.unlock()
            reached.values.forEach { $0.continuation.resume(returning: count) }
            finishIfDrained()
        }
    }

    private func scheduleInitialIfNeeded() {
        lock.lock()
        guard state == .idle else {
            lock.unlock()
            return
        }
        guard let next = iterator.next() else {
            state = .finished
            let observers = Array(lifecycleObservers.values)
            lock.unlock()
            observers.forEach { $0(.finished) }
            return
        }
        state = .running
        generation &+= 1
        let generation = self.generation
        _estimatedNextExecutionDate = Date().adding(next)
        let observers = Array(lifecycleObservers.values)
        lock.unlock()
        observers.forEach { $0(.running) }
        installTimer(after: next, generation: generation)
    }

    private func scheduleNextExecution() {
        lock.lock()
        guard state == .running || state == .suspended else {
            lock.unlock()
            return
        }
        guard let next = iterator.next() else {
            planExhausted = true
            generation &+= 1
            let oldTimer = timer
            timer = nil
            _estimatedNextExecutionDate = nil
            lock.unlock()
            oldTimer?.stop()
            finishIfDrained()
            return
        }
        generation &+= 1
        let generation = self.generation
        let suspended = state == .suspended
        suspendedNextInterval = suspended ? next : nil
        _estimatedNextExecutionDate = suspended ? nil : Date().adding(next)
        let oldTimer = timer
        timer = nil
        lock.unlock()
        oldTimer?.stop()
        if !suspended {
            installTimer(after: next, generation: generation)
        }
    }

    private func installTimer(after interval: JobsPeriod, generation: UInt64) {
        if runLoopMode != nil && !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.installTimer(after: interval, generation: generation)
            }
            return
        }
        let config = JobsSwiftTimerConfig(
            interval: interval.timeInterval,
            repeats: false,
            queue: queue,
            runLoop: .main,
            runLoopMode: runLoopMode ?? .common,
            pauseInBackground: false,
            autoManageAppState: false
        )
        let kind: JobsTimerKind = runLoopMode == nil ? .gcd : .runLoop
        let oneShot = JobsTimer(kind: kind, config: config) { [weak self] in
            self?.handleTimerFired(generation: generation)
        }
        lock.lock()
        if state == .suspended, self.generation == generation {
            suspendedNextInterval = interval
            lock.unlock()
            return
        }
        guard state == .running, self.generation == generation else {
            lock.unlock()
            return
        }
        timer = oneShot
        lock.unlock()
        if kind == .gcd {
            oneShot.start()
        } else if Thread.isMainThread {
            oneShot.start()
        } else {
            DispatchQueue.main.async {
                oneShot.start()
            }
        }
    }

    private func handleTimerFired(generation: UInt64) {
        let shouldContinue: Bool
        lock.lock()
        shouldContinue = state == .running && self.generation == generation
        lock.unlock()
        guard shouldContinue else { return }
        executeNow()
        scheduleNextExecution()
    }

    /// 将异步业务句柄纳入任务生命周期；自然 finished 直到所有业务结束才发布。
    func launchAsync(
        priority: TaskPriority,
        action: @escaping @Sendable () async -> Void
    ) {
        let id = UUID()
        lock.lock()
        guard !state.isTerminated else {
            lock.unlock()
            return
        }
        activeAsyncIDs.insert(id)
        lock.unlock()
        let handle = Task(priority: priority) { [weak self] in
            guard !Task.isCancelled else {
                self?.completeAsync(id)
                return
            }
            await action()
            self?.completeAsync(id)
        }
        lock.lock()
        let shouldKeep = activeAsyncIDs.contains(id) && state != .cancelled
        if shouldKeep {
            asyncExecutions[id] = handle
        }
        lock.unlock()
        if !shouldKeep {
            handle.cancel()
        }
    }

    private func completeAsync(_ id: UUID) {
        lock.lock()
        activeAsyncIDs.remove(id)
        asyncExecutions.removeValue(forKey: id)
        lock.unlock()
        finishIfDrained()
    }

    private func finishIfDrained() {
        lock.lock()
        guard planExhausted, !state.isTerminated, activeAsyncIDs.isEmpty,
              activeSynchronousExecutions == 0, pendingExecutionRequests == 0 else {
            lock.unlock()
            return
        }
        state = .finished
        let observers = Array(lifecycleObservers.values)
        let pending = Array(waiters.values)
        waiters.removeAll()
        let count = _executionCount
        lock.unlock()
        pending.forEach { $0.continuation.resume(returning: count) }
        observers.forEach { $0(.finished) }
    }

    @discardableResult
    private func updateState(
        to newState: JobsTaskLifecycle,
        allowed: (JobsTaskLifecycle) -> Bool
    ) -> Bool {
        let observers: [LifecycleObserver]
        lock.lock()
        guard allowed(state), state != newState else {
            lock.unlock()
            return false
        }
        state = newState
        if newState.isTerminated {
            generation &+= 1
            _estimatedNextExecutionDate = nil
        }
        observers = Array(lifecycleObservers.values)
        lock.unlock()
        observers.forEach { $0(newState) };return true
    }
}

// MARK: - JobsTask Async/Await/AsyncSequence Support
extension JobsTask {
    /// 达到次数、任务终止或 waiter 自身取消时返回实际新增次数。取消 waiter 不取消任务。
    @discardableResult
    public func wait(forExecutions count: Int) async -> Int {
        guard count > 0 else {
            return 0
        }
        let initial = executionCount
        let (sum, overflow) = initial.addingReportingOverflow(count)
        let current = await waitForCount(target: overflow ? Int.max : sum)
        return max(0, current - initial)
    }

    @discardableResult
    public func waitForNextExecution() async -> Int {
        let initial = executionCount
        let (target, overflow) = initial.addingReportingOverflow(1)
        return await waitForCount(target: overflow ? Int.max : target)
    }

    public func waitUntilFinished() async {
        _ = await waitForCount(target: nil)
    }

    @discardableResult
    public func executeAndWait() async -> Bool {
        guard !lifecycle.isTerminated, !Task.isCancelled else {
            return false
        }
        let initialCount = executionCount
        executeNow()
        let (target, overflow) = initialCount.addingReportingOverflow(1)
        let observedCount = await waitForCount(target: overflow ? Int.max : target)
        return observedCount > initialCount
    }

    public func executions() -> JobsTaskExecutionSequence {
        JobsTaskExecutionSequence(task: self)
    }

    private func waitForCount(target: Int?) async -> Int {
        let id = UUID()
        return await withTaskCancellationHandler {
            await withCheckedContinuation { continuation in
                lock.lock()
                let count = _executionCount
                if Task.isCancelled || state.isTerminated || target.map({ count >= $0 }) == true {
                    lock.unlock()
                    continuation.resume(returning: count)
                    return
                }
                waiters[id] = Waiter(target: target, continuation: continuation)
                lock.unlock()
            }
        } onCancel: {
            self.lock.lock()
            let pending = self.waiters.removeValue(forKey: id)
            let count = self._executionCount
            self.lock.unlock()
            pending?.continuation.resume(returning: count)
        }
    }
}

// MARK: - JobsTask Combinators (组合器)
extension JobsTask {
    /// 等待多个任务全部完成
    /// - Parameter tasks: 要等待的任务数组
    /// - Returns: 所有任务完成时返回
    public static func waitAll(_ tasks: [JobsTask]) async {
        await withTaskGroup(of: Void.self) { group in
            for task in tasks {
                group.addTask {
                    await task.waitUntilFinished()
                }
            }
            // 等待所有任务完成
            await group.waitForAll()
        }
    }

    /// 等待任意一个任务完成
    /// - Parameter tasks: 要等待的任务数组
    /// - Returns: 第一个完成的任务
    public static func waitAny(_ tasks: [JobsTask]) async -> JobsTask? {
        await withTaskGroup(of: JobsTask?.self) { group in
            for task in tasks {
                group.addTask {
                    await task.waitUntilFinished()
                    return Task.isCancelled ? nil : task
                }
            }
            // 返回第一个完成的任务
            while let result = await group.next() {
                if let first = result {
                    group.cancelAll()
                    return first
                }
            }
            return nil
        }
    }

    /// 取消多个任务
    /// - Parameter tasks: 要取消的任务数组
    public static func cancelAll(_ tasks: [JobsTask]) {
        tasks.forEach { $0.cancel() }
    }

    /// 暂停多个任务
    /// - Parameter tasks: 要暂停的任务数组
    public static func suspendAll(_ tasks: [JobsTask]) {
        tasks.forEach { $0.suspend() }
    }

    /// 恢复多个任务
    /// - Parameter tasks: 要恢复的任务数组
    public static func resumeAll(_ tasks: [JobsTask]) {
        tasks.forEach { $0.resume() }
    }
}
