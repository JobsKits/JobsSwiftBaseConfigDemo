//
//  JobsError.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum JobsError: Error, Sendable {
    case http(statusCode: Int, data: Data?)
    case transport(underlying: String)
    case server(statusCode: Int, data: Data?)
    case decode(underlying: String, data: Data?)
    case business(code: Int, message: String, data: Data?)
    case cacheMiss
    case cancelled
    case invalidRequest(reason: String)
    case emptyResponse
    case unknown(underlying: String)
}

public extension JobsError {
    var isCancelled: Bool {
        if case .cancelled = self { return true }
        return false
    }

    var isBusiness: Bool {
        if case .business = self { return true }
        return false
    }

    var retryCategory: JobsRetryCategory {
        switch self {
        case .cancelled:
            return .doNotRetry
        case let .http(statusCode, _), let .server(statusCode, _):
            return (500...599).contains(statusCode) ? .serverSide : .doNotRetry
        case .transport:
            return .transport
        case .decode, .business, .invalidRequest, .emptyResponse, .cacheMiss, .unknown:
            return .doNotRetry
        }
    }
}

extension JobsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .http(statusCode, data):
            return "HTTP \(statusCode) \(Self.describe(data))"
        case let .transport(underlying):
            return underlying
        case let .server(statusCode, data):
            return "Server \(statusCode) \(Self.describe(data))"
        case let .decode(underlying, data):
            return "Decode failed: \(underlying) \(Self.describe(data))"
        case let .business(code, message, data):
            return "Business(\(code)): \(message) \(Self.describe(data))"
        case .cacheMiss:
            return "Cache miss"
        case .cancelled:
            return "Request cancelled"
        case let .invalidRequest(reason):
            return reason
        case .emptyResponse:
            return "Empty response"
        case let .unknown(underlying):
            return underlying
        }
    }

    private static func describe(_ data: Data?) -> String {
        guard let data, !data.isEmpty else { return "<empty>" }
        return String(data: data, encoding: .utf8) ?? "<binary \(data.count) bytes>"
    }
}
