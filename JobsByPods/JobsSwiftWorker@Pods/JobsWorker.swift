//
//  JobsWorker.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

public final class JobsWorker: JobsWorkerDisposable, @unchecked Sendable {
    public let id: UUID = UUID()
    public let mode: JobsWorkerMode
    public let label: String?

    private let lock = NSLock()
    private var disposer: (() -> Void)?
    private var disposed = false
    public var isDisposed: Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return disposed
    }

    public init(mode: JobsWorkerMode,
                label: String? = nil,
                disposer: (() -> Void)? = nil) {
        self.mode = mode
        self.label = label
        self.disposer = disposer
    }

    public func setDisposer(_ disposer: @escaping () -> Void) {
        lock.lock()
        let shouldDispose = disposed
        let previous = shouldDispose ? nil : self.disposer
        if !shouldDispose {
            self.disposer = disposer
        }
        lock.unlock()
        withExtendedLifetime(previous) {}
        if shouldDispose {
            disposer()
        }
    }

    public func dispose() {
        let action: (() -> Void)?
        lock.lock()
        guard !disposed else {
            lock.unlock()
            return
        }
        disposed = true
        action = disposer
        disposer = nil
        lock.unlock()
        action?()
    }

    deinit {
        dispose()
    }
}

public final class JobsWorkerBag {
    private let lock = NSLock()
    private var workers: [UUID: JobsWorkerDisposable] = [:]

    public init() {}

    public var count: Int {
        lock.lock()
        defer { lock.unlock() };return workers.count
    }

    public func insert(_ worker: JobsWorkerDisposable) {
        lock.lock()
        workers[UUID()] = worker
        lock.unlock()
    }

    public func removeAll() {
        let snapshot: [JobsWorkerDisposable]
        lock.lock()
        snapshot = Array(workers.values)
        workers.removeAll()
        lock.unlock()
        snapshot.forEach { $0.dispose() }
    }

    deinit {
        removeAll()
    }
}

public extension JobsWorkerDisposable {
    @discardableResult
    func store(in bag: JobsWorkerBag) -> Self {
        bag.insert(self)
        return self
    }
}
