//
//  Trace.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public struct JobsTrace {
    public let requestId: String
    public let traceId: String

    public init(requestId: String = UUID().uuidString, traceId: String = UUID().uuidString) {
        self.requestId = requestId
        self.traceId = traceId
    }
}
