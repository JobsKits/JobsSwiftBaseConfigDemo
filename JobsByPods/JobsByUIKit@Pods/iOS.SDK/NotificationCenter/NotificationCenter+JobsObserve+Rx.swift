//
//  NotificationCenter+JobsObserve+Rx.swift
//  Pods
//
//  Created by Jobs on 24/1/26.
//

import Foundation
import ObjectiveC
import JobsSwiftBlock
#if canImport(RxSwift) && canImport(RxCocoa)
import RxSwift
import RxCocoa
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

private final class JobsRxNotificationToken: JobsNotificationToken {
    private var disposable: Disposable?
    init(_ disposable: Disposable) { self.disposable = disposable }
    func cancel() { disposable?.dispose(); disposable = nil }
    deinit { cancel() }
}

internal extension NotificationCenter {
    func jobs_observe_rx(
        _ name: Notification.Name,
        object: AnyObject? = nil,
        handler: @escaping jobsByNotiBlock
    ) -> JobsNotificationToken {
        JobsRxNotificationToken(
            self.rx
                .notification(name, object: object)
                .subscribe(onNext: { handler($0) })
        )
    }
}
#endif
// MARK: - 内部 token 容器（挂到 owner 上）
public final class JobsNotiTokenBag: NSObject {
    var tokens: [JobsNotificationToken] = []
    deinit { tokens.forEach { $0.cancel() } }
}

private var jobsNotiBagKey: UInt8 = 0
extension NSObject {
   public var jobs_notiBag: JobsNotiTokenBag {
        if let bag = objc_getAssociatedObject(self, &jobsNotiBagKey) as? JobsNotiTokenBag {
            return bag
        }
        let bag = JobsNotiTokenBag()
        objc_setAssociatedObject(self, &jobsNotiBagKey, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return bag
    }

    public func jobs_store(_ token: JobsNotificationToken) {
        jobs_notiBag.tokens.append(token)
    }
}
// MARK: - NSObject DSL
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
