import Foundation

public enum JobsError: Error, Sendable {
    /// 传输层：无网、超时、TLS、取消等
    case transport(underlying: Error)
    /// 服务端：HTTP 状态码或服务端不可用等
    case server(statusCode: Int, data: Data?)
    /// 解码层：JSON 结构不匹配、格式错误等
    case decode(underlying: Error, data: Data?)
    /// 业务层：code/msg 业务错误（永不自动 Retry）
    case business(code: Int, message: String, data: Data?)
    /// 已取消（cancel 后允许抛出）
    case cancelled

    public var isCancellable: Bool {
        if case .cancelled = self { return true }
        return false
    }

    public var isBusiness: Bool {
        if case .business = self { return true }
        return false
    }
}
