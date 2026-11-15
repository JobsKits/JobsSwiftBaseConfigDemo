//
//  JobsGetWindowStabilityTests.swift
//  JobsGetWindow
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsGetWindow
import JobsSwiftBlock

final class JobsGetWindowStabilityTests: XCTestCase {

    @MainActor
    func testTopMostControllerTraversesAnExplicitNavigationRoot() {
        let first = UIViewController.jobsMake { _ in }
        let last = UIViewController.jobsMake { _ in }
        let navigation = UINavigationController.jobsMake { controller in
            // 独立夹具只设置本地导航栈，不接入 UIApplication 或窗口。
            controller.setViewControllers([first, last], animated: false)
        }

        XCTAssertTrue(UIApplication.jobsTopMostVC(from: navigation) === last)
        XCTAssertTrue(UIApplication.jobsTopMostVC(from: first) === first)
    }

    @MainActor
    func testViewScopedSafeAreaDoesNotConsultTheGlobalWindow() {
        let view = UIView.jobsMake { _ in }

        XCTAssertEqual(UIApplication.jobsSafeAreaInsets(in: view), view.safeAreaInsets)
    }
}
