//
//  JobsBluetoothPeripheral.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import Foundation

/// 业务层使用的不可变外设快照，不直接泄露 CBPeripheral。
public struct JobsBluetoothPeripheral: Hashable, Sendable {
    public let identifier: UUID
    public let name: String
    public let RSSI: Int
    public let advertisementData: [String: String]
    public let connected: Bool

    public init(identifier: UUID,
                name: String,
                RSSI: Int,
                advertisementData: [String: String] = [:],
                connected: Bool = false) {
        self.identifier = identifier
        self.name = name
        self.RSSI = RSSI
        self.advertisementData = advertisementData
        self.connected = connected
    }
}
