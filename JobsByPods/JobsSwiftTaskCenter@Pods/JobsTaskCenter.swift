//
//  JobsTaskCenter.swift  
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 3/15/26.
//  Copyright © 2026 Jobs. All rights reserved.
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
    /// 任务-标签映射：同一任务可拥有多个标签。
    private var taskTags: [ObjectIdentifier: Set<String>] = [:]
    /// 私有化构造，限制外部实例化，强制使用单例。
    public init() {}
}

extension JobsTaskCenter {
    /// 当前所有任务的标签并集（去重后返回数组）。
    public var allTags: [String] {
        lock.lock()
        defer { lock.unlock() }
        return Array(Set(taskTags.values.flatMap { $0 }))
    }
    /// 添加任务到中心。
    /// - Parameter task: 要管理的任务。
    public func add(_ task: JobsTask) {
        lock.lock()
        tasks[ObjectIdentifier(task)] = task
        lock.unlock()
    }
    /// 从中心移除指定任务，并在移除后调用 `task.cancel()` 取消任务。
    /// - Parameter task: 要移除的任务。
    public func remove(_ task: JobsTask) {
        lock.lock()
        let key = ObjectIdentifier(task)
        tasks.removeValue(forKey: key)
        taskTags.removeValue(forKey: key)
        lock.unlock()
        task.cancel()
    }
    /// 移除并取消所有任务。
    public func removeAll() {
        lock.lock()
        let all = Array(tasks.values)
        tasks.removeAll()
        taskTags.removeAll()
        lock.unlock()
        all.forEach { $0.cancel() }
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
