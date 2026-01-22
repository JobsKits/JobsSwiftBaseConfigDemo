//
//  BaseMain.swift
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
/// ✅ 支持在主线程/主 Actor 执行 async 闭包（可 await）
/// ✅ iOS 13+：Task + @MainActor
/// ✅ iOS 12-：退化为 DispatchQueue.main.async 再启动 Task（仅用于执行 async，不要求并发运行时存在）
@inline(__always)
public func jobsRunOnMain(
    _ block: @MainActor @escaping () async -> Void
) {
#if compiler(>=5.5)
    if #available(iOS 13.0, *) {
        Task { @MainActor in
            await block()
        }
    } else {
        if Thread.isMainThread {
            Task { @MainActor in
                await block()
            }
        } else {
            DispatchQueue.main.async {
                Task { @MainActor in
                    await block()
                }
            }
        }
    }
#else
    // Swift < 5.5 没有 async/await，这个重载不会参与编译
#endif
}
/// ✅ Optional 兼容：允许 `[weak self]` 场景直接传 self?
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) async -> Void
) {
    guard let object else { return }
    jobsRunOnMain(object, block)
}

/// ✅ 避免直接捕获 self：传入 object 参数并在 MainActor 上执行 async 闭包
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) async -> Void
) {
#if compiler(>=5.5)
    if #available(iOS 13.0, *) {
        Task { @MainActor [weak object] in
            guard let object else { return }
            await block(object)
        }
    } else {
        if Thread.isMainThread {
            Task { @MainActor [weak object] in
                guard let object else { return }
                await block(object)
            }
        } else {
            DispatchQueue.main.async { [weak object] in
                guard let object else { return }
                Task { @MainActor in
                    await block(object)
                }
            }
        }
    }
#else
    // Swift < 5.5 不支持 async/await
#endif
}
/// ✅ 在 iOS 13 以下（无并发运行时）/ 或者需要同步路径时：
/// ✅ 让 `@MainActor` 闭包在“已处于主线程”的前提下安全执行
/// ✅ Swift 5.9+ 用 `MainActor.assumeIsolated` 做类型层面的 MainActor 假定
/// ✅ Swift 5.5~5.8 没有同等 API，只能依赖调用点保证已在主线程（否则逻辑不成立）
@inline(__always)
private func _jobsAssumeMainActor(_ block: @MainActor () -> Void) {
#if compiler(>=5.9)
    // Swift 5.9+：显式假定当前就是 MainActor 隔离上下文
    MainActor.assumeIsolated {
        block()
    }
#else
    // Swift 5.5~5.8：缺少 assumeIsolated，只能在“已在主线程”的前提下直接执行
    // 注意：这里必须由上层保证 Thread.isMainThread == true
    block()
#endif
}
/// ✅ 对外唯一入口：把传入的 UI 闭包保证切到 MainActor（或主线程）执行
/// ✅ iOS 13+：使用 Task + @MainActor，满足严格并发检查
/// ✅ iOS 12-：退化到主线程调度；在主线程上通过 `_jobsAssumeMainActor` 执行 `@MainActor` 闭包
@inline(__always)
public func jobsRunOnMain(
    _ block: @MainActor @escaping () -> Void
) {
#if compiler(>=5.5)
    if #available(iOS 13.0, *) {
        Task { @MainActor in
            block()
        }
    } else {
        if Thread.isMainThread {
            _jobsAssumeMainActor(block)
        } else {
            DispatchQueue.main.async {
                _jobsAssumeMainActor(block)
            }
        }
    }
#else
    // Swift < 5.5：没有并发模型，直接按主线程/异步切回主线程处理
    if Thread.isMainThread { block() }
    else { DispatchQueue.main.async { block() } }
#endif
}
/// ✅ Optional 兼容：允许在 `[weak self]` 场景里直接 `jobsRunOnMain(self) { ... }`
/// ✅ 传入对象为 nil 则直接 return，避免每处都写 guard let self
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object?,
    _ block: @MainActor @escaping (Object) -> Void
) {
    guard let object else { return }
    jobsRunOnMain(object, block)
}

/// ✅ 避免在 Task 闭包里直接捕获 self：通过参数传递对象，从源头减少并发捕获相关告警
/// ✅ iOS 13+：Task { @MainActor [weak object] in ... }，确保 UI 操作在 MainActor
/// ✅ iOS 12-：回退到主线程调度；并在主线程用 `_jobsAssumeMainActor` 执行 `@MainActor` 闭包
@inline(__always)
public func jobsRunOnMain<Object: AnyObject>(
    _ object: Object,
    _ block: @MainActor @escaping (Object) -> Void
) {
#if compiler(>=5.5)
    if #available(iOS 13.0, *) {
        Task { @MainActor [weak object] in
            guard let object else { return }
            block(object)
        }
    } else {
        if Thread.isMainThread {
            _jobsAssumeMainActor { block(object) }
        } else {
            DispatchQueue.main.async { [weak object] in
                guard let object else { return }
                _jobsAssumeMainActor { block(object) }
            }
        }
    }
#else
    if Thread.isMainThread { block(object) }
    else {
        DispatchQueue.main.async { [weak object] in
            guard let object else { return }
            block(object)
        }
    }
#endif
}
// MARK: - 主线程 ➤ 在并发世界里（async/await）并且想要 MainActor 语义（避免 actor 隔离警告、配合 @MainActor API）
@inline(__always)
public func onMain(_ block: @escaping () -> Void) {
    jobsRunOnMain(block)
}
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
