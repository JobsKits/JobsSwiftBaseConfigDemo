//
//  BluetoothRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

@main
@MainActor
struct BluetoothRegression {
    static func main() async throws {
        let profile = JobsBluetoothProfile()
        let mock = JobsBluetoothMockTransport().byLatency(0.02)
        let manager = JobsBluetoothManager(profile: profile, mockTransport: mock)
        await verifyScanRestart(manager)
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
        mock.latency = 0.08
        var cancelled = 0
        await waitForCallback("disconnect cancellation") { done in
            manager.send(JobsBluetoothCommand().byPayload(Data([4]))) { result in
                guard case .failure(let error) = result,
                      let error = error as? JobsBluetoothError,
                      case .cancelled = error else {
                    preconditionFailure("Disconnect must cancel the pending command")
                }
                cancelled += 1
                done()
            }
            manager.disconnect()
            manager.connect(identifier: identifier)
        }
        await waitForCallback("late echo checkpoint") { done in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                precondition(cancelled == 1 && manager.state == .ready)
                done()
            }
        }
        try await verifyReentrantResponse(manager, mock: mock, identifier: identifier, usesDecoder: false)
        try await verifyReentrantResponse(manager, mock: mock, identifier: identifier, usesDecoder: true)
        var releasedCancellation = 0
        await waitForCallback("owner release cancellation") { done in
            let releaseMock = JobsBluetoothMockTransport().byLatency(0.08)
            var releasable: JobsBluetoothManager? = JobsBluetoothManager(mockTransport: releaseMock)
            weak var weakManager = releasable
            releasable?.connect(identifier: identifier)
            releasable?.send(JobsBluetoothCommand().byPayload(Data([5]))) { result in
                precondition(weakManager == nil)
                guard case .failure(let error) = result,
                      let error = error as? JobsBluetoothError,
                      case .cancelled = error else {
                    preconditionFailure("Owner release must cancel the pending command")
                }
                releasedCancellation += 1
                done()
            }
            releasable = nil
        }
        await waitForCallback("released owner late echo checkpoint") { done in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                precondition(releasedCancellation == 1)
                done()
            }
        }
        print("BluetoothRegression: scan restart, Mock matcher/timeout/retry, priority ordering, disconnect/late echo, decoder/matcher reentrancy, owner release passed")
    }

    // 在主队列观察生产回调；watchdog 仅拒绝挂死，不把任务唤醒时刻当作业务时序。
    static func waitForCallback(_ label: String,
                                perform: @escaping (@escaping () -> Void) -> Void) async {
        await withCheckedContinuation { continuation in
            let gate = BluetoothCallbackGate()
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                precondition(gate.isCompleted, "Timed out waiting for \(label)")
            }
            DispatchQueue.main.async {
                perform {
                    precondition(gate.complete(), "Duplicate callback for \(label)")
                    continuation.resume()
                }
            }
        }
    }

    // 新扫描不设超时，旧期限之后仍应扫描；再单独等待当前扫描的真实超时事件。
    static func verifyScanRestart(_ manager: JobsBluetoothManager) async {
        await waitForCallback("restarted scan") { done in
            manager.profile.byScanTimeout(0.05)
            manager.startScan()
            precondition(manager.discoveredPeripherals.count == 3)
            manager.stopScan()
            manager.profile.byScanTimeout(0)
            manager.startScan()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                precondition(manager.state == .scanning, "Old scan timeout stopped the new scan")
                manager.stopScan()
                done()
            }
        }
        await waitForCallback("current scan timeout") { done in
            manager.profile.byScanTimeout(0.03)
            manager.onStateChanged { state in
                guard state == .idle else {
                    return
                }
                manager.stateChanged = nil
                done()
            }
            manager.startScan()
        }
        precondition(manager.state == .idle)
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

// watchdog 与主队列回调共用有锁状态，不会因主队列阻塞而一起失效。
private final class BluetoothCallbackGate: @unchecked Sendable {
    private let lock = NSLock()
    private var completed = false

    var isCompleted: Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return completed
    }

    func complete() -> Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        guard !completed else {
            return false
        }
        completed = true
        return true
    }
}
