//
//  JobsMarkdownStabilityTests.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftMarkdown

final class JobsMarkdownStabilityTests: XCTestCase {

    func testFontScaleClampsFiniteValuesAndRejectsNonfiniteValues() {
        XCTAssertEqual(JobsMarkdownConfiguration(fontScale: -1).fontScale, 0.75)
        XCTAssertEqual(JobsMarkdownConfiguration(fontScale: 8).fontScale, 2)
        XCTAssertEqual(JobsMarkdownConfiguration(fontScale: .nan).fontScale, 1)
        XCTAssertEqual(JobsMarkdownConfiguration(fontScale: .infinity).fontScale, 1)
    }

    func testOfflineConfigurationPreservesSafetyAndRenderingChoices() {
        let configuration = JobsMarkdownConfiguration(appearance: .dark,
                                                      showsTableOfContents: false,
                                                      rendersMermaid: false,
                                                      allowsRemoteContent: false,
                                                      customCSS: "body { margin: 0; }")
        XCTAssertEqual(configuration.appearance.rawValue, "dark")
        XCTAssertFalse(configuration.showsTableOfContents)
        XCTAssertFalse(configuration.rendersMermaid)
        XCTAssertFalse(configuration.allowsRemoteContent)
        XCTAssertTrue(configuration.sanitizesHTML)
        XCTAssertEqual(configuration.customCSS, "body { margin: 0; }")
    }
}
