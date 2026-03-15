//
//  JobsMappedTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
// MARK: - JobsMappedTaskExecutionSequence
public struct JobsMappedTaskExecutionSequence<T>: AsyncSequence where T: Sendable {
    
    public typealias Element = T
    private let base: JobsTaskExecutionSequence
    private let transform: @Sendable (TaskExecution) -> T
    
    init(base: JobsTaskExecutionSequence, transform: @escaping @Sendable (TaskExecution) -> T) {
        self.base = base
        self.transform = transform
    }
}

extension JobsMappedTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(base: base.makeAsyncIterator(), transform: transform)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private var base: JobsTaskExecutionSequence.AsyncIterator
        private let transform: @Sendable (TaskExecution) -> T
        
        init(base: JobsTaskExecutionSequence.AsyncIterator,
             transform: @escaping @Sendable (TaskExecution) -> T) {
            self.base = base
            self.transform = transform
        }
        
        public mutating func next() async -> T? {
            guard let execution = await base.next() else { return nil }
            return transform(execution)
        }
    }
}
