//
//  JobsTaskExecutionSequence.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
/// 任务执行的异步序列

public struct JobsTaskExecutionSequence: AsyncSequence {
    public typealias Element = TaskExecution
    private let task: JobsTask

    init(task: JobsTask) {
        self.task = task
    }
}

extension JobsTaskExecutionSequence {
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(task: task)
    }

    public struct AsyncIterator: AsyncIteratorProtocol {
        private let task: JobsTask
        private let stream: AsyncStream<TaskExecution>
        private var iterator: AsyncStream<TaskExecution>.Iterator
        init(task: JobsTask) {
            self.task = task
            self.stream = AsyncStream<TaskExecution>(bufferingPolicy: .unbounded) { continuation in
                let actionToken = task.addAction { task in
                    let execution = TaskExecution(
                        count: task.executionCount,
                        date: Date(),
                        lifecycle: task.lifecycle,
                        nextFireDate: task.estimatedNextExecutionDate
                    )
                    continuation.yield(execution)
                    if task.lifecycle.isTerminated {
                        continuation.finish()
                    }
                }
                let lifecycleToken = task.addLifecycleObserver { lifecycle in
                    if lifecycle.isTerminated {
                        continuation.finish()
                    }
                }
                continuation.onTermination = { _ in
                    task.removeAction(actionToken)
                    task.removeLifecycleObserver(lifecycleToken)
                }
                if task.lifecycle.isTerminated {
                    continuation.finish()
                }
            }
            self.iterator = stream.makeAsyncIterator()
        }
        public mutating func next() async -> TaskExecution? {
            await iterator.next()
        }
    }
}

extension JobsTaskExecutionSequence {
    public func prefix(_ maxCount: Int) -> JobsPrefixTaskExecutionSequence {
        JobsPrefixTaskExecutionSequence(base: self, maxCount: maxCount)
    }

    public func filter(
        _ predicate: @escaping @Sendable (TaskExecution) -> Bool
    ) -> JobsFilteredTaskExecutionSequence {
        JobsFilteredTaskExecutionSequence(base: self, predicate: predicate)
    }

    public func map<T>(
        _ transform: @escaping @Sendable (TaskExecution) -> T
    ) -> JobsMappedTaskExecutionSequence<T> where T: Sendable {
        JobsMappedTaskExecutionSequence(base: self, transform: transform)
    }

    public func dropFirst(_ count: Int = 1) -> JobsDropFirstTaskExecutionSequence {
        JobsDropFirstTaskExecutionSequence(base: self, count: count)
    }

    public func windowed(seconds: TimeInterval) -> JobsWindowedTaskExecutionSequence {
        JobsWindowedTaskExecutionSequence(base: self, windowDuration: seconds)
    }

    public func collect() async -> [TaskExecution] {
        var results: [TaskExecution] = []
        for await execution in self {
            results.append(execution)
        };return results
    }

    public func collect(_ count: Int) async -> [TaskExecution] {
        var results: [TaskExecution] = []
        for await execution in self.prefix(count) {
            results.append(execution)
        };return results
    }

    public func forEach(_ action: @escaping @Sendable (TaskExecution) async -> Void) async {
        for await execution in self {
            await action(execution)
        }
    }

    public func first(
        where predicate: @escaping @Sendable (TaskExecution) -> Bool
    ) async -> TaskExecution? {
        for await execution in self {
            if predicate(execution) {
                return execution
            }
        };return nil
    }
}
