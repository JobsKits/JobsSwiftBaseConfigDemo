//
//  NSObject+通知.swift
//  JobsByUIKit
//
//  Created by Jobs on 30/1/26.
//

import Foundation
import JobsSwiftBlock
// MARK: - 发通知
extension NSObject {
    /// 1) 只发通知名 ➤ self.post("通知名称")
    @inline(__always)
    public func post(_ name: String) {
        post(name, userInfo: nil)
    }
    /// 2) 发通知 ➤ self.post("通知名称", userInfo: ["id": 1])
    @inline(__always)
    public func post(_ name: String, userInfo: [AnyHashable: Any]? = nil) {
        let notiName = Notification.Name(name)
        let block = {
            NotificationCenter.default.post(
                name: notiName,
                object: nil,
                userInfo: userInfo
            )
        }
        // UI 相关通知建议主线程发
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
    /// 3) 发通知 + 任意 payload（会放到 object 里）➤ self.post("通知名称", payload: scrollView.contentOffset.y)
    @inline(__always)
    public func post(_ name: String, payload: Any? = nil) {
        let notiName = Notification.Name(name)
        let block = {
            NotificationCenter.default.post(
                name: notiName,
                object: payload,
                userInfo: nil
            )
        }

        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
}
/**
 
     self.on("通知名称") { y in
       /// TODO
     }
 */
// MARK: - 接收通知
extension NSObject {
    /// 最常用：只关心 payload（Any?）
    public func on(_ name: String,
                   object: AnyObject? = nil,
                   on queue: OperationQueue? = nil,
                   _ block: @escaping jobsByAnyBlock) {
        let t = NotificationCenter._onBase(
            Notification.Name(name),
            object: object,
            on: queue
        ) { noti in
            block(noti.userInfo?["payload"])
        }
        jobs_store(t)
    }
    /// 强类型：直接拿到 CGFloat / Int / Model 等
    public func on<T>(_ name: String,
                      object: AnyObject? = nil,
                      on queue: OperationQueue? = nil,
                      _ block: @escaping jobsByTypeBlock<T>) {
        let t = NotificationCenter._onBase(
            Notification.Name(name),
            object: object,
            on: queue
        ) { noti in
            block(noti.userInfo?["payload"] as? T)
        }
        jobs_store(t)
    }
    /// 如果想拿完整 Notification
    public func onNotification(_ name: String,
                               object: AnyObject? = nil,
                               on queue: OperationQueue? = nil,
                               _ block: @escaping jobsByNotiBlock) {
        let t = NotificationCenter._onBase(
            Notification.Name(name),
            object: object,
            on: queue,
            handler: block
        )
        jobs_store(t)
    }
}
// MARK: - 移除通知
extension NSObject {
    /// self.removeNotification(self)
    /// self.removeNotification(self, name: "通知名称")
    @inline(__always)
    public func removeNotification(_ observer: Any,
                                   name: String? = nil,
                                   object: Any? = nil) {
        NotificationCenter.default.removeObserver(
            observer,
            name: name.map { Notification.Name($0) },
            object: object
        )
    }
    /// self.removeNotification(self, name: Notification.Name(...))
    @inline(__always)
    public func removeNotification(_ observer: Any,
                                   name: Notification.Name?,
                                   object: Any? = nil) {
        NotificationCenter.default.removeObserver(
            observer,
            name: name,
            object: object
        )
    }
}
