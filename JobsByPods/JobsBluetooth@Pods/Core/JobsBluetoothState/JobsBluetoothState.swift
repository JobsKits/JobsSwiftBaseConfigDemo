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
        /// 处理 .bluetoothUnavailable 分支
        case .bluetoothUnavailable: return "系统蓝牙不可用"
        /// 处理 .peripheralNotFound 分支
        case .peripheralNotFound: return "没有找到目标外设"
        /// 处理 .characteristicNotFound 分支
        case .characteristicNotFound: return "没有找到目标特征"
        /// 处理 .connectionTimeout 分支
        case .connectionTimeout: return "连接超时"
        /// 处理 .commandTimeout 分支
        case .commandTimeout: return "命令超时"
        /// 处理 .cancelled 分支
        case .cancelled: return "操作已取消"
        /// 处理 .invalidPacket 分支
        case .invalidPacket: return "数据包格式无效"
        }
    }
}
