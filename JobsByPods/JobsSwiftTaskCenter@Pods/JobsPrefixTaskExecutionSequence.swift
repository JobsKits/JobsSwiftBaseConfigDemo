//
//  JobsPrefixTaskExecutionSequence.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

// MARK: - JobsPrefixTaskExecutionSequence
public struct JobsPrefixTaskExecutionSequence: AsyncSequence {
    public typealias Element = TaskExecution

    private let base: JobsTaskExecutionSequence
    private let maxCount: Int

    init(base: JobsTaskExecutionSequence, maxCount: Int) {
        self.base = base
        self.maxCount = maxCount
    }
}

extension JobsPrefixTaskExecutionSequence {
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), maxCount: maxCount)
    }

    public struct AsyncIterator: AsyncIteratorProtocol {
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private let maxCount: Int
        private var count = 0
        init(base: JobsTaskExecutionSequence.AsyncIterator, maxCount: Int) {
            self.base = base
            self.maxCount = maxCount
        }
        public mutating func next() async -> TaskExecution? {
            guard count < maxCount else { return nil }
            count += 1
            return await base.next()
        }
    }
}
