//
//  JobsSPMDemoMacroTests.swift
//  JobsSPMDemoMacroTests
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import Testing
import JobsSPMDemoMacros

// 用途：验证 @EquatableBy 宏生成的相等判断和哈希只使用指定字段。
// 运行：在 MacroDemo 目录执行 swift test，由其独立 Package.swift 的 testTarget 执行。
// 边界：依赖编译期宏工具链，不属于主 App 或主工程 XCTest Target，Xcode 分组仅提供查看入口。

@EquatableBy("id")
private struct TestUser {
    let id: Int
    let name: String
}

@Test("宏生成的相等与哈希只使用指定字段")
func macroUsesSelectedProperty() {
    let lhs = TestUser(id: 7, name: "Jobs")
    let rhs = TestUser(id: 7, name: "Codex")
    #expect(lhs == rhs)
    #expect(Set([lhs, rhs]).count == 1)
}
