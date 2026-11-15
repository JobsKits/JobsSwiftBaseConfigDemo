//
//  JobsByPhotosUIStabilityTests.swift
//  JobsByPhotosUI
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import PhotosUI
import XCTest
import JobsByPhotosUI

final class JobsByPhotosUIStabilityTests: XCTestCase {

    @MainActor
    func testPickerDSLClampsNegativeLimitsAndUsesValueSemantics() {
        let original = PHPickerConfiguration()
        let configured = original
            .bySelectionLimit(-8)
            .byPreferredAssetRepresentationMode(.current)

        XCTAssertEqual(configured.selectionLimit, 0)
        XCTAssertEqual(original.selectionLimit, 1)
        XCTAssertEqual(configured.preferredAssetRepresentationMode, .current)
    }

    @MainActor
    func testPickerDSLRetainsAValidSelectionLimit() {
        let configured = PHPickerConfiguration().bySelectionLimit(5)

        XCTAssertEqual(configured.selectionLimit, 5)
    }
}
