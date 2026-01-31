//
//  AnySendable.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
/// 用于在 Request 层携带通用参数（String/Int/Bool/Double/Array/Dict 等）。
/// 注意：这里不做严格 JSON 约束校验，编码时会在 Agent 层统一转换。
public struct AnySendable: Hashable {
    public let value: AnyHashable?
    public init(_ value: Any?) {
        self.value = value as? AnyHashable
    }
}
