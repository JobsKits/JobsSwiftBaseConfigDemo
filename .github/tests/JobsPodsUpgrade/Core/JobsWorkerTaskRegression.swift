//
//  JobsWorkerTaskRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation
import JobsSwiftTaskCenter
import JobsSwiftTimer
import JobsSwiftWorker

private final class Locked<Value>: @unchecked Sendable {
    private let lock = NSLock()
    private var storage: Value
    init(_ value: Value) { storage = value }
    var value: Value {
        lock.lock()
        defer { lock.unlock() }
        return storage
    }
    func update(_ body: (inout Value) -> Void) {
        lock.lock()
        body(&storage)
        lock.unlock()
    }
}

private final class DisposerCapture {
    weak var worker: JobsWorker?
    init(_ worker: JobsWorker) {
        self.worker = worker
    }
    deinit {
        precondition(worker?.isDisposed == false)
    }
}

@main
struct JobsWorkerTaskRegression {
    static func main() async throws {
        DispatchQueue.global().asyncAfter(deadline: .now() + 15) { fatalError("Task/Worker regression timeout") }
        let queue = DispatchQueue(label: "jobs.core.regression")
        let disposerWorker = JobsWorker(mode: .ever)
        weak var disposerOwner: DisposerCapture?
        func installDisposer() {
            let owner = DisposerCapture(disposerWorker)
            disposerOwner = owner
            disposerWorker.setDisposer { [owner] in withExtendedLifetime(owner) {} }
        }
        installDisposer()
        precondition(disposerOwner != nil)
        disposerWorker.setDisposer {}
        precondition(disposerOwner == nil)
        disposerWorker.dispose()
        let pair = Locked<[JobsTask]>([])
        let firstActionsEntered = DispatchGroup()
        firstActionsEntered.enter()
        firstActionsEntered.enter()
        let crossQueueA = DispatchQueue(label: "jobs.core.cross.a")
        let crossQueueB = DispatchQueue(label: "jobs.core.cross.b")
        let crossA = JobsTask(plan: .after(JobsPeriod(100)), queue: crossQueueA) { task in
            if task.executionCount == 1 {
                firstActionsEntered.leave()
                precondition(firstActionsEntered.wait(timeout: .now() + 3) == .success)
                pair.value[1].executeNow()
            }
        }
        let crossB = JobsTask(plan: .after(JobsPeriod(100)), queue: crossQueueB) { task in
            if task.executionCount == 1 {
                firstActionsEntered.leave()
                precondition(firstActionsEntered.wait(timeout: .now() + 3) == .success)
                pair.value[0].executeNow()
            }
        }
        pair.update { $0 = [crossA, crossB] }
        let crossFinished = DispatchGroup()
        crossFinished.enter()
        crossFinished.enter()
        crossQueueA.async {
            crossA.executeNow()
            crossFinished.leave()
        }
        crossQueueB.async {
            crossB.executeNow()
            crossFinished.leave()
        }
        precondition(crossFinished.wait(timeout: .now() + 3) == .success, "cross-task executeNow must not deadlock")
        precondition(crossA.executionCount == 2 && crossB.executionCount == 2)
        crossA.cancel()
        crossB.cancel()
        pair.update { $0.removeAll() }
        let extreme = JobsTaskCenterComponent.createOneShotTask(seconds: Int.max, queue: queue) {}
        DispatchQueue.concurrentPerform(iterations: 1000) { index in
            extreme.tag = "tag.\(index)"
            precondition(extreme.tag != nil)
        }
        extreme.cancel()
        for _ in 0..<100 {
            let infinite = JobsPlan.every(JobsPeriod(100)).do(queue: queue) {}
            let waiter = Task { await infinite.waitForNextExecution() }
            waiter.cancel()
            _ = await waiter.value
            let terminalWaiter = Task { await infinite.wait(forExecutions: 100) }
            infinite.cancel()
            let actual = await terminalWaiter.value
            precondition(actual == 0)
        }
        let finite = JobsPlan.after(JobsPeriod(0.05)).do(queue: queue) {}
        let infinite = JobsPlan.every(JobsPeriod(100)).do(queue: queue) {}
        let winner = await JobsTask.waitAny([finite, infinite])
        precondition(winner === finite)
        infinite.cancel()
        let finalEffect = Locked(false)
        let once = JobsPlan.after(JobsPeriod(0.04)).do(queue: queue) { finalEffect.update { $0 = true } }
        let events = await once.executions().collect()
        await once.waitUntilFinished()
        precondition(events.count == 1 && events.first?.count == 1 && finalEffect.value)
        let repeated = JobsPlan.every(JobsPeriod(0.02), repeatCount: 3).do(queue: queue) {}
        let repeats = await repeated.executions().collect()
        precondition(repeats.map(\.count) == [1, 2, 3])
        let asyncEffect = Locked(false)
        let asyncJob = JobsPlan.after(JobsPeriod(0.02)).doAsync(queue: queue) {
            try? await Task.sleep(nanoseconds: 50_000_000)
            asyncEffect.update { $0 = true }
        }
        await asyncJob.waitUntilFinished()
        precondition(asyncEffect.value)
        let cancelled = Locked(false)
        let cancellable = JobsPlan.after(JobsPeriod(0.02)).doAsync(queue: queue) {
            do { try await Task.sleep(nanoseconds: 5_000_000_000) } catch { cancelled.update { $0 = Task.isCancelled } }
        }
        _ = await cancellable.waitForNextExecution()
        cancellable.cancel()
        try await Task.sleep(nanoseconds: 30_000_000)
        precondition(cancelled.value)
        let paused = JobsTask(plan: .every(JobsPeriod(0.02), repeatCount: 2), queue: queue) { task in
            if task.executionCount == 1 { task.suspend() }
        }
        _ = await paused.waitForNextExecution()
        try await Task.sleep(nanoseconds: 30_000_000)
        precondition(paused.isSuspended && paused.executionCount == 1)
        paused.resume()
        await paused.waitUntilFinished()
        precondition(paused.executionCount == 2)
        let source = JobsObservable(0)
        weak var mappedWeak: JobsObservable<Int>?
        do {
            let mapped = source.map { $0 + 1 }
            mappedWeak = mapped
        }
        precondition(mappedWeak == nil)
        weak var leftWeak: JobsObservable<Int>?
        weak var rightWeak: JobsObservable<Int>?
        weak var combinedWeak: JobsObservable<(Int, Int)>?
        do {
            let left = JobsObservable(1)
            let right = JobsObservable(2)
            let combined = JobsObservable<(Int, Int)>.combineLatest(left, right)
            leftWeak = left
            rightWeak = right
            combinedWeak = combined
        }
        precondition(leftWeak == nil && rightWeak == nil && combinedWeak == nil)
        let calls = Locked(0)
        let worker = JobsWorkerFactory.once(source) { _ in
            calls.update { $0 += 1 }
            source.accept(2)
        }
        source.accept(1)
        precondition(calls.value == 1 && worker.isDisposed)
        worker.setDisposer { worker.dispose() }
        let concurrentSource = JobsObservable(0)
        let onceCount = Locked(0)
        let concurrentWorker = JobsWorkerFactory.once(concurrentSource) { _ in onceCount.update { $0 += 1 } }
        DispatchQueue.concurrentPerform(iterations: 1000) { concurrentSource.accept($0) }
        precondition(onceCount.value == 1 && concurrentWorker.isDisposed)
        let scheduler = JobsWorkerScheduler()
        let baseline = JobsTaskCenter.default.count
        DispatchQueue.concurrentPerform(iterations: 500) { _ in
            scheduler.schedule(after: JobsPeriod(100), key: "same", queue: queue) {}
        }
        precondition(scheduler.count == 1 && JobsTaskCenter.default.count == baseline + 1)
        scheduler.cancelAll()
        precondition(scheduler.count == 0 && JobsTaskCenter.default.count == baseline)
        let completed = scheduler.schedule(after: JobsPeriod(0.02), key: "once", queue: queue) {}
        await completed.waitUntilFinished()
        try await Task.sleep(nanoseconds: 20_000_000)
        precondition(scheduler.count == 0 && JobsTaskCenter.default.count == baseline)
        var config = JobsSwiftTimerConfig()
        config.interval = .nan
        config.tolerance = .infinity
        precondition(config.normalized.interval == 1 && config.normalized.tolerance == 0)
        config.interval = .greatestFiniteMagnitude
        config.tolerance = .greatestFiniteMagnitude
        precondition(config.normalized.interval == 1_000_000_000 && config.normalized.tolerance == 1_000_000_000)
        print("Jobs Task/Worker cancellation/final-event/async-drain/release/scheduler regression checks passed")
    }
}
