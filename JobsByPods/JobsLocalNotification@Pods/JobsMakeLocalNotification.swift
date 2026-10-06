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
    /// 兼容原来的日志式调用；需要处理结果时使用 completion 重载。
    public func triggerLocalNotification(_ model: JobsLocalNotificationModel) {
        triggerLocalNotification(model) { result in
            switch result {
            case .success:
                JobsLog.log("Notification scheduled.")
            case .failure(let error):
                JobsLog.log("Error adding notification: \(error)")
            }
        }
    }

    /// 调用时快照模型；模型配置与提交应在同一执行上下文完成。
    public func triggerLocalNotification(
        _ model: JobsLocalNotificationModel,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        let identifier = model.identifier
        let interval = model.triggerWithTimeInterval
        let repeats = model.repeats
        guard !identifier.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            deliver(.failure(JobsLocalNotificationError.emptyIdentifier), completion: completion)
            return
        }
        guard interval.isFinite, interval > 0, !repeats || interval >= 60 else {
            deliver(.failure(JobsLocalNotificationError.invalidInterval), completion: completion)
            return
        }
        let content = UNMutableNotificationContent()
        content.title = model.title
        content.body = model.body
        #if !os(tvOS)
        content.sound = model.sound
        #endif
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: repeats)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }

    private func deliver(_ result: Result<Void, Error>, completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
