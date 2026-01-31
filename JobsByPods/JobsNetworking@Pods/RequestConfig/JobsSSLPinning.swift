import Foundation

/// 可选 SSL Pinning 配置（演示用）。如需更严谨实现，可在 Agent 内替换 Alamofire 的 ServerTrustManager。
public struct JobsSSLPinning: Sendable {
    public let pinnedHosts: [String]
    public init(pinnedHosts: [String]) {
        self.pinnedHosts = pinnedHosts
    }
}
