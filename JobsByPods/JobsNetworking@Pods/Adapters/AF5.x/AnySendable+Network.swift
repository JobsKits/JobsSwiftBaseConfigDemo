//
//  AnySendable+Network.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

extension AnySendable {
    func stringValueForNetwork() -> String {
        Self.stringify(value)
    }

    private static func stringify(_ value: Any?) -> String {
        guard let value else { return "nil" }

        switch value {
        case let value as String:
            return value
        case let value as NSNumber:
            return value.stringValue
        case let value as URL:
            return value.absoluteString
        case let value as Date:
            return ISO8601DateFormatter().string(from: value)
        case let value as Data:
            return value.base64EncodedString()
        case let value as [String: AnySendable]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value.value))" }
                .joined(separator: ",")
        case let value as [String: Any]:
            return value
                .sorted { $0.key < $1.key }
                .map { "\($0.key):\(stringify($0.value))" }
                .joined(separator: ",")
        case let value as [AnySendable]:
            return value.map { stringify($0.value) }.joined(separator: ",")
        case let value as [Any]:
            return value.map { stringify($0) }.joined(separator: ",")
        default:
            return String(describing: value)
        }
    }
}
