//
//  JobsObservable+Workers.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import JobsSwiftTaskCenter

public extension JobsValueListenable {
    @discardableResult
    func ever(
        condition: (@Sendable (JobsWorkerChange<Value>) -> Bool)? = nil,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.ever(self,
                               condition: condition,
                               label: label,
                               onChange: onChange)
    }

    @discardableResult
    func once(
        condition: (@Sendable (JobsWorkerChange<Value>) -> Bool)? = nil,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.once(self,
                               condition: condition,
                               label: label,
                               onChange: onChange)
    }

    @discardableResult
    func debounce(
        _ delay: JobsPeriod,
        condition: (@Sendable (JobsWorkerChange<Value>) -> Bool)? = nil,
        queue: DispatchQueue = .main,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.debounce(self,
                                   time: delay,
                                   condition: condition,
                                   queue: queue,
                                   label: label,
                                   onChange: onChange)
    }

    @discardableResult
    func interval(
        _ window: JobsPeriod,
        condition: (@Sendable (JobsWorkerChange<Value>) -> Bool)? = nil,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.interval(self,
                                   time: window,
                                   condition: condition,
                                   label: label,
                                   onChange: onChange)
    }

    @discardableResult
    func skip(
        _ count: Int,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.skip(self,
                               count,
                               label: label,
                               onChange: onChange)
    }

    @discardableResult
    func take(
        _ count: Int,
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsWorkerChange<Value>) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.take(self,
                               count,
                               label: label,
                               onChange: onChange)
    }
}

public extension Array where Element == JobsAnyValueListenable {
    @discardableResult
    func everAll(
        label: String? = nil,
        _ onChange: @escaping @Sendable (JobsAnyWorkerChange) -> Void
    ) -> JobsWorker {
        JobsWorkerFactory.everAll(self,
                                  label: label,
                                  onChange: onChange)
    }
}
