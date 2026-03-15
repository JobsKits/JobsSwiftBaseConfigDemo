//
//  JobsDropFirstTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
// MARK: - JobsDropFirstTaskExecutionSequence
public struct JobsDropFirstTaskExecutionSequence: AsyncSequence {
    
    public typealias Element = TaskExecution
    private let base: JobsTaskExecutionSequence
    private let count: Int
    
    init(base: JobsTaskExecutionSequence, count: Int) {
        self.base = base
        self.count = count
    }
}

extension JobsDropFirstTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), dropCount: count)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private var dropped = 0
        private let dropCount: Int
        
        init(base: JobsTaskExecutionSequence.AsyncIterator, dropCount: Int) {
            self.base = base
            self.dropCount = dropCount
        }
        
        public mutating func next() async -> TaskExecution? {
            while dropped < dropCount {
                guard await base.next() != nil else { return nil }
                dropped += 1
            };return await base.next()
        }
    }
}
