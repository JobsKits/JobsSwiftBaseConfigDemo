//
//  ByUIKitFixture.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

@_exported import Foundation
@_exported import JobsSwiftBlock

/// 为 SafeCodable 的 macOS 回归补齐 ISO8601DateFormatter 工厂，并再导出 Foundation 与真实 JobsSwiftBlock。
/// 由上级目录 run_regressions.rb 编译为测试用 JobsByUIKit 模块，使 Foundation 用例无需链接 UIKit。
/// 这是依赖替身，不验证生产 JobsByUIKit / DSL 工厂；不得加入主 App 或替代真实模块。
extension ISO8601DateFormatter {
    public static func jobsMake(_ configure: (ISO8601DateFormatter) -> Void) -> ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        configure(formatter)
        return formatter
    }
}
