//
//  JobsDebugToolsStabilityTests.swift
//  JobsSwiftDebugTools
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftDebugTools

final class JobsDebugToolsStabilityTests: XCTestCase {

    @MainActor
    func testTemporarySuppressionDoesNotOverwritePersistentPreference() {
        let previousSuppression = VCDebugDeallocDebug.temporarilySuppressesDeinitTips
        let previousPreference = VCDebugDeallocDebug.showsDeinitTips
        defer {
            VCDebugDeallocDebug.temporarilySuppressesDeinitTips = previousSuppression
        }
        VCDebugDeallocDebug.temporarilySuppressesDeinitTips = true
        XCTAssertTrue(VCDebugDeallocDebug.temporarilySuppressesDeinitTips)
        XCTAssertEqual(VCDebugDeallocDebug.showsDeinitTips, previousPreference)
        VCDebugDeallocDebug.temporarilySuppressesDeinitTips = false
        XCTAssertEqual(VCDebugDeallocDebug.showsDeinitTips, previousPreference)
    }
}
