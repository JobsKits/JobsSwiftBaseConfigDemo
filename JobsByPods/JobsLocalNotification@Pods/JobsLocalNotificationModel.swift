//
//  JobsLocalNotificationModel.swift
//  JobsLocalNotification
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import UserNotifications
import JobsByUIKit

public final class JobsLocalNotificationModel: NSObject {
    /// identifier
    @objc public dynamic var identifier: String = "DemoNotification"
    /// title
    @objc public dynamic var title: String = "本地通知".tr
    /// body
    @objc public dynamic var body: String = "这是一个示例本地通知".tr
    /// 有限正数；重复通知至少 60 秒，提交入口返回参数错误。
    @objc public dynamic var triggerWithTimeInterval: TimeInterval = 1
    /// repeats
    @objc public dynamic var repeats: Bool = false
    /// sound (tvOS unavailable)
    @available(tvOS, unavailable)
    @objc public dynamic var sound: UNNotificationSound = .default

    @discardableResult
    public func byIdentifier(_ value: String) -> Self {
        identifier = value
        return self
    }

    @discardableResult
    public func byTitle(_ value: String) -> Self {
        title = value
        return self
    }

    @discardableResult
    public func byBody(_ value: String) -> Self {
        body = value
        return self
    }

    @discardableResult
    public func byTriggerWithTimeInterval(_ value: TimeInterval) -> Self {
        triggerWithTimeInterval = value
        return self
    }

    @discardableResult
    public func byRepeats(_ value: Bool) -> Self {
        repeats = value
        return self
    }

    @available(tvOS, unavailable)
    @discardableResult
    public func bySound(_ value: UNNotificationSound) -> Self {
        sound = value
        return self
    }
}
