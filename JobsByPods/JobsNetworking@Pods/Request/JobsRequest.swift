//
//  JobsRequest.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsRequest {
    public var path: String
    public var method: HTTPMethod
    public var query: [String: AnySendable]?
    public var body: [String: AnySendable]?
    public var headers: [String: String]
    public var timeout: TimeInterval?
    public var encoding: JobsParameterEncoding?
    public var cachePolicy: JobsCachePolicy
    public var retryPolicy: JobsRetryPolicy?
    public var trace: JobsTrace

    public init(
        path: String,
        method: HTTPMethod,
        query: [String: AnySendable]? = nil,
        body: [String: AnySendable]? = nil,
        headers: [String: String] = [:],
        timeout: TimeInterval? = nil,
        encoding: JobsParameterEncoding? = nil,
        cachePolicy: JobsCachePolicy = .none,
        retryPolicy: JobsRetryPolicy? = nil,
        trace: JobsTrace = JobsTrace()
    ) {
        self.path = path
        self.method = method
        self.query = query
        self.body = body
        self.headers = headers
        self.timeout = timeout
        self.encoding = encoding
        self.cachePolicy = cachePolicy
        self.retryPolicy = retryPolicy
        self.trace = trace
    }
}
