//
//  NotificationCenter+JobsObserve.swift
//  Pods
//
//  Created by Jobs on 24/1/26.
//

import Foundation
import JobsSwiftBlock
/**
     NotificationCenter.on("通知名") { noti in
         /// TODO
     }
 */
// MARK: - JobsNotificationToken
public protocol JobsNotificationToken {
    func cancel()
}

public final class JobsAnyNotificationToken: JobsNotificationToken {
    private var _cancel: jobsByVoidBlock?
    public init(_ cancel: @escaping jobsByVoidBlock) { self._cancel = cancel }
    public func cancel() { _cancel?(); _cancel = nil }
    deinit { cancel() }
}
// MARK: - NotificationCenter + Jobs
public extension NotificationCenter {
    /// ✅ 业务层直接 NotificationCenter.on(...)，不再写 .default
    @discardableResult
    static func on(
        _ name: Notification.Name,
        object: AnyObject? = nil,
        on queue: OperationQueue? = nil,
        handler: @escaping jobsByNotiBlock
    ) -> JobsNotificationToken {
        // 优先 Rx（如果存在且启用）
        #if canImport(RxSwift) && canImport(RxCocoa)
        return NotificationCenter.default.jobs_observe_rx(name,
                                                          object: object,
                                                          handler: handler)
        #else
        // fallback：系统 block observer（不需要 selector）
        return JobsAnyNotificationToken {
            NotificationCenter.default.removeObserver(
                NotificationCenter.default.addObserver(
                    forName: name,
                    object: object,
                    queue: queue,
                    using: handler
                )
            )
        }
        #endif
    }
    /// Swift API 统一用 Notification（值类型 struct 包装，但桥接到 NSNotification）
    @discardableResult
    static func on(
        _ rawName: String,
        object: AnyObject? = nil,
        on queue: OperationQueue? = nil,
        handler: @escaping jobsByNotiBlock
    ) -> JobsNotificationToken {
        on(Notification.Name(rawName),
           object: object,
           on: queue,
           handler: handler)
    }
}
