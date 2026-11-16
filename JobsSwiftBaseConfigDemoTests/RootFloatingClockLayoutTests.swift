//
//  RootFloatingClockLayoutTests.swift
//  JobsSwiftBaseConfigDemoTests
//
//  Created by Jobs on 2026年11月16日，星期一.
//

import UIKit
import XCTest
#if canImport(JobsSwiftBaseDefines)
import JobsSwiftBaseDefines
#endif
#if canImport(JobsSwiftBaseConfigDemo)
@testable import JobsSwiftBaseConfigDemo
#endif

final class RootFloatingClockLayoutTests: XCTestCase {

    func testChineseClockUsesContentWidthAndStableDigitSpace() {
        let titleFont = JobsFont.systemFont(ofSize: 18,
                                           weight: .bold)
        let timeFont = JobsFont.monospacedDigitSystemFont(ofSize: 18,
                                                         weight: .bold)
        let size = RootFloatingClockLayout.size(title: "当前时间",
                                                titleFont: titleFont,
                                                timeFont: timeFont,
                                                availableSize: CGSize(width: 390, height: 700))
        XCTAssertLessThan(size.width, 166)
        XCTAssertGreaterThanOrEqual(size.height, 44)
        for time in ["00:00:00", "11:11:11", "23:59:59"] {
            XCTAssertLessThanOrEqual((time as NSString).size(withAttributes: [.font: timeFont]).width,
                                     size.width - RootFloatingClockLayout.horizontalPadding * 2)
        }
    }

    func testLongTitleAndLargeTextWrapInsteadOfShrinking() {
        let titleFont = JobsFont.systemFont(ofSize: 56,
                                           weight: .bold)
        let timeFont = JobsFont.monospacedDigitSystemFont(ofSize: 56,
                                                         weight: .bold)
        let wide = RootFloatingClockLayout.size(title: "Kasalukuyang Oras",
                                                titleFont: titleFont,
                                                timeFont: timeFont,
                                                availableSize: CGSize(width: 700, height: 700))
        let narrow = RootFloatingClockLayout.size(title: "Kasalukuyang Oras",
                                                  titleFont: titleFont,
                                                  timeFont: timeFont,
                                                  availableSize: CGSize(width: 280, height: 700))
        XCTAssertEqual(narrow.width, 280)
        XCTAssertGreaterThan(narrow.height, wide.height)
        XCTAssertLessThanOrEqual(narrow.height, 700)
        XCTAssertEqual(titleFont.pointSize, 56)
        XCTAssertEqual(timeFont.pointSize, 56)
    }

    func testSafeAreaResizeKeepsDockedRightAndBottomEdges() {
        let oldArea = CGRect(x: 0, y: 59, width: 390, height: 730)
        let newArea = CGRect(x: 59, y: 0, width: 700, height: 360)
        let frame = RootFloatingClockLayout.frame(size: CGSize(width: 210, height: 100),
                                                  currentFrame: CGRect(x: 250, y: 725, width: 140, height: 64),
                                                  previousArea: oldArea,
                                                  availableArea: newArea)
        XCTAssertEqual(frame.maxX, newArea.maxX)
        XCTAssertEqual(frame.maxY, newArea.maxY)
        XCTAssertTrue(newArea.contains(frame))
    }

    func testContentResizeDoesNotResetUndockedDragPosition() {
        let area = CGRect(x: 0, y: 59, width: 390, height: 730)
        let original = CGRect(x: 37, y: 210, width: 140, height: 64)
        let frame = RootFloatingClockLayout.frame(size: CGSize(width: 220, height: 110),
                                                  currentFrame: original,
                                                  previousArea: area,
                                                  availableArea: area)
        XCTAssertEqual(frame.origin, original.origin)
        let clamped = RootFloatingClockLayout.frame(size: CGSize(width: 380, height: 720),
                                                    currentFrame: frame,
                                                    previousArea: area,
                                                    availableArea: area)
        XCTAssertTrue(area.contains(clamped))
    }

    func testFirstLayoutAvoidsNavigationWithoutRestrictingLaterDragging() {
        let area = CGRect(x: 0, y: 59, width: 390, height: 730)
        let size = CGSize(width: 140, height: 64)
        let initial = RootFloatingClockLayout.initialFrame(size: size,
                                                            navigationBottom: 106,
                                                            availableArea: area)
        XCTAssertEqual(initial.minY, 114)
        let inNavigation = RootFloatingClockLayout.frame(size: size,
                                                          currentFrame: CGRect(x: 130, y: 59, width: 140, height: 64),
                                                          previousArea: area,
                                                          availableArea: area)
        XCTAssertEqual(inNavigation.minY, 59)
        let atBottom = RootFloatingClockLayout.dockedFrame(CGRect(x: 125, y: 700, width: 140, height: 64),
                                                            availableArea: area)
        XCTAssertEqual(atBottom.maxY, area.maxY)
    }
}
