//
//  NotificationCenter+JobsObserve+Rx.swift
//  Pods
//
//  Created by Jobs on 24/1/26.
//

import Foundation
#if canImport(RxSwift) && canImport(RxCocoa)
import RxSwift
import RxCocoa
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
        handler: @escaping (Notification) -> Void
    ) -> JobsNotificationToken {
        JobsRxNotificationToken(
            self.rx
                .notification(name, object: object)
                .subscribe(onNext: { handler($0) })
        )
    }
}
#endif
