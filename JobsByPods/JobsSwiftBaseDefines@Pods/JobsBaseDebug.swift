//
//  JobsBaseDebug.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/1/25.
//
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBlock
import JobsSwiftBaseDefines
// MARK: - DEBUG 模式下才允许做的事
/// ✅ Debug 才执行：并保证在 MainActor/主线程运行（复用 jobsRunOnMain）
@inline(__always)
public func debugOnly(_ work: @MainActor @escaping () -> Void) {
#if DEBUG
    jobsRunOnMain(work)
#endif
}
/// ✅ Debug 才执行：支持 async/await，并保证在 MainActor/主线程运行
@inline(__always)
public func debugOnly(_ work: @MainActor @escaping () async -> Void) {
#if DEBUG
    jobsRunOnMain(work)
#endif
}
/// ✅ Debug 才执行：避免直接捕获 self（object 可能为 nil 直接跳过）
@inline(__always)
public func debugOnly<Object: AnyObject>(
    _ object: Object?,
    _ work: @MainActor @escaping (Object) -> Void
) {
#if DEBUG
    jobsRunOnMain(object, work)
#endif
}
/// ✅ Debug 才执行：async 版本
@inline(__always)
public func debugOnly<Object: AnyObject>(
    _ object: Object?,
    _ work: @MainActor @escaping (Object) async -> Void
) {
#if DEBUG
    jobsRunOnMain(object, work)
#endif
}
// MARK: - 私有：蓝色占位图（1x1）
// 统一的纯色占位（1×1）；需要更大就改 size
public func jobsSolidBlue(
    color: UIColor = .systemBlue,
    size: CGSize = .init(width: 1, height: 1),
    scale: CGFloat = 0
) -> UIImage {
    let fmt = UIGraphicsImageRendererFormat.default(); fmt.scale = scale
    return UIGraphicsImageRenderer(size: size, format: fmt).image { ctx in
        color.setFill()
        ctx.fill(CGRect(origin: .zero, size: size))
    }
}
