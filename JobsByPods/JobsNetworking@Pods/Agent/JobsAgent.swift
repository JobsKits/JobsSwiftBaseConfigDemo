//
//  JobsAgent.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public protocol JobsAgent {
    var config: JobsRequestConfig { get }
    var headerHook: JobsHeaderHook { get }
    /// iOS 12 主路径：closure API
    @discardableResult
    func send<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) -> JobsRequestToken
}
