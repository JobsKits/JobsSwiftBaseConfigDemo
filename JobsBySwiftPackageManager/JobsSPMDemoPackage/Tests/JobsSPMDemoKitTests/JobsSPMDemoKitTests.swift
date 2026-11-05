//
//  JobsSPMDemoKitTests.swift
//  JobsSPMDemoKitTests
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import Testing
@testable import JobsSPMDemoKit

// 用途：验证 JobsSPMDemoKit 的打包资源能正确解码，以及 Actor 仓库的异步检索结果。
// 运行：在 JobsSPMDemoPackage 目录执行 swift test，由 Package.swift 的 testTarget 发现这些 Swift Testing 用例。
// 边界：只属于 Swift Package 测试；主工程中的引用用于查看，不加入 App 或 XCTest Target。

@Test("资源目录能够被 Bundle.module 解码")
func bundledCatalogLoads() throws {
    let catalog = try JobsSPMDemoCatalog.loadBundled()
    #expect(catalog.features.count >= 5)
}

@Test("Actor 仓库支持异步检索")
func repositorySearchesAsynchronously() async throws {
    let catalog = try JobsSPMDemoCatalog.loadBundled()
    let repository = JobsSPMDemoRepository(catalog: catalog)
    let results = await repository.search("resource")
    #expect(!results.isEmpty)
}
