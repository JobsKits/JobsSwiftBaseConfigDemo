//
//  RootRecentDemoStore.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月15日，星期日.
//

import Foundation

/// 只保存稳定类型标识，展示时由当前注册表解析，旧版本条目不参与路由。
struct RootRecentDemoStore {
    static let storageKey = "com.BSports.JobsSwiftRecentDemoUserDefaultsKey"
    private let defaults: UserDefaults
    private let capacity = 30

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func record(_ identifier: String) {
        guard !identifier.isEmpty else {
            return
        }
        var identifiers = uniqueStoredIdentifiers()
        identifiers.removeAll { $0 == identifier }
        identifiers.insert(identifier, at: 0)
        defaults.set(Array(identifiers.prefix(capacity)), forKey: Self.storageKey)
    }

    func identifiers(available: Set<String>) -> [String] {
        uniqueStoredIdentifiers().filter(available.contains)
    }

    private func uniqueStoredIdentifiers() -> [String] {
        var seen = Set<String>()
        return (defaults.stringArray(forKey: Self.storageKey) ?? []).filter {
            !$0.isEmpty && seen.insert($0).inserted
        }.prefix(capacity).map { $0 }
    }
}
