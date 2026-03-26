//
//  JobsObservable.swift
//  JobsSwiftWorker
//
//  Created by OpenAI on 2026/3/26.
//

import Foundation

public final class JobsObservable<Value>: @unchecked Sendable where Value: Sendable {
    public typealias Observer = @Sendable (JobsWorkerChange<Value>) -> Void

    private let lock = NSLock()
    private var observers: [UUID: Observer] = [:]
    private var storage: Value

    public let sourceID: UUID = UUID()
    public let sourceName: String?

    public init(_ value: Value,
                name: String? = nil) {
        storage = value
        sourceName = name
    }

    public var value: Value {
        get {
            lock.lock()
            defer { lock.unlock() }
            return storage
        }
        set {
            _setValue(newValue, shouldNotify: true)
        }
    }

    public var currentValue: Value {
        value
    }

    @discardableResult
    public func observe(_ observer: @escaping @Sendable (JobsWorkerChange<Value>) -> Void) -> UUID {
        let id = UUID()
        lock.lock()
        observers[id] = observer
        lock.unlock()
        return id
    }

    public func removeObserver(_ id: UUID) {
        lock.lock()
        observers.removeValue(forKey: id)
        lock.unlock()
    }

    @discardableResult
    public func accept(_ newValue: Value) -> Self {
        value = newValue
        return self
    }

    @discardableResult
    public func acceptSilently(_ newValue: Value) -> Self {
        _setValue(newValue, shouldNotify: false)
        return self
    }

    @discardableResult
    public func mutate(_ transform: (inout Value) -> Void) -> Self {
        let oldValue: Value
        let newValue: Value
        let snapshot: [Observer]

        lock.lock()
        oldValue = storage
        var copy = storage
        transform(&copy)
        storage = copy
        newValue = copy
        snapshot = Array(observers.values)
        lock.unlock()

        let change = JobsWorkerChange(oldValue: oldValue, newValue: newValue)
        snapshot.forEach { $0(change) }
        return self
    }

    @discardableResult
    public func notifyCurrentValue() -> Self {
        let current = currentValue
        let snapshot: [Observer]
        lock.lock()
        snapshot = Array(observers.values)
        lock.unlock()
        let change = JobsWorkerChange(oldValue: current, newValue: current)
        snapshot.forEach { $0(change) }
        return self
    }

    private func _setValue(_ newValue: Value,
                           shouldNotify: Bool) {
        let change: JobsWorkerChange<Value>
        let snapshot: [Observer]

        lock.lock()
        let old = storage
        storage = newValue
        change = .init(oldValue: old, newValue: newValue)
        snapshot = shouldNotify ? Array(observers.values) : []
        lock.unlock()

        snapshot.forEach { $0(change) }
    }
}

extension JobsObservable: JobsValueListenable {}

extension JobsObservable: JobsAnyValueListenable {
    public var currentAnyValue: AnySendableBox {
        AnySendableBox(currentValue)
    }

    @discardableResult
    public func observeAny(_ observer: @escaping @Sendable (JobsAnyWorkerChange) -> Void) -> UUID {
        observe { [weak self] change in
            guard let self else { return }
            observer(
                .init(oldValue: AnySendableBox(change.oldValue),
                      newValue: AnySendableBox(change.newValue),
                      date: change.date,
                      sourceID: self.sourceID,
                      sourceName: self.sourceName)
            )
        }
    }
}
