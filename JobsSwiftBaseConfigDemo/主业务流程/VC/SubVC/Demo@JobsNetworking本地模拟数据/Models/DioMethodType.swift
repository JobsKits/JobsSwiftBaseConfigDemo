//
//  DioMethodType.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

import Foundation

enum DioMethodType: String, CaseIterable, Codable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case upload = "UPLOAD"
    case download = "DOWNLOAD"

    var title: String { rawValue }

    var subTitle: String {
        switch self {
        case .get: "GET 请求演示"
        case .post: "POST 请求演示"
        case .put: "PUT 请求演示"
        case .patch: "PATCH 请求演示"
        case .delete: "DELETE 请求演示"
        case .upload: "UPLOAD 请求演示"
        case .download: "DOWNLOAD 请求演示"
        }
    }

    var path: String {
        switch self {
        case .get: "/api/get"
        case .post: "/api/post"
        case .put: "/api/put"
        case .patch: "/api/patch"
        case .delete: "/api/delete"
        case .upload: "/api/upload"
        case .download: "/api/download"
        }
    }

    static func from(_ value: String) -> Self {
        Self(rawValue: value.uppercased()) ?? .get
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self = Self.from(value)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
