//
//  JobsHooks.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public protocol JobsHeaderHook {
    /// 注入鉴权/自定义 header。框架会统一注入 Accept/Content-Type 等通用 header。
    func headers(for request: JobsRequest) -> [String: String]
}

public struct EmptyHeaderHook: JobsHeaderHook {
    public init() {}
    public func headers(for request: JobsRequest) -> [String: String] { [:] }
}
