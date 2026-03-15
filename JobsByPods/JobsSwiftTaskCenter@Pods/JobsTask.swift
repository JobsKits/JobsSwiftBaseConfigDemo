//
//  JobsTask.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 3/15/26.
//  Copyright © 2026 Jobs. All rights reserved.
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

    private let lock = NSLock()
    private let queue: DispatchQueue
    private let runLoopMode: RunLoop.Mode?
    private var iterator: AnyIterator<JobsPeriod>
    private var actions: [UUID: Action] = [:]
    private var lifecycleObservers: [UUID: LifecycleObserver] = [:]
    private var timer: JobsSwiftTimerProtocol?
    private var state: JobsTaskLifecycle = .idle
    private var generation: UInt64 = 0
    private var _executionCount: Int = 0
    private var _estimatedNextExecutionDate: Date?

    public var lifecycle: JobsTaskLifecycle {
        lock.lock()
        defer { lock.unlock() }
        return state
    }

    public var executionCount: Int {
        lock.lock()
        defer { lock.unlock() }
        return _executionCount
    }

    public var estimatedNextExecutionDate: Date? {
        lock.lock()
        defer { lock.unlock() }
        return _estimatedNextExecutionDate
    }

    public var isRunning: Bool { lifecycle == .running }
    public var isSuspended: Bool { lifecycle == .suspended }
    public var isCancelled: Bool { lifecycle == .cancelled }
    public var isFinished: Bool { lifecycle == .finished }

    public var actionCount: Int {
        lock.lock()
        defer { lock.unlock() }
        return actions.count
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

    public func suspend() {
        let timer: JobsSwiftTimerProtocol?
        let didChange = updateState(to: .suspended, allowed: { $0 == .running })
        lock.lock()
        timer = self.timer
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

    public func executeNow() {
        let snapshot: [Action]
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        _executionCount += 1
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
            observers.forEach { $0(.finished) }
            return
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
        observers.forEach { $0(newState) }
        return true
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
        }
        return await withCheckedContinuation { continuation in
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
