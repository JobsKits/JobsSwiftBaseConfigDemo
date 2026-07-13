//
//  JobsBluetoothCommand.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import Foundation

/// 一条可排队、可超时、可重试、可匹配通知响应的命令。
public final class JobsBluetoothCommand {
    public var identifier = UUID().uuidString
    public var payload = Data()
    public var timeout: TimeInterval = 5
    public var retryCount = 0
    public var priority = 0
    public var responseMatcher: ((Data) -> Bool)?

    public init() {}

    @discardableResult public func byIdentifier(_ value: String) -> Self { identifier = value;return self }
    @discardableResult public func byPayload(_ value: Data) -> Self { payload = value;return self }
    @discardableResult public func byTimeout(_ value: TimeInterval) -> Self { timeout = max(0, value);return self }
    @discardableResult public func byRetryCount(_ value: Int) -> Self { retryCount = max(0, value);return self }
    @discardableResult public func byPriority(_ value: Int) -> Self { priority = value;return self }
    @discardableResult public func byResponseMatcher(_ value: @escaping (Data) -> Bool) -> Self { responseMatcher = value;return self }
}
