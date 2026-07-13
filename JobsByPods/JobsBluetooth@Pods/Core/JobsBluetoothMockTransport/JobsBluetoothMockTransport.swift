//
//  JobsBluetoothMockTransport.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import Foundation

/// 模拟器和单元测试使用的确定性 Transport。
public final class JobsBluetoothMockTransport {
    public var latency: TimeInterval = 0.15
    public var enabled = true

    public init() {}

    @discardableResult public func byLatency(_ value: TimeInterval) -> Self { latency = max(0, value);return self }
    @discardableResult public func byEnabled(_ value: Bool) -> Self { enabled = value;return self }

    public func advertisements() -> [JobsBluetoothPeripheral] {
        [
            JobsBluetoothPeripheral(identifier: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!, name: "Jobs Sensor", RSSI: -42, advertisementData: ["mock": "true"]),
            JobsBluetoothPeripheral(identifier: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!, name: "Jobs Light", RSSI: -67, advertisementData: ["mock": "true"]),
            JobsBluetoothPeripheral(identifier: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!, name: "Jobs OTA", RSSI: -81, advertisementData: ["mock": "true"])
        ]
    }

    public func echo(_ data: Data, completion: @escaping (Data) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + latency) { completion(data) }
    }
}
