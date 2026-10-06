//
//  JobsObservable+Transform.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

public extension JobsObservable {
    func map<Mapped>(_ transform: @escaping @Sendable (Value) -> Mapped,
                     name: String? = nil) -> JobsObservable<Mapped> where Mapped: Sendable {
        let mapped = JobsObservable<Mapped>(transform(currentValue), name: name)
        let token = observe { [weak mapped] change in
            mapped?.accept(transform(change.newValue))
        }
        mapped.retainUpstream {
            self.removeObserver(token)
        }
        return mapped
    }

    func filter(_ isIncluded: @escaping @Sendable (Value) -> Bool,
                name: String? = nil) -> JobsObservable<Value> {
        let initial = currentValue
        let filtered = JobsObservable<Value>(initial, name: name)
        let token = observe { [weak filtered] change in
            guard isIncluded(change.newValue) else {
                return
            }
            filtered?.accept(change.newValue)
        }
        filtered.retainUpstream {
            self.removeObserver(token)
        }
        return filtered
    }

    func distinctUntilChanged(_ comparator: @escaping @Sendable (Value, Value) -> Bool,
                              name: String? = nil) -> JobsObservable<Value> {
        let derived = JobsObservable<Value>(currentValue, name: name)
        let token = observe { [weak derived] change in
            guard !comparator(change.oldValue, change.newValue) else {
                return
            }
            derived?.accept(change.newValue)
        }
        derived.retainUpstream {
            self.removeObserver(token)
        }
        return derived
    }
}

public extension JobsObservable where Value: Equatable {
    func distinctUntilChanged(name: String? = nil) -> JobsObservable<Value> {
        distinctUntilChanged({ $0 == $1 }, name: name)
    }
}
