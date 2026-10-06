//
//  ByUIKitFixture.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

@_exported import Foundation
@_exported import JobsSwiftBlock

/// 只满足 SafeCodable 的 ISO 工厂依赖；不验证生产 DSL / UIKit 工厂。
extension ISO8601DateFormatter {
    public static func jobsMake(_ configure: (ISO8601DateFormatter) -> Void) -> ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        configure(formatter)
        return formatter
    }
}
