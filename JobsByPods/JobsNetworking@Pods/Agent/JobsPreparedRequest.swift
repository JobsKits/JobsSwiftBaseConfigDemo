import Foundation
import Alamofire

struct JobsPreparedRequest: Sendable {
    let url: URL
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let headers: HTTPHeaders
    let timeout: TimeInterval?
    let trace: JobsTrace
}

enum JobsEncodingRule {
    static func encoding(for request: JobsRequest) -> JobsParameterEncoding {
        if let e = request.encoding { return e }
        switch request.method {
        case .get, .head, .delete:
            return .urlQuery
        case .post, .put, .patch:
            return .jsonBody
        }
    }

    /// 白皮书规则：Query 与 Body 不允许隐式混用
    static func validateNoImplicitMix(_ request: JobsRequest, encoding: JobsParameterEncoding) throws {
        switch encoding {
        case .urlQuery:
            if request.body != nil && !(request.body?.isEmpty ?? true) {
                throw JobsError.decode(underlying: NSError(domain: "JobsNetworking", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL Query 编码下不允许携带 Body 参数"]), data: nil)
            }
        case .jsonBody, .formURLEncoded, .multipart, .rawData:
            // 允许 query + body 同时存在，但必须显式（这里的显式性体现在你设置了 query/body）
            // 如需更严格（禁止 query+body 同时存在），可在此改为 throw。
            break
        }
    }
}

extension Dictionary where Key == String, Value == AnySendable {
    func toAFParameters() -> Parameters {
        var out: Parameters = [:]
        for (k, v) in self {
            out[k] = v.value
        }
        return out
    }
}
