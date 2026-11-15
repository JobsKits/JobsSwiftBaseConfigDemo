//
//  JobsWorkerStabilityTests.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftWorker

final class JobsWorkerStabilityTests: XCTestCase {

    func testMapAndFilterReceiveOnlyEligibleUpdates() {
        let source = JobsObservable(1)
        let mapped = source.map { $0 * 2 }
        let filtered = source.filter { $0.isMultiple(of: 2) }
        XCTAssertEqual(mapped.value, 2)
        source.accept(2).accept(3)
        XCTAssertEqual(mapped.value, 6)
        XCTAssertEqual(filtered.value, 2)
    }

    func testOnceDisposesBeforeReentrantSourceUpdate() {
        let source = JobsObservable(0)
        let fired = expectation(description: "once callback")
        fired.assertForOverFulfill = true
        let worker = JobsWorkerFactory.once(source) { change in
            XCTAssertEqual(change.newValue, 1)
            source.accept(2)
            fired.fulfill()
        }
        source.accept(1).accept(3)
        XCTAssertTrue(worker.isDisposed)
        wait(for: [fired], timeout: 1)
    }

    func testDerivedObservableDoesNotRetainItselfThroughUpstream() {
        let source = JobsObservable(1)
        weak var released: JobsObservable<Int>?
        do {
            let derived = source.map { $0 + 1 }
            released = derived
            XCTAssertEqual(derived.value, 2)
        }
        XCTAssertNil(released)
        XCTAssertEqual(source.accept(4).value, 4)
    }
}
