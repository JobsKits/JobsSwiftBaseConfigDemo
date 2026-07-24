//
//  JobsSPMDemoKitTests.swift
//  JobsSPMDemoKitTests
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import Testing
@testable import JobsSPMDemoKit

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
