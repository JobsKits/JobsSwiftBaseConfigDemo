//
//  JobsTaskManager.swift
//  Pods
//
//  Created by Jobs on 15/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
/// JobsTaskManager - Jobs 系列任务管理器
/// 提供任务的集中管理、生命周期控制和应用状态监听
/// 线程安全：使用 NSLock 保护内部状态
public final class JobsTaskManager: @unchecked Sendable {

    public static let `default` = JobsTaskManager()
    private let lock = NSLock()
    private var tasks: [JobsTaskItem] = []
    private var statusObservers: [UUID: @Sendable (JobsTaskStatusChange) -> Void] = [:]
    private var lifecycleObserverTokens: [String: UUID] = [:]

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
        let didAdd: Bool
        lock.lock()
        let tagExists = tasks.contains { $0.tag == item.tag }
        if tagExists {
            didAdd = false
        } else {
            tasks.append(item)
            didAdd = true
        }
        lock.unlock()

        guard didAdd else { return self }

        bindLifecycle(for: item)
        InternalTaskCenter.default.add(item.task)
        InternalTaskCenter.default.addTag(item.tag, to: item.task)
        item.task.suspend()
        let newStatus = status(for: item.task, fallback: item.status)
        updateStatus(for: item.tag, to: newStatus, emitWhenUnchanged: true)
        return self
    }

    @discardableResult
    public func removeTask(task: JobsTaskItem) -> JobsTaskManager {
        removeTask(by: task.tag)
    }

    @discardableResult
    public func removeTask(by tag: String) -> JobsTaskManager {
        let item: JobsTaskItem?
        lock.lock()
        let idx = tasks.firstIndex { $0.tag == tag }
        item = idx.map { tasks.remove(at: $0) }
        let lifecycleToken = lifecycleObserverTokens.removeValue(forKey: tag)
        lock.unlock()

        if let item {
            if let lifecycleToken { item.task.removeLifecycleObserver(lifecycleToken) }
            InternalTaskCenter.default.remove(item.task)
            notifyStatusChange(tag: tag, oldStatus: item.status, newStatus: nil)
        };return self
    }

    @discardableResult
    public func removeAllTask() -> JobsTaskManager {
        let snapshot: [JobsTaskItem]
        let tokens: [String: UUID]
        lock.lock()
        snapshot = tasks
        tasks.removeAll()
        tokens = lifecycleObserverTokens
        lifecycleObserverTokens.removeAll()
        lock.unlock()

        for item in snapshot {
            if let token = tokens[item.tag] {
                item.task.removeLifecycleObserver(token)
            }
            notifyStatusChange(tag: item.tag, oldStatus: item.status, newStatus: nil)
        }
        InternalTaskCenter.default.removeAll()
        return self
    }

    @discardableResult
    public func resume(by tag: String) -> JobsTaskManager {
        let matched = tasksSnapshot().filter { $0.tag == tag }
        matched.forEach { item in
            item.task.resume()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .execute))
        };return self
    }

    @discardableResult
    public func resume(condition: (JobsTaskItem) -> Bool) -> JobsTaskManager {
        let snapshot = tasksSnapshot()
        snapshot.filter(condition).forEach { item in
            item.task.resume()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .execute))
        };return self
    }

    @discardableResult
    public func executeNow(by tag: String) -> JobsTaskManager {
        let matched = tasksSnapshot().filter { $0.tag == tag }
        matched.forEach { item in
            item.task.executeNow()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .execute))
        };return self
    }

    @discardableResult
    public func executeNow(condition: (JobsTaskItem) -> Bool) -> JobsTaskManager {
        let snapshot = tasksSnapshot()
        snapshot.filter(condition).forEach { item in
            item.task.executeNow()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .execute))
        };return self
    }

    @discardableResult
    public func suspend(by tag: String) -> JobsTaskManager {
        let matched = tasksSnapshot().filter { $0.tag == tag }
        matched.forEach { item in
            item.task.suspend()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .suspend))
        };return self
    }

    @discardableResult
    public func suspend() -> JobsTaskManager {
        let snapshot = tasksSnapshot()
        snapshot.forEach { item in
            item.task.suspend()
            updateStatus(for: item.tag, to: status(for: item.task, fallback: .suspend))
        };return self
    }

    @discardableResult
    public func cancel(by tag: String) -> JobsTaskManager {
        let item: JobsTaskItem?
        let lifecycleToken: UUID?
        lock.lock()
        let idx = tasks.firstIndex { $0.tag == tag }
        item = idx.map { tasks.remove(at: $0) }
        lifecycleToken = lifecycleObserverTokens.removeValue(forKey: tag)
        lock.unlock()

        if let item {
            if let lifecycleToken { item.task.removeLifecycleObserver(lifecycleToken) }
            item.task.cancel()
            let oldStatus = item.status
            item.status = .ended
            notifyStatusChange(tag: tag,
                               oldStatus: oldStatus,
                               newStatus: .ended)
        };return self
    }

    @discardableResult
    public func cancel() -> JobsTaskManager {
        let snapshot: [JobsTaskItem]
        let tokens: [String: UUID]
        lock.lock()
        snapshot = tasks
        tasks.removeAll()
        tokens = lifecycleObserverTokens
        lifecycleObserverTokens.removeAll()
        lock.unlock()

        snapshot.forEach { item in
            if let token = tokens[item.tag] {
                item.task.removeLifecycleObserver(token)
            }
            item.task.cancel()
            let oldStatus = item.status
            item.status = .ended
            notifyStatusChange(tag: item.tag,
                               oldStatus: oldStatus,
                               newStatus: .ended)
        };return self
    }

    public var allTasks: [JobsTaskItem] {
        tasksSnapshot()
    }

    public func tasks(where predicate: (JobsTaskItem) -> Bool) -> [JobsTaskItem] {
        tasksSnapshot().filter(predicate)
    }

    public func tasks(with status: JobsTaskStatus) -> [JobsTaskItem] {
        tasks(where: { $0.status == status })
    }

    public var taskCount: Int {
        lock.lock()
        defer { lock.unlock() }
        return tasks.count
    }
}

// MARK: - JobsTaskManager Async/Await Support
extension JobsTaskManager {
    @discardableResult
    public func addTaskAsync(_ item: JobsTaskItem) async -> Bool {
        let existedBefore = task(by: item.tag) != nil
        _ = addTask(task: item)
        return !existedBefore && task(by: item.tag) != nil
    }

    @discardableResult
    public func removeTaskAsync(by tag: String) async -> Bool {
        let existed = task(by: tag) != nil
        removeTask(by: tag)
        return existed
    }

    @discardableResult
    public func executeNowAsync(by tag: String) async -> Bool {
        guard let item = task(by: tag) else { return false }
        return await item.task.executeAndWait()
    }

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

    public func waitForTask(by tag: String) async {
        guard let item = task(by: tag) else { return }
        await item.task.waitUntilFinished()
    }

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
            };return successCount
        }
    }

    public func executionStream(for tag: String) -> JobsTaskManagerExecutionStream {
        JobsTaskManagerExecutionStream(manager: self, tag: tag)
    }

    public func statusChanges() -> JobsTaskManagerStatusStream {
        JobsTaskManagerStatusStream(manager: self)
    }
}
// MARK: - JobsTaskManager internals
extension JobsTaskManager {
    @discardableResult
    func addStatusObserver(_ observer: @escaping @Sendable (JobsTaskStatusChange) -> Void) -> UUID {
        let id = UUID()
        lock.lock()
        statusObservers[id] = observer
        lock.unlock()
        return id
    }

    func removeStatusObserver(_ id: UUID) {
        lock.lock()
        statusObservers.removeValue(forKey: id)
        lock.unlock()
    }

    private func tasksSnapshot() -> [JobsTaskItem] {
        lock.lock()
        defer { lock.unlock() }
        return tasks
    }

    private func bindLifecycle(for item: JobsTaskItem) {
        let token = item.task.addLifecycleObserver { [weak self] lifecycle in
            guard let self else { return }
            guard let mappedStatus = self.status(for: lifecycle) else { return }
            self.updateStatus(for: item.tag, to: mappedStatus)
        }
        lock.lock()
        lifecycleObserverTokens[item.tag] = token
        lock.unlock()
    }

    private func updateStatus(for tag: String,
                              to newStatus: JobsTaskStatus,
                              emitWhenUnchanged: Bool = false) {
        let oldStatus: JobsTaskStatus?
        let shouldEmit: Bool
        lock.lock()
        if let item = tasks.first(where: { $0.tag == tag }) {
            oldStatus = item.status
            shouldEmit = emitWhenUnchanged || item.status != newStatus
            item.status = newStatus
        } else {
            oldStatus = nil
            shouldEmit = false
        }
        let observers = Array(statusObservers.values)
        lock.unlock()

        guard shouldEmit else { return }
        let change = JobsTaskStatusChange(tag: tag,
                                          oldStatus: oldStatus,
                                          newStatus: newStatus,
                                          timestamp: Date())
        observers.forEach { $0(change) }
    }

    private func notifyStatusChange(tag: String,
                                    oldStatus: JobsTaskStatus?,
                                    newStatus: JobsTaskStatus?) {
        lock.lock()
        let observers = Array(statusObservers.values)
        lock.unlock()
        let change = JobsTaskStatusChange(tag: tag,
                                          oldStatus: oldStatus,
                                          newStatus: newStatus,
                                          timestamp: Date())
        observers.forEach { $0(change) }
    }

    private func status(for task: JobsTask, fallback: JobsTaskStatus) -> JobsTaskStatus {
        status(for: task.lifecycle) ?? fallback
    }

    private func status(for lifecycle: JobsTaskLifecycle) -> JobsTaskStatus? {
        switch lifecycle {
        case .idle: return .prepare
        case .running: return .execute
        case .suspended: return .suspend
        case .cancelled, .finished: return .ended
        }
    }
}
// MARK: - JobsTaskManager@DSL
extension JobsTaskManager {
    @discardableResult
    public func byAddTask(_ item: JobsTaskItem) -> Self {
        addTask(task: item)
        return self
    }

    @discardableResult
    public func byRemoveTask(_ item: JobsTaskItem) -> Self {
        removeTask(task: item)
        return self
    }

    @discardableResult
    public func byRemoveTask(tag: String) -> Self {
        removeTask(by: tag)
        return self
    }

    @discardableResult
    public func byRemoveAllTask() -> Self {
        removeAllTask()
        return self
    }

    @discardableResult
    public func byResume(tag: String) -> Self {
        resume(by: tag)
        return self
    }

    @discardableResult
    public func byResume(condition: @escaping (JobsTaskItem) -> Bool) -> Self {
        resume(condition: condition)
        return self
    }

    @discardableResult
    public func byExecuteNow(tag: String) -> Self {
        executeNow(by: tag)
        return self
    }

    @discardableResult
    public func byExecuteNow(condition: @escaping (JobsTaskItem) -> Bool) -> Self {
        executeNow(condition: condition)
        return self
    }

    @discardableResult
    public func bySuspend(tag: String) -> Self {
        suspend(by: tag)
        return self
    }

    @discardableResult
    public func bySuspend() -> Self {
        suspend()
        return self
    }

    @discardableResult
    public func byCancel(tag: String) -> Self {
        cancel(by: tag)
        return self
    }

    @discardableResult
    public func byCancel() -> Self {
        cancel()
        return self
    }

    @discardableResult
    public func byAddTaskAsync(_ item: JobsTaskItem) async -> Self {
        _ = await addTaskAsync(item)
        return self
    }

    @discardableResult
    public func byRemoveTaskAsync(tag: String) async -> Self {
        _ = await removeTaskAsync(by: tag)
        return self
    }

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
        let snapshot = tasksSnapshot()

        switch state {
        case .active:
            snapshot.filter { $0.status == .background }.forEach {
                resume(by: $0.tag)
                executeNow(by: $0.tag)
            }
        case .background:
            snapshot.filter { $0.status == .execute }.forEach { item in
                item.task.suspend()
                updateStatus(for: item.tag, to: .background)
            }
        default:
            break
        }
    }
}
#endif
