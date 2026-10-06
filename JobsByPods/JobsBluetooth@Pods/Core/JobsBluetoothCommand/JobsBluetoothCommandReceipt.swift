//
//  JobsBluetoothCommandReceipt.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

public struct JobsBluetoothCommandReceipt {
    public enum Confirmation {
        case submitted
        case writeAcknowledged
        case applicationResponse
    }

    public let confirmation: Confirmation
    public let data: Data
}
