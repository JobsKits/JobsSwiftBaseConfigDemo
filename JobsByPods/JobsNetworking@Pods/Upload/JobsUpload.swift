//
//  JobsUpload.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsUploadFile {
    public let name: String
    public let fileName: String
    public let mimeType: String
    public let data: Data

    public init(name: String, fileName: String, mimeType: String, data: Data) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
}
/// 白皮书中上传由 Agent 内核统一处理；此处提供接口占位，便于后续演进（iOS12 主路径：closure API）。
public protocol JobsUploadCapable: JobsAgent {
    @discardableResult
    func upload<T: Decodable>(
        _ request: JobsRequest,
        files: [JobsUploadFile],
        as type: T.Type,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) -> JobsRequestToken
}
