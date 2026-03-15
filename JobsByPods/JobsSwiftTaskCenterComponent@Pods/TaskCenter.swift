import Foundation

public final class TaskCenter {
    public static let `default` = TaskCenter()

    private let lock = NSLock()
    private var tasks: [ObjectIdentifier: STTask] = [:]
    private var taskTags: [ObjectIdentifier: Set<String>] = [:]

    private init() {}

    public var allTags: [String] {
        lock.lock()
        defer { lock.unlock() }
        return Array(Set(taskTags.values.flatMap { $0 }))
    }

    public func add(_ task: STTask) {
        lock.lock()
        tasks[ObjectIdentifier(task)] = task
        lock.unlock()
    }

    public func remove(_ task: STTask) {
        lock.lock()
        let key = ObjectIdentifier(task)
        tasks.removeValue(forKey: key)
        taskTags.removeValue(forKey: key)
        lock.unlock()
        task.cancel()
    }

    public func removeAll() {
        lock.lock()
        let all = Array(tasks.values)
        tasks.removeAll()
        taskTags.removeAll()
        lock.unlock()
        all.forEach { $0.cancel() }
    }

    public func addTag(_ tag: String, to task: STTask) {
        lock.lock()
        taskTags[ObjectIdentifier(task), default: []].insert(tag)
        lock.unlock()
    }
}
