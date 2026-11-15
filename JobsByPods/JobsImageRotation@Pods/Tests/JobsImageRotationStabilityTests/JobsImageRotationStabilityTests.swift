//
//  JobsImageRotationStabilityTests.swift
//  JobsImageRotation
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsSwiftDSL
@testable import JobsImageRotation

final class JobsImageRotationStabilityTests: XCTestCase {

    @MainActor
    func testRotatorRepairsInvalidIntervalsAndRestoresTheOriginalTransform() {
        let original = CGAffineTransform(scaleX: 2, y: 3)
        let view = UIView.jobsMake { _ in }.byTransform(original)
        let rotator = JobsImageRotator(targetView: view, interval: .nan)

        XCTAssertEqual(rotator.interval, JobsImageRotator.defaultInterval)
        rotator.interval = -1
        XCTAssertEqual(rotator.interval, JobsImageRotator.defaultInterval)
        rotator.interval = 0.125
        XCTAssertEqual(rotator.interval, 0.125)
        view.byTransform(.identity)
        XCTAssertTrue(rotator.stop() === rotator)
        XCTAssertEqual(view.transform, original)
    }

    func testDirectionsUseOppositeAngularSigns() {
        XCTAssertEqual(JobsImageRotationDirection.clockwise.angularMultiplier, 1)
        XCTAssertEqual(JobsImageRotationDirection.counterclockwise.angularMultiplier, -1)
    }
}
