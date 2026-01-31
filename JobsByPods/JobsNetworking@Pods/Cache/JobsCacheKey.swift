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
        let sorted = (params ?? [:]).map { ($0.key, $0.value.value?.description ?? "nil") }
            .sorted { $0.0 < $1.0 }
            .map { "\($0)=\($1)" }
            .joined(separator: "&")
        let raw = "\(method.rawValue)|\(url.absoluteString)|\(sorted)|\(version)|\(userScope)"
        return JobsCacheKey(raw: raw)
    }
}
