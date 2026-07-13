//
//  JobsBluetoothState.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

import Foundation

public enum JobsBluetoothState: Int, Sendable {
    case unknown
    case unavailable
    case idle
    case scanning
    case connecting
    case discovering
    case ready
    case disconnecting
    case reconnecting
    case failed
}

public enum JobsBluetoothError: LocalizedError {
    case bluetoothUnavailable
    case peripheralNotFound
    case characteristicNotFound
    case connectionTimeout
    case commandTimeout
    case cancelled
    case invalidPacket

    public var errorDescription: String? {
        switch self {
        case .bluetoothUnavailable: return "系统蓝牙不可用"
        case .peripheralNotFound: return "没有找到目标外设"
        case .characteristicNotFound: return "没有找到目标特征"
        case .connectionTimeout: return "连接超时"
        case .commandTimeout: return "命令超时"
        case .cancelled: return "操作已取消"
        case .invalidPacket: return "数据包格式无效"
        }
    }
}
