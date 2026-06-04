//
//  JobsTaskCenterExtension.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

// MARK: - Int Extension
/// 针对 `Int` 的便捷扩展：以毫秒/秒创建 `JobsPeriod`。
extension Int {
    /// 将毫秒整数转换为 `JobsPeriod`（秒）。例如：`500.milliseconds` -> 0.5 秒。
    public var milliseconds: JobsPeriod { JobsPeriod(Double(self) / 1000.0) }
    /// 将秒整数转换为 `JobsPeriod`。例如：`2.seconds` -> 2 秒。
    public var seconds: JobsPeriod { JobsPeriod(Double(self)) }
}
// MARK: - Double Extension
/// 针对 `Double` 的便捷扩展：以毫秒/秒创建 `JobsPeriod`（支持小数）。
extension Double {
    /// 将毫秒小数转换为 `JobsPeriod`（秒）。例如：`12.5.milliseconds` -> 0.0125 秒。
    public var milliseconds: JobsPeriod { JobsPeriod(self / 1000.0) }
    /// 将秒小数转换为 `JobsPeriod`。例如：`1.25.seconds` -> 1.25 秒。
    public var seconds: JobsPeriod { JobsPeriod(self) }
}
// MARK: - Date 扩展：支持 JobsPeriod 时间计算
/// 针对 `Date` 的便捷扩展：支持用 `JobsPeriod` 进行时间相加。
extension Date {
    /// 在当前日期基础上添加时间段
    /// - Parameter period: 要添加的时间段
    /// - Returns: 新的日期
    public func adding(_ period: JobsPeriod) -> Date {
        addingTimeInterval(period.timeInterval)
    }
    /// 从当前日期减去时间段
    /// - Parameter period: 要减去的时间段
    /// - Returns: 新的日期
    public func subtracting(period: JobsPeriod) -> Date {
        addingTimeInterval(-period.timeInterval)
    }
}
