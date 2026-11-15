//
//  JobsCountdownButtonStabilityTests.swift
//  JobsCountdownButton
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsCountdownButton

final class JobsCountdownButtonStabilityTests: XCTestCase {

    func testDefaultConfigurationCountsDownWithoutAllowingRepeatedTaps() {
        let config = JobsCountdownBtnConfig()
        guard case .down(let seconds) = config.mode else {
            XCTFail("默认模式必须倒计时")
            return
        }

        XCTAssertEqual(seconds, 60)
        XCTAssertEqual(config.interval, 1)
        XCTAssertTrue(config.renderOnInit)
        XCTAssertFalse(config.clickableWhileRunning)
        XCTAssertNil(config.onFinish)
    }

    @MainActor
    func testConfigurationRendererRetainsItsTypedClosure() {
        var config = JobsCountdownBtnConfig()
        config.renderConfiguration = { seconds, original in
            var result = original
            result.title = "\(seconds)s"
            return result
        }
        let original = UIButton.Configuration.plain()
        let rendered = config.renderConfiguration?(7, original)

        XCTAssertEqual(rendered?.title, "7s")
        XCTAssertNil(original.title)
        config.renderConfiguration = nil
        XCTAssertNil(config.renderConfiguration)
    }
}
