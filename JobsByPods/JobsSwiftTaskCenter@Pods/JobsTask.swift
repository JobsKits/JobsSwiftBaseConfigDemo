//
//  JobsTask.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTimer

private final class JobsTaskContinuationBox: @unchecked Sendable {
    private let lock = NSLock()
    private var resumed = false
    var token: UUID?

    func markResumed() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        guard !resumed else { return false }
        resumed = true
        return true
    }
}
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
        let timer = self.timer
        lock.unlock()
        switch current {
        case .suspended:
            _ = updateState(to: .running, allowed: { $0 == .suspended })
            // 恢复时重新计算预估执行时间
            lock.lock()
            if let timer = self.timer {
                // 如果定时器存在，保持原有的预估时间逻辑
                // （因为 pause/resume 不改变定时器的剩余时间）
            }
            lock.unlock()
            timer?.resume()
        case .idle:
            scheduleInitialIfNeeded()
        default:
            break
        }
    }

    public func cancel() {
        let timerToStop: JobsSwiftTimerProtocol?
        let didChange: Bool
        lock.lock()
        if state == .cancelled {
            lock.unlock()
            return
        }
        state = .cancelled
        generation &+= 1
        timerToStop = timer
        timer = nil
        _estimatedNextExecutionDate = nil
        didChange = true
        let observers = Array(lifecycleObservers.values)
        lock.unlock()
        timerToStop?.stop()
        if didChange {
            observers.forEach { $0(.cancelled) }
        }
    }

    /// 立即执行所有已注册的 action
    /// 
    /// 注意：
    /// - 此方法会增加 executionCount
    /// - Actions 在锁外执行，以避免死锁
    /// - 即使 action 中调用 addAction/removeAction 也是安全的
    /// - 如果任务已取消，此方法会静默返回
    public func executeNow() {
        let snapshot: [Action]
        let now = Date()
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        _executionCount += 1
        // 更新性能指标
        if firstExecutionDate == nil {
            firstExecutionDate = now
        }
        lastExecutionDate = now
        snapshot = Array(actions.values)
        lock.unlock()
        snapshot.forEach { $0(self) }
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
            observers.forEach { $0(.finished) };return
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
        guard state == .running else {
            lock.unlock()
            return
        }
        guard let next = iterator.next() else {
            state = .finished
            generation &+= 1
            let oldTimer = timer
            timer = nil
            _estimatedNextExecutionDate = nil
            let observers = Array(lifecycleObservers.values)
            lock.unlock()
            oldTimer?.stop()
            observers.forEach { $0(.finished) };return
        }
        generation &+= 1
        let generation = self.generation
        _estimatedNextExecutionDate = Date().adding(next)
        let oldTimer = timer
        timer = nil
        lock.unlock()
        oldTimer?.stop()
        installTimer(after: next, generation: generation)
    }

    private func installTimer(after interval: JobsPeriod, generation: UInt64) {
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
        guard state != .cancelled else {
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
        scheduleNextExecution()
        executeNow()
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
    @discardableResult
    public func wait(forExecutions count: Int) async -> Int {
        guard count > 0 else { return 0 }
        let initial = executionCount
        if lifecycle.isTerminated {
            return 0
        }
        let target = initial + count
        return await withCheckedContinuation { continuation in
            let box = JobsTaskContinuationBox()
            let token = self.addAction { task in
                let current = task.executionCount
                guard current >= target else { return }
                if let token = box.token { self.removeAction(token) }
                if box.markResumed() { continuation.resume(returning: current - initial) }
            }
            box.token = token
            if self.lifecycle.isTerminated {
                self.removeAction(token)
                if box.markResumed() { continuation.resume(returning: max(0, self.executionCount - initial)) }
            }
        }
    }

    @discardableResult
    public func waitForNextExecution() async -> Int {
        await withCheckedContinuation { continuation in
            let box = JobsTaskContinuationBox()
            let token = self.addAction { task in
                let current = task.executionCount
                if let token = box.token { self.removeAction(token) }
                if box.markResumed() { continuation.resume(returning: current) }
            }
            box.token = token
            if self.lifecycle.isTerminated {
                self.removeAction(token)
                if box.markResumed() { continuation.resume(returning: self.executionCount) }
            }
        }
    }

    public func waitUntilFinished() async {
        guard !lifecycle.isTerminated else { return }
        await withCheckedContinuation { continuation in
            let box = JobsTaskContinuationBox()
            let token = self.addLifecycleObserver { lifecycle in
                guard lifecycle.isTerminated else { return }
                if let token = box.token { self.removeLifecycleObserver(token) }
                if box.markResumed() { continuation.resume() }
            }
            box.token = token
            if self.lifecycle.isTerminated {
                self.removeLifecycleObserver(token)
                if box.markResumed() { continuation.resume() }
            }
        }
    }

    @discardableResult
    public func executeAndWait() async -> Bool {
        guard !lifecycle.isTerminated else { return false }
        let initialCount = executionCount
        executeNow()
        let observedCount = await waitForExecutionCount(greaterThan: initialCount)
        return observedCount > initialCount
    }

    public func executions() -> JobsTaskExecutionSequence {
        JobsTaskExecutionSequence(task: self)
    }

    private func waitForExecutionCount(greaterThan initialCount: Int) async -> Int {
        if executionCount > initialCount {
            return executionCount
        };return await withCheckedContinuation { continuation in
            let box = JobsTaskContinuationBox()
            let token = self.addAction { task in
                let current = task.executionCount
                guard current > initialCount else { return }
                if let token = box.token { self.removeAction(token) }
                if box.markResumed() { continuation.resume(returning: current) }
            }
            box.token = token
            if self.executionCount > initialCount || self.lifecycle.isTerminated {
                self.removeAction(token)
                if box.markResumed() { continuation.resume(returning: self.executionCount) }
            }
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
        await withTaskGroup(of: JobsTask.self) { group in
            for task in tasks {
                group.addTask {
                    await task.waitUntilFinished()
                    return task
                }
            }
            // 返回第一个完成的任务
            if let first = await group.next() {
                group.cancelAll()
                return first
            };return nil
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

