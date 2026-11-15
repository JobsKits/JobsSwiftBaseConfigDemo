//
//  JobsLuckyEnvelopeRainStabilityTests.swift
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
@testable import JobsLuckyEnvelopeRain

final class JobsLuckyEnvelopeRainStabilityTests: XCTestCase {

    func testRainNormalizationBoundsAllocationAndRepairsNonfiniteInputs() {
        let config = RedPacketRainConfig(spawnInterval: .infinity,
                                           minFallDuration: 8,
                                           maxFallDuration: 2,
                                           packetSize: CGSize(width: CGFloat.nan, height: 2_048),
                                           maxConcurrentCount: Int.max,
                                           spawnInsets: UIEdgeInsets(top: 0, left: -1, bottom: 0, right: .infinity))
            .normalized

        XCTAssertEqual(config.spawnInterval, 0.25)
        XCTAssertEqual(config.minFallDuration, 2)
        XCTAssertEqual(config.maxFallDuration, 8)
        XCTAssertEqual(config.packetSize, CGSize(width: 44, height: 1_024))
        XCTAssertEqual(config.maxConcurrentCount, 500)
        XCTAssertEqual(config.spawnInsets.left, 0)
        XCTAssertEqual(config.spawnInsets.right, 10)
    }

    func testRainCanDisableAllConcurrentPackets() {
        let config = RedPacketRainConfig(maxConcurrentCount: -1).normalized

        XCTAssertEqual(config.maxConcurrentCount, 0)
    }
}
