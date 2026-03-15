import Foundation

public final class TaskCenterComponent {
    public struct Configuration {
        public var interval: Period
        public var initialDelay: Period
        public var repeatCount: Int?
        public var queue: DispatchQueue
        public var runLoopMode: RunLoop.Mode?
        public var fireImmediately: Bool

        public init(
            interval: Period,
            initialDelay: Period = .zero,
            repeatCount: Int? = nil,
            queue: DispatchQueue = .main,
            runLoopMode: RunLoop.Mode? = nil,
            fireImmediately: Bool = false
        ) {
            self.interval = interval
            self.initialDelay = initialDelay
            self.repeatCount = repeatCount
            self.queue = queue
            self.runLoopMode = runLoopMode
            self.fireImmediately = fireImmediately
        }
    }

    private let task: STTask
    public private(set) var tag: String?
    public let configuration: Configuration

    private init(task: STTask, configuration: Configuration, tag: String? = nil) {
        self.task = task
        self.configuration = configuration
        self.tag = tag
    }

    @discardableResult
    public static func schedule(
        configuration: Configuration,
        action: @escaping () -> Void
    ) -> TaskCenterComponent {
        TaskCenterComponent(
            task: makeTask(
                with: Plan.every(
                    configuration.interval,
                    initialDelay: configuration.initialDelay,
                    repeatCount: configuration.repeatCount,
                    fireImmediately: configuration.fireImmediately
                ),
                queue: configuration.queue,
                runLoopMode: configuration.runLoopMode,
                action: action),
            configuration: configuration)
    }

    @discardableResult
    public static func createOneShotTask(
        milliseconds: Int,
        queue: DispatchQueue = .main,
        runLoopMode: RunLoop.Mode? = nil,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        let delay = milliseconds.milliseconds
        let config = Configuration(
            interval: delay,
            initialDelay: delay,
            repeatCount: 1,
            queue: queue,
            runLoopMode: runLoopMode,
            fireImmediately: false
        )
        let plan = Plan.after(delay)
        let task = makeTask(with: plan,
                            queue: queue,
                            runLoopMode: runLoopMode,
                            action: taskBlock)
        return TaskCenterComponent(task: task, configuration: config)
    }

    @discardableResult
    public static func createOneShotTask(
        seconds: Int,
        queue: DispatchQueue = .main,
        runLoopMode: RunLoop.Mode? = nil,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        createOneShotTask(
            milliseconds: seconds * 1000,
            queue: queue,
            runLoopMode: runLoopMode,
            taskBlock: taskBlock
        )
    }

    public static func createRunLoopTask(
        runloop mode: RunLoop.Mode,
        milliseconds: Int,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        schedule(configuration: Configuration(
            interval: milliseconds.milliseconds,
            initialDelay: initialDelay.milliseconds,
            repeatCount: repeatCount,
            queue: .main,
            runLoopMode: mode,
            fireImmediately: fireImmediately
        ), action: taskBlock)
    }

    @available(*, deprecated, message: "Typo kept for backward compatibility. Use createRunLoopTask instead.")
    public static func createRunLoppTask(
        runloop mode: RunLoop.Mode,
        seconds: Int,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        createRunLoopTask(runloop: mode, milliseconds: seconds * 1000, taskBlock: taskBlock)
    }

    public static func createRunLoopTask(
        runloop mode: RunLoop.Mode,
        seconds: Int,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        createRunLoopTask(
            runloop: mode,
            milliseconds: seconds * 1000,
            initialDelay: initialDelay * 1000,
            repeatCount: repeatCount,
            fireImmediately: fireImmediately,
            taskBlock: taskBlock
        )
    }

    public static func createTimerTask(
        milliseconds: Int,
        queue: DispatchQueue = .main,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        let config = Configuration(
            interval: milliseconds.milliseconds,
            initialDelay: initialDelay.milliseconds,
            repeatCount: repeatCount,
            queue: queue,
            runLoopMode: nil,
            fireImmediately: fireImmediately
        )
        return schedule(configuration: config, action: taskBlock)
    }

    public static func createTimerTask(
        seconds: Int,
        queue: DispatchQueue = .main,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        taskBlock: @escaping () -> Void
    ) -> TaskCenterComponent {
        createTimerTask(
            milliseconds: seconds * 1000,
            queue: queue,
            initialDelay: initialDelay * 1000,
            repeatCount: repeatCount,
            fireImmediately: fireImmediately,
            taskBlock: taskBlock
        )
    }

    @discardableResult
    public func appendTask(action: @escaping () -> Void) -> UUID {
        return task.addAction { _ in action() }
    }

    public func removeAppendedTask(by token: UUID) {
        task.removeAction(token)
    }

    public func resume() {
        task.resume()
    }

    public func suspend() {
        task.suspend()
    }

    public func cancel() {
        task.cancel()
    }

    public func executeNow() {
        task.executeNow()
    }

    public var executionCount: Int {
        task.executionCount
    }

    public var nextFireDate: Date? {
        task.estimatedNextExecutionDate
    }

    public var lifecycle: STTask.Lifecycle {
        task.lifecycle
    }

    @discardableResult
    public func attach(
        tag: String,
        manager: TaskManager = .default,
        autoResume: Bool = true,
        executeImmediately: Bool = false
    ) -> TaskItem {
        let item = TaskItem(task: task, tag: tag)
        manager.addTask(task: item)
        if autoResume {
            manager.resume(by: tag)
        }
        if executeImmediately {
            manager.executeNow(by: tag)
        }
        self.tag = tag
        return item
    }

    private static func makeTask(
        with plan: Plan,
        queue: DispatchQueue,
        runLoopMode: RunLoop.Mode?,
        action: @escaping () -> Void
    ) -> STTask {
        if let mode = runLoopMode {
            return plan.do(mode: mode) {
                action()
            }
        }
        return plan.do(queue: queue) {
            action()
        }
    }
}
