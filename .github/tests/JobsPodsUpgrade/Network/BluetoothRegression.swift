//
//  BluetoothRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

@main
struct BluetoothRegression {
    static func main() async throws {
        let profile = JobsBluetoothProfile().byScanTimeout(0.12)
        let mock = JobsBluetoothMockTransport().byLatency(0.02)
        let manager = JobsBluetoothManager(profile: profile, mockTransport: mock)
        manager.startScan()
        precondition(manager.discoveredPeripherals.count == 3)
        try await Task.sleep(nanoseconds: 40_000_000)
        manager.stopScan()
        manager.startScan()
        try await Task.sleep(nanoseconds: 90_000_000)
        precondition(manager.state == .scanning)
        try await Task.sleep(nanoseconds: 50_000_000)
        precondition(manager.state == .idle)
        let identifier = mock.advertisements()[0].identifier
        manager.connect(identifier: identifier)
        precondition(manager.state == .ready)
        let echoed = try await send(manager, JobsBluetoothCommand().byPayload(Data([1])).byTimeout(0.1))
        precondition(echoed.confirmation == .applicationResponse && echoed.data == Data([1]))
        let matched = try await send(manager, JobsBluetoothCommand().byPayload(Data([2])).byTimeout(0.1)
            .byResponseMatcher { $0 == Data([2]) })
        precondition(matched.data == Data([2]))
        mock.dropsResponses = true
        do {
            _ = try await send(manager, JobsBluetoothCommand().byPayload(Data([3])).byTimeout(0.02).byRetryCount(2))
            preconditionFailure("Dropped response must time out")
        } catch let error as JobsBluetoothError {
            if case .commandTimeout = error { } else { preconditionFailure("Wrong error") }
        }
        mock.dropsResponses = false
        var order: [UInt8] = []
        await withCheckedContinuation { continuation in
            for (value, priority) in [(UInt8(1), 0), (UInt8(2), 0), (UInt8(3), 10)] {
                manager.send(JobsBluetoothCommand().byPayload(Data([value])).byPriority(priority)) { result in
                    if case .success(let response) = result {
                        order.append(response[0])
                        if order.count == 3 { continuation.resume() }
                    } else { preconditionFailure("Mock queue failed") }
                }
            }
        }
        precondition(order == [1, 3, 2])
        var cancelled = 0
        mock.latency = 0.08
        manager.send(JobsBluetoothCommand().byPayload(Data([4]))) { result in
            if case .failure(let error) = result, let error = error as? JobsBluetoothError,
               case .cancelled = error { cancelled += 1 }
        }
        manager.disconnect()
        manager.connect(identifier: identifier)
        try await Task.sleep(nanoseconds: 100_000_000)
        precondition(cancelled == 1 && manager.state == .ready)
        try await verifyReentrantResponse(manager, mock: mock, identifier: identifier, usesDecoder: false)
        try await verifyReentrantResponse(manager, mock: mock, identifier: identifier, usesDecoder: true)
        let releaseMock = JobsBluetoothMockTransport().byLatency(0.08)
        var releasable: JobsBluetoothManager? = JobsBluetoothManager(mockTransport: releaseMock)
        weak var weakManager = releasable
        releasable?.connect(identifier: identifier)
        var releasedCancellation = 0
        releasable?.send(JobsBluetoothCommand().byPayload(Data([5]))) { result in
            if case .failure = result { releasedCancellation += 1 }
        }
        releasable = nil
        try await Task.sleep(nanoseconds: 100_000_000)
        precondition(weakManager == nil && releasedCancellation == 1)
        print("BluetoothRegression: scan restart, Mock matcher/timeout/retry, priority ordering, disconnect/late echo, decoder/matcher reentrancy, owner release passed")
    }

    static func verifyReentrantResponse(_ manager: JobsBluetoothManager,
                                        mock: JobsBluetoothMockTransport,
                                        identifier: UUID,
                                        usesDecoder: Bool) async throws {
        mock.latency = 0.01
        mock.dropsResponses = false
        var cancelled = 0
        var oldDataPublished = 0
        manager.dataReceived = { _, _ in oldDataPublished += 1 }
        await withCheckedContinuation { continuation in
            let reconnectAndSend = {
                manager.profile.decoder = nil
                manager.disconnect()
                manager.connect(identifier: identifier)
                mock.dropsResponses = true
                manager.sendReliably(JobsBluetoothCommand().byPayload(Data([7])).byTimeout(0.03)
                    .byResponseMatcher { _ in true }) { result in
                    if case .failure(let error) = result, let error = error as? JobsBluetoothError,
                       case .commandTimeout = error {
                        continuation.resume()
                    } else {
                        preconditionFailure("Old callback completed the new command")
                    }
                }
            }
            let old = JobsBluetoothCommand().byPayload(Data([6])).byTimeout(0.1)
            if usesDecoder {
                manager.profile.decoder = { _ in
                    reconnectAndSend()
                    return NSNull()
                }
            } else {
                old.responseMatcher = { _ in
                    reconnectAndSend()
                    return true
                }
            }
            manager.sendReliably(old) { result in
                if case .failure(let error) = result, let error = error as? JobsBluetoothError,
                   case .cancelled = error {
                    cancelled += 1
                } else {
                    preconditionFailure("Replaced command must be cancelled")
                }
            }
        }
        precondition(cancelled == 1)
        if usesDecoder { precondition(oldDataPublished == 0) }
        manager.dataReceived = nil
        mock.dropsResponses = false
    }

    static func send(_ manager: JobsBluetoothManager, _ command: JobsBluetoothCommand) async throws -> JobsBluetoothCommandReceipt {
        try await withCheckedThrowingContinuation { continuation in
            manager.sendReliably(command) { continuation.resume(with: $0) }
        }
    }
}
