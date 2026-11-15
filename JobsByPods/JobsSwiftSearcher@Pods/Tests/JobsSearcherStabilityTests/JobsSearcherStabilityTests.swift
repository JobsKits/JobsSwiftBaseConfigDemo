//
//  JobsSearcherStabilityTests.swift
//  JobsSwiftSearcher
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
import JobsSwiftSearcher

final class JobsSearcherStabilityTests: XCTestCase {

    func testHistoryScopeSeparatesAccountsWithoutWritingPreferences() {
        let configuration = JobsSwiftSearcherConfig()
        configuration.historyStorageKey = "test.history"
        XCTAssertEqual(configuration.effectiveHistoryStorageKey, "test.history")
        configuration.historyScope = "account-a"
        let first = configuration.effectiveHistoryStorageKey
        configuration.historyScope = "account-b"
        XCTAssertNotEqual(first, configuration.effectiveHistoryStorageKey)
        XCTAssertTrue(first.hasPrefix("test.history.account."))
        configuration.historyScope = ""
        XCTAssertEqual(configuration.effectiveHistoryStorageKey, "test.history")
    }

    func testDefaultConfigurationsDoNotShareMutableSettings() {
        let first = JobsSwiftSearcherConfig.defaultConfig
        let second = JobsSwiftSearcherConfig.defaultConfig
        first.maxHistoryCount = 1
        first.persistsHistory = false
        XCTAssertEqual(second.maxHistoryCount, 20)
        XCTAssertTrue(second.persistsHistory)
    }
}
