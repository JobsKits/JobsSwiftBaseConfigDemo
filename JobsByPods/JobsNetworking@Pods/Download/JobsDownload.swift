import Foundation

public protocol JobsDownloadCapable: JobsAgent {
    /// 断点下载接口占位（可扩展 resumeData / range header 等）
    func download(_ request: JobsRequest, to destination: URL) async throws -> URL
}
