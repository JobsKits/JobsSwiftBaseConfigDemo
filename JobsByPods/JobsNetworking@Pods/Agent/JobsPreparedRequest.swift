//
//  JobsPreparedRequest.swift
//  JobsNetworking
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import Alamofire

struct JobsPreparedRequest {
    let url: URL
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding?
    let headers: HTTPHeaders
    let timeout: TimeInterval?
    let rawBody: Data?
    let trace: JobsTrace
}

enum JobsEncodingRule {
    static func encoding(for request: JobsRequest) -> JobsParameterEncoding {
        if let encoding = request.encoding { return encoding }
        switch request.method {
        case .get, .head, .delete:
            return .urlQuery
        case .post, .put, .patch:
            return .jsonBody
        }
    }

    static func validate(_ request: JobsRequest, encoding: JobsParameterEncoding) throws {
        switch encoding {
        case .urlQuery:
            if let body = request.body, !body.isEmpty {
                throw JobsError.invalidRequest(reason: "URL Query encoding does not allow body payload")
            }
        case .multipart:
            break
        case .rawData:
            if let query = request.query, !query.isEmpty {
                throw JobsError.invalidRequest(reason: "Raw data request should not mix query payload in body channel")
            }
        case .jsonBody, .formURLEncoded:
            break
        }
    }
}
