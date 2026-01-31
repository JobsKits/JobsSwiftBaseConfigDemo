//
//  JobsRequestConfig.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsRequestConfig {
    public var baseURL: URL
    public var timeout: TimeInterval
    public var version: String
    public var userScope: String
    public var defaultRetryPolicy: JobsRetryPolicy
    public var decoder: JSONDecoder
    public var logger: JobsLogger
    public var sslPinning: JobsSSLPinning?

    public init(
        baseURL: URL,
        timeout: TimeInterval = 30,
        version: String = "v1",
        userScope: String = "default",
        defaultRetryPolicy: JobsRetryPolicy = .default,
        decoder: JSONDecoder = .jobsDefault,
        logger: JobsLogger = JobsLogger(),
        sslPinning: JobsSSLPinning? = nil
    ) {
        self.baseURL = baseURL
        self.timeout = timeout
        self.version = version
        self.userScope = userScope
        self.defaultRetryPolicy = defaultRetryPolicy
        self.decoder = decoder
        self.logger = logger
        self.sslPinning = sslPinning
    }
}

public extension JSONDecoder {
    static var jobsDefault: JSONDecoder {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .useDefaultKeys
        d.dateDecodingStrategy = .deferredToDate
        return d
    }
}
