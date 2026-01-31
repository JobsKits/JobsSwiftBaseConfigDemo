import Foundation

public enum JobsParameterEncoding: Sendable, Codable {
    /// GET: URL Query 编码
    case urlQuery
    /// POST/PUT/PATCH: 默认 JSON Body
    case jsonBody
    /// form-urlencoded 需显式声明
    case formURLEncoded
    /// multipart 需显式声明（用于上传）
    case multipart
    /// raw data body
    case rawData
}
