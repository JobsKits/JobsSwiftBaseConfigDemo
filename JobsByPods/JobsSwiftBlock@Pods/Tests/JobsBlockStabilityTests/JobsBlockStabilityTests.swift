//
//  JobsBlockStabilityTests.swift
//  JobsSwiftBlock
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest

import JobsSwiftBlock

final class JobsBlockStabilityTests: XCTestCase {

    private final class Host: JobsCallbackable {}

    private final class Capture {

        let onRelease: () -> Void

        init(onRelease: @escaping () -> Void) {
            self.onRelease = onRelease
        }

        deinit {
            onRelease()
        }
    }

    func testTypedCallbackReplacementAndRemoval() {
        let host = Host().jobsBy("sum", { (left: Int, right: Int) in left + right })
        let sum: Int? = host.jobsCall("sum", 2, 3)
        XCTAssertEqual(sum, 5)
        let incompatible: (() -> Int)? = host.jobs_callback("sum")
        XCTAssertNil(incompatible)
        host.jobsBy("sum", Optional<(Int, Int) -> Int>.none)
        let removed: Int? = host.jobsCall("sum", 2, 3)
        XCTAssertNil(removed)
    }

    func testReplacedCaptureCanReenterStorageDuringRelease() {
        let host = Host()
        var releases = 0
        var owner: Capture? = Capture { [weak host] in
            let replacement: (() -> Int)? = host?.jobs_callback("value")
            XCTAssertEqual(replacement?(), 9)
            releases += 1
        }
        weak var released = owner
        host.jobsBy("value", { [capture = owner] in
            withExtendedLifetime(capture) {}
        })
        owner = nil
        XCTAssertNotNil(released)
        host.jobsBy("value", { 9 })
        XCTAssertNil(released)
        XCTAssertEqual(releases, 1)
    }
}
