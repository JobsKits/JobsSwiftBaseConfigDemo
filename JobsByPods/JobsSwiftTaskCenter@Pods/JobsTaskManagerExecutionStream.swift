//
//  JobsTaskManagerExecutionStream.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

// MARK: - JobsTaskManagerExecutionStream
/// 任务管理器执行流
public struct JobsTaskManagerExecutionStream: AsyncSequence {
    
    public typealias Element = TaskExecution
    private let manager: JobsTaskManager
    private let tag: String
    
    init(manager: JobsTaskManager, tag: String) {
        self.manager = manager
        self.tag = tag
    }
}

extension JobsTaskManagerExecutionStream {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(manager: manager, tag: tag)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private let manager: JobsTaskManager
        private let tag: String
        private var taskIterator: JobsTaskExecutionSequence.AsyncIterator?
        
        init(manager: JobsTaskManager, tag: String) {
            self.manager = manager
            self.tag = tag
            
            if let item = manager.task(by: tag) {
                self.taskIterator = item.task.executions().makeAsyncIterator()
            }
        }
        
        public mutating func next() async -> TaskExecution? {
            guard var iterator = taskIterator else { return nil }
            let result = await iterator.next()
            taskIterator = iterator
            return result
        }
    }
}
