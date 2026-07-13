//
//  JobsBluetoothProfile.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import CoreBluetooth
import Foundation

/// 描述一种设备的 UUID、超时、重连和协议编解码策略。
public final class JobsBluetoothProfile {
    public var identifier = "default"
    public var serviceUUIDs: [CBUUID] = []
    public var writeCharacteristicUUID: CBUUID?
    public var notifyCharacteristicUUID: CBUUID?
    public var readCharacteristicUUID: CBUUID?
    public var scanTimeout: TimeInterval = 10
    public var connectTimeout: TimeInterval = 12
    public var maximumReconnectCount = 3
    public var allowDuplicates = false
    public var encoder: ((Any?) throws -> Data)?
    public var decoder: ((Data) throws -> Any)?

    public init() {}

    @discardableResult public func byIdentifier(_ value: String) -> Self { identifier = value;return self }
    @discardableResult public func byServiceUUIDStrings(_ values: [String]) -> Self { serviceUUIDs = values.map(CBUUID.init(string:));return self }
    @discardableResult public func byWriteUUIDString(_ value: String) -> Self { writeCharacteristicUUID = CBUUID(string: value);return self }
    @discardableResult public func byNotifyUUIDString(_ value: String) -> Self { notifyCharacteristicUUID = CBUUID(string: value);return self }
    @discardableResult public func byReadUUIDString(_ value: String) -> Self { readCharacteristicUUID = CBUUID(string: value);return self }
    @discardableResult public func byScanTimeout(_ value: TimeInterval) -> Self { scanTimeout = max(0, value);return self }
    @discardableResult public func byConnectTimeout(_ value: TimeInterval) -> Self { connectTimeout = max(0, value);return self }
    @discardableResult public func byMaximumReconnectCount(_ value: Int) -> Self { maximumReconnectCount = max(0, value);return self }
    @discardableResult public func byAllowDuplicates(_ value: Bool) -> Self { allowDuplicates = value;return self }
    @discardableResult public func byEncoder(_ value: @escaping (Any?) throws -> Data) -> Self { encoder = value;return self }
    @discardableResult public func byDecoder(_ value: @escaping (Data) throws -> Any) -> Self { decoder = value;return self }
}
