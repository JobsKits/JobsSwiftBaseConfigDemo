//
//  JobsWidgetSharedStore.swift
//  JobsWidgetShared
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation

enum JobsWidgetSharedStore {
    static let appGroupIdentifier = "group.com.jobs.JobsSwiftBaseConfigDemo"
    static let widgetKind = "JobsHomeScreenWidget"
    static let defaultCounter = 8

    private static let counterKey = "jobs.widget.counter"
    private static let updatedAtKey = "jobs.widget.updatedAt"
    private static let localizationKey = "jobs.widget.localization"

    static let localizationKeys = [
        "演武堂 · 小组件",
        "今日进度 %d / 12",
        "宿主 Demo 更新后，桌面时间线会同步刷新。",
        "长按桌面可编辑或移除小组件",
        "最近同步 %@",
        "在手机桌面查看当前时间和 Demo 进度。"
    ]

    private static var defaults: UserDefaults {
        UserDefaults(suiteName: appGroupIdentifier) ?? .standard
    }

    static var counter: Int {
        let value = defaults.integer(forKey: counterKey)
        return value > 0 ? value : defaultCounter
    }

    static var updatedAt: Date {
        defaults.object(forKey: updatedAtKey) as? Date ?? Date()
    }

    static func save(counter: Int, updatedAt: Date = Date()) {
        defaults.set(counter, forKey: counterKey)
        defaults.set(updatedAt, forKey: updatedAtKey)
    }

    static var localization: (languageCode: String, strings: [String: String]) {
        let payload = defaults.dictionary(forKey: localizationKey) ?? [:]
        return (payload["languageCode"] as? String ?? Locale.preferredLanguages.first ?? "en",
                payload["strings"] as? [String: String] ?? [:])
    }

    static func saveLocalization(languageCode: String, strings: [String: String]) {
        defaults.set(["languageCode": languageCode, "strings": strings], forKey: localizationKey)
    }

    static func localizedText(_ key: String) -> String {
        return localization.strings[key] ?? key
    }
}
