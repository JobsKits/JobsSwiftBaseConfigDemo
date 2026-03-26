//
//  JobsWorkerScheduler.swift
//  JobsSwiftWorker
//
//  Created by OpenAI on 2026/3/26.
//

import Foundation
import JobsSwiftTaskCenter

public final class JobsWorkerScheduler: @unchecked Sendable {
    public static let `default` = JobsWorkerScheduler()

    private let lock = NSLock()
    private let center = JobsTaskCenter.default
    private var tasks: [String: JobsTask] = [:]

    public init() {}

    @discardableResult
    public func schedule(after delay: JobsPeriod,
                         key: String = UUID().uuidString,
                         queue: DispatchQueue = .main,
                         action: @escaping @Sendable () -> Void) -> JobsTask {
        cancel(key)
        let task = JobsPlan.after(delay).do(queue: queue, action: action)
        center.add(task)

        lock.lock()
        tasks[key] = task
        lock.unlock()
        return task
    }

    @discardableResult
    public func scheduleRepeating(every interval: JobsPeriod,
                                  key: String = UUID().uuidString,
                                  queue: DispatchQueue = .main,
                                  action: @escaping @Sendable () -> Void) -> JobsTask {
        cancel(key)
        let task = JobsPlan.every(interval).do(queue: queue, action: action)
        center.add(task)

        lock.lock()
        tasks[key] = task
        lock.unlock()
        return task
    }

    public func cancel(_ key: String) {
        let task: JobsTask?
        lock.lock()
        task = tasks.removeValue(forKey: key)
        lock.unlock()
        if let task {
            center.remove(task)
        }
    }

    public func cancelAll() {
        let snapshot: [JobsTask]
        lock.lock()
        snapshot = Array(tasks.values)
        tasks.removeAll()
        lock.unlock()
        snapshot.forEach { center.remove($0) }
    }
}
