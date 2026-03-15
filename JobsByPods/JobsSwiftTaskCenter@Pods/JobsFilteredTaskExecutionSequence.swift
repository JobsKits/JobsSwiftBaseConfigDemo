//
//  JobsFilteredTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
// MARK: - JobsFilteredTaskExecutionSequence
public struct JobsFilteredTaskExecutionSequence: AsyncSequence {
    
    public typealias Element = TaskExecution
    private let base: JobsTaskExecutionSequence
    private let predicate: @Sendable (TaskExecution) -> Bool


    
    init(base: JobsTaskExecutionSequence,
         predicate: @escaping @Sendable (TaskExecution) -> Bool) {
        self.base = base
        self.predicate = predicate
    }
}

extension JobsFilteredTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), predicate: predicate)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private let predicate: @Sendable (TaskExecution) -> Bool
        
        init(base: JobsTaskExecutionSequence.AsyncIterator,
             predicate: @escaping @Sendable (TaskExecution) -> Bool) {
            self.base = base
            self.predicate = predicate
        }
        
        public mutating func next() async -> TaskExecution? {
            while let execution = await base.next() {
                if predicate(execution) {
                    return execution
                }
            };return nil
        }
    }
}
