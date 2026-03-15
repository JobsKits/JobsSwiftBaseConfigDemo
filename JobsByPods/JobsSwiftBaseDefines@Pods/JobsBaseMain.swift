//
//  JobsBaseMain.swift
//  Pods
//
//  Created by Jobs on 18/1/25
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
// MARK: - Run on Main (async)  iOS/tvOS 13+ / macOS 10.15+
#if compiler(>=5.5)
/// ✅ 支持在 MainActor 上执行 async 闭包（可 await）
///
/// 说明：
/// - Swift Concurrency / Task / MainActor 在 iOS/tvOS 13+、macOS 10.15+ 才可用
/// - 因此 async 版本仅在这些系统版本可用；更低系统请使用下方同步版本（或改 completion 形式）
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@inline(__always)
public func jobsRunOnMain(
    _ block: @MainActor @escaping () async -> Void) {
    Task { @MainActor in
        await block()
    }
}
/// ✅ Optional 兼容：允许 `[weak self]` 场景直接传 self?
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) async -> Void) {
    guard let object else { return }
    Task { @MainActor [weak object] in
        guard let object else { return }
        await block(object)
    }
}
/// ✅ 避免直接捕获 self：传入 object 参数并在 MainActor 上执行 async 闭包
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) async -> Void) {
    Task { @MainActor [weak object] in
        guard let object else { return }
        await block(object)
    }
}
// MARK: - Run on Main (Task returning)
/// ✅ 在 MainActor 上启动一个 async Task，并返回 Task 以便 cancel / 生命周期管理
///
/// 说明：
/// - 这是对 `jobsRunOnMain(_ block: @MainActor @escaping () async -> Void)` 的补充
/// - 适用于需要持有 Task、后续 cancel 的场景，例如 AsyncSequence 观察任务
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsRunOnMainTask(
    _ block: @MainActor @escaping () async -> Void) -> Task<Void, Never> {
    Task { @MainActor in
        await block()
    }
}
/// ✅ Optional 兼容：允许 `[weak self]` 场景直接传 self?
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsRunOnMainTask<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) async -> Void
) -> Task<Void, Never>? {
    guard let object else { return nil }
    return Task { @MainActor [weak object] in
        guard let object else { return }
        await block(object)
    }
}
/// ✅ 避免直接捕获 self：传入 object 参数并在 MainActor 上执行 async Task
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsRunOnMainTask<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) async -> Void
) -> Task<Void, Never> {
    Task { @MainActor [weak object] in
        guard let object else { return }
        await block(object)
    }
}
/// ✅ 直接在 MainActor 上观察 AsyncSequence，并返回 Task 以便 cancel
///
/// 示例：
/// ```swift
/// observerTask = jobsObserveOnMain(manager.statusChanges()) { change in
///     self.handle(change)
/// }
/// ```
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsObserveOnMain<S: AsyncSequence>(
    _ sequence: S,
    _ handler: @MainActor @escaping (S.Element) -> Void
) -> Task<Void, Never> {
    jobsRunOnMainTask {
        do {
            for try await value in sequence {
                handler(value)
            }
        } catch {
            // 保持 Never 失败语义：吞掉来自 throwing sequence 的错误
        }
    }
}
/// ✅ Optional object 版本：避免在 handler 内直接强捕获 self
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsObserveOnMain<Object: AnyObject, S: AsyncSequence>(
    _ object: Object?,
    sequence: S,
    _ handler: @MainActor @escaping (Object, S.Element) -> Void
) -> Task<Void, Never>? {
    guard let object else { return nil }
    return Task { @MainActor [weak object] in
        guard let object else { return }

        do {
            for try await value in sequence {
                handler(object, value)
            }
        } catch {
            // 保持 Never 失败语义：吞掉来自 throwing sequence 的错误
        }
    }
}
/// ✅ object 版本：在 MainActor 上观察 AsyncSequence，并把 object 作为参数传入
@available(iOS 13.0, tvOS 13.0, macOS 10.15, *)
@discardableResult
@inline(__always)
public func jobsObserveOnMain<Object: AnyObject, S: AsyncSequence>(
    _ object: Object,
    sequence: S,
    _ handler: @MainActor @escaping (Object, S.Element) -> Void
) -> Task<Void, Never> {
    Task { @MainActor [weak object] in
        guard let object else { return }
        do {
            for try await value in sequence {
                handler(object, value)
            }
        } catch {
            // 保持 Never 失败语义：吞掉来自 throwing sequence 的错误
        }
    }
}
#else
// Swift < 5.5 没有 async/await，这些重载不会参与编译
#endif
// MARK: - Run on Main (sync)  all OS
#if compiler(>=5.5)
/// ✅ 同步入口（重点）：闭包是 @MainActor
/// 这样你在里面调用任何 main actor-isolated API 都不会报错。
///
/// - iOS/tvOS 13+、macOS 10.15+：Task hop 到 MainActor
/// - 更低系统：GCD 切主线程，并把 GCD closure 标注为 @MainActor（不使用 Task）
@inline(__always)
public func jobsRunOnMain(
    _ block: @MainActor @escaping () -> Void) {
    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        Task { @MainActor in
            block()
        }
    } else {
        // iOS 12-：不能出现 Task；只保证主线程 + 在标注 @MainActor 的闭包里执行
        DispatchQueue.main.async { @MainActor in
            block()
        }
    }
}
/// ✅ Optional 兼容：允许在 `[weak self]` 场景里直接 `jobsRunOnMain(self) { ... }`
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) -> Void) {
    guard let object else { return }

    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        Task { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    } else {
        DispatchQueue.main.async { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    }
}
/// ✅ 避免直接捕获 self：通过参数传递 object
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) -> Void) {
    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        Task { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    } else {
        DispatchQueue.main.async { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    }
}
/// ✅ 在 MainActor 上启动一个同步 Task，并返回 Task 以便 cancel / 生命周期管理
///
/// 说明：
/// - 适用于想统一使用 MainActor 调度，同时需要拿到 Task 句柄的场景
/// - 例如：启动一个长期观察任务、延后 UI 行为、集中 cancel
@discardableResult
@inline(__always)
public func jobsRunOnMainTask(
    _ block: @MainActor @escaping () -> Void) -> Task<Void, Never>? {
    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        return Task { @MainActor in
            block()
        }
    } else {
        DispatchQueue.main.async { @MainActor in
            block()
        };return nil
    }
}
/// ✅ Optional 兼容：允许在 `[weak self]` 场景里直接拿到 Task?
@discardableResult
@inline(__always)
public func jobsRunOnMainTask<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) -> Void
) -> Task<Void, Never>? {
    guard let object else { return nil }
    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        return Task { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    } else {
        DispatchQueue.main.async { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        };return nil
    }
}
/// ✅ 避免直接捕获 self：通过参数传递 object，并返回 Task
@discardableResult
@inline(__always)
public func jobsRunOnMainTask<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) -> Void
) -> Task<Void, Never>? {
    if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
        return Task { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    } else {
        DispatchQueue.main.async { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        };return nil
    }
}
#else
/// Swift < 5.5：没有 MainActor 语义，只能保证主线程
@inline(__always)
public func jobsRunOnMain(_ block: @escaping () -> Void) {
    Thread.isMainThread ? block() : DispatchQueue.main.async(execute: block)
}

@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object?,
    _ block: @escaping (Object) -> Void) {
    guard let object else { return }
    jobsRunOnMain(object, block)
}

@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object,
    _ block: @escaping (Object) -> Void) {
    if Thread.isMainThread {
        block(object)
    } else {
        DispatchQueue.main.async { [weak object] in
            guard let object else { return }
            block(object)
        }
    }
}
#endif
// MARK: - 主线程快捷入口
#if compiler(>=5.5)
@inline(__always)
public func onMain(_ block: @MainActor @escaping () -> Void) {
    jobsRunOnMain(block)
}
#else
@inline(__always)
public func onMain(_ block: @escaping () -> Void) {
    jobsRunOnMain(block)
}
#endif
/**
 优点：
 在主线程时是“立即执行”（无额外排队）
 运行开销很小
 在非 async 环境里最稳、最直观

 缺点：
 只保证“主线程”，不保证 MainActor 语义（一般 UI 足够了）
 */
@inline(__always)
/// UI 更新 / 必须在主线程立即执行（而且希望“已经在主线程就立刻跑”）
public func byMain(_ block: @escaping jobsByVoidBlock) {
    Thread.isMainThread ? block() : DispatchQueue.main.async(execute: block)
}
// MARK: - 同步取值（不支持抛错）
@inline(__always)
@discardableResult
public func onMainSync<T>(_ work: () -> T) -> T {
    if Thread.isMainThread { return work() }
    return DispatchQueue.main.sync(execute: work)
}
// MARK: - 同步取值（支持抛错）
@inline(__always)
public func onMainSync<T>(_ work: () throws -> T) rethrows -> T {
    if Thread.isMainThread { return try work() }
    return try DispatchQueue.main.sync(execute: work)
}
