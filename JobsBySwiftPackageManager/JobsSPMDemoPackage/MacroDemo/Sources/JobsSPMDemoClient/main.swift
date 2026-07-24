//
//  main.swift
//  JobsSPMDemoClient
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import JobsSPMDemoKit
import JobsSPMDemoMacros

@EquatableBy("id")
private struct ClientUser {
    let id: Int
    let name: String
}

@main
struct JobsSPMDemoClient {
    static func main() async throws {
        let catalog = try JobsSPMDemoCatalog.loadBundled()
        let repository = JobsSPMDemoRepository(catalog: catalog)
        let matches = await repository.search("macro")
        let users = Set([
            ClientUser(id: 1, name: "Jobs"),
            ClientUser(id: 1, name: "Codex")
        ])
        print(JobsSPMDemoKit.packageSummary)
        print(JobsSPMDemoFormatter.lines(matches.map(\.title)))
        print("@EquatableBy 去重后用户数：\(users.count)")
    }
}
