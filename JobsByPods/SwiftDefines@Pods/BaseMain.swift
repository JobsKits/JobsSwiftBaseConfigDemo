//
//  BaseMain.swift
//  Pods
//
//  Created by Jobs on 18/1/2569 BE.
//
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
// MARK: - 主线程 ➤ 在并发世界里（async/await）并且想要 MainActor 语义（避免 actor 隔离警告、配合 @MainActor API）
@inline(__always)
public func onMain(_ block: @escaping JobsByMAVoidBlock) {
    Task { @MainActor in
        block()
    }
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
