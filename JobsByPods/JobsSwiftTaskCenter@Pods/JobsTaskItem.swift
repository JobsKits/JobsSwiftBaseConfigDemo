//
//  JobsTaskItem.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

/// JobsTaskItem - Jobs 系列任务项
/// 封装了任务实例、标签和状态信息
/// 线程安全：使用 NSLock 保护状态修改

public final class JobsTaskItem {
    
    var task: JobsTask
    private let lock = NSLock()
    public let tag: String
    private var _status: JobsTaskStatus = .prepare
    /// 线程安全的状态访问
    public var status: JobsTaskStatus {
        get {
            lock.lock()
            defer { lock.unlock() };return _status
        }
        set {
            lock.lock()
            _status = newValue
            lock.unlock()
        }
    }

    public init(schedule: JobsPeriod,
                for tag: String,
                do action: @escaping () -> Void) {
        self.task = JobsPlan.every(schedule).do(queue: .global()) { action() }
        self.tag = tag
    }

    public init(task: JobsTask,
                tag: String,
                status: JobsTaskStatus = .prepare) {
        self.task = task
        self.tag = tag
        self._status = status
    }
}
// MARK: - JobsTaskItem@DSL
extension JobsTaskItem {
    /// 链式设置状态
    /// - Parameter status: 任务状态
    /// - Returns: self
    @discardableResult
    func byStatus(_ status: JobsTaskStatus) -> Self {
        self.status = status
        return self
    }
}
