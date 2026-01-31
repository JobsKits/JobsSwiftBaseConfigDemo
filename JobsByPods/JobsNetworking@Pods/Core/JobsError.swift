//
//  JobsError.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
/// JobsNetworking 统一错误类型。
///
/// 设计目标：
/// - **可分层定位**：传输 / HTTP / 服务端 / 解码 / 业务 / 缓存
/// - **便于策略化处理**：是否可重试、是否可忽略、是否需要弹窗、是否要上报
///
/// 约定：
/// - `data` 尽量保存**原始响应体**（若存在），方便排查与二次解析。
/// - `statusCode` 为 HTTP 状态码（例如 404/500）。
public enum JobsError: Error {
    /// HTTP 协议层错误（**仅状态码维度**，不包含业务语义）。
    ///
    /// 使用场景：
    /// - 收到 HTTP 响应，但状态码不在 `200...299`。
    /// - 你不确定这是“服务端故障”还是“业务错误”，先用该 case 承载。
    ///
    /// 建议处理：
    /// - 通常可按 `statusCode` 做兜底策略（如 401 重新登录、5xx 重试、4xx 提示）。
    /// - 若上层需要区分“服务端不可用”，可在映射层将部分状态码升级为 `.server`。
    case http(statusCode: Int, data: Data?)
    /// 传输层错误：网络不可达、超时、DNS、TLS、连接断开、取消等（无有效 HTTP 响应）。
    ///
    /// 使用场景：
    /// - `URLSession` / Alamofire 抛出的底层错误
    /// - 取消请求（可映射为 `.cancelled`，也可以归入此处）
    ///
    /// 建议处理：
    /// - 多数情况下可重试（取决于 `underlying`，如超时/断网）。
    case transport(underlying: Error)
    /// 服务端层错误：服务端不可用、网关错误、限流等（**偏“服务端侧故障/不可用”语义**）。
    ///
    /// 使用场景（建议约定清晰，避免与 `.http` 混用）：
    /// - `5xx`（服务端异常）
    /// - `429`（限流）
    /// - `503/504`（服务不可用/网关超时）
    ///
    /// 建议处理：
    /// - 通常可重试（可结合退避、熔断、降级）。
    case server(statusCode: Int, data: Data?)
    /// 解码层错误：响应体存在，但解析/解码失败（JSON 格式错误、结构不匹配等）。
    ///
    /// 使用场景：
    /// - `Decodable` 解析失败
    ///
    /// 建议处理：
    /// - 一般不重试（除非确认是服务端返回偶发脏数据）
    /// - `data` 建议保留，便于定位真实响应内容
    case decode(underlying: Error, data: Data?)
    /// 业务层错误：服务端返回明确的业务错误 code/msg（**永不自动重试**）。
    ///
    /// 使用场景：
    /// - 响应 JSON 解析成功，但业务 code 表示失败（例如余额不足、权限不足等）
    ///
    /// 建议处理：
    /// - 直接提示用户或走业务兜底逻辑
    case business(code: Int, message: String, data: Data?)
    /// 缓存未命中：仅用于 cacheOnly / 纯缓存读取场景。
    ///
    /// 建议处理：
    /// - 由上层决定是否触发网络请求或提示“无缓存”
    case cacheMiss
    /// 已取消：主动取消请求后返回。
    ///
    /// 建议处理：
    /// - 通常可忽略，不计入错误上报（由业务自行决定）
    case cancelled
    /// 兜底未知错误：不在以上分类的异常。
    ///
    /// 建议处理：
    /// - 上报（日志/埋点），并做统一兜底提示
    case unknown(underlying: Error)
    /// 是否允许作为“可取消”错误对待（例如 UI 层可以静默处理）。
    public var isCancellable: Bool {
        if case .cancelled = self { return true }
        return false
    }
    /// 是否为业务错误（通常不自动重试）。
    public var isBusiness: Bool {
        if case .business = self { return true }
        return false
    }
}
