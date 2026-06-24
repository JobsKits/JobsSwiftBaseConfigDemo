//
//  JobsMakeLocalNotification.swift
//  JobsLocalNotification
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import UserNotifications
import JobsSwiftTools

public final class JobsMakeLocalNotification: NSObject {
    public func triggerLocalNotification(_ model: JobsLocalNotificationModel) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = model.title
        content.body  = model.body
        #if !os(tvOS)
        content.sound = model.sound
        #endif
        let interval = max(1, model.triggerWithTimeInterval) // 防崩
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval,
                                                        repeats: model.repeats)
        let request = UNNotificationRequest(identifier: model.identifier,
                                            content: content,
                                            trigger: trigger)
        center.add(request) { error in
            if let error {
                JobsLog.log("Error adding notification: \(error)")
            } else {
                JobsLog.log("Notification scheduled.")
            }
        }
    }
}
