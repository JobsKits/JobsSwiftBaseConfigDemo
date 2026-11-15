//
//  JobsByQuartzCoreStabilityTests.swift
//  JobsByQuartzCore
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import QuartzCore
import XCTest
import JobsByQuartzCore

final class JobsByQuartzCoreStabilityTests: XCTestCase {

    @MainActor
    func testBridgeExportsLayerDSLAndKeepsLayerIdentity() {
        let layer = CALayer.jobsMake { _ in }
        let configured = layer
            .byOpacity(0.25)
            .byCornerRadius(12)

        XCTAssertTrue(configured === layer)
        XCTAssertEqual(layer.opacity, 0.25)
        XCTAssertEqual(layer.cornerRadius, 12)
    }
}
