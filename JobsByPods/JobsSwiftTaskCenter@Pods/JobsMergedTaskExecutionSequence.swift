//
//  JobsMergedTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
// MARK: - 组合多个任务的执行流
/// 合并多个任务的执行流
public struct JobsMergedTaskExecutionSequence: AsyncSequence {
    
    public typealias Element = TaggedTaskExecution
    private let sequences: [(tag: String, sequence: JobsTaskExecutionSequence)]
    public init(_ sequences: [(tag: String, sequence: JobsTaskExecutionSequence)]) {
        self.sequences = sequences
    }
}

extension JobsMergedTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(sequences: sequences)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private let stream: AsyncStream<TaggedTaskExecution>
        private var iterator: AsyncStream<TaggedTaskExecution>.Iterator
        
        init(sequences: [(tag: String, sequence: JobsTaskExecutionSequence)]) {
            var continuation: AsyncStream<TaggedTaskExecution>.Continuation?
            self.stream = AsyncStream<TaggedTaskExecution> { cont in
                continuation = cont
            }
            self.iterator = stream.makeAsyncIterator()
            
            // 为每个序列启动一个 Task
            if let cont = continuation {
                for (tag, sequence) in sequences {
                    Task {
                        for await execution in sequence {
                            let tagged = TaggedTaskExecution(tag: tag, execution: execution)
                            cont.yield(tagged)
                        }
                    }
                }
            }
        }
        
        public mutating func next() async -> TaggedTaskExecution? {
            await iterator.next()
        }
    }
}
