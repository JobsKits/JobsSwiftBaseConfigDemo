import Foundation

public protocol JobsCacheStore: Sendable {
    func get(key: JobsCacheKey) async -> JobsCachedValue?
    func set(key: JobsCacheKey, value: JobsCachedValue) async
    func remove(key: JobsCacheKey) async
    func removeAll() async
}

public struct JobsCachedValue: Sendable {
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

public actor JobsMemoryCache: JobsCacheStore {
    // Use String as the backing key to avoid any global-actor/default-isolation interactions
    // with `Hashable` conformances in Swift 6 projects configured with MainActor default isolation.
    private var store: [String: JobsCachedValue] = [:]

    public init() {}

    public func get(key: JobsCacheKey) async -> JobsCachedValue? {
        let k = key.raw
        guard let v = store[k], !v.isExpired else {
            store[k] = nil
            return nil
        }
        return v
    }

    public func set(key: JobsCacheKey, value: JobsCachedValue) async {
        store[key.raw] = value
    }

    public func remove(key: JobsCacheKey) async { store[key.raw] = nil }
    public func removeAll() async { store.removeAll() }
}

public actor JobsDiskCache: JobsCacheStore {
    private let dir: URL

    public init(namespace: String = "JobsNetworkingCache") {
        let base = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        dir = base.appendingPathComponent(namespace, isDirectory: true)
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    }

    public func get(key: JobsCacheKey) async -> JobsCachedValue? {
        let url = fileURL(for: key)
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let wrapper = try? JSONDecoder().decode(DiskWrapper.self, from: data) else { return nil }
        if Date() >= wrapper.expiry {
            try? FileManager.default.removeItem(at: url)
            return nil
        }
        return JobsCachedValue(data: wrapper.data, expiry: wrapper.expiry, meta: wrapper.meta)
    }

    public func set(key: JobsCacheKey, value: JobsCachedValue) async {
        let url = fileURL(for: key)
        let wrapper = DiskWrapper(data: value.data, expiry: value.expiry, meta: value.meta)
        if let encoded = try? JSONEncoder().encode(wrapper) {
            try? encoded.write(to: url, options: .atomic)
        }
    }

    public func remove(key: JobsCacheKey) async {
        try? FileManager.default.removeItem(at: fileURL(for: key))
    }

    public func removeAll() async {
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
