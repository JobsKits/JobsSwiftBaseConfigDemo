//
//  TaskStatus.swift
//  TaskCenterComponent
//
//  Created by ken on 2019/4/11.
//

import UIKit

/// 任务状态
///
/// - expire: 过期
/// - suspend: 暂停
/// - prepare: 预备，将要执行
/// - excute: 执行中
/// - ended: 结束
public enum TaskStatus {

    case expire
    case suspend
    case prepare
    case excute
    case ended
    case background
}
