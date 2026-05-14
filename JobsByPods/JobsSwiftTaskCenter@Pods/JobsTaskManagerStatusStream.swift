//
//  JobsTaskManagerStatusStream.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
// MARK: - JobsTaskManagerStatusStream
/// 任务管理器状态变化流
public struct JobsTaskManagerStatusStream: AsyncSequence {

    public typealias Element = JobsTaskStatusChange
    private let manager: JobsTaskManager

    init(manager: JobsTaskManager) {
        self.manager = manager
    }
}

extension JobsTaskManagerStatusStream {

    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(manager: manager)
    }

    public struct AsyncIterator: AsyncIteratorProtocol {
        private let stream: AsyncStream<JobsTaskStatusChange>
        private var iterator: AsyncStream<JobsTaskStatusChange>.Iterator

        init(manager: JobsTaskManager) {
            self.stream = AsyncStream<JobsTaskStatusChange>(bufferingPolicy: .unbounded) { continuation in
                let token = manager.addStatusObserver { change in
                    continuation.yield(change)
                }
                continuation.onTermination = { _ in
                    manager.removeStatusObserver(token)
                }
            }
            self.iterator = stream.makeAsyncIterator()
        }

        public mutating func next() async -> JobsTaskStatusChange? {
            await iterator.next()
        }
    }
}
