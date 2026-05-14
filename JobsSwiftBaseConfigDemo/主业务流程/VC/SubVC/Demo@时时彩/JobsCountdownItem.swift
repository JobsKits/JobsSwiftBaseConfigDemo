//
//  JobsCountdownItem.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
// MARK: - Model
public struct JobsCountdownItem: Hashable, Sendable {
    public let id: String
    public let title: String
    public let endAt: Date
    public let tickInterval: TimeInterval
    /// 每条数据一个唯一 timer id（同屏多 timer 并行不会串）
    public var timerIdentifier: String { "com.jobs.demo.countdown.\(id)" }
    public init(id: String,
                title: String,
                endAt: Date,
                tickInterval: TimeInterval = 1) {
        self.id = id
        self.title = title
        self.endAt = endAt
        self.tickInterval = tickInterval
    }
    public func remainSeconds(now: Date = .init()) -> Int {
        max(0, Int(endAt.timeIntervalSince(now)))
    }
}
