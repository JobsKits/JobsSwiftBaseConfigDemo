//
//  JobsByWebKitStabilityTests.swift
//  JobsByWebKit
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import WebKit
import XCTest
import JobsByWebKit

final class JobsByWebKitStabilityTests: XCTestCase {

    @MainActor
    func testBridgeExportsConfigurationDSLWithoutCreatingAWebView() {
        let configuration = WKWebViewConfiguration.make { _ in }
        let configured = configuration
            .bySuppressesIncrementalRendering(true)
            .byApplicationNameForUserAgent("JobsStability")
            .byAllowsAirPlayForMediaPlayback(false)

        XCTAssertTrue(configured === configuration)
        XCTAssertTrue(configuration.suppressesIncrementalRendering)
        XCTAssertEqual(configuration.applicationNameForUserAgent, "JobsStability")
        XCTAssertFalse(configuration.allowsAirPlayForMediaPlayback)
    }
}
