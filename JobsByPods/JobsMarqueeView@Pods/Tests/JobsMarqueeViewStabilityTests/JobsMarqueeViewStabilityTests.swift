//
//  JobsMarqueeViewStabilityTests.swift
//  JobsMarqueeView
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsByUIKit
import JobsMarqueeView

final class JobsMarqueeViewStabilityTests: XCTestCase {

    @MainActor
    func testEmptyDataDoesNotStartAnAutomaticTimer() {
        let marquee = JobsMarqueeView.jobsMake { _ in }
        marquee.start()
        marquee.pause()
        marquee.resume()

        XCTAssertFalse(marquee.isRunning)
        XCTAssertTrue(marquee.dataSourceButtons.isEmpty)
        marquee.stop()
        XCTAssertFalse(marquee.isRunning)
    }

    @MainActor
    func testFillBoundsManualModeEnablesPagingAndCanBeDisabled() throws {
        let marquee = JobsMarqueeView.jobsMake { _ in }
            .byItemSizeMode(.fillBounds)
            .byManualScrollEnabled(true)
        let scrollView = try XCTUnwrap(marquee.subviews.compactMap { $0 as? UIScrollView }.first)

        XCTAssertTrue(scrollView.isScrollEnabled)
        XCTAssertTrue(scrollView.isPagingEnabled)
        marquee.byManualScrollEnabled(false)
        XCTAssertFalse(scrollView.isScrollEnabled)
        XCTAssertFalse(scrollView.isPagingEnabled)
    }
}
