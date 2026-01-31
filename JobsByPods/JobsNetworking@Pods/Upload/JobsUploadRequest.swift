//
//  JobsUploadRequest.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsUploadRequest {
    public var path: String
    public var method: HTTPMethod
    public var files: [JobsUploadFileSpec]
    public var form: [String: AnySendable]
    public var headers: [String: String]
    public var timeout: TimeInterval?
    public var trace: JobsTrace

    public init(
        path: String,
        method: HTTPMethod = .post,
        files: [JobsUploadFileSpec],
        form: [String: AnySendable] = [:],
        headers: [String: String] = [:],
        timeout: TimeInterval? = nil,
        trace: JobsTrace = JobsTrace()
    ) {
        self.path = path
        self.method = method
        self.files = files
        self.form = form
        self.headers = headers
        self.timeout = timeout
        self.trace = trace
    }
}

public enum JobsUploadFileSpec {
    case file(url: URL,
              name: String,
              fileName: String,
              mimeType: String)
    case data(data: Data,
              name: String,
              fileName: String,
              mimeType: String)
    // NOTE:
    // Can't provide static factories named `file(...)` / `data(...)` because they collide with
    // the enum case constructors in Swift ("Invalid redeclaration").
    public static func fromFile(url: URL,
                                name: String,
                                fileName: String,
                                mimeType: String) -> JobsUploadFileSpec {
        .file(url: url,
              name: name,
              fileName: fileName,
              mimeType: mimeType)
    }

    public static func fromData(_ data: Data,
                                name: String,
                                fileName: String,
                                mimeType: String) -> JobsUploadFileSpec {
        .data(data: data,
              name: name,
              fileName: fileName,
              mimeType: mimeType)
    }
}
/// 内核上传用的 multipart part（供 HTTPClient 使用）
public struct JobsMultipartPart {
    public let name: String
    public let fileName: String
    public let mimeType: String
    public let data: Data

    public init(name: String,
                fileName: String,
                mimeType: String,
                data: Data) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
}
