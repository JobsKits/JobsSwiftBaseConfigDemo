//
//  DemoAPI.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public enum DemoAPI {
    // GitHub：公开 GET
    case ghZen
    case ghUser(username: String)
    case ghSearchUsers(q: String, page: Int?)
    // ReqRes：登录/CRUD
    case login(email: String, password: String)
    case createUser(CreateUserReq)
    case updateUser(id: Int, UpdateUserReq)
    case deleteUser(id: Int)
    // httpbin：上传/下载
    case uploadAvatar(imageData: Data)
    case downloadPNG
    case downloadBytes(size: Int)
}

extension DemoAPI: TargetType {
    public var baseURL: URL {
        switch self {
        /// 合并处理 .ghZen、.ghUser、.ghSearchUsers 分支
        case .ghZen, .ghUser, .ghSearchUsers:
            return URL(string: "https://api.github.com")!
        /// 合并处理 .login、.createUser、.updateUser、.deleteUser 分支
        case .login, .createUser, .updateUser, .deleteUser:
            return URL(string: "https://reqres.in")!
        /// 合并处理 .uploadAvatar、.downloadPNG、.downloadBytes 分支
        case .uploadAvatar, .downloadPNG, .downloadBytes:
            return URL(string: "https://httpbin.org")!
        }
    }

    public var path: String {
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
        case let .deleteUser(id):    return "/api/users/\(id)"
        /// 处理 .uploadAvatar 分支
        case .uploadAvatar: return "/post"
        /// 处理 .downloadPNG 分支
        case .downloadPNG:  return "/image/png"
        /// 处理 .downloadBytes 分支
        case let .downloadBytes(size): return "/bytes/\(size)"
        }
    }

    public var method: Moya.Method {
        switch self {
        /// 合并处理 .ghZen、.ghUser、.ghSearchUsers、.downloadPNG、.downloadBytes 分支
        case .ghZen, .ghUser, .ghSearchUsers, .downloadPNG, .downloadBytes: return .get
        /// 合并处理 .login、.createUser、.uploadAvatar 分支
        case .login, .createUser, .uploadAvatar: return .post
        /// 处理 .updateUser 分支
        case .updateUser: return .put
        /// 处理 .deleteUser 分支
        case .deleteUser: return .delete
        }
    }

    public var task: Task {
        switch self {
        /// GitHub
        case .ghZen, .ghUser:
            return .requestPlain
        /// 处理 .ghSearchUsers 分支
        case let .ghSearchUsers(q, page):
            var params = ["q": q]
            if let p = page { params["page"] = "\(p)" };return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        /// ReqRes
        case let .login(email, password):
            return .requestParameters(parameters: ["email": email, "password": password],
                                      encoding: JSONEncoding.default)
        /// 处理 .createUser 分支
        case let .createUser(body):
            return .requestJSONEncodable(body)
        /// 处理 .updateUser 分支
        case let .updateUser(_, body):
            return .requestJSONEncodable(body)
        /// 处理 .deleteUser 分支
        case .deleteUser:
            return .requestPlain
        /// httpbin 上传/下载
        case let .uploadAvatar(data):
            let form = MultipartFormData(provider: .data(data),
                                         name: "file",
                                         fileName: "avatar.jpg",
                                         mimeType: "image/jpeg")
            return .uploadMultipart([form])
        /// 合并处理 .downloadPNG、.downloadBytes 分支
        case .downloadPNG, .downloadBytes:
            let destination: DownloadDestination = { _, _ in
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
            };return .downloadDestination(destination)
        }
    }

    public var headers: [String : String]? {
        var h = ["Accept": "application/json"]
        if case .uploadAvatar = self {
            // multipart 自带 boundary Content-Type
        } else {
            h["Content-Type"] = "application/json; charset=utf-8"
        };return h
    }

    public var sampleData: Data {
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

    public var validationType: ValidationType { .successCodes }
    public var timeout: TimeInterval {
        switch self {
        /// 合并处理 .uploadAvatar、.downloadPNG、.downloadBytes 分支
        case .uploadAvatar, .downloadPNG, .downloadBytes: return 60
        /// 未匹配已知分支时执行兜底处理
        default: return 20
        }
    }
}
