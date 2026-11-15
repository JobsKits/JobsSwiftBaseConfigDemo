//
//  JobsTimerStabilityTests.swift
//  JobsSwiftTimer
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftTimer

final class JobsTimerStabilityTests: XCTestCase {

    func testTimerConfigurationNormalizesInvalidAndOversizedValues() {
        let invalid = JobsSwiftTimerConfig(interval: .nan, tolerance: .infinity)
        XCTAssertEqual(invalid.interval, 1)
        XCTAssertEqual(invalid.tolerance, 0)
        let small = JobsSwiftTimerConfig(interval: -1, tolerance: 10)
        XCTAssertEqual(small.interval, 0.000_001)
        XCTAssertEqual(small.tolerance, small.interval)
        let large = JobsSwiftTimerConfig(interval: .greatestFiniteMagnitude,
                                         tolerance: .greatestFiniteMagnitude)
        XCTAssertEqual(large.interval, 1_000_000_000)
        XCTAssertEqual(large.tolerance, large.interval)
    }

    func testNormalizationAlsoCoversConfigurationMutatedAfterInitialization() {
        var configuration = JobsSwiftTimerConfig()
        configuration.interval = .infinity
        configuration.tolerance = -1
        XCTAssertEqual(configuration.normalized.interval, 1)
        XCTAssertEqual(configuration.normalized.tolerance, 0)
    }

    func testCountdownStartsWithConsistentSnapshotWithoutStartingATimer() {
        let countdown = JobsSwiftTimerCountdown(duration: 20, kind: .gcd)
        XCTAssertEqual(countdown.state, .idle)
        XCTAssertEqual(countdown.snapshot.total, 20)
        XCTAssertEqual(countdown.snapshot.remaining, 20)
        XCTAssertEqual(countdown.snapshot.progress(for: .countUp), 0)
        XCTAssertEqual(countdown.snapshot.progress(for: .countDown), 1)
        let empty = JobsSwiftTimerCountdown(duration: -.infinity, kind: .gcd)
        XCTAssertEqual(empty.snapshot.total, 0)
        XCTAssertEqual(empty.snapshot.remaining, 0)
        XCTAssertEqual(empty.snapshot.progress(for: .countUp), 1)
    }
}
