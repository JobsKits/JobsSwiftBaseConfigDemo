//
//  JobsError.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public enum JobsError: Error {
    case http(statusCode: Int, data: Data?)
    case transport(underlying: Error)
    case server(statusCode: Int, data: Data?)
    case decode(underlying: Error, data: Data?)
    case business(code: Int, message: String, data: Data?)
    case cacheMiss
    case cancelled
    case unknown(underlying: Error)

    public var isCancellable: Bool {
        if case .cancelled = self { return true }
        return false
    }

    public var isBusiness: Bool {
        if case .business = self { return true }
        return false
    }
}

extension JobsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .http(statusCode, data):
            return """
            HTTP \(statusCode)
            \(Self.describe(data))
            """
        case let .transport(underlying):
            return underlying.localizedDescription
        case let .server(statusCode, data):
            return """
            Server \(statusCode)
            \(Self.describe(data))
            """
        case let .decode(underlying, data):
            return """
            Decode failed: \(underlying.localizedDescription)
            \(Self.describe(data))
            """
        case let .business(code, message, data):
            return """
            Business (\(code)): \(message)
            \(Self.describe(data))
            """
        case .cacheMiss:
            return "Cache miss"
        case .cancelled:
            return "Request cancelled"
        case let .unknown(underlying):
            return underlying.localizedDescription
        }
    }

    private static func describe(_ data: Data?) -> String {
        guard let data, !data.isEmpty else { return "<empty>" }
        return String(data: data, encoding: .utf8) ?? "<binary \(data.count) bytes>"
    }
}
