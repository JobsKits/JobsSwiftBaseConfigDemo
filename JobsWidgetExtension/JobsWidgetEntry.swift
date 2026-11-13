//
//  JobsWidgetEntry.swift
//  JobsWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import WidgetKit

struct JobsWidgetEntry: TimelineEntry {
    let date: Date
    let counter: Int
    let updatedAt: Date
    let languageCode: String
    let localizedStrings: [String: String]

    func text(_ key: String) -> String {
        return localizedStrings[key] ?? key
    }
}
