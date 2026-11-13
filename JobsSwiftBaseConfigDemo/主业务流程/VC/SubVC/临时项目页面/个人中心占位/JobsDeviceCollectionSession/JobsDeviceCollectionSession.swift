//
//  JobsDeviceCollectionSession.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月6日，星期五.
//

import Foundation

import JobsSwiftDSL

struct JobsDeviceCollectionSession: Decodable,
                                    Sendable {

    struct Response: Decodable,
                     Sendable {

        let ok: Bool
        let pairToken: String?
        let session: JobsDeviceCollectionSession?
    }

    struct Diagnostic: Decodable,
                       Sendable {

        let code: String
        let stage: String
    }

    struct Device: Decodable,
                   Sendable {

        let udid: String?
        let imei: String?
        let imei2: String?
        let iccid: String?
        let meid: String?
        let serial: String?
        let product: String?
        let version: String?
        let osVersion: String?
        let modelName: String?
        let modelNumber: String?
        let seid: String?
        let fieldSources: [String: String]?
        let collectionMethod: String?

        var values: [(String, String?)] {
            [
                ("udid", udid), ("imei", imei), ("imei2", imei2),
                ("iccid", iccid), ("meid", meid), ("osVersion", osVersion),
                ("modelName", modelName), ("serial", serial),
                ("modelNumber", modelNumber), ("seid", seid),
                ("product", product), ("version", version)
            ]
        }

        var hasValidUDID: Bool {
            guard let udid else {
                return false
            }
            return udid.range(of: "^(?:[0-9a-fA-F]{40}|[0-9a-fA-F]{8}-[0-9a-fA-F]{16})$",
                              options: .regularExpression) != nil
        }
    }

    let state: String
    let expiresAt: String
    let device: Device?
    let callbackError: Diagnostic?
    let verification: String?

    var expirationDate: Date? {
        let normalized = expiresAt.replacingOccurrences(of: "\\.\\d+(?=Z$)",
                                                         with: "",
                                                         options: .regularExpression)
        return ISO8601DateFormatter.jobsMake { _ in }
            .date(from: normalized)
    }

    var isValid: Bool {
        ["waiting", "received"].contains(state) && expirationDate != nil
    }
}
