//
//  JobsTaskManagerStatusStream.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
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
        
        private let manager: JobsTaskManager
        private let stream: AsyncStream<JobsTaskStatusChange>
        private var iterator: AsyncStream<JobsTaskStatusChange>.Iterator
        
        init(manager: JobsTaskManager) {
            self.manager = manager
            var continuation: AsyncStream<JobsTaskStatusChange>.Continuation?
            self.stream = AsyncStream<JobsTaskStatusChange> { cont in
                continuation = cont
            }
            self.iterator = stream.makeAsyncIterator()
            // 启动后台监控任务
            if let cont = continuation {
                Task {
                    await JobsTaskManagerStatusStream.AsyncIterator.monitorStatusChanges(manager: manager, continuation: cont)
                }
            }
        }
        
        private static func monitorStatusChanges(
            manager: JobsTaskManager,
            continuation: AsyncStream<JobsTaskStatusChange>.Continuation
        ) async {
            var lastSnapshot: [String: JobsTaskStatus] = [:]
            
            while !Task.isCancelled {
                let currentTasks = manager.allTasks
                var currentSnapshot: [String: JobsTaskStatus] = [:]
                for item in currentTasks {
                    currentSnapshot[item.tag] = item.status
                    // 检测状态变化
                    if let oldStatus = lastSnapshot[item.tag],
                       oldStatus != item.status {
                        let change = JobsTaskStatusChange(
                            tag: item.tag,
                            oldStatus: oldStatus,
                            newStatus: item.status,
                            timestamp: Date()
                        )
                        continuation.yield(change)
                    } else if lastSnapshot[item.tag] == nil {
                        // 新任务
                        let change = JobsTaskStatusChange(
                            tag: item.tag,
                            oldStatus: nil,
                            newStatus: item.status,
                            timestamp: Date()
                        )
                        continuation.yield(change)
                    }
                }
                // 检测移除的任务
                for (tag, status) in lastSnapshot {
                    if currentSnapshot[tag] == nil {
                        let change = JobsTaskStatusChange(
                            tag: tag,
                            oldStatus: status,
                            newStatus: nil,
                            timestamp: Date()
                        )
                        continuation.yield(change)
                    }
                }
                lastSnapshot = currentSnapshot
                // 每 100ms 检查一次
                try? await Task.sleep(nanoseconds: 100_000_000)
            }
            continuation.finish()
        }
        
        public mutating func next() async -> JobsTaskStatusChange? {
            await iterator.next()
        }
    }
}
