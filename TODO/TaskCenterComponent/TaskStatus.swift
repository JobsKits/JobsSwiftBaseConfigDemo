//
//  TaskStatus.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

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
