//
//  JobsTaskCenterExtension.swift
//  JobsSwiftTaskCenter
//
//  Created by Jobs on 15/3/26.
//

import Foundation
// MARK: - Int Extension
/// 针对 `Int` 的便捷扩展：以毫秒/秒创建 `JobsPeriod`。
public extension Int {
    /// 将毫秒整数转换为 `JobsPeriod`（秒）。例如：`500.milliseconds` -> 0.5 秒。
    var milliseconds: JobsPeriod { JobsPeriod(Double(self) / 1000.0) }
    /// 将秒整数转换为 `JobsPeriod`。例如：`2.seconds` -> 2 秒。
    var seconds: JobsPeriod { JobsPeriod(Double(self)) }
}
// MARK: - Double Extension
/// 针对 `Double` 的便捷扩展：以毫秒/秒创建 `JobsPeriod`（支持小数）。
public extension Double {
    /// 将毫秒小数转换为 `JobsPeriod`（秒）。例如：`12.5.milliseconds` -> 0.0125 秒。
    var milliseconds: JobsPeriod { JobsPeriod(self / 1000.0) }
    /// 将秒小数转换为 `JobsPeriod`。例如：`1.25.seconds` -> 1.25 秒。
    var seconds: JobsPeriod { JobsPeriod(self) }
}
// MARK: - Date Extension
/// 针对 `Date` 的便捷扩展：支持用 `JobsPeriod` 进行时间相加。
public extension Date {
    /// 返回在当前日期基础上增加指定时间段后的新日期。
    /// 等价于 `addingTimeInterval(period.timeInterval)`。
    func adding(_ period: JobsPeriod) -> Date {
        addingTimeInterval(period.timeInterval)
    }
}
