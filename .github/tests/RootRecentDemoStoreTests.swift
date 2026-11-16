//
//  RootRecentDemoStoreTests.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月15日，星期日.
//

import Foundation

/// 将本文件与 RootRecentDemoStore.swift 一同交给 swiftc，验证隔离存储，不读写用户真实偏好。
@main
enum RootRecentDemoStoreTests {
    static func main() {
        let suite = "JobsRecentDemoTests.\(UUID().uuidString)"
        guard let defaults = UserDefaults(suiteName: suite) else {
            fatalError("Unable to create isolated preferences")
        }
        defer {
            defaults.removePersistentDomain(forName: suite)
        }
        let store = RootRecentDemoStore(defaults: defaults)
        let all = Set((0..<40).map { "demo-\($0)" })
        precondition(store.identifiers(available: all).isEmpty)
        for index in 0..<40 {
            store.record("demo-\(index)")
        }
        let ordered = store.identifiers(available: all)
        precondition(ordered.count == 30 && ordered.first == "demo-39" && ordered.last == "demo-10")
        store.record("demo-20")
        precondition(store.identifiers(available: all).first == "demo-20")
        precondition(store.identifiers(available: all).count == 30)
        let restored = RootRecentDemoStore(defaults: defaults)
        precondition(restored.identifiers(available: all) == store.identifiers(available: all))
        precondition(restored.identifiers(available: ["demo-20"]) == ["demo-20"])
        defaults.set(["demo-20", "demo-20", "removed", ""], forKey: RootRecentDemoStore.storageKey)
        precondition(restored.identifiers(available: all) == ["demo-20"])
        print("RootRecentDemoStore: 7 checks passed")
    }
}
