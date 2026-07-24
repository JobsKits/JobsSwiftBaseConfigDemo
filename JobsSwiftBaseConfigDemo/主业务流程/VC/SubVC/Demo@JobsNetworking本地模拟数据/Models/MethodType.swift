//
//  MethodType.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

enum MethodType: String, CaseIterable, Codable {
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
        /// 处理 .get 分支
        case .get: "GET 请求演示"
        /// 处理 .post 分支
        case .post: "POST 请求演示"
        /// 处理 .put 分支
        case .put: "PUT 请求演示"
        /// 处理 .patch 分支
        case .patch: "PATCH 请求演示"
        /// 处理 .delete 分支
        case .delete: "DELETE 请求演示"
        /// 处理 .upload 分支
        case .upload: "UPLOAD 请求演示"
        /// 处理 .download 分支
        case .download: "DOWNLOAD 请求演示"
        }
    }

    var path: String {
        switch self {
        /// 处理 .get 分支
        case .get: "/api/get"
        /// 处理 .post 分支
        case .post: "/api/post"
        /// 处理 .put 分支
        case .put: "/api/put"
        /// 处理 .patch 分支
        case .patch: "/api/patch"
        /// 处理 .delete 分支
        case .delete: "/api/delete"
        /// 处理 .upload 分支
        case .upload: "/api/upload"
        /// 处理 .download 分支
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
