//
//  JobsTask.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 3/15/26.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsSwiftTimer
/// JobsTask - Jobs 系列任务管理核心类
/// 提供基于计划（Plan）的可取消、可暂停/恢复的定时任务执行能力
/// 线程安全：使用 NSLock 保护内部状态，标记为 @unchecked Sendable
public final class JobsTask: @unchecked Sendable {
    /// 任务生命周期类型别名
    public typealias Lifecycle = JobsTaskLifecycle
    public typealias Action = @Sendable (JobsTask) -> Void
    private let lock = NSLock()
    private let queue: DispatchQueue
    private let runLoopMode: RunLoop.Mode?
    private var iterator: AnyIterator<JobsPeriod>
    private var actions: [UUID: Action] = [:]
    private var timer: JobsSwiftTimerProtocol?
    private var state: JobsTaskLifecycle = .idle
    private var generation: UInt64 = 0
    public private(set) var executionCount: Int = 0
    public private(set) var estimatedNextExecutionDate: Date?

    public var lifecycle: JobsTaskLifecycle {
        lock.lock()
        defer { lock.unlock() }
        return state
    }
    
    /// 任务是否正在运行
    public var isRunning: Bool {
        lifecycle == .running
    }
    
    /// 任务是否已暂停
    public var isSuspended: Bool {
        lifecycle == .suspended
    }
    
    /// 任务是否已取消
    public var isCancelled: Bool {
        lifecycle == .cancelled
    }
    
    /// 任务是否已完成
    public var isFinished: Bool {
        lifecycle == .finished
    }
    
    /// 已注册的 action 数量
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

    public func suspend() {
        lock.lock()
        guard state == .running else {
            lock.unlock()
            return
        }
        state = .suspended
        let timer = self.timer
        lock.unlock()
        timer?.pause()
    }

    public func resume() {
        lock.lock()
        switch state {
        case .suspended:
            state = .running
            let timer = self.timer
            lock.unlock()
            timer?.resume()
        case .idle:
            lock.unlock()
            scheduleInitialIfNeeded()
        default:
            lock.unlock()
        }
    }

    public func cancel() {
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        state = .cancelled
        let timer = self.timer
        self.timer = nil
        estimatedNextExecutionDate = nil
        lock.unlock()
        timer?.stop()
    }

    public func executeNow() {
        let snapshot: [Action]
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        executionCount += 1
        snapshot = Array(actions.values)
        lock.unlock()
        
        // 在锁外执行 actions，避免死锁和提升并发性能
        snapshot.forEach { $0(self) }
    }

    private func scheduleInitialIfNeeded() {
        lock.lock()
        guard state == .idle else {
            lock.unlock()
            return
        }
        let next = iterator.next()
        guard let next, !next.isNegative else {
            state = .finished
            lock.unlock()
            return
        }
        state = .running
        generation &+= 1
        let generation = self.generation
        estimatedNextExecutionDate = Date().adding(next)
        lock.unlock()
        installTimer(after: next, generation: generation)
    }

    private func scheduleNextExecution() {
        lock.lock()
        guard state == .running else {
            lock.unlock()
            return
        }
        let next = iterator.next()
        guard let next, !next.isNegative else {
            state = .finished
            let oldTimer = timer
            timer = nil
            estimatedNextExecutionDate = nil
            lock.unlock()
            oldTimer?.stop()
            return
        }
        generation &+= 1
        let generation = self.generation
        estimatedNextExecutionDate = Date().adding(next)
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
}
// MARK: - JobsTask Async/Await/AsyncSequence Support
extension JobsTask {
    /// 等待任务执行指定次数
    /// - Parameter count: 等待执行的次数
    /// - Returns: 实际执行次数
    @discardableResult
    public func wait(forExecutions count: Int) async -> Int {
        await withCheckedContinuation { continuation in
            var executionsSeen = 0
            let token = self.addAction { task in
                executionsSeen += 1
                if executionsSeen >= count {
                    continuation.resume(returning: executionsSeen)
                }
            }
            
            // 如果任务已经完成或取消，立即返回
            if self.lifecycle.isTerminated {
                self.removeAction(token)
                continuation.resume(returning: executionsSeen)
            }
        }
    }
    /// 等待下一次执行
    /// - Returns: 任务执行时的执行计数
    @discardableResult
    public func waitForNextExecution() async -> Int {
        await withCheckedContinuation { continuation in
            var resumed = false
            let token = self.addAction { task in
                guard !resumed else { return }
                resumed = true
                let count = task.executionCount
                self.removeAction(token)
                continuation.resume(returning: count)
            }
            
            // 如果任务已终止，立即返回
            if self.lifecycle.isTerminated {
                self.removeAction(token)
                continuation.resume(returning: self.executionCount)
            }
        }
    }
    /// 等待任务完成（finished 或 cancelled）
    public func waitUntilFinished() async {
        guard !lifecycle.isTerminated else { return }
        
        await withCheckedContinuation { continuation in
            var resumed = false
            // 使用定时器轮询状态（因为没有状态变化通知机制）
            let checkTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if self.lifecycle.isTerminated {
                    timer.invalidate()
                    guard !resumed else { return }
                    resumed = true
                    continuation.resume()
                }
            }
            // 设置超时（可选）
            Task {
                try? await Task.sleep(nanoseconds: 60_000_000_000) // 60秒超时
                checkTimer.invalidate()
                guard !resumed else { return }
                resumed = true
                continuation.resume()
            }
        }
    }
    /// 异步执行并等待完成
    /// - Returns: 是否成功执行
    @discardableResult
    public func executeAndWait() async -> Bool {
        guard !lifecycle.isTerminated else { return false }
        
        let initialCount = self.executionCount
        self.executeNow()
        
        // 等待一小段时间确保执行完成
        try? await Task.sleep(nanoseconds: 100_000_000) // 100ms
        
        return self.executionCount > initialCount
    }
    /// 创建一个异步序列，发出每次任务执行
    /// - Returns: 异步序列，每次执行时产生执行计数
    public func executions() -> JobsTaskExecutionSequence {
        JobsTaskExecutionSequence(task: self)
    }
}
