//
//  JobsPreparedRequest.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire

struct JobsPreparedRequest {
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

    static func validateNoImplicitMix(_ request: JobsRequest, encoding: JobsParameterEncoding) throws {
        switch encoding {
        case .urlQuery:
            if request.body != nil && !(request.body?.isEmpty ?? true) {
                throw JobsError.decode(
                    underlying: NSError(
                        domain: "JobsNetworking",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey: "URL Query 编码下不允许携带 Body 参数"]
                    ),
                    data: nil
                )
            }
        case .jsonBody, .formURLEncoded, .multipart, .rawData:
            break
        }
    }
}

enum JobsParameterNormalizer {
    static func normalize(_ value: Any?) -> Any {
        guard let value else { return NSNull() }

        switch value {
        case let value as AnySendable:
            return normalize(value.value)
        case let value as [String: AnySendable]:
            return value.reduce(into: Parameters()) { partialResult, item in
                partialResult[item.key] = normalize(item.value.value)
            }
        case let value as [String: Any]:
            return value.reduce(into: Parameters()) { partialResult, item in
                partialResult[item.key] = normalize(item.value)
            }
        case let value as [AnySendable]:
            return value.map { normalize($0.value) }
        case let value as [Any]:
            return value.map(normalize)
        case let value as URL:
            return value.absoluteString
        case let value as Date:
            return ISO8601DateFormatter().string(from: value)
        case let value as Data:
            return value.base64EncodedString()
        default:
            return value
        }
    }
}

extension Dictionary where Key == String, Value == AnySendable {
    func toAFParameters() -> Parameters {
        reduce(into: Parameters()) { partialResult, item in
            partialResult[item.key] = JobsParameterNormalizer.normalize(item.value.value)
        }
    }
}
