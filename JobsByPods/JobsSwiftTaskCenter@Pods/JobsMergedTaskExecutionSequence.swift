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
            self.stream = AsyncStream<TaggedTaskExecution>(bufferingPolicy: .unbounded) { continuation in
                let worker = Task {
                    await withTaskGroup(of: Void.self) { group in
                        for (tag, sequence) in sequences {
                            group.addTask {
                                for await execution in sequence {
                                    if Task.isCancelled { break }
                                    continuation.yield(TaggedTaskExecution(tag: tag, execution: execution))
                                }
                            }
                        }
                        await group.waitForAll()
                    }
                    continuation.finish()
                }

                continuation.onTermination = { _ in
                    worker.cancel()
                }

                if sequences.isEmpty {
                    continuation.finish()
                }
            }
            self.iterator = stream.makeAsyncIterator()
        }

        public mutating func next() async -> TaggedTaskExecution? {
            await iterator.next()
        }
    }
}
