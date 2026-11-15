//
//  BRPickerViewSwiftStabilityTests.swift
//  BRPickerViewSwift
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import BRPickerViewSwift

final class BRPickerViewSwiftStabilityTests: XCTestCase {

    func testNestedAreaNodesSurviveCodableRoundTrip() throws {
        let area = BRAreaNode(name: "四川",
                              children: [BRAreaNode(name: "成都",
                                                    children: [BRAreaNode(name: "锦江")])])
        let data = try JSONEncoder().encode(area)
        let decoded = try JSONDecoder().decode(BRAreaNode.self, from: data)

        XCTAssertEqual(decoded, area)
        XCTAssertNil(decoded.children?.first?.children?.first?.children)
    }

    func testProvinceOnlySelectionKeepsMissingLevelsOptional() {
        let selection = BRAreaSelection(province: "四川")

        XCTAssertNil(selection.city)
        XCTAssertNil(selection.district)
        XCTAssertNotEqual(selection, BRAreaSelection(province: "四川", city: "成都"))
    }
}
