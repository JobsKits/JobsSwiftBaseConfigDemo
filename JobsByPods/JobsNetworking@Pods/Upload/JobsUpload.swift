import Foundation

public struct JobsUploadFile: Sendable {
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

/// 白皮书中上传由 Agent 内核统一处理；此处提供接口占位，便于后续演进。
public protocol JobsUploadCapable: JobsAgent {
    func upload<T: Decodable>(_ request: JobsRequest, files: [JobsUploadFile], as type: T.Type) async throws -> T
}
