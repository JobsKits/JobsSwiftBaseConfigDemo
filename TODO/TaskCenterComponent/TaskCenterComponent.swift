//
//  TaskCenterComponent.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public class TaskCenterComponent {
    private var task: STTask!

    public static func createRunLoopTask(runloop mode: RunLoop.Mode, milliseconds: Int, taskBlock: @escaping () -> Void) -> TaskCenterComponent {
        let taskCenter = TaskCenterComponent()
        taskCenter.task = Plan.every(milliseconds.milliseconds).do(mode: mode, action: {
            taskBlock()
        })
        return taskCenter
    }

    public static func createRunLoppTask(runloop mode: RunLoop.Mode, seconds: Int, taskBlock: @escaping () -> Void) -> TaskCenterComponent {
        return self.createRunLoopTask(runloop: mode, milliseconds: seconds*1000, taskBlock: taskBlock)
    }

    public func appendTask(action: @escaping () -> Void) {
        self.task.addAction { _ in action()}
    }

    public static func createTimerTask(milliseconds: Int, taskBlock: @escaping () -> Void) -> TaskCenterComponent {
        let taskCenter = TaskCenterComponent.init()
        taskCenter.task = Plan.every(milliseconds.milliseconds).do {
            taskBlock()
        }
        return taskCenter
    }

    public static func createTimerTask(seconds: Int, taskBlock: @escaping () -> Void) -> TaskCenterComponent {
        return self.createTimerTask(milliseconds: seconds*1000, taskBlock: taskBlock)
    }

    public static func createTimerTask(milliseconds: Int, queue: DispatchQueue, taskBlock: @escaping () -> Void) -> TaskCenterComponent {
        let taskCenter = TaskCenterComponent.init()
        taskCenter.task = Plan.every(milliseconds.milliseconds).do(queue: queue, action: {
            taskBlock()
        })
        return taskCenter
    }

}
