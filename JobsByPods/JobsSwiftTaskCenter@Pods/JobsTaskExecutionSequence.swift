//
//  JobsTaskExecutionSequence.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
/// 任务执行的异步序列
public struct JobsTaskExecutionSequence: AsyncSequence {
    
    public typealias Element = TaskExecution
    private let task: JobsTask
    
    init(task: JobsTask) {
        self.task = task
    }
}

extension JobsTaskExecutionSequence {
    
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(task: task)
    }
    
    public struct AsyncIterator: AsyncIteratorProtocol {
        private let task: JobsTask
        private let stream: AsyncStream<TaskExecution>
        private var iterator: AsyncStream<TaskExecution>.Iterator
        private var actionToken: UUID?
        
        init(task: JobsTask) {
            self.task = task
            
            var continuation: AsyncStream<TaskExecution>.Continuation?
            self.stream = AsyncStream<TaskExecution> { cont in
                continuation = cont
            }
            self.iterator = stream.makeAsyncIterator()
            
            // 注册 action 来捕获执行
            if let cont = continuation {
                self.actionToken = task.addAction { task in
                    let execution = TaskExecution(
                        count: task.executionCount,
                        date: Date(),
                        lifecycle: task.lifecycle,
                        nextFireDate: task.estimatedNextExecutionDate
                    )
                    cont.yield(execution)
                    
                    // 如果任务终止，结束序列
                    if task.lifecycle.isTerminated {
                        cont.finish()
                    }
                }
            }
        }

        public mutating func next() async -> TaskExecution? {
            guard !task.lifecycle.isTerminated else {
                return nil
            };return await iterator.next()
        }
    }
}

extension JobsTaskExecutionSequence {
    // MARK: - JobsTaskExecutionSequence 操作符扩展
    /// 限制执行次数
    /// - Parameter maxCount: 最大执行次数
    /// - Returns: 新的异步序列
    public func prefix(_ maxCount: Int) -> JobsPrefixTaskExecutionSequence {
        JobsPrefixTaskExecutionSequence(base: self, maxCount: maxCount)
    }
    /// 过滤执行
    /// - Parameter predicate: 过滤条件
    /// - Returns: 新的异步序列
    public func filter(
        _ predicate: @escaping @Sendable (TaskExecution) -> Bool
    ) -> JobsFilteredTaskExecutionSequence {
        JobsFilteredTaskExecutionSequence(base: self, predicate: predicate)
    }
    /// 映射执行
    /// - Parameter transform: 转换函数
    /// - Returns: 新的异步序列
    public func map<T>(
        _ transform: @escaping @Sendable (TaskExecution) -> T
    ) -> JobsMappedTaskExecutionSequence<T> where T: Sendable {
        JobsMappedTaskExecutionSequence(base: self, transform: transform)
    }
    /// 跳过前 N 次执行
    /// - Parameter count: 要跳过的次数
    /// - Returns: 新的异步序列
    public func dropFirst(_ count: Int = 1) -> JobsDropFirstTaskExecutionSequence {
        JobsDropFirstTaskExecutionSequence(base: self, count: count)
    }
    // MARK: - AsyncSequence 时间窗口操作
    /// 在指定时间窗口内收集执行
    /// - Parameter window: 时间窗口（秒）
    /// - Returns: 异步序列，发出时间窗口内的执行数组
    public func windowed(seconds: TimeInterval) -> JobsWindowedTaskExecutionSequence {
        JobsWindowedTaskExecutionSequence(base: self, windowDuration: seconds)
    }
    // MARK: - JobsTaskExecutionSequence 便利方法
    /// 收集所有执行到数组
    /// - Returns: 执行数组
    public func collect() async -> [TaskExecution] {
        var results: [TaskExecution] = []
        for await execution in self {
            results.append(execution)
        };return results
    }
    /// 收集指定数量的执行
    /// - Parameter count: 数量
    /// - Returns: 执行数组
    public func collect(_ count: Int) async -> [TaskExecution] {
        var results: [TaskExecution] = []
        for await execution in self.prefix(count) {
            results.append(execution)
        };return results
    }
    /// 对每次执行执行操作
    /// - Parameter action: 操作闭包
    public func forEach(_ action: @escaping @Sendable (TaskExecution) async -> Void) async {
        for await execution in self {
            await action(execution)
        }
    }
    /// 查找第一个匹配的执行
    /// - Parameter predicate: 匹配条件
    /// - Returns: 匹配的执行
    public func first(
        where predicate: @escaping @Sendable (TaskExecution) -> Bool
    ) async -> TaskExecution? {
        for await execution in self {
            if predicate(execution) {
                return execution
            }
        };return nil
    }
}
