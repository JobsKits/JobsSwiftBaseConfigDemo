//
//  JobsScaleStabilityTests.swift
//  JobsScale
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsScale
import JobsSwiftBlock

final class JobsScaleStabilityTests: XCTestCase {

    @MainActor
    func testContainerScaleUsesProvidedViewRatherThanGlobalScreen() {
        JobsScale.setup(designWidth: 200,
                         designHeight: 400,
                         fontMode: .continuous,
                         fontMinScale: 0.5,
                         fontMaxScale: 3)
        defer {
            JobsScale.setup(designWidth: 375, designHeight: 812)
        }
        let view = UIView.jobsMake {
            $0.frame = CGRect(x: 0, y: 0, width: 400, height: 200)
        }
        XCTAssertEqual(JobsScale.widthScale(in: view), 2)
        XCTAssertEqual(JobsScale.heightScale(in: view), 0.5)
        XCTAssertEqual(JobsScale.fontScale(in: view), 2)
    }

    @MainActor
    func testInvalidDesignDimensionsFallBackToReferenceDimensions() {
        JobsScale.setup(designWidth: .nan,
                         designHeight: 0,
                         fontMode: .continuous,
                         fontMinScale: 1.5,
                         fontMaxScale: 0.5)
        defer {
            JobsScale.setup(designWidth: 375, designHeight: 812)
        }
        let view = UIView.jobsMake {
            $0.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
        }
        XCTAssertEqual(JobsScale.widthScale(in: view), 1)
        XCTAssertEqual(JobsScale.heightScale(in: view), 1)
        XCTAssertEqual(JobsScale.fontScale(in: view), 1)
    }
}
