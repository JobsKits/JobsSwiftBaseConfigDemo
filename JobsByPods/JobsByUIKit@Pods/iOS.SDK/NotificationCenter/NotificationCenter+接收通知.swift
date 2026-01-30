//
//  NotificationCenter+接收通知.swift
//  Pods
//
//  Created by Jobs on 26/1/26.
//

import Foundation
import JobsSwiftBlock
// MARK: - 接收通知
extension NotificationCenter {
    /// 接收通知（内部基础实现）
    @discardableResult
    public static func _onBase(
        _ name: Notification.Name,
        object: AnyObject? = nil,
        on queue: OperationQueue? = nil,
        handler: @escaping jobsByNotiBlock
    ) -> JobsNotificationToken {
        #if canImport(RxSwift) && canImport(RxCocoa)
        return NotificationCenter.default.jobs_observe_rx(
            name,
            object: object,
            handler: handler
        )
        #else
        let token = NotificationCenter.default.addObserver(
            forName: name,
            object: object,
            queue: queue,
            using: handler
        )
        return JobsAnyNotificationToken {
            NotificationCenter.default.removeObserver(token)
        }
        #endif
    }
    /// 接收通知（owner 版）
    public static func on(
        _ rawName: String,
        owner: NSObject,
        object: AnyObject? = nil,
        on queue: OperationQueue? = nil,
        handler: @escaping jobsByNotiBlock
    ) {
        let t = _onBase(
            Notification.Name(rawName),
            object: object,
            on: queue,
            handler: handler
        )
        owner.jobs_store(t)
    }
    /// Notification.Name 版本
    public static func on(
        _ name: Notification.Name,
        owner: NSObject,
        object: AnyObject? = nil,
        on queue: OperationQueue? = nil,
        handler: @escaping jobsByNotiBlock
    ) {
        let t = _onBase(
            name,
            object: object,
            on: queue,
            handler: handler
        )
        owner.jobs_store(t)
    }
}
