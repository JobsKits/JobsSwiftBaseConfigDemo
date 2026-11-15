//
//  JobsDSLStabilityTests.swift
//  JobsSwiftDSL
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsSwiftBlock
import JobsSwiftDSL

final class JobsDSLStabilityTests: XCTestCase {

    @MainActor
    func testViewChainKeepsSubclassAndNormalizesCornerRadius() {
        let label = UILabel.jobsMake { _ in }
        let configured = label
            .byText("链式配置")
            .byNumberOfLines(2)
            .byCornerRadius(-8)
            .byHidden(true)
        XCTAssertTrue(configured === label)
        XCTAssertEqual(configured.text, "链式配置")
        XCTAssertEqual(configured.numberOfLines, 2)
        XCTAssertEqual(configured.layer.cornerRadius, 0)
        XCTAssertTrue(configured.isHidden)
    }

    @MainActor
    func testOptionalControlFlagsAndToggleHaveConsistentSemantics() {
        let control = UIControl.jobsMake { _ in }
            .byEnabled(nil)
            .bySelected(nil)
            .byToggleSelected()
        XCTAssertFalse(control.isEnabled)
        XCTAssertTrue(control.isSelected)
        control.byToggleSelected()
        XCTAssertFalse(control.isSelected)
    }
}
