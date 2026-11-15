//
//  JobsOpenStabilityTests.swift
//  JobsSwiftOpen
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsSwiftOpen

final class JobsOpenStabilityTests: XCTestCase {

    func testConfigurationChainKeepsIdentityAndAllValues() throws {
        let url = try XCTUnwrap(URL(string: "https://example.invalid/page"))
        let configuration = JobsOpenConfiguration()
        let result = configuration
            .byURL(url)
            .byMode(.externalBrowser)
            .byTitle("Jobs")
            .byAnimated(false)
        XCTAssertTrue(result === configuration)
        XCTAssertEqual(configuration.url, url)
        XCTAssertEqual(configuration.title, "Jobs")
        XCTAssertFalse(configuration.animated)
        if case .externalBrowser = configuration.mode {
        } else {
            XCTFail("Configuration lost the requested open mode")
        }
    }

    func testPresentationAndPageLoadCallbacksRemainIndependent() throws {
        let url = try XCTUnwrap(URL(string: "https://example.invalid/page"))
        var presented: Bool?
        var loaded: URL?
        let configuration = JobsOpenConfiguration(url: url)
            .byCompletion { presented = $0 }
            .byPageLoadCompletion { result in
                loaded = try? result.get()
            }
        configuration.completion?(true)
        XCTAssertEqual(presented, true)
        XCTAssertNil(loaded)
        configuration.pageLoadCompletion?(.success(url))
        XCTAssertEqual(loaded, url)
    }
}
