//
//  JobsWorkerFactory.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTaskCenter

public enum JobsWorkerFactory {
    @discardableResult
    public static func ever<Source: JobsValueListenable>(
        _ source: Source,
        condition: (@Sendable (JobsWorkerChange<Source.Value>) -> Bool)? = nil,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .ever, label: label)
        let token = source.observe { change in
            if let condition, !condition(change) { return }
            onChange(change)
        }
        worker.setDisposer {
            source.removeObserver(token)
        };return worker
    }

    @discardableResult
    public static func once<Source: JobsValueListenable>(
        _ source: Source,
        condition: (@Sendable (JobsWorkerChange<Source.Value>) -> Bool)? = nil,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .once, label: label)
        var token: UUID?
        token = source.observe { change in
            if let condition, !condition(change) { return }
            onChange(change)
            if let token {
                source.removeObserver(token)
            }
            worker.dispose()
        }
        worker.setDisposer {
            if let token {
                source.removeObserver(token)
            }
        };return worker
    }

    @discardableResult
    public static func debounce<Source: JobsValueListenable>(
        _ source: Source,
        time: JobsPeriod,
        condition: (@Sendable (JobsWorkerChange<Source.Value>) -> Bool)? = nil,
        queue: DispatchQueue = .main,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .debounce(delay: time), label: label)
        let key = "debounce.\(source.sourceID.uuidString).\(worker.id.uuidString)"
        let scheduler = JobsWorkerScheduler.default
        let token = source.observe { change in
            if let condition, !condition(change) { return }
            scheduler.schedule(after: time, key: key, queue: queue) {
                onChange(change)
            }
        }
        worker.setDisposer {
            source.removeObserver(token)
            scheduler.cancel(key)
        };return worker
    }

    @discardableResult
    public static func interval<Source: JobsValueListenable>(
        _ source: Source,
        time: JobsPeriod,
        condition: (@Sendable (JobsWorkerChange<Source.Value>) -> Bool)? = nil,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .interval(window: time), label: label)
        let lock = NSLock()
        var nextAllowedDate: Date = .distantPast

        let token = source.observe { change in
            if let condition, !condition(change) { return }
            let shouldFire: Bool = lock.jobs_sync {
                let now = Date()
                guard now >= nextAllowedDate else { return false }
                nextAllowedDate = now.addingTimeInterval(time.timeInterval)
                return true
            }
            guard shouldFire else { return }
            onChange(change)
        }

        worker.setDisposer {
            source.removeObserver(token)
        };return worker
    }

    @discardableResult
    public static func skip<Source: JobsValueListenable>(
        _ source: Source,
        _ count: Int,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let safeCount = max(0, count)
        let worker = JobsWorker(mode: .skip(safeCount), label: label)
        let lock = NSLock()
        var skipped = 0
        let token = source.observe { change in
            let shouldForward: Bool = lock.jobs_sync {
                guard skipped < safeCount else { return true }
                skipped += 1
                return false
            }
            guard shouldForward else { return }
            onChange(change)
        }
        worker.setDisposer {
            source.removeObserver(token)
        };return worker
    }

    @discardableResult
    public static func take<Source: JobsValueListenable>(
        _ source: Source,
        _ count: Int,
        label: String? = nil,
        onChange: @escaping @Sendable (JobsWorkerChange<Source.Value>) -> Void
    ) -> JobsWorker {
        let safeCount = max(0, count)
        let worker = JobsWorker(mode: .take(safeCount), label: label)
        if safeCount == 0 {
            worker.dispose()
            return worker
        }
        let lock = NSLock()
        var fired = 0
        var token: UUID?
        token = source.observe { change in
            let shouldForward: Bool = lock.jobs_sync {
                guard fired < safeCount else { return false }
                fired += 1
                return true
            }
            guard shouldForward else { return }
            onChange(change)
            let isCompleted: Bool = lock.jobs_sync { fired >= safeCount }
            guard isCompleted else { return }
            if let token {
                source.removeObserver(token)
            }
            worker.dispose()
        }
        worker.setDisposer {
            if let token {
                source.removeObserver(token)
            }
        };return worker
    }

    @discardableResult
    public static func everAll(
        _ sources: [JobsAnyValueListenable],
        label: String? = nil,
        onChange: @escaping @Sendable (JobsAnyWorkerChange) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .everAll, label: label)
        let tokens: [(JobsAnyValueListenable, UUID)] = sources.map { source in
            let token = source.observeAny { change in
                onChange(change)
            };return (source, token)
        }
        worker.setDisposer {
            tokens.forEach { pair in
                pair.0.removeObserver(pair.1)
            }
        };return worker
    }
}

private extension NSLock {
    func jobs_sync<T>(_ action: () -> T) -> T {
        lock()
        defer { unlock() };return action()
    }
}
