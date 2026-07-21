//
//  JobsSwiftBaseConfigDemoTests.swift
//  JobsSwiftBaseConfigDemoTests
//
//  Created by Jobs on 2026年7月16日，星期四.
//

import UIKit
import XCTest
import JobsSwiftTimer
import JobsSwiftTimerMgr

private final class JobsTimerTestProbe: @unchecked Sendable {
    private let lock = NSLock()
    private var activeCallbacks = 0
    private var callbackCount = 0
    private var maximumConcurrentCallbacks = 0

    func beginCallback(targetCount: Int) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        activeCallbacks += 1
        callbackCount += 1
        maximumConcurrentCallbacks = max(maximumConcurrentCallbacks, activeCallbacks)
        return callbackCount == targetCount
    }

    func endCallback() {
        lock.lock()
        activeCallbacks -= 1
        lock.unlock()
    }

    var maximumConcurrency: Int {
        lock.lock()
        defer { lock.unlock() };return maximumConcurrentCallbacks
    }
}

private final class JobsTimerTestClock: @unchecked Sendable {
    private let lock = NSLock()
    private var value: TimeInterval = 0

    func read() -> TimeInterval {
        lock.lock()
        defer { lock.unlock() };return value
    }

    func set(_ newValue: TimeInterval) {
        lock.lock()
        value = newValue
        lock.unlock()
    }
}

final class JobsSwiftBaseConfigDemoTests: XCTestCase {
    func testTimerConfigNormalizesInvalidValues() {
        let config = JobsSwiftTimerConfig(
            interval: .infinity,
            tolerance: .nan,
            callbackDeliveryPolicy: .dropIfBusy
        )

        XCTAssertEqual(config.interval, 1)
        XCTAssertEqual(config.tolerance, 0)
        XCTAssertEqual(config.callbackDeliveryPolicy, .dropIfBusy)
    }

    func testAllTimerEnginesCanStartAndStop() {
        [JobsTimerKind.gcd, .foundation, .displayLink, .runLoop].forEach { kind in
            let timer = JobsTimer(
                kind: kind,
                config: JobsSwiftTimerConfig(
                    interval: 60,
                    queue: .main,
                    pauseInBackground: false,
                    autoManageAppState: false
                )
            ) {}
            timer.start()
            XCTAssertTrue(timer.isRunning, "kind=\(kind)")
            timer.stop()
            XCTAssertFalse(timer.isRunning, "kind=\(kind)")
        }
    }

    func testOneShotDeliversTickBeforeFinish() {
        let finished = expectation(description: "one-shot finished")
        let lock = NSLock()
        var events: [String] = []
        let timer = JobsTimer(
            kind: .gcd,
            config: JobsSwiftTimerConfig(
                interval: 0.01,
                repeats: false,
                queue: .global(qos: .userInitiated),
                pauseInBackground: false,
                autoManageAppState: false
            )
        ) {
            lock.lock()
            events.append("tick")
            lock.unlock()
        }.onFinish {
            lock.lock()
            events.append("finish")
            lock.unlock()
            finished.fulfill()
        }
        timer.start()

        wait(for: [finished], timeout: 2)
        lock.lock()
        let deliveredEvents = events
        lock.unlock()
        XCTAssertEqual(deliveredEvents, ["tick", "finish"])
        XCTAssertFalse(timer.isRunning)
    }

    func testDropIfBusySerializesSlowCallbacks() {
        assertSlowCallbacksAreSerialized(policy: .dropIfBusy)
    }

    func testCoalesceLatestSerializesSlowCallbacks() {
        assertSlowCallbacksAreSerialized(policy: .coalesceLatest)
    }

    func testCountdownUsesMonotonicElapsedTimeAndFinishesOnce() {
        let clock = JobsTimerTestClock()
        let finished = expectation(description: "countdown finished")
        finished.expectedFulfillmentCount = 1
        let countdown = JobsSwiftTimerCountdown(
            duration: 1,
            kind: .gcd,
            tickInterval: 0.005,
            queue: .global(qos: .userInitiated),
            timeProvider: { clock.read() }
        ).byFinished { snapshot in
            XCTAssertEqual(snapshot.elapsed, 1, accuracy: 0.000_001)
            XCTAssertEqual(snapshot.remaining, 0, accuracy: 0.000_001)
            finished.fulfill()
        }
        countdown.start()
        clock.set(2)

        wait(for: [finished], timeout: 2)
        XCTAssertEqual(countdown.state, .finished)
        XCTAssertEqual(countdown.snapshot.progress, 1, accuracy: 0.000_001)
    }

    func testTimerResumesOnlyAfterAutomaticPause() {
        let timer = JobsTimer(
            kind: .gcd,
            config: JobsSwiftTimerConfig(
                interval: 60,
                queue: .main,
                pauseInBackground: true,
                autoManageAppState: true
            )
        ) {}
        timer.start()
        XCTAssertTrue(timer.isRunning)

        NotificationCenter.default.post(
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        XCTAssertFalse(timer.isRunning)

        NotificationCenter.default.post(
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        XCTAssertTrue(timer.isRunning)

        timer.pause()
        NotificationCenter.default.post(
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        XCTAssertFalse(timer.isRunning)
        timer.stop()
    }

    func testManagedTimerHandleKeepsManagerPauseStateInSync() throws {
        let identifier = "tests.managed.\(UUID().uuidString)"
        let manager = JobsSwiftTimerMgr()
        defer { _ = try? manager.act(.cancel, identifier: identifier) }
        let timer = try manager.create(
            kind: .gcd,
            identifier: identifier,
            config: JobsSwiftTimerConfig(interval: 60, queue: .main),
            backgroundPolicy: .pauseAndResume
        ) {}
        timer.start()
        XCTAssertTrue(timer.isRunning)

        NotificationCenter.default.post(
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        XCTAssertFalse(timer.isRunning)

        timer.pause()
        NotificationCenter.default.post(
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
        XCTAssertFalse(timer.isRunning)
    }

    func testReplacedManagedHandleCannotRestartOldTimer() throws {
        let identifier = "tests.replace.\(UUID().uuidString)"
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        defer { _ = try? manager.act(.cancel, identifier: identifier) }
        let config = JobsSwiftTimerConfig(
            interval: 60,
            queue: .main,
            pauseInBackground: false
        )
        let oldTimer = try manager.create(
            kind: .gcd,
            identifier: identifier,
            config: config,
            backgroundPolicy: .ignore
        ) {}
        let currentTimer = try manager.create(
            kind: .gcd,
            identifier: identifier,
            config: config,
            backgroundPolicy: .ignore
        ) {}

        oldTimer.start()
        currentTimer.start()
        XCTAssertFalse(oldTimer.isRunning)
        XCTAssertTrue(currentTimer.isRunning)
    }

    func testManagedFireOnceRemovesRegistrationBeforeDelivery() throws {
        let identifier = "tests.fire-once.\(UUID().uuidString)"
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        let delivered = expectation(description: "managed fire once")
        let timer = try manager.create(
            kind: .gcd,
            identifier: identifier,
            config: JobsSwiftTimerConfig(
                interval: 60,
                queue: .global(qos: .userInitiated),
                pauseInBackground: false,
                autoManageAppState: false
            ),
            backgroundPolicy: .ignore
        ) {
            delivered.fulfill()
        }
        timer.fireOnce()

        XCTAssertNil(manager.timer(for: identifier))
        wait(for: [delivered], timeout: 2)
    }

    func testConcurrentManagedActionsConvergeToFinalPause() throws {
        let identifier = "tests.concurrent.\(UUID().uuidString)"
        let manager = JobsSwiftTimerMgr(managesAppState: false)
        let timer = try manager.create(
            kind: .gcd,
            identifier: identifier,
            config: JobsSwiftTimerConfig(
                interval: 60,
                queue: .global(qos: .utility),
                pauseInBackground: false,
                autoManageAppState: false
            ),
            backgroundPolicy: .ignore
        ) {}
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "tests.timer-manager", attributes: .concurrent)
        for index in 0..<100 {
            group.enter()
            queue.async {
                defer { group.leave() }
                switch index % 3 {
                case 0:
                    timer.start()
                case 1:
                    timer.pause()
                default:
                    timer.resume()
                }
            }
        }
        XCTAssertEqual(group.wait(timeout: .now() + 3), .success)

        timer.pause()
        XCTAssertFalse(timer.isRunning)
        XCTAssertNotNil(manager.timer(for: identifier))
        timer.stop()
    }

    private func assertSlowCallbacksAreSerialized(
        policy: JobsTimerCallbackDeliveryPolicy,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let callbackQueue = DispatchQueue(
            label: "tests.timer-callback.\(UUID().uuidString)",
            attributes: .concurrent
        )
        let probe = JobsTimerTestProbe()
        let received = expectation(description: "slow callbacks \(policy)")
        let timer = JobsTimer(
            kind: .gcd,
            config: JobsSwiftTimerConfig(
                interval: 0.001,
                queue: callbackQueue,
                callbackDeliveryPolicy: policy,
                pauseInBackground: false,
                autoManageAppState: false
            )
        ) {
            let reachedTarget = probe.beginCallback(targetCount: 4)
            Thread.sleep(forTimeInterval: 0.015)
            probe.endCallback()
            if reachedTarget {
                received.fulfill()
            }
        }
        timer.start()
        wait(for: [received], timeout: 3)
        timer.stop()
        callbackQueue.sync(flags: .barrier) {}

        XCTAssertEqual(probe.maximumConcurrency, 1, file: file, line: line)
    }
}
