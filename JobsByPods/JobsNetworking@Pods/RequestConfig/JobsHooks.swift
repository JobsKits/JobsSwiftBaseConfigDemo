import Foundation

public protocol JobsHeaderHook: Sendable {
    /// 注入鉴权/自定义 header。框架会统一注入 Accept/Content-Type 等通用 header。
    func headers(for request: JobsRequest) async -> [String: String]
}

public struct EmptyHeaderHook: JobsHeaderHook {
    public init() {}
    public func headers(for request: JobsRequest) async -> [String : String] { [:] }
}
