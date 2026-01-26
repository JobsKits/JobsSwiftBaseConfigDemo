//
//  NotificationCenter+DSL.swift
//  Pods
//
//  Created by Jobs on 26/1/26.
//

import Foundation
import JobsSwiftBlock
// MARK: - 发通知
/**
 
     NotificationCenter.post("通知名称")
     NotificationCenter.post("通知名称", userInfo: ["id": 1])
     NotificationCenter.post("通知名称", payload: scrollView.contentOffset.y)
 */
extension NotificationCenter {

    public static func post(_ name: String,
                            userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(
            name: Notification.Name(name),
            object: nil,
            userInfo: userInfo
        )
    }
    /// 允许直接传任意 payload（比如 CGFloat / CGPoint / 自定义 struct）
    public static func post(_ name: String,
                            payload: Any?) {
        var info: [AnyHashable: Any]? = nil
        if let payload { info = ["payload": payload] }
        NotificationCenter.default.post(
            name: Notification.Name(name),
            object: nil,
            userInfo: info
        )
    }
}
// MARK: - 接收通知
/**
 
     self.on("通知名称") { y in
       /// TODO
     }
 */
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
// MARK: - 移除通知
/**
 
     NotificationCenter.remove(self)
     NotificationCenter.remove(self, name: "通知名称")
 */
extension NotificationCenter {

    public static func remove(_ observer: Any,
                              name: String? = nil,
                              object: Any? = nil) {
        NotificationCenter.default.removeObserver(
            observer,
            name: name.map { Notification.Name($0) },
            object: object
        )
    }

    public static func remove(_ observer: Any,
                              name: Notification.Name?,
                              object: Any? = nil) {
        NotificationCenter.default.removeObserver(
            observer,
            name: name,
            object: object
        )
    }
}
