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
    @objc dynamic var identifier: String = "DemoNotification"
    /// title
    @objc dynamic var title: String = "本地通知".tr
    /// body
    @objc dynamic var body: String = "这是一个示例本地通知".tr
    /// 时间间隔必须 > 0（<=0 会崩）
    @objc dynamic var triggerWithTimeInterval: TimeInterval = 1
    /// repeats
    @objc dynamic var repeats: Bool = false
    /// sound (tvOS unavailable)
    @available(tvOS, unavailable)
    @objc dynamic var sound: UNNotificationSound = .default
}
