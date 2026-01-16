//
//  TaskInfo.swift
//  TaskCenterComponent
//
//  Created by ken on 2019/4/11.
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
