//
//  JobsTaskManager.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

import Foundation
/// JobsTaskManager - Jobs 系列任务管理器
/// 提供任务的集中管理、生命周期控制和应用状态监听
/// 线程安全：使用 NSLock 保护内部状态
public final class JobsTaskManager: @unchecked Sendable {
    
    public static let `default` = JobsTaskManager()
    private let lock = NSLock()
    private var tasks: [JobsTaskItem] = []

    private init() {
        #if os(iOS) || os(tvOS)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(backgroundState),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(activeState),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        #endif
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension JobsTaskManager {
    /// 便利构建器@合并多个任务的执行流
    /// - Parameter tags: 任务标签数组
    /// - Returns: 合并的异步序列
    @discardableResult
    public func mergedExecutions(for tags: [String]) -> JobsMergedTaskExecutionSequence {
        let sequences = tags.compactMap { tag -> (String, JobsTaskExecutionSequence)? in
            guard let item = task(by: tag) else { return nil }
            return (tag, item.task.executions())
        };return JobsMergedTaskExecutionSequence(sequences)
    }
    
    @discardableResult
    public func task(by tag: String) -> JobsTaskItem? {
        lock.lock()
        defer { lock.unlock() }
        return tasks.first { $0.tag == tag }
    }

    @discardableResult
    public func addTask(task item: JobsTaskItem) -> JobsTaskManager {
        lock.lock()
        // 检查是否已存在同名标签
        let tagExists = tasks.contains { $0.tag == item.tag }
        if tagExists {
            lock.unlock()
            return self
        }
        tasks.append(item)
        lock.unlock()
        
        InternalTaskCenter.default.add(item.task)
        InternalTaskCenter.default.addTag(item.tag, to: item.task)
        item.task.suspend()
        
        return self
    }

    @discardableResult
    public func removeTask(task: JobsTaskItem) -> JobsTaskManager {
        removeTask(by: task.tag)
    }

    @discardableResult
    public func removeTask(by tag: String) -> JobsTaskManager {
        lock.lock()
        let idx = tasks.firstIndex { $0.tag == tag }
        let item = idx.map { tasks.remove(at: $0) }
        lock.unlock()
        if let item {
            InternalTaskCenter.default.remove(item.task)
        }
        return self
    }

    @discardableResult
    public func removeAllTask() -> JobsTaskManager {
        lock.lock()
        tasks.removeAll()
        lock.unlock()
        InternalTaskCenter.default.removeAll()
        return self
    }

    @discardableResult
    public func resume(by tag: String) -> JobsTaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            $0.task.resume()
            $0.status = .execute
        }
        return self
    }

    @discardableResult
    public func resume(condition: (JobsTaskItem) -> Bool) -> JobsTaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.filter(condition).forEach {
            $0.task.resume()
            $0.status = .execute
        }
        return self
    }

    @discardableResult
    public func executeNow(by tag: String) -> JobsTaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            $0.task.executeNow()
            $0.status = .execute
        }
        return self
    }

    @discardableResult
    public func executeNow(condition: (JobsTaskItem) -> Bool) -> JobsTaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.filter(condition).forEach {
            $0.task.executeNow()
            $0.status = .execute
        }
        return self
    }

    @discardableResult
    public func suspend(by tag: String) -> JobsTaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            guard $0.status == .execute else { return }
            $0.task.suspend()
            $0.status = .suspend
        }
        return self
    }

    @discardableResult
    public func suspend() -> JobsTaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.forEach {
            guard $0.status == .execute else { return }
            $0.task.suspend()
            $0.status = .suspend
        }
        return self
    }

    @discardableResult
    public func cancel(by tag: String) -> JobsTaskManager {
        lock.lock()
        let idx = tasks.firstIndex { $0.tag == tag }
        let item = idx.map { tasks.remove(at: $0) }
        lock.unlock()
        if let item {
            item.task.cancel()
            item.status = .ended
        }
        return self
    }

    @discardableResult
    public func cancel() -> JobsTaskManager {
        lock.lock()
        let snapshot = tasks
        tasks.removeAll()
        lock.unlock()
        snapshot.forEach {
            $0.task.cancel()
            $0.status = .ended
        }
        return self
    }
    
    // MARK: - 批量查询与筛选
    /// 获取所有任务项的快照
    public var allTasks: [JobsTaskItem] {
        lock.lock()
        defer { lock.unlock() }
        return tasks
    }
    /// 根据条件筛选任务
    /// - Parameter predicate: 筛选条件
    /// - Returns: 符合条件的任务数组
    public func tasks(where predicate: (JobsTaskItem) -> Bool) -> [JobsTaskItem] {
        lock.lock()
        defer { lock.unlock() }
        return tasks.filter(predicate)
    }
    /// 获取指定状态的所有任务
    /// - Parameter status: 任务状态
    /// - Returns: 符合条件的任务数组
    public func tasks(with status: JobsTaskStatus) -> [JobsTaskItem] {
        tasks(where: { $0.status == status })
    }
    /// 任务总数
    public var taskCount: Int {
        lock.lock()
        defer { lock.unlock() }
        return tasks.count
    }
}
// MARK: - JobsTaskManager Async/Await Support
extension JobsTaskManager {
    /// 异步等待任务添加完成
    /// - Parameter item: 任务项
    /// - Returns: 是否成功添加
    @discardableResult
    public func addTaskAsync(_ item: JobsTaskItem) async -> Bool {
        await withCheckedContinuation { continuation in
            let result = addTask(task: item)
            continuation.resume(returning: result === self)
        }
    }
    /// 异步移除任务
    /// - Parameter tag: 任务标签
    /// - Returns: 是否成功移除
    @discardableResult
    public func removeTaskAsync(by tag: String) async -> Bool {
        await withCheckedContinuation { continuation in
            lock.lock()
            let existed = tasks.contains { $0.tag == tag }
            lock.unlock()
            
            removeTask(by: tag)
            continuation.resume(returning: existed)
        }
    }
    /// 异步执行任务并等待
    /// - Parameter tag: 任务标签
    /// - Returns: 是否成功执行
    @discardableResult
    public func executeNowAsync(by tag: String) async -> Bool {
        guard let item = task(by: tag) else { return false }
        return await item.task.executeAndWait()
    }
    /// 等待所有任务完成
    public func waitForAllTasks() async {
        let snapshot = allTasks
        await withTaskGroup(of: Void.self) { group in
            for item in snapshot {
                group.addTask {
                    await item.task.waitUntilFinished()
                }
            }
        }
    }
    /// 等待指定标签的任务完成
    /// - Parameter tag: 任务标签
    public func waitForTask(by tag: String) async {
        guard let item = task(by: tag) else { return }
        await item.task.waitUntilFinished()
    }
    /// 批量异步执行任务
    /// - Parameter tags: 任务标签数组
    /// - Returns: 成功执行的任务数量
    @discardableResult
    public func executeNowAsync(tags: [String]) async -> Int {
        await withTaskGroup(of: Bool.self) { group in
            for tag in tags {
                group.addTask {
                    await self.executeNowAsync(by: tag)
                }
            }
            
            var successCount = 0
            for await success in group {
                if success {
                    successCount += 1
                }
            }
            return successCount
        }
    }
    /// 创建任务执行流
    /// - Parameter tag: 任务标签
    /// - Returns: 异步序列
    public func executionStream(for tag: String) -> JobsTaskManagerExecutionStream {
        JobsTaskManagerExecutionStream(manager: self, tag: tag)
    }
    /// 创建所有任务状态变化流
    /// - Returns: 异步序列
    public func statusChanges() -> JobsTaskManagerStatusStream {
        JobsTaskManagerStatusStream(manager: self)
    }
}
// MARK: - JobsTaskManager@DSL
extension JobsTaskManager {
    /// 链式添加任务
    /// - Parameter item: 任务项
    /// - Returns: self
    @discardableResult
    public func byAddTask(_ item: JobsTaskItem) -> Self {
        addTask(task: item)
        return self
    }
    /// 链式移除任务
    /// - Parameter item: 任务项
    /// - Returns: self
    @discardableResult
    public func byRemoveTask(_ item: JobsTaskItem) -> Self {
        removeTask(task: item)
        return self
    }
    /// 链式根据标签移除任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byRemoveTask(tag: String) -> Self {
        removeTask(by: tag)
        return self
    }
    /// 链式移除所有任务
    /// - Returns: self
    @discardableResult
    public func byRemoveAllTask() -> Self {
        removeAllTask()
        return self
    }
    /// 链式根据标签恢复任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byResume(tag: String) -> Self {
        resume(by: tag)
        return self
    }
    /// 链式根据条件恢复任务
    /// - Parameter condition: 筛选条件
    /// - Returns: self
    @discardableResult
    public func byResume(condition: @escaping (JobsTaskItem) -> Bool) -> Self {
        resume(condition: condition)
        return self
    }
    /// 链式根据标签立即执行任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byExecuteNow(tag: String) -> Self {
        executeNow(by: tag)
        return self
    }
    /// 链式根据条件立即执行任务
    /// - Parameter condition: 筛选条件
    /// - Returns: self
    @discardableResult
    public func byExecuteNow(condition: @escaping (JobsTaskItem) -> Bool) -> Self {
        executeNow(condition: condition)
        return self
    }
    /// 链式根据标签暂停任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func bySuspend(tag: String) -> Self {
        suspend(by: tag)
        return self
    }
    /// 链式暂停所有任务
    /// - Returns: self
    @discardableResult
    public func bySuspend() -> Self {
        suspend()
        return self
    }
    /// 链式根据标签取消任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byCancel(tag: String) -> Self {
        cancel(by: tag)
        return self
    }
    /// 链式取消所有任务
    /// - Returns: self
    @discardableResult
    public func byCancel() -> Self {
        cancel()
        return self
    }
    // MARK: - Async Builders (DSL)
    /// 异步链式添加任务
    /// - Parameter item: 任务项
    /// - Returns: self
    @discardableResult
    public func byAddTaskAsync(_ item: JobsTaskItem) async -> Self {
        _ = await addTaskAsync(item)
        return self
    }
    /// 异步链式移除任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byRemoveTaskAsync(tag: String) async -> Self {
        _ = await removeTaskAsync(by: tag)
        return self
    }
    /// 异步链式执行任务
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byExecuteNowAsync(tag: String) async -> Self {
        _ = await executeNowAsync(by: tag)
        return self
    }
}
#if os(iOS) || os(tvOS)
extension JobsTaskManager: TaskForApplicationStatusDelegate {
    
    @objc private func backgroundState() {
        applicationStatusDidChanged(.background)
    }

    @objc private func activeState() {
        applicationStatusDidChanged(.active)
    }

    public func applicationStatusDidChanged(_ state: UIApplication.State) {
        lock.lock()
        let snapshot = tasks
        lock.unlock()

        switch state {
        case .active:
            snapshot.filter { $0.status == .background }.forEach {
                resume(by: $0.tag)
                executeNow(by: $0.tag)
            }
        case .background:
            snapshot.filter { $0.status == .execute }.forEach {
                suspend(by: $0.tag)
                $0.status = .background
            }
        default:
            break
        }
    }
}
#endif
