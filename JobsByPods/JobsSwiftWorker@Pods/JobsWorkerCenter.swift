//
//  JobsWorkerCenter.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public final class JobsWorkerCenter {
    public static let `default` = JobsWorkerCenter()

    private let lock = NSLock()
    private var buckets: [String: JobsWorkerBag] = [:]

    public init() {}

    @discardableResult
    public func bag(for key: String) -> JobsWorkerBag {
        lock.lock()
        defer { lock.unlock() }
        if let bag = buckets[key] {
            return bag
        }
        let bag = JobsWorkerBag()
        buckets[key] = bag
        return bag
    }

    public func dispose(key: String) {
        let bag: JobsWorkerBag?
        lock.lock()
        bag = buckets.removeValue(forKey: key)
        lock.unlock()
        bag?.removeAll()
    }

    public func disposeAll() {
        let snapshot: [JobsWorkerBag]
        lock.lock()
        snapshot = Array(buckets.values)
        buckets.removeAll()
        lock.unlock()
        snapshot.forEach { $0.removeAll() }
    }
}
