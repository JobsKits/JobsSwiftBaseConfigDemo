//
//  JobsWorkerScheduler.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTaskCenter

public final class JobsWorkerScheduler: @unchecked Sendable {
    public static let `default` = JobsWorkerScheduler()

    private struct Entry {
        let generation: UUID
        var task: JobsTask?
        var observer: UUID?
    }
    private let lock = NSLock()
    private let center = JobsTaskCenter.default
    private var tasks: [String: Entry] = [:]

    public init() {}

    public var count: Int {
        lock.lock()
        defer {
            lock.unlock()
        }
        return tasks.count
    }

    @discardableResult
    public func schedule(
        after delay: JobsPeriod,
        key: String = UUID().uuidString,
        queue: DispatchQueue = .main,
        action: @escaping @Sendable () -> Void
    ) -> JobsTask {
        schedule(plan: .after(delay), key: key, queue: queue, action: action)
    }

    @discardableResult
    public func scheduleRepeating(
        every interval: JobsPeriod,
        key: String = UUID().uuidString,
        queue: DispatchQueue = .main,
        action: @escaping @Sendable () -> Void
    ) -> JobsTask {
        schedule(plan: .every(interval), key: key, queue: queue, action: action)
    }

    private func schedule(
        plan: JobsPlan,
        key: String,
        queue: DispatchQueue,
        action: @escaping @Sendable () -> Void
    ) -> JobsTask {
        let generation = UUID()
        lock.lock()
        let replaced = tasks.updateValue(Entry(generation: generation), forKey: key)
        lock.unlock()
        release(replaced)
        let task = plan.do(queue: queue) { [weak self] in
            guard self?.isCurrent(key: key, generation: generation) == true else {
                return
            }
            action()
        }
        let observer = task.addLifecycleObserver { [weak self, weak task] state in
            guard state.isTerminated, let task else {
                return
            }
            self?.finish(key: key, generation: generation, task: task)
        }
        center.add(task)
        lock.lock()
        let keep = tasks[key]?.generation == generation && !task.lifecycle.isTerminated
        if keep {
            tasks[key]?.task = task
            tasks[key]?.observer = observer
        } else if tasks[key]?.generation == generation {
            tasks.removeValue(forKey: key)
        }
        lock.unlock()
        if !keep {
            task.removeLifecycleObserver(observer)
            center.remove(task)
        }
        return task
    }

    private func isCurrent(key: String, generation: UUID) -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return tasks[key]?.generation == generation
    }

    private func finish(key: String, generation: UUID, task: JobsTask) {
        lock.lock()
        let entry: Entry?
        if tasks[key]?.generation == generation {
            entry = tasks.removeValue(forKey: key)
        } else {
            entry = nil
        }
        lock.unlock()
        if let observer = entry?.observer {
            task.removeLifecycleObserver(observer)
        }
        center.remove(task)
    }

    public func cancel(_ key: String) {
        lock.lock()
        let entry = tasks.removeValue(forKey: key)
        lock.unlock()
        release(entry)
    }

    public func cancelAll() {
        lock.lock()
        let snapshot = Array(tasks.values)
        tasks.removeAll()
        lock.unlock()
        snapshot.forEach { release($0) }
    }

    private func release(_ entry: Entry?) {
        guard let task = entry?.task else {
            return
        }
        if let observer = entry?.observer {
            task.removeLifecycleObserver(observer)
        }
        center.remove(task)
    }

    deinit {
        cancelAll()
    }
}
