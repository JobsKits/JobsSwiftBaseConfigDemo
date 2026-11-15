//
//  JobsScreenCaptureStabilityTests.swift
//  JobsScreenCapture
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsScreenCapture
import JobsSwiftBlock

final class JobsScreenCaptureStabilityTests: XCTestCase {

    @MainActor
    func testZeroSizedViewIsRejectedBeforeRenderingOrPhotoAccess() {
        let view = UIView.jobsMake { _ in }
        let result = JobsScreenshotCapturer().capture(view)
        switch result {
        case .failure(.invalidBounds):
            break
        default:
            XCTFail("零尺寸视图必须返回 invalidBounds")
        }
    }

    func testCaptureFailuresProvideDistinctActionableDescriptions() {
        let boundsMessage = JobsScreenshotCapturer.CaptureError.invalidBounds.errorDescription
        let permissionMessage = JobsScreenshotCapturer.CaptureError.photoLibraryUnauthorized.errorDescription
        XCTAssertFalse(boundsMessage?.isEmpty ?? true)
        XCTAssertFalse(permissionMessage?.isEmpty ?? true)
        XCTAssertNotEqual(boundsMessage, permissionMessage)
    }
}
