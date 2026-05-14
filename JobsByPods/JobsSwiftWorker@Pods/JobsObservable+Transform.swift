//
//  JobsObservable+Transform.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public extension JobsObservable {
    func map<Mapped>(_ transform: @escaping @Sendable (Value) -> Mapped,
                     name: String? = nil) -> JobsObservable<Mapped> where Mapped: Sendable {
        let mapped = JobsObservable<Mapped>(transform(currentValue), name: name)
        _ = observe { change in
            mapped.accept(transform(change.newValue))
        }
        return mapped
    }

    func filter(_ isIncluded: @escaping @Sendable (Value) -> Bool,
                name: String? = nil) -> JobsObservable<Value> {
        let initial = currentValue
        let filtered = JobsObservable<Value>(initial, name: name)
        _ = observe { change in
            guard isIncluded(change.newValue) else { return }
            filtered.accept(change.newValue)
        }
        return filtered
    }

    func distinctUntilChanged(_ comparator: @escaping @Sendable (Value, Value) -> Bool,
                              name: String? = nil) -> JobsObservable<Value> {
        let derived = JobsObservable<Value>(currentValue, name: name)
        _ = observe { change in
            guard !comparator(change.oldValue, change.newValue) else { return }
            derived.accept(change.newValue)
        }
        return derived
    }
}

public extension JobsObservable where Value: Equatable {
    func distinctUntilChanged(name: String? = nil) -> JobsObservable<Value> {
        distinctUntilChanged(==, name: name)
    }
}
