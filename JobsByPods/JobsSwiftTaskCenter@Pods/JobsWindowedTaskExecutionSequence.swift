//
//  JobsWindowedTaskExecutionSequence.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public struct JobsWindowedTaskExecutionSequence: AsyncSequence {

    public typealias Element = [TaskExecution]
    private let base: JobsTaskExecutionSequence
    private let windowDuration: TimeInterval

    init(base: JobsTaskExecutionSequence, windowDuration: TimeInterval) {
        self.base = base
        self.windowDuration = windowDuration
    }
}

extension JobsWindowedTaskExecutionSequence {

    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), windowDuration: windowDuration)
    }

    public struct AsyncIterator: AsyncIteratorProtocol {
        
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private let windowDuration: TimeInterval
        private var bufferedExecution: TaskExecution?

        init(base: JobsTaskExecutionSequence.AsyncIterator, windowDuration: TimeInterval) {
            self.base = base
            self.windowDuration = Swift.max(0, windowDuration)
        }

        public mutating func next() async -> [TaskExecution]? {
            let firstExecution: TaskExecution
            if let bufferedExecution {
                firstExecution = bufferedExecution
                self.bufferedExecution = nil
            } else {
                guard let next = await base.next() else { return nil }
                firstExecution = next
            }

            var window: [TaskExecution] = [firstExecution]
            let endTime = firstExecution.date.addingTimeInterval(windowDuration)

            while let execution = await base.next() {
                if execution.date <= endTime {
                    window.append(execution)
                } else {
                    bufferedExecution = execution
                    break
                }
            };return window
        }
    }
}
