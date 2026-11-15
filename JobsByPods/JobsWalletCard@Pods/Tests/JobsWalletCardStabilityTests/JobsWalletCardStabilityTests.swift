//
//  JobsWalletCardStabilityTests.swift
//  JobsWalletCard
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsWalletCard

final class JobsWalletCardStabilityTests: XCTestCase {

    @MainActor
    func testChangingExpansionModeClearsThePreviousExpandedState() {
        let layout = JobsWalletCardLayout()
            .byExpansionMode(.all)
        let indexPath = IndexPath(item: 1, section: 0)
        layout.toggle(at: indexPath, animated: false)
        XCTAssertTrue(layout.isExpanded)
        XCTAssertTrue(layout.isActive(at: indexPath))
        layout.byExpansionMode(.individual)
        XCTAssertFalse(layout.isExpanded)
        XCTAssertNil(layout.expandedIndexPath)
    }

    @MainActor
    func testIndividualModeCannotExpandWithoutACollectionView() {
        let layout = JobsWalletCardLayout()
        layout.toggle(at: IndexPath(item: 0, section: 0), animated: false)
        XCTAssertFalse(layout.isExpanded)
        XCTAssertNil(layout.expandedIndexPath)
        XCTAssertTrue(layout.shouldInvalidateLayout(forBoundsChange: .zero))
    }
}
