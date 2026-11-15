//
//  JobsFuseAnimationStabilityTests.swift
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsFuseAnimation

final class JobsFuseAnimationStabilityTests: XCTestCase {

    func testBubbleConfigurationClampsUnsafeAnimationValues() {
        let config = JobsFuseBubbleConfig(emissionInterval: -1,
                                            riseDistance: -1,
                                            horizontalDrift: -1,
                                            duration: -1,
                                            initialScale: -1,
                                            peakScale: -1,
                                            endScale: -1,
                                            maximumRotation: -1,
                                            maximumConcurrentCount: 0)

        XCTAssertEqual(config.emissionInterval, 0.06)
        XCTAssertEqual(config.riseDistance, 24)
        XCTAssertEqual(config.horizontalDrift, 0)
        XCTAssertEqual(config.duration, 0.2)
        XCTAssertEqual(config.initialScale, 0.01)
        XCTAssertEqual(config.peakScale, 0.01)
        XCTAssertEqual(config.endScale, 0.01)
        XCTAssertEqual(config.maximumRotation, 0)
        XCTAssertEqual(config.maximumConcurrentCount, 1)
    }
}
