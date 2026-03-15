import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#endif

public typealias InternalTaskCenter = TaskCenter

#if os(iOS) || os(tvOS)
public protocol TaskForApplicationStatusDelegate: AnyObject {
    func applicationStatusDidChanged(_ state: UIApplication.State)
}
#endif

public final class TaskItem {
    fileprivate var task: STTask
    public let tag: String
    public var status: TaskStatus = .prepare

    public init(schedule: Period, for tag: String, do action: @escaping () -> Void) {
        self.task = Plan.every(schedule).do(queue: .global()) { action() }
        self.tag = tag
    }

    public init(task: STTask, tag: String, status: TaskStatus = .prepare) {
        self.task = task
        self.tag = tag
        self.status = status
    }
}

public final class TaskManager {
    public static let `default` = TaskManager()

    private let lock = NSLock()
    private var tasks: [TaskItem] = []

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

    public func task(by tag: String) -> TaskItem? {
        lock.lock()
        defer { lock.unlock() }
        return tasks.first { $0.tag == tag }
    }

    @discardableResult
    public func addTask(task item: TaskItem) -> TaskManager {
        let allTags = InternalTaskCenter.default.allTags
        guard !allTags.contains(item.tag) else { return self }

        InternalTaskCenter.default.add(item.task)
        InternalTaskCenter.default.addTag(item.tag, to: item.task)
        item.task.suspend()

        lock.lock()
        tasks.append(item)
        lock.unlock()
        return self
    }

    @discardableResult
    public func removeTask(task: TaskItem) -> TaskManager {
        removeTask(by: task.tag)
    }

    @discardableResult
    public func removeTask(by tag: String) -> TaskManager {
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
    public func removeAllTask() -> TaskManager {
        lock.lock()
        tasks.removeAll()
        lock.unlock()
        InternalTaskCenter.default.removeAll()
        return self
    }

    @discardableResult
    public func resume(by tag: String) -> TaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            $0.task.resume()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func resume(condition: (TaskItem) -> Bool) -> TaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.filter(condition).forEach {
            $0.task.resume()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func executeNow(by tag: String) -> TaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            $0.task.executeNow()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func executeNow(condition: (TaskItem) -> Bool) -> TaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.filter(condition).forEach {
            $0.task.executeNow()
            $0.status = .excute
        }
        return self
    }

    @discardableResult
    public func suspend(by tag: String) -> TaskManager {
        lock.lock()
        let matched = tasks.filter { $0.tag == tag }
        lock.unlock()
        matched.forEach {
            guard $0.status == .excute else { return }
            $0.task.suspend()
            $0.status = .suspend
        }
        return self
    }

    @discardableResult
    public func suspend() -> TaskManager {
        lock.lock()
        let snapshot = tasks
        lock.unlock()
        snapshot.forEach {
            guard $0.status == .excute else { return }
            $0.task.suspend()
            $0.status = .suspend
        }
        return self
    }

    @discardableResult
    public func cancel(by tag: String) -> TaskManager {
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
    public func cancel() -> TaskManager {
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
}

#if os(iOS) || os(tvOS)
extension TaskManager: TaskForApplicationStatusDelegate {
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
            snapshot.filter { $0.status == .excute }.forEach {
                suspend(by: $0.tag)
                $0.status = .background
            }
        default:
            break
        }
    }
}
#endif
