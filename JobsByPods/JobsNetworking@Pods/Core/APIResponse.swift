//
//  APIResponse.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

/// 业务包装（code/msg/data）
/// - code == 0 视为成功（可按你们业务调整）
public struct APIResponse<T: Decodable>: Decodable {
    public let code: Int
    public let msg: String?
    public let data: T?
}
