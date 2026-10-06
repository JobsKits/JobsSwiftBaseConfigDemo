//
//  JobsTaskCenter.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
/// 任务中心：集中管理 `JobsTask` 实例的生命周期与标签。

public typealias InternalTaskCenter = JobsTaskCenter
public final class JobsTaskCenter: @unchecked Sendable {
    /// 单例实例，便于全局访问。
    public static let `default` = JobsTaskCenter()
    /// 互斥锁，保证多线程环境下对任务/标签字典的安全访问。
    private let lock = NSLock()
    /// 任务存储：以对象标识符为键，存储任务实例。
    private var tasks: [ObjectIdentifier: JobsTask] = [:]
    private var lifecycleTokens: [ObjectIdentifier: UUID] = [:]
    /// 任务-标签映射：同一任务可拥有多个标签。
    private var taskTags: [ObjectIdentifier: Set<String>] = [:]
    /// 私有化构造，限制外部实例化，强制使用单例。
    public init() {}

    public var count: Int {
        lock.lock()
        defer {
            lock.unlock()
        }
        return tasks.count
    }

    deinit {
        removeAll()
    }
}

extension JobsTaskCenter {
    /// 当前所有任务的标签并集（去重后返回数组）。
    public var allTags: [String] {
        lock.lock()
        defer { lock.unlock() };return Array(Set(taskTags.values.flatMap { $0 }))
    }
    /// 添加任务到中心。
    /// - Parameter task: 要管理的任务。
    public func add(_ task: JobsTask) {
        let key = ObjectIdentifier(task)
        lock.lock()
        if tasks[key] != nil {
            lock.unlock()
            return
        }
        tasks[key] = task
        let token = task.addLifecycleObserver { [weak self, weak task] state in
            guard state.isTerminated, let task else {
                return
            }
            self?.detach(task, cancel: false)
        }
        lifecycleTokens[key] = token
        lock.unlock()
        if task.lifecycle.isTerminated {
            detach(task, cancel: false)
        }
    }

    /// 移除并取消任务；已完成任务的自动回收不会改变 finished 状态。
    public func remove(_ task: JobsTask) {
        detach(task, cancel: true)
    }

    private func detach(_ task: JobsTask, cancel: Bool) {
        let key = ObjectIdentifier(task)
        lock.lock()
        tasks.removeValue(forKey: key)
        taskTags.removeValue(forKey: key)
        let token = lifecycleTokens.removeValue(forKey: key)
        lock.unlock()
        if let token {
            task.removeLifecycleObserver(token)
        }
        if cancel {
            task.cancel()
        }
    }

    public func removeAll() {
        lock.lock()
        let all = Array(tasks.values)
        let tokens = lifecycleTokens
        tasks.removeAll()
        taskTags.removeAll()
        lifecycleTokens.removeAll()
        lock.unlock()
        for task in all {
            if let token = tokens[ObjectIdentifier(task)] {
                task.removeLifecycleObserver(token)
            }
            task.cancel()
        }
    }
    /// 为指定任务添加标签。
    /// - Parameters:
    ///   - tag: 标签字符串。
    ///   - task: 需要打标签的任务。
    public func addTag(_ tag: String, to task: JobsTask) {
        lock.lock()
        taskTags[ObjectIdentifier(task), default: []].insert(tag)
        lock.unlock()
    }
}
