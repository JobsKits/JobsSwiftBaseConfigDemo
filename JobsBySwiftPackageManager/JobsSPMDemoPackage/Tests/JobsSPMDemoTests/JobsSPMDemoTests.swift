import Testing

@testable import JobsSPMDemoKit
import JobsSPMDemoMacros

@EquatableBy("id")
private struct TestUser {
    let id: Int
    let name: String
}

@Test("资源目录能够被 Bundle.module 解码")
func bundledCatalogLoads() throws {
    let catalog = try JobsSPMDemoCatalog.loadBundled()
    #expect(catalog.features.count >= 5)
}

@Test("宏生成的相等与哈希只使用指定字段")
func macroUsesSelectedProperty() {
    let lhs = TestUser(id: 7, name: "Jobs")
    let rhs = TestUser(id: 7, name: "Codex")
    #expect(lhs == rhs)
    #expect(Set([lhs, rhs]).count == 1)
}

@Test("Actor 仓库支持异步检索")
func repositorySearchesAsynchronously() async throws {
    let catalog = try JobsSPMDemoCatalog.loadBundled()
    let repository = JobsSPMDemoRepository(catalog: catalog)
    let results = await repository.search("resource")
    #expect(!results.isEmpty)
}
