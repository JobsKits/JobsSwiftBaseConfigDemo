//
//  TaskItem.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import UIKit

public typealias InternalTaskCenter = TaskCenter

public protocol TaskForApplicationStatusDelegate {

    /// APP各种状态改变
    func applicationStatusDidChanged(_ state: UIApplication.State)

}

public struct TaskManager {

    class ApplicationStateListener: NSObject {
        fileprivate static var `default`: ApplicationStateListener = ApplicationStateListener()
        private override init() {
            super.init()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        @objc fileprivate func backgroundState() {
            TaskManager.default.applicationStatusDidChanged(.background)
        }

        @objc fileprivate func activeState() {
            TaskManager.default.applicationStatusDidChanged(.active)
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }

    }

    public static var `default`: TaskManager = TaskManager()
    let lock = NSLock()
    private init() {
        NotificationCenter.default.addObserver(ApplicationStateListener.default, selector: #selector(ApplicationStateListener.backgroundState), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(ApplicationStateListener.default, selector: #selector(ApplicationStateListener.activeState), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    fileprivate var tasks: [TaskItem] = []

    // MARK: - 添加任务

    /// 找tast
    ///
    /// - Parameter tag: tag
    /// - Returns: task
    public func task(by tag: String) -> TaskItem? {
        return self.tasks.first {
            $0.tag == tag
        }
    }

    /// 添加任务
    ///
    /// - Parameters:
    ///   - item: 任务
    ///   - tag: 任务tag
    @discardableResult
    public mutating func addTask(task item: TaskItem) -> TaskManager {
        let allTags = InternalTaskCenter.default.allTags
        if !allTags.contains(item.tag) {
            InternalTaskCenter.default.add(item.task)
            InternalTaskCenter.default.addTag(item.tag, to: item.task)
            item.task.suspend()
            lock.lock()
            self.tasks.append(item)
            lock.unlock()
        }
        return self
    }

    // MARK: - 删除任务

    @discardableResult
    public mutating func removeTask(task: TaskItem) -> TaskManager {
        return self.removeTask(by: task.tag)
    }

    @discardableResult
    public mutating func removeTask(by tag: String) -> TaskManager {
        lock.lock()
        if let firstIndex = (0..<self.tasks.count).first(where: {self.tasks[$0].tag == tag}) {
            InternalTaskCenter.default.remove(self.tasks[firstIndex].task)
            self.tasks.remove(at: firstIndex)
        }
        lock.unlock()
        return self
    }

    @discardableResult
    public mutating func removeAllTask() -> TaskManager {
        lock.lock()
        InternalTaskCenter.default.removeAll()
        self.tasks = []
        lock.unlock()
        return self
    }

    // MARK: - 调度任务
    @discardableResult
    public func resume(by tag: String) -> TaskManager {
        self.tasks.filter {$0.tag == tag}.forEach {
            $0.task.resume()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func resume(condition: (TaskItem) -> Bool) -> TaskManager {
        self.tasks.forEach {
            if condition($0) {
                $0.task.resume()
                $0.status = .excute
            }
        }
        return self
    }

    @discardableResult
    public func executeNow(by tag: String) -> TaskManager {
        self.tasks.filter {$0.tag == tag}.forEach {
            $0.task.executeNow()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func executeNow(condition: (TaskItem) -> Bool) -> TaskManager {
        self.tasks.forEach {
            if condition($0) {
                $0.task.executeNow()
                $0.status = .excute
            }
        }
        return self
    }

    @discardableResult
    public func suspend(by tag: String) -> TaskManager {
        self.tasks.filter {$0.tag == tag}.forEach {
            if $0.status == .excute {   /// 目前只要是正在执行的才可以暂停，其他状态不能暂停，因为其他状态本身就不会执行
                $0.task.suspend()
                $0.status = .suspend
            }
        }
        return self
    }

    @discardableResult
    public func suspend() -> TaskManager {
        self.tasks.forEach {
            if $0.status == .excute {
                $0.task.suspend()
                $0.status = .suspend
            }
        }
        return self
    }

    @discardableResult
    public mutating func cancel(by tag: String) -> TaskManager {
        lock.lock()
        if let first = (0..<self.tasks.count).first(where: {self.tasks[$0].tag == tag}) {
            self.tasks[first].task.cancel()
            self.tasks[first].status = .ended
            self.tasks.remove(at: first)
        }
        lock.unlock()
        return self
    }

    @discardableResult
    public mutating func cancel() -> TaskManager {
        lock.lock()
        self.tasks.forEach {
            $0.task.cancel()
            $0.status = .ended
        }
        self.tasks = []
        lock.unlock()
        return self
    }

}

extension TaskManager: TaskForApplicationStatusDelegate {

    public func applicationStatusDidChanged(_ state: UIApplication.State) {
        switch state {
        case .active:
            /// 如果有后台任务，立马启动
            let filterTask = self.tasks.filter {$0.status == .background}
            filterTask.forEach {
                if $0.status == .background {
                    self.resume(by: $0.tag)
                    self.executeNow(by: $0.tag)
                }
            }
        case .background:
            let filterTask = self.tasks.filter {$0.status == .excute}
            filterTask.forEach {
                if $0.status == .excute {
                    self.suspend(by: $0.tag)
                    $0.status = .background
                }
            }
        default:
            break
        }
    }

}

public class TaskItem {

    fileprivate var task: STTask
    public var tag: String
    public var status: TaskStatus = .prepare

    public init(schedule: Period, for tag: String, do action: @escaping () -> Void) {
        self.task = Plan.every(schedule).do(queue: DispatchQueue.global()) {action()}
        self.tag = tag
    }

}
