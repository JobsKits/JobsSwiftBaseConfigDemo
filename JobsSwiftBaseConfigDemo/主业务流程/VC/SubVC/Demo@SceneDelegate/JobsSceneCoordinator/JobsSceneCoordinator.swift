//
//  JobsSceneCoordinator.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

import UIKit

import JobsByUIKit
import JobsSwiftDSL

enum JobsSceneCoordinator {
    static let activityType = "com.jobs.scene-delegate-demo"
    static let didChangeNotification = Notification.Name("JobsSceneCoordinatorDidChangeNotification")
    static let sessionIdentifierUserInfoKey = "sessionIdentifier"

    private static let counterUserInfoKey = "counter"
    private static let sourceSessionIdentifierUserInfoKey = "sourceSessionIdentifier"
    private static var countersBySessionIdentifier: [String: Int] = [:]
    private static var eventsBySessionIdentifier: [String: [String]] = [:]
    private static let timeFormatter: DateFormatter = {
        DateFormatter.make { formatter in
            formatter
                .byLocale(Locale(identifier: "zh_Hans_CN"))
                .byDateFormat("HH:mm:ss.SSS")
        }
    }()

    static func demoActivity(
        counter: Int,
        sourceSession: UISceneSession? = nil
    ) -> NSUserActivity {
        NSUserActivity.make(activityType: activityType) { activity in
            activity
                .byTitle("SceneDelegate 多场景 Demo")
                .byTargetContentIdentifier(activityType)
                .byUserInfo([
                    counterUserInfoKey: counter,
                    sourceSessionIdentifierUserInfoKey: sourceSession?.persistentIdentifier ?? ""
                ])
                .byEligibleForHandoff(false)
                .byEligibleForPrediction(false)
        }
    }

    static func demoActivity(
        from connectionOptions: UIScene.ConnectionOptions,
        session: UISceneSession
    ) -> NSUserActivity? {
        if let activity = connectionOptions.userActivities.first(where: isDemoActivity) {
            return activity
        }
        guard let activity = session.stateRestorationActivity,
              isDemoActivity(activity) else { return nil };return activity
    }

    static func isDemoActivity(_ activity: NSUserActivity) -> Bool {
        return activity.activityType == activityType
    }

    static func restoredCounter(from activity: NSUserActivity?) -> Int {
        guard let activity,
              isDemoActivity(activity) else { return 0 }
        if let counter = activity.userInfo?[counterUserInfoKey] as? Int {
            return counter
        };return (activity.userInfo?[counterUserInfoKey] as? NSNumber)?.intValue ?? 0
    }

    static func counter(for session: UISceneSession, fallback: Int) -> Int {
        return countersBySessionIdentifier[session.persistentIdentifier] ?? fallback
    }

    @discardableResult
    static func updateCounter(_ counter: Int, for scene: UIWindowScene) -> NSUserActivity {
        let identifier = scene.session.persistentIdentifier
        countersBySessionIdentifier[identifier] = counter
        let activity = demoActivity(counter: counter, sourceSession: scene.session)
        scene.userActivity = activity
        postChange(for: scene.session)
        return activity
    }

    static func events(for session: UISceneSession) -> [String] {
        return eventsBySessionIdentifier[session.persistentIdentifier] ?? []
    }

    static func record(_ event: String, for session: UISceneSession) {
        let identifier = session.persistentIdentifier
        let time = timeFormatter.string(from: Date())
        var events = eventsBySessionIdentifier[identifier] ?? []
        events.append("[\(time)] \(event)")
        if events.count > 30 {
            events.removeFirst(events.count - 30)
        }
        eventsBySessionIdentifier[identifier] = events
        postChange(for: session)
    }

    static func discard(_ sessions: Set<UISceneSession>) {
        sessions.forEach {
            countersBySessionIdentifier.removeValue(forKey: $0.persistentIdentifier)
            eventsBySessionIdentifier.removeValue(forKey: $0.persistentIdentifier)
        }
    }

    static func shortIdentifier(for session: UISceneSession) -> String {
        return String(session.persistentIdentifier.prefix(8))
    }

    static func activationStateText(for state: UIScene.ActivationState) -> String {
        switch state {
        /// Scene 位于前台并接收事件
        case .foregroundActive:
            return "前台活跃"
        /// Scene 位于前台但暂不接收事件
        case .foregroundInactive:
            return "前台非活跃"
        /// Scene 已进入后台
        case .background:
            return "后台"
        /// Scene 尚未连接或已断开
        case .unattached:
            return "未连接"
        @unknown default:
            return "未知"
        }
    }

    static func otherOpenSession(excluding session: UISceneSession) -> UISceneSession? {
        return UIApplication.shared.openSessions
            .filter { $0.role == session.role && $0.persistentIdentifier != session.persistentIdentifier }
            .sorted { $0.persistentIdentifier < $1.persistentIdentifier }
            .first
    }

    static func requestNewDemoScene(
        from sourceSession: UISceneSession?,
        completion: @escaping (Error?) -> Void
    ) {
        let activity = demoActivity(counter: 0, sourceSession: sourceSession)
        if #available(iOS 17.0, *) {
            let request = UISceneSessionActivationRequest(
                role: .windowApplication,
                userActivity: activity
            )
            UIApplication.shared.activateSceneSession(for: request, errorHandler: completion)
        } else {
            UIApplication.shared.requestSceneSessionActivation(
                nil,
                userActivity: activity,
                options: nil,
                errorHandler: completion
            )
        }
    }

    static func requestActivation(
        for session: UISceneSession,
        completion: @escaping (Error?) -> Void
    ) {
        if #available(iOS 17.0, *) {
            let request = UISceneSessionActivationRequest(session: session)
            UIApplication.shared.activateSceneSession(for: request, errorHandler: completion)
        } else {
            UIApplication.shared.requestSceneSessionActivation(
                session,
                userActivity: nil,
                options: nil,
                errorHandler: completion
            )
        }
    }

    static func requestDestruction(
        for session: UISceneSession,
        completion: @escaping (Error?) -> Void
    ) {
        UIApplication.shared.requestSceneSessionDestruction(
            session,
            options: nil,
            errorHandler: completion
        )
    }

    private static func postChange(for session: UISceneSession) {
        NotificationCenter.default.post(
            name: didChangeNotification,
            object: nil,
            userInfo: [sessionIdentifierUserInfoKey: session.persistentIdentifier]
        )
    }
}
