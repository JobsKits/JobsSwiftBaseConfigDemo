//
//  AFRoute.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - JSON body helper (avoid Encodable MainActor isolation issues)
private func jobs_encodeJSONObject(_ value: Any) throws -> Data {
    // Prefer [String: Any] directly
    if let dict = value as? [String: Any] {
        return try JSONSerialization.data(withJSONObject: dict)
    }
    // Mirror-based fallback for simple DTO structs/classes with stored properties
    let mirror = Mirror(reflecting: value)
    var obj: [String: Any] = [:]
    for (labelOpt, v) in mirror.children {
        guard let label = labelOpt else { continue }
        // unwrap Optional
        let mv = Mirror(reflecting: v)
        if mv.displayStyle == .optional {
            if mv.children.count == 0 { continue } // nil
            let unwrapped = mv.children.first!.value
            if let json = jobs_jsonValue(unwrapped) { obj[label] = json }
            continue
        }
        if let json = jobs_jsonValue(v) { obj[label] = json }
    };return try JSONSerialization.data(withJSONObject: obj)
}

private func jobs_jsonValue(_ v: Any) -> Any? {
    switch v {
    /// 处理 String 类型分支
    case let x as String: return x
    /// 处理 Int 类型分支
    case let x as Int: return x
    /// 处理 Int64 类型分支
    case let x as Int64: return x
    /// 处理 Double 类型分支
    case let x as Double: return x
    /// 处理 Float 类型分支
    case let x as Float: return x
    /// 处理 Bool 类型分支
    case let x as Bool: return x
    /// 处理 [Any] 类型分支
    case let x as [Any]:
        return x.compactMap { jobs_jsonValue($0) }
    /// 处理 [String: Any] 类型分支
    case let x as [String: Any]:
        // sanitize nested dictionary
        var out: [String: Any] = [:]
        for (k, vv) in x {
            if let j = jobs_jsonValue(vv) { out[k] = j }
        };return out
    /// 未匹配已知分支时执行兜底处理
    default:
        return nil
    }
}

enum AFRoute: URLRequestConvertible {
    case ghZen
    case ghUser(username: String)
    case ghSearchUsers(q: String, page: Int?)

    case login(email: String, password: String)
    case createUser(CreateUserReq)
    case updateUser(id: Int, UpdateUserReq)
    case deleteUser(id: Int)

    case uploadAvatar(Data)
    case downloadPNG
    case downloadBytes(size: Int)

    // MARK: - Base / Path / Method
    var baseURL: URL {
        switch self {
        /// 合并处理 .ghZen、.ghUser、.ghSearchUsers 分支
        case .ghZen, .ghUser, .ghSearchUsers: return URL(string: "https://api.github.com")!
        /// 合并处理 .login、.createUser、.updateUser、.deleteUser 分支
        case .login, .createUser, .updateUser, .deleteUser: return URL(string: "https://reqres.in")!
        /// 合并处理 .uploadAvatar、.downloadPNG、.downloadBytes 分支
        case .uploadAvatar, .downloadPNG, .downloadBytes: return URL(string: "https://httpbin.org")!
        }
    }

    var path: String {
        switch self {
        /// 处理 .ghZen 分支
        case .ghZen: return "/zen"
        /// 处理 .ghUser 分支
        case let .ghUser(username): return "/users/\(username)"
        /// 处理 .ghSearchUsers 分支
        case .ghSearchUsers: return "/search/users"
        /// 处理 .login 分支
        case .login: return "/api/login"
        /// 处理 .createUser 分支
        case .createUser: return "/api/users"
        /// 处理 .updateUser 分支
        case let .updateUser(id, _): return "/api/users/\(id)"
        /// 处理 .deleteUser 分支
        case let .deleteUser(id): return "/api/users/\(id)"
        /// 处理 .uploadAvatar 分支
        case .uploadAvatar: return "/post"
        /// 处理 .downloadPNG 分支
        case .downloadPNG:  return "/image/png"
        /// 处理 .downloadBytes 分支
        case let .downloadBytes(n): return "/bytes/\(n)"
        }
    }

    var method: Alamofire.HTTPMethod {
        switch self {
        /// 合并处理 .ghZen、.ghUser、.ghSearchUsers、.downloadPNG、.downloadBytes 分支
        case .ghZen, .ghUser, .ghSearchUsers, .downloadPNG, .downloadBytes:
            return .get
        /// 合并处理 .login、.createUser、.uploadAvatar 分支
        case .login, .createUser, .uploadAvatar:
            return .post
        /// 处理 .updateUser 分支
        case .updateUser:
            return .put
        /// 处理 .deleteUser 分支
        case .deleteUser:
            return .delete
        }
    }

    var timeout: TimeInterval {
        switch self {
        /// 合并处理 .uploadAvatar、.downloadPNG、.downloadBytes 分支
        case .uploadAvatar, .downloadPNG, .downloadBytes: return 60
        /// 未匹配已知分支时执行兜底处理
        default: return 20
        }
    }
    // MARK: - Headers
    var headers: HTTPHeaders {
        var h: HTTPHeaders = ["Accept": "application/json"]
        if case .uploadAvatar = self {
            // multipart 自带 boundary Content-Type
        } else {
            h.add(name: "Content-Type", value: "application/json; charset=utf-8")
        };return h
    }
    // MARK: - Encoding / Body
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var req = URLRequest(url: url)
        req.method = method
        req.headers = headers
        req.timeoutInterval = timeout
        switch self {
        /// 合并处理 .ghZen、.ghUser、.deleteUser、.downloadPNG、.downloadBytes、.uploadAvatar 分支
        case .ghZen, .ghUser, .deleteUser, .downloadPNG, .downloadBytes, .uploadAvatar:
            // 这些要么无 body，要么交给 upload/download API
            return req
        /// 处理 .ghSearchUsers 分支
        case let .ghSearchUsers(q, page):
            var comps = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            var items: [URLQueryItem] = [.init(name: "q", value: q)]
            if let p = page { items.append(.init(name: "page", value: "\(p)")) }
            comps.queryItems = items
            req.url = comps.url
            return req
        /// 处理 .login 分支
        case let .login(email, password):
            let body = ["email": email, "password": password]
            req.httpBody = try JSONSerialization.data(withJSONObject: body)
            return req
        /// 处理 .createUser 分支
        case let .createUser(b):
            req.httpBody = try jobs_encodeJSONObject(b)
            return req
        /// 处理 .updateUser 分支
        case let .updateUser(_, b):
            req.httpBody = try jobs_encodeJSONObject(b)
            return req
        }
    }
    // MARK: - Download Destination
    var destination: DownloadRequest.Destination? {
        switch self {
        /// 合并处理 .downloadPNG、.downloadBytes 分支
        case .downloadPNG, .downloadBytes:
            return { _, _ in
                let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    .appendingPathComponent("Downloads", isDirectory: true)
                try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
                let name: String = {
                    switch self {
                    /// 处理 .downloadPNG 分支
                    case .downloadPNG: return "sample.png"
                    /// 处理 .downloadBytes 分支
                    case let .downloadBytes(n): return "bytes_\(n).bin"
                    /// 未匹配已知分支时执行兜底处理
                    default: return "file.bin"
                    }
                }()
                let url = dir.appendingPathComponent(name)
                return (url, [.removePreviousFile, .createIntermediateDirectories])
            }
        /// 未匹配已知分支时执行兜底处理
        default:
            return nil
        }
    }
    // MARK: - sampleData（给 Stub 用，内容与 Moya 版一致）
    var sampleData: Data {
        switch self {
        /// 处理 .ghZen 分支
        case .ghZen:
            return Data("Keep it logically awesome.".utf8)
        /// 处理 .ghUser 分支
        case .ghUser:
            return #"{"login":"apple","id":1,"avatar_url":"https://avatars.githubusercontent.com/u/1"}"#
                .data(using: .utf8)!
        /// 处理 .ghSearchUsers 分支
        case .ghSearchUsers:
            return #"{"total_count":1,"items":[{"login":"jobs","id":9527,"avatar_url":"https://example.com/a.png"}]}"#
                .data(using: .utf8)!
        /// 处理 .login 分支
        case .login:
            return #"{"token":"QpwL5tke4Pnpja7X4"}"#.data(using: .utf8)!
        /// 处理 .createUser 分支
        case .createUser:
            return #"{"id":"101","name":"New User","email":"new@example.com","createdAt":"2025-01-01T00:00:00Z"}"#
                .data(using: .utf8)!
        /// 处理 .updateUser 分支
        case .updateUser:
            return #"{"name":"Updated","email":"updated@example.com","updatedAt":"2025-01-01T00:00:00Z"}"#
                .data(using: .utf8)!
        /// 处理 .deleteUser 分支
        case .deleteUser:
            return Data()
        /// 处理 .uploadAvatar 分支
        case .uploadAvatar:
            return #"{"files":{"file":"data:image/jpeg;base64,..."},"form":{}}"#.data(using: .utf8)!
        /// 合并处理 .downloadPNG、.downloadBytes 分支
        case .downloadPNG, .downloadBytes:
            return Data()
        }
    }
}
