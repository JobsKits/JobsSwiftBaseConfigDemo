//
//  JobsBluetoothPendingCommand.swift
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

final class JobsBluetoothPendingCommand {
    let identifier: String
    let payload: Data
    let timeout: TimeInterval
    let retryCount: Int
    let priority: Int
    let allowsChunking: Bool
    let matcher: ((Data) -> Bool)?
    let completion: (Result<JobsBluetoothCommandReceipt, Error>) -> Void
    var attempt = 0
    var chunks: [Data] = []
    var nextChunk = 0
    var awaitingWrite = false
    var matchedResponse: Data?
    var timeoutItem: DispatchWorkItem?
    var attemptID = UUID()

    init(_ command: JobsBluetoothCommand,
         completion: @escaping (Result<JobsBluetoothCommandReceipt, Error>) -> Void) {
        identifier = command.identifier
        payload = command.payload
        timeout = command.timeout
        retryCount = min(10, max(0, command.retryCount))
        priority = command.priority
        allowsChunking = command.allowsChunking
        matcher = command.responseMatcher
        self.completion = completion
    }
}
