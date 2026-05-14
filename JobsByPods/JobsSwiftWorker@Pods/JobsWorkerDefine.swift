//
//  JobsWorkerDefine.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsSwiftTaskCenter

public struct JobsWorkerChange<Value>: Sendable where Value: Sendable {
    public let oldValue: Value
    public let newValue: Value
    public let date: Date

    public init(oldValue: Value,
                newValue: Value,
                date: Date = Date()) {
        self.oldValue = oldValue
        self.newValue = newValue
        self.date = date
    }

    public func map<T>(_ transform: (Value) -> T) -> JobsWorkerChange<T> where T: Sendable {
        .init(oldValue: transform(oldValue),
              newValue: transform(newValue),
              date: date)
    }
}

public struct JobsAnyWorkerChange: Sendable {
    public let oldValue: AnySendableBox
    public let newValue: AnySendableBox
    public let date: Date
    public let sourceID: UUID
    public let sourceName: String?

    public init(oldValue: AnySendableBox,
                newValue: AnySendableBox,
                date: Date = Date(),
                sourceID: UUID,
                sourceName: String?) {
        self.oldValue = oldValue
        self.newValue = newValue
        self.date = date
        self.sourceID = sourceID
        self.sourceName = sourceName
    }
}

public struct AnySendableBox: @unchecked Sendable, CustomStringConvertible {
    public let value: Any

    public init(_ value: Any) {
        self.value = value
    }

    public var description: String {
        String(describing: value)
    }
}

public enum JobsWorkerMode: Sendable {
    case ever
    case once
    case debounce(delay: JobsPeriod)
    case interval(window: JobsPeriod)
    case everAll
    case skip(Int)
    case take(Int)
}

public protocol JobsWorkerDisposable: AnyObject {
    var isDisposed: Bool { get }
    func dispose()
}

public protocol JobsValueListenable: AnyObject {
    associatedtype Value: Sendable
    var sourceID: UUID { get }
    var sourceName: String? { get }
    var currentValue: Value { get }
    @discardableResult
    func observe(_ observer: @escaping @Sendable (JobsWorkerChange<Value>) -> Void) -> UUID
    func removeObserver(_ id: UUID)
}

public protocol JobsAnyValueListenable: AnyObject {
    var sourceID: UUID { get }
    var sourceName: String? { get }
    var currentAnyValue: AnySendableBox { get }
    @discardableResult
    func observeAny(_ observer: @escaping @Sendable (JobsAnyWorkerChange) -> Void) -> UUID
    func removeObserver(_ id: UUID)
}
