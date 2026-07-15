//
//  JobsValue.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

public struct JobsValue: Sendable {
    public let raw: Any?

    public init(_ raw: Any?) {
        self.raw = raw
    }
}

@available(*, deprecated, renamed: "JobsValue")
public typealias AnySendable = JobsValue

public extension Dictionary where Key == String, Value == JobsValue {
    func normalizedJSONObject() -> [String: Any] {
        reduce(into: [String: Any]()) { partialResult, item in
            partialResult[item.key] = JobsValueNormalizer.normalize(item.value.raw)
        }
    }
}

enum JobsValueNormalizer {
    static func normalize(_ value: Any?) -> Any {
        guard let value else { return NSNull() }
        switch value {
        case let value as JobsValue:
            return normalize(value.raw)
        case let value as [String: JobsValue]:
            return value.normalizedJSONObject()
        case let value as [String: Any]:
            return value.mapValues(normalize)
        case let value as [JobsValue]:
            return value.map { normalize($0.raw) }
        case let value as [Any]:
            return value.map(normalize)
        case let value as URL:
            return value.absoluteString
        case let value as Date:
            return ISO8601DateFormatter().string(from: value)
        case let value as Data:
            return value.base64EncodedString()
        default:
            return value
        }
    }
}
