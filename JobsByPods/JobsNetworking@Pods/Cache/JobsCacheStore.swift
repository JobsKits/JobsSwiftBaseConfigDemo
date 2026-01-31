//
//  JobsCacheStore.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public protocol JobsCacheStore {
    func get(key: JobsCacheKey) -> JobsCachedValue?
    func set(key: JobsCacheKey, value: JobsCachedValue)
    func remove(key: JobsCacheKey)
    func removeAll()
}

public struct JobsCachedValue: Codable {
    public let data: Data
    public let expiry: Date
    public let meta: [String: String]

    public init(data: Data, expiry: Date, meta: [String: String] = [:]) {
        self.data = data
        self.expiry = expiry
        self.meta = meta
    }

    public var isExpired: Bool { Date() >= expiry }
}

public final class JobsMemoryCache: JobsCacheStore {
    private var store: [String: JobsCachedValue] = [:]
    private let lock = NSLock()

    public init() {}

    public func get(key: JobsCacheKey) -> JobsCachedValue? {
        lock.lock(); defer { lock.unlock() }
        let k = key.raw
        guard let v = store[k], !v.isExpired else {
            store[k] = nil
            return nil
        };return v
    }

    public func set(key: JobsCacheKey, value: JobsCachedValue) {
        lock.lock(); defer { lock.unlock() }
        store[key.raw] = value
    }

    public func remove(key: JobsCacheKey) {
        lock.lock(); defer { lock.unlock() }
        store[key.raw] = nil
    }

    public func removeAll() {
        lock.lock(); defer { lock.unlock() }
        store.removeAll()
    }
}

public final class JobsDiskCache: JobsCacheStore {
    private let dir: URL
    private let lock = NSLock()

    public init(namespace: String = "JobsNetworkingCache") {
        let base = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        dir = base.appendingPathComponent(namespace, isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    }

    public func get(key: JobsCacheKey) -> JobsCachedValue? {
        lock.lock(); defer { lock.unlock() }
        let url = fileURL(for: key)
        guard let data = try? Data(contentsOf: url),
              let wrapper = try? JSONDecoder().decode(DiskWrapper.self, from: data) else { return nil }
        if Date() >= wrapper.expiry {
            try? FileManager.default.removeItem(at: url)
            return nil
        }
        return JobsCachedValue(data: wrapper.data, expiry: wrapper.expiry, meta: wrapper.meta)
    }

    public func set(key: JobsCacheKey, value: JobsCachedValue) {
        lock.lock(); defer { lock.unlock() }
        let url = fileURL(for: key)
        let wrapper = DiskWrapper(data: value.data, expiry: value.expiry, meta: value.meta)
        if let encoded = try? JSONEncoder().encode(wrapper) {
            try? encoded.write(to: url, options: .atomic)
        }
    }

    public func remove(key: JobsCacheKey) {
        lock.lock(); defer { lock.unlock() }
        try? FileManager.default.removeItem(at: fileURL(for: key))
    }

    public func removeAll() {
        lock.lock(); defer { lock.unlock() }
        try? FileManager.default.removeItem(at: dir)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    }

    private func fileURL(for key: JobsCacheKey) -> URL {
        let safe = key.raw.data(using: .utf8)!.base64EncodedString()
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "+", with: "-")
        return dir.appendingPathComponent(safe).appendingPathExtension("json")
    }

    private struct DiskWrapper: Codable {
        let data: Data
        let expiry: Date
        let meta: [String: String]
    }
}
