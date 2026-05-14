//
//  TaskInfo.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

// 任务调度协议，包含任务信息
// public protocol TaskScheduleProtocol {
//    associatedtype TaskInfo
//    typealias ExecuteTask = (TaskInfo)->Void
//    var taskInfo: TaskInfo {get set}
//    init(_ taskInfo: TaskInfo)
//
//    func add(taskExe: ExecuteTask)
//
// }

public protocol TaskInfoable {
    var taskID: String {get}
}
