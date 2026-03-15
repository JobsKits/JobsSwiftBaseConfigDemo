//
//  JobsTaskCenterDefine.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 15/3/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
// MARK: - JobsSwiftTaskCenter@结构体
///
/// 定义了一个轻量的时间段类型 `JobsPeriod`，以秒为单位封装 `TimeInterval`，
/// 并提供便捷的构造方式（毫秒/秒）、比较与等值判断，以及与 `Date` 的加法操作。
///
/// 主要用途：
/// - 用更语义化的方式表达时间段（如 `500.milliseconds`、`2.seconds`）。
/// - 与 `Date` 配合，便捷地进行时间计算（如 `date.adding(2.seconds)`）。
/// 表示一个时间段（单位：秒）。
/// - `Sendable`: 可在并发环境中安全传递。
/// - `Equatable`: 支持等值比较。
/// - `Comparable`: 支持大小比较（基于内部秒数）。
public struct JobsPeriod: Sendable, Equatable, Comparable {
    /// 以秒为单位的底层时间间隔。
    public let timeInterval: TimeInterval
    /// 是否为 0 秒。
    public var isZero: Bool { timeInterval == 0 }
    /// 表示 0 秒的时间段。
    public static var zero: JobsPeriod { JobsPeriod(0) }
    /// 基于内部秒数进行大小比较。
    public static func < (lhs: JobsPeriod, rhs: JobsPeriod) -> Bool {
        lhs.timeInterval < rhs.timeInterval
    }
    /// 使用给定的秒数初始化 `JobsPeriod`。
    /// 会将负数钳制为 0，确保时间段不为负值。
    public init(_ timeInterval: TimeInterval) {
        self.timeInterval = max(0, timeInterval)
    }
}
// MARK: - JobsPeriod 便利扩展
public extension JobsPeriod {
    /// 常用时间段预定义
    static var millisecond: JobsPeriod { JobsPeriod(0.001) }
    static var second: JobsPeriod { JobsPeriod(1) }
    static var minute: JobsPeriod { JobsPeriod(60) }
    static var hour: JobsPeriod { JobsPeriod(3600) }
    static var day: JobsPeriod { JobsPeriod(86400) }
    
    /// 数学运算支持
    static func + (lhs: JobsPeriod, rhs: JobsPeriod) -> JobsPeriod {
        JobsPeriod(lhs.timeInterval + rhs.timeInterval)
    }
    
    static func - (lhs: JobsPeriod, rhs: JobsPeriod) -> JobsPeriod {
        JobsPeriod(lhs.timeInterval - rhs.timeInterval)
    }
    
    static func * (lhs: JobsPeriod, rhs: Double) -> JobsPeriod {
        JobsPeriod(lhs.timeInterval * rhs)
    }
    
    static func / (lhs: JobsPeriod, rhs: Double) -> JobsPeriod {
        JobsPeriod(lhs.timeInterval / rhs)
    }
}
/// JobsPlan@系列任务计划
/// 定义了任务执行的时间序列，支持一次性、重复、延迟等多种调度策略
public struct JobsPlan: Sequence, Sendable {
    
    public typealias Element = JobsPeriod
    private let builder: @Sendable () -> AnyIterator<JobsPeriod>

    public init(builder: @escaping @Sendable () -> AnyIterator<JobsPeriod>) {
        self.builder = builder
    }
}

extension JobsPlan {
    
    public static func make(_ builder: @escaping @Sendable () -> AnyIterator<JobsPeriod>) -> JobsPlan {
        JobsPlan(builder: builder)
    }

    public static func every(
        _ interval: JobsPeriod,
        initialDelay: JobsPeriod = .zero,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false
    ) -> JobsPlan {
        JobsPlan.make {
            var emitted = 0
            var hasEmittedImmediate = !fireImmediately
            var shouldEmitInitialDelay = !initialDelay.isZero
            return AnyIterator {
                if let repeatCount, emitted >= repeatCount { return nil }
                emitted += 1

                if fireImmediately && !hasEmittedImmediate {
                    hasEmittedImmediate = true
                    return .zero
                }

                if shouldEmitInitialDelay {
                    shouldEmitInitialDelay = false
                    return initialDelay
                }

                return interval
            }
        }
    }
    
    public static func after(_ delay: JobsPeriod) -> JobsPlan {
        JobsPlan.make {
            var fired = false
            return AnyIterator {
                guard !fired else { return nil }
                fired = true
                return delay
            }
        }
    }
    /// 创建在指定日期执行的一次性计划
    /// - Parameter date: 目标执行日期
    /// - Returns: JobsPlan
    public static func at(_ date: Date) -> JobsPlan {
        let interval = Swift.max(0, date.timeIntervalSinceNow)
        return after(JobsPeriod(interval))
    }
    
    /// 创建立即执行的一次性计划
    /// - Returns: JobsPlan
    public static var now: JobsPlan {
        after(.zero)
    }
    
    public func makeIterator() -> AnyIterator<JobsPeriod> {
        builder()
    }

    public func concat(_ other: JobsPlan) -> JobsPlan {
        JobsPlan.make {
            var lhs = self.makeIterator()
            var rhs = other.makeIterator()
            var useRHS = false
            return AnyIterator {
                if !useRHS, let next = lhs.next() { return next }
                useRHS = true
                return rhs.next()
            }
        }
    }

    @discardableResult
    public func `do`(action: @escaping @Sendable () -> Void) -> JobsTask {
        JobsTask(plan: self, queue: .main) { _ in action() }
    }

    @discardableResult
    public func `do`(queue: DispatchQueue, action: @escaping @Sendable () -> Void) -> JobsTask {
        JobsTask(plan: self, queue: queue) { _ in action() }
    }

    @discardableResult
    public func `do`(mode: RunLoop.Mode, action: @escaping @Sendable () -> Void) -> JobsTask {
        JobsTask(plan: self, queue: .main, runLoopMode: mode) { _ in action() }
    }
}
// MARK: - JobsPlan Async Support
extension JobsPlan {
    /// 创建异步执行的任务
    /// - Parameter action: 异步执行的闭包
    /// - Returns: JobsTask
    @discardableResult
    public func doAsync(
        queue: DispatchQueue = .main,
        priority: TaskPriority = .medium,
        action: @escaping @Sendable () async -> Void
    ) -> JobsTask {
        JobsTask(plan: self, queue: queue) { task in
            Task(priority: priority) {
                await action()
            }
        }
    }
    /// 创建异步执行的任务（带任务参数）
    /// - Parameter action: 异步执行的闭包，接收 JobsTask 参数
    /// - Returns: JobsTask
    @discardableResult
    public func doAsync(
        queue: DispatchQueue = .main,
        priority: TaskPriority = .medium,
        action: @escaping @Sendable (JobsTask) async -> Void
    ) -> JobsTask {
        JobsTask(plan: self, queue: queue) { task in
            Task(priority: priority) {
                await action(task)
            }
        }
    }
    /// 创建异步执行的任务（RunLoop 模式）
    /// - Parameters:
    ///   - mode: RunLoop 模式
    ///   - priority: 任务优先级
    ///   - action: 异步执行的闭包
    /// - Returns: JobsTask
    @discardableResult
    public func doAsync(
        mode: RunLoop.Mode,
        priority: TaskPriority = .medium,
        action: @escaping @Sendable () async -> Void
    ) -> JobsTask {
        JobsTask(plan: self, queue: .main, runLoopMode: mode) { task in
            Task(priority: priority) {
                await action()
            }
        }
    }
}
/// 带标签的任务执行
public struct TaggedTaskExecution: Sendable {
    /// 任务标签
    public let tag: String
    /// 执行信息
    public let execution: TaskExecution
}
/// 任务执行信息
public struct TaskExecution: Sendable {
    /// 执行计数
    public let count: Int
    /// 执行时间
    public let date: Date
    /// 当时的生命周期状态
    public let lifecycle: JobsTaskLifecycle
    /// 下次预计执行时间
    public let nextFireDate: Date?
}
/// 任务状态变化
public struct JobsTaskStatusChange: Sendable {
    /// 任务标签
    public let tag: String
    /// 旧状态（nil 表示新添加）
    public let oldStatus: JobsTaskStatus?
    /// 新状态（nil 表示已移除）
    public let newStatus: JobsTaskStatus?
    /// 变化时间
    public let timestamp: Date
    /// 是否为新任务
    public var isNew: Bool { oldStatus == nil && newStatus != nil }
    /// 是否被移除
    public var isRemoved: Bool { newStatus == nil }
    /// 是否为状态转换
    public var isTransition: Bool { oldStatus != nil && newStatus != nil }
}
// MARK: - JobsSwiftTaskCenter@枚举
/// JobsTaskType - 任务类型枚举
/// 定义了不同的任务调度策略
public enum JobsTaskType: Sendable, Equatable {
    case priority    // 优先级队列
    case queue       // FIFO 队列
    case stack       // LIFO 栈
    case timer       // 定时器
    case custom      // 自定义
}
/// JobsTaskStatus - Jobs 系列任务状态枚举
/// 定义了任务在其生命周期中可能处于的各种状态
public enum JobsTaskStatus: Sendable, Equatable {
    case expire      // 过期
    case suspend     // 暂停
    case prepare     // 准备
    case execute     // 执行中
    case ended       // 已结束
    case background  // 后台
    
    /// 是否为活跃状态（执行中或准备中）
    public var isActive: Bool {
        self == .execute || self == .prepare
    }
    
    /// 是否为终止状态（已结束或过期）
    public var isTerminated: Bool {
        self == .ended || self == .expire
    }
    
    /// 是否可以恢复
    public var canResume: Bool {
        self == .suspend || self == .background || self == .prepare
    }
}

public enum JobsTaskLifecycle: Sendable, Equatable {
    case idle
    case running
    case suspended
    case cancelled
    case finished
    
    /// 是否为活跃状态（运行中或暂停）
    public var isActive: Bool {
        self == .running || self == .suspended
    }
    
    /// 是否为终止状态
    public var isTerminated: Bool {
        self == .cancelled || self == .finished
    }
    
    /// 是否可以恢复
    public var canResume: Bool {
        self == .suspended || self == .idle
    }
    
    /// 是否可以暂停
    public var canSuspend: Bool {
        self == .running
    }
}
// MARK: - JobsSwiftTaskCenter@协议
public protocol JobsTaskInfoable {
    var taskID: String { get }
}
#if os(iOS) || os(tvOS)
public protocol TaskForApplicationStatusDelegate: AnyObject {
    func applicationStatusDidChanged(_ state: UIApplication.State)
}
#endif
