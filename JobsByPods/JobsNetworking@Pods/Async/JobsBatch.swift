//
//  JobsAgent+Async.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public enum JobsBatch {
    /// TaskGroup 并发批量请求
    public static func concurrent<T: Sendable>(
        _ tasks: [@Sendable () async throws -> T]
    ) async throws -> [T] {
        try await withThrowingTaskGroup(of: (Int, T).self) { group in
            for (idx, task) in tasks.enumerated() {
                group.addTask { (idx, try await task()) }
            }
            var result = Array<T?>(repeating: nil, count: tasks.count)
            for try await (idx, value) in group {
                result[idx] = value
            };return result.compactMap { $0 }
        }
    }
    /// 请求接力：顺序 await（退化为串行）
    public static func chain<T: Sendable>(
        _ tasks: [@Sendable () async throws -> T]
    ) async throws -> [T] {
        var out: [T] = []
        out.reserveCapacity(tasks.count)
        for task in tasks {
            out.append(try await task())
        };return out
    }
}
