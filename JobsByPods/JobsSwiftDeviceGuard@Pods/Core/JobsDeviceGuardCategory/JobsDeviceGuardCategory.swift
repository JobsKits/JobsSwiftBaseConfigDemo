//
//  JobsDeviceGuardCategory.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation

/// 同类路径命中多次仍只算一类证据。
public enum JobsDeviceGuardCategory: String,
                                     CaseIterable,
                                     Sendable {

    case fileSystem
    case runtime
    case sandbox
}
