//
//  JobsByUIKitStabilityTests.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsByUIKit
import JobsSwiftBaseDefines

final class JobsByUIKitStabilityTests: XCTestCase {

    @MainActor
    func testImageCreationRejectsEmptyDimensions() {
        XCTAssertNil(UIImage.solidColor(size: .zero, color: JobsCor.red))
        XCTAssertNil(UIImage.solidColor(size: CGSize(width: -1, height: 20), color: JobsCor.red))
        XCTAssertNil(UIImage.make { _ in }.squareCropped(maximumPixelLength: 20))
    }

    @MainActor
    func testSquareCropRespectsThePixelBudget() throws {
        let source = try XCTUnwrap(UIImage.solidColor(size: CGSize(width: 80, height: 40),
                                                      color: JobsCor.red))
        let cropped = try XCTUnwrap(source.squareCropped(maximumPixelLength: 12))

        XCTAssertEqual(cropped.size, CGSize(width: 12, height: 12))
        XCTAssertEqual(cropped.scale, 1)
        XCTAssertEqual(cropped.cgImage?.width, 12)
        XCTAssertEqual(cropped.cgImage?.height, 12)
        XCTAssertNil(source.squareCropped(maximumPixelLength: 0))
    }
}
