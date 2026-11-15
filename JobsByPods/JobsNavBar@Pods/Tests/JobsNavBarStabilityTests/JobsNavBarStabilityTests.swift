//
//  JobsNavBarStabilityTests.swift
//  JobsNavBar
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsNavBar

final class JobsNavBarStabilityTests: XCTestCase {

    @MainActor
    func testLoadingTitleCanRefreshWithoutWebViewOrNavigationHost() {
        let bar = JobsNavBar()
        bar.showLoadingTitle("等待本地内容")
        XCTAssertEqual(bar.titleLabel.attributedText?.string, "等待本地内容")
        XCTAssertNil(bar.titleProvider)
        bar.jobsNavBarRefresh()
        XCTAssertEqual(bar.titleLabel.attributedText?.string, "等待本地内容")
    }

    @MainActor
    func testHairlineStyleAppliesAtConstruction() {
        var style = JobsNavBar.Style()
        style.hairlineHidden = true
        style.contentHeight = 52
        let bar = JobsNavBar(style: style)
        XCTAssertTrue(bar.hairline.isHidden)
        XCTAssertEqual(bar.style.contentHeight, 52)
    }
}
