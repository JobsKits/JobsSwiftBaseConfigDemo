//
//  JobsSPMDemoMacroTests.swift
//  JobsSPMDemoMacroTests
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import Testing
import JobsSPMDemoMacros

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
