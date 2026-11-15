//
//  JobsCountryCodeStabilityTests.swift
//  JobsSwiftCountryCodeCtrl
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import UIKit
import XCTest
import JobsSwiftBlock
import JobsSwiftCountryCodeCtrl

final class JobsCountryCodeStabilityTests: XCTestCase {

    @MainActor
    func testCountryResourcesLoadAndInvalidSectionsRemainEmpty() {
        let controller = JobsSwiftCountryCodeCtrl()
        controller.loadViewIfNeeded()
        let table = UITableView.jobsMake { _ in }
        let sectionCount = controller.numberOfSections(in: table)
        XCTAssertGreaterThan(sectionCount, 0, "国家区号 plist 必须随 Pod 打包")
        let rowCount = (0..<sectionCount).reduce(0) {
            $0 + controller.tableView(table, numberOfRowsInSection: $1)
        }
        XCTAssertGreaterThan(rowCount, 100)
        XCTAssertEqual(controller.tableView(table, numberOfRowsInSection: -1), 0)
        XCTAssertEqual(controller.tableView(table, numberOfRowsInSection: sectionCount), 0)
    }
}
