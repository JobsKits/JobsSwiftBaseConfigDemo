//
//  JobsTaskCenter.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 3/15/26.
//  Copyright © 2026 Jobs. All rights reserved.
//
/// JobsTaskCenter - Jobs 系列任务中心
///
/// 该类用于集中管理一组符合 `JobsTask` 类型的任务：
/// - 线程安全：内部使用 `NSLock` 保证并发访问安全。
/// - 任务增删：支持添加、移除单个任务，或移除全部任务（并在移除时取消任务）。
/// - 标签管理：可为任务添加字符串标签，便于分类与筛选；同时提供 `allTags` 获取目前所有标签的并集。
///
/// 使用场景示例：
/// - 在页面/模块中创建多个可取消的异步任务（如网络请求、下载、定时器任务等），统一交给 `JobsTaskCenter` 管理，页面销毁时统一 `removeAll()`。
/// - 为任务打上业务标签，如 "login"、"imageDownload"，便于统计与查询。
import Foundation
/// JobsTaskCenterComponent - Jobs 系列任务中心组件
/// 提供便捷的任务创建、配置和管理接口
public final class JobsTaskCenterComponent: @unchecked Sendable {
    
    public let task: JobsTask
    public let configuration: Configuration

    public var tag: String?
    public var executionCount: Int {
        task.executionCount
    }

    public var nextFireDate: Date? {
        task.estimatedNextExecutionDate
    }

    public var lifecycle: JobsTaskLifecycle {
        task.lifecycle
    }
    
    private init(task: JobsTask, configuration: Configuration, tag: String? = nil) {
        self.task = task
        self.configuration = configuration
        self.tag = tag
    }
    /// 便利初始化器
    public init(task: JobsTask, configuration: Configuration) {
        self.task = task
        self.configuration = configuration
        self.tag = nil
    }
}

extension JobsTaskCenterComponent {
    
    public struct Configuration: Sendable {
        public var interval: JobsPeriod
        public var initialDelay: JobsPeriod
        public var repeatCount: Int?
        public var queue: DispatchQueue
        public var runLoopMode: RunLoop.Mode?
        public var fireImmediately: Bool

        public init(
            interval: JobsPeriod,
            initialDelay: JobsPeriod = .zero,
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
    
    @discardableResult
    public static func schedule(
        configuration: Configuration,
        action: @escaping () -> Void
    ) -> JobsTaskCenterComponent {
        JobsTaskCenterComponent(
            task: makeTask(
                with: JobsPlan.every(
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
    ) -> JobsTaskCenterComponent {
        let delay = milliseconds.milliseconds
        let config = Configuration(
            interval: delay,
            initialDelay: delay,
            repeatCount: 1,
            queue: queue,
            runLoopMode: runLoopMode,
            fireImmediately: false
        )
        let plan = JobsPlan.after(delay)
        let task = makeTask(with: plan,
                            queue: queue,
                            runLoopMode: runLoopMode,
                            action: taskBlock)
        return JobsTaskCenterComponent(task: task, configuration: config)
    }

    @discardableResult
    public static func createOneShotTask(
        seconds: Int,
        queue: DispatchQueue = .main,
        runLoopMode: RunLoop.Mode? = nil,
        taskBlock: @escaping () -> Void
    ) -> JobsTaskCenterComponent {
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
    ) -> JobsTaskCenterComponent {
        schedule(configuration: Configuration(
            interval: milliseconds.milliseconds,
            initialDelay: initialDelay.milliseconds,
            repeatCount: repeatCount,
            queue: .main,
            runLoopMode: mode,
            fireImmediately: fireImmediately
        ), action: taskBlock)
    }

    public static func createRunLoopTask(
        runloop mode: RunLoop.Mode,
        seconds: Int,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        taskBlock: @escaping () -> Void
    ) -> JobsTaskCenterComponent {
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
    ) -> JobsTaskCenterComponent {
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
    ) -> JobsTaskCenterComponent {
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

    @discardableResult
    public func removeAppendedTask(by token: UUID)  -> Self {
        task.removeAction(token)
        return self
    }

    @discardableResult
    public func resume() -> Self {
        task.resume()
        return self
    }

    @discardableResult
    public func suspend() -> Self {
        task.suspend()
        return self
    }

    @discardableResult
    public func cancel() -> Self {
        task.cancel()
        return self
    }

    @discardableResult
    public func executeNow() -> Self {
        task.executeNow()
        return self
    }

    @discardableResult
    public func attach(
        tag: String,
        manager: JobsTaskManager = .default,
        autoResume: Bool = true,
        executeImmediately: Bool = false
    ) -> JobsTaskItem {
        let item = JobsTaskItem(task: task, tag: tag)
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
        with plan: JobsPlan,
        queue: DispatchQueue,
        runLoopMode: RunLoop.Mode?,
        action: @escaping () -> Void
    ) -> JobsTask {
        guard let mode = runLoopMode else {
            return plan.do(queue: queue) {
                action()
            }
        }
        return plan.do(mode: mode) {
            action()
        }
    }
}

extension JobsTaskCenterComponent {
    /// 链式设置标签
    /// - Parameter tag: 任务标签
    /// - Returns: self
    @discardableResult
    public func byTag(_ tag: String?) -> Self {
        self.tag = tag
        return self
    }
    /// 链式添加任务动作
    /// - Parameter action: 任务执行闭包
    /// - Returns: self
    @discardableResult
    public func byAppendTask(_ action: @escaping () -> Void) -> Self {
        _ = appendTask(action: action)
        return self
    }
    /// 链式恢复任务
    /// - Returns: self
    @discardableResult
    public func byResume() -> Self {
        resume()
        return self
    }
    /// 链式暂停任务
    /// - Returns: self
    @discardableResult
    public func bySuspend() -> Self {
        suspend()
        return self
    }
    /// 链式取消任务
    /// - Returns: self
    @discardableResult
    public func byCancel() -> Self {
        cancel()
        return self
    }
    /// 链式立即执行
    /// - Returns: self
    @discardableResult
    public func byExecuteNow() -> Self {
        executeNow()
        return self
    }
    /// 链式绑定到 TaskManager
    /// - Parameters:
    ///   - tag: 任务标签
    ///   - manager: 任务管理器
    ///   - autoResume: 是否自动恢复
    ///   - executeImmediately: 是否立即执行
    /// - Returns: self
    @discardableResult
    public func byAttach(
        tag: String,
        manager: JobsTaskManager = .default,
        autoResume: Bool = true,
        executeImmediately: Bool = false
    ) -> Self {
        attach(tag: tag,
               manager: manager,
               autoResume: autoResume,
               executeImmediately: executeImmediately);return self
    }
}
// MARK: - JobsTaskCenterComponent Async Support
extension JobsTaskCenterComponent {
    /// 创建异步定时任务
    /// - Parameters:
    ///   - seconds: 间隔秒数
    ///   - queue: 执行队列
    ///   - initialDelay: 初始延迟（秒）
    ///   - repeatCount: 重复次数
    ///   - fireImmediately: 是否立即触发
    ///   - priority: 任务优先级
    ///   - taskBlock: 异步任务闭包
    /// - Returns: JobsTaskCenterComponent
    public static func createAsyncTimerTask(
        seconds: Int,
        queue: DispatchQueue = .main,
        initialDelay: Int = 0,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false,
        priority: TaskPriority = .medium,
        taskBlock: @escaping @Sendable () async -> Void
    ) -> JobsTaskCenterComponent {
        let config = Configuration(
            interval: seconds.seconds,
            initialDelay: initialDelay.seconds,
            repeatCount: repeatCount,
            queue: queue,
            runLoopMode: nil,
            fireImmediately: fireImmediately
        )
        let task = JobsPlan.every(
            config.interval,
            initialDelay: config.initialDelay,
            repeatCount: config.repeatCount,
            fireImmediately: config.fireImmediately
        ).doAsync(queue: queue, priority: priority, action: taskBlock)
        
        return JobsTaskCenterComponent(task: task, configuration: config)
    }
    /// 创建异步一次性任务
    /// - Parameters:
    ///   - seconds: 延迟秒数
    ///   - queue: 执行队列
    ///   - priority: 任务优先级
    ///   - taskBlock: 异步任务闭包
    /// - Returns: JobsTaskCenterComponent
    public static func createAsyncOneShotTask(
        seconds: Int,
        queue: DispatchQueue = .main,
        priority: TaskPriority = .medium,
        taskBlock: @escaping @Sendable () async -> Void
    ) -> JobsTaskCenterComponent {
        let delay = seconds.seconds
        let config = Configuration(
            interval: delay,
            initialDelay: delay,
            repeatCount: 1,
            queue: queue,
            runLoopMode: nil,
            fireImmediately: false
        )
        let task = JobsPlan.after(delay).doAsync(
            queue: queue,
            priority: priority,
            action: taskBlock
        );return JobsTaskCenterComponent(task: task, configuration: config)
    }
    /// 等待任务执行指定次数
    /// - Parameter count: 执行次数
    /// - Returns: 实际执行次数
    @discardableResult
    public func waitForExecutions(_ count: Int) async -> Int {
        await task.wait(forExecutions: count)
    }
    /// 等待下一次执行
    @discardableResult
    public func waitForNextExecution() async -> Int {
        await task.waitForNextExecution()
    }
    /// 获取执行序列
    /// - Returns: 异步序列
    public func executions() -> JobsTaskExecutionSequence {
        task.executions()
    }
}
// MARK: - JobsTaskCenterComponent.Configuration@DSL
extension JobsTaskCenterComponent.Configuration {
    /// 链式设置时间间隔
    /// - Parameter interval: 时间间隔
    /// - Returns: 新的 Configuration
    public func byInterval(_ interval: JobsPeriod) -> Self {
        var config = self
        config.interval = interval
        return config
    }
    /// 链式设置初始延迟
    /// - Parameter delay: 初始延迟
    /// - Returns: 新的 Configuration
    public func byInitialDelay(_ delay: JobsPeriod) -> Self {
        var config = self
        config.initialDelay = delay
        return config
    }
    /// 链式设置重复次数
    /// - Parameter count: 重复次数
    /// - Returns: 新的 Configuration
    public func byRepeatCount(_ count: Int?) -> Self {
        var config = self
        config.repeatCount = count
        return config
    }
    /// 链式设置执行队列
    /// - Parameter queue: 执行队列
    /// - Returns: 新的 Configuration
    public func byQueue(_ queue: DispatchQueue) -> Self {
        var config = self
        config.queue = queue
        return config
    }
    /// 链式设置 RunLoop 模式
    /// - Parameter mode: RunLoop 模式
    /// - Returns: 新的 Configuration
    public func byRunLoopMode(_ mode: RunLoop.Mode?) -> Self {
        var config = self
        config.runLoopMode = mode
        return config
    }
    /// 链式设置是否立即触发
    /// - Parameter fireImmediately: 是否立即触发
    /// - Returns: 新的 Configuration
    public func byFireImmediately(_ fireImmediately: Bool) -> Self {
        var config = self
        config.fireImmediately = fireImmediately
        return config
    }
}
