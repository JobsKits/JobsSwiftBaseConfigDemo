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
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed else {
                return
            }
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
        let gate = JobsWorkerInvocationGate(limit: 1)
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed else {
                return
            }
            if let condition, !condition(change) {
                return
            }
            guard gate.claim() != nil else {
                return
            }
            worker.dispose()
            onChange(change)
        }
        worker.setDisposer {
            source.removeObserver(token)
        }
        return worker
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
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed else {
                return
            }
            if let condition, !condition(change) { return }
            scheduler.schedule(after: time, key: key, queue: queue) { [weak worker] in
                guard worker?.isDisposed == false else {
                    return
                }
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
        let nextAllowedDate = JobsWorkerState<Date>(.distantPast)
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed else {
                return
            }
            if let condition, !condition(change) { return }
            let shouldFire: Bool = nextAllowedDate.withValue { date in
                let now = Date()
                guard now >= date else { return false }
                date = now.addingTimeInterval(time.timeInterval)
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
        let skipped = JobsWorkerState<Int>(0)
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed else {
                return
            }
            let shouldForward: Bool = skipped.withValue { value in
                guard value < safeCount else { return true }
                value += 1
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
        let gate = JobsWorkerInvocationGate(limit: safeCount)
        let token = source.observe { [weak worker] change in
            guard let worker, !worker.isDisposed, let isLast = gate.claim() else {
                return
            }
            if isLast {
                worker.dispose()
            }
            onChange(change)
        }
        worker.setDisposer {
            source.removeObserver(token)
        }
        return worker
    }

    @discardableResult
    public static func everAll(
        _ sources: [JobsAnyValueListenable],
        label: String? = nil,
        onChange: @escaping @Sendable (JobsAnyWorkerChange) -> Void
    ) -> JobsWorker {
        let worker = JobsWorker(mode: .everAll, label: label)
        let tokens: [(JobsAnyValueListenable, UUID)] = sources.map { source in
            let token = source.observeAny { [weak worker] change in
                guard worker?.isDisposed == false else {
                    return
                }
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

/// 此盒只接收 Sendable 值，所有读写由同一锁保护，引用不会暴露可变状态。
private final class JobsWorkerState<Value: Sendable>: @unchecked Sendable {
    private let lock = NSLock()
    private var value: Value

    init(_ value: Value) {
        self.value = value
    }

    func withValue<Result>(_ body: (inout Value) -> Result) -> Result {
        lock.lock()
        defer { lock.unlock() }
        return body(&value)
    }
}

/// 限次回调在进入用户代码前抢占，允许业务回调重入 accept/dispose。
private final class JobsWorkerInvocationGate: @unchecked Sendable {
    private let lock = NSLock()
    private var remaining: Int

    init(limit: Int) {
        remaining = limit
    }

    func claim() -> Bool? {
        lock.lock()
        defer {
            lock.unlock()
        }
        guard remaining > 0 else {
            return nil
        }
        remaining -= 1
        return remaining == 0
    }
}
