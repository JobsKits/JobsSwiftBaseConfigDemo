//
//  JobsHomeWidget.swift
//  JobsWidgetExtension
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import SwiftUI
import WidgetKit

struct JobsHomeWidget: Widget {
    let kind = JobsWidgetSharedStore.widgetKind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: JobsWidgetTimelineProvider()) { entry in
            JobsHomeWidgetView(entry: entry)
        }
        .configurationDisplayName("演武堂小组件")
        .description("在手机桌面查看当前时间和 Demo 进度。")
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge
        ])
    }
}
