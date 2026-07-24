//
//  JobsWidgetTimelineProvider.swift
//  JobsWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import WidgetKit

struct JobsWidgetTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> JobsWidgetEntry {
        JobsWidgetEntry(
            date: Date(),
            counter: JobsWidgetSharedStore.defaultCounter,
            updatedAt: Date()
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (JobsWidgetEntry) -> Void) {
        completion(currentEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<JobsWidgetEntry>) -> Void) {
        let entry = currentEntry()
        let nextRefreshDate = Calendar.current.date(
            byAdding: .minute,
            value: 15,
            to: entry.date
        ) ?? entry.date.addingTimeInterval(15 * 60)
        completion(Timeline(entries: [entry], policy: .after(nextRefreshDate)))
    }

    private func currentEntry() -> JobsWidgetEntry {
        JobsWidgetEntry(
            date: Date(),
            counter: JobsWidgetSharedStore.counter,
            updatedAt: JobsWidgetSharedStore.updatedAt
        )
    }
}
