//
//  JobsWorker.swift
//  JobsSwiftWorker
//
//  Created by OpenAI on 2026/3/26.
//

import Foundation

public final class JobsWorker: JobsWorkerDisposable, @unchecked Sendable {
    public let id: UUID = UUID()
    public let mode: JobsWorkerMode
    public let label: String?

    private let lock = NSLock()
    private var disposer: (() -> Void)?
    public private(set) var isDisposed: Bool = false

    public init(mode: JobsWorkerMode,
                label: String? = nil,
                disposer: (() -> Void)? = nil) {
        self.mode = mode
        self.label = label
        self.disposer = disposer
    }

    public func setDisposer(_ disposer: @escaping () -> Void) {
        lock.lock()
        defer { lock.unlock() }
        guard !isDisposed else {
            disposer()
            return
        }
        self.disposer = disposer
    }

    public func dispose() {
        let action: (() -> Void)?
        lock.lock()
        guard !isDisposed else {
            lock.unlock()
            return
        }
        isDisposed = true
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
        defer { lock.unlock() }
        return workers.count
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
