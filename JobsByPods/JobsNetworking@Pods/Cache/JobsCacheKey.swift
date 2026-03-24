//
//  JobsCacheKey.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsCacheKey: Hashable {
    public let raw: String
    public init(raw: String) { self.raw = raw }

    public static func make(
        method: HTTPMethod,
        url: URL,
        params: [String: AnySendable]?,
        version: String,
        userScope: String
    ) -> JobsCacheKey {
        let sorted = (params ?? [:])
            .map { ($0.key, Self.stringify($0.value.value)) }
            .sorted { $0.0 < $1.0 }
            .map { "\($0)=\($1)" }
            .joined(separator: "&")
        let raw = "\(method.rawValue)|\(url.absoluteString)|\(sorted)|\(version)|\(userScope)"
        return JobsCacheKey(raw: raw)
    }

    private static func stringify(_ value: Any?) -> String {
        guard let value else { return "nil" }

        switch value {
        case let value as String:
            return value
        case let value as CustomStringConvertible:
            return value.description
        case let value as [String: Any]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value))" }
                .joined(separator: ",")
        case let value as [Any]:
            return value.map { stringify($0) }.joined(separator: ",")
        case let value as [String: AnySendable]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value.value))" }
                .joined(separator: ",")
        default:
            return String(describing: value)
        }
    }
}
