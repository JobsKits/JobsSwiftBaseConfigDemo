//
//  JobsL10nStabilityTests.swift
//  Jobsl10n
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

@testable import Jobsl10n

final class JobsL10nStabilityTests: XCTestCase {

    func testLanguageNormalizationPreservesSupportedScriptsAndRegions() {
        let cases = [
            "zh_TW": "zh-Hant", "zh-Hans-SG": "zh-Hans", " EN_ph ": "en-PH",
            "fil-PH": "tl", "pt_BR": "pt-BR", "es-MX": "es-MX",
            "bo-CN": "bo", "fr-FR": "fr", "de-DE": "de", "ja-JP": "ja",
            "ru-RU": "ru", "ko-KR": "ko"
        ]
        for (raw, expected) in cases {
            XCTAssertEqual(raw.normalizedLanguageCode, expected, raw)
        }
    }

    func testUnknownAndEmptyLanguageCodesUseEnglishFallback() {
        XCTAssertEqual("unknown-ZZ".normalizedLanguageCode, "en")
        XCTAssertEqual("  ".normalizedLanguageCode, "en")
    }

    func testManagerReadsInjectedPreferencesWithoutWritingStandardDefaults() throws {
        let suite = "JobsL10nStability.\(UUID().uuidString)"
        // 独立 suite 是偏好夹具，不修改应用的标准偏好或全局 Bundle override。
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suite))
        defer {
            defaults.removePersistentDomain(forName: suite)
        }
        let followingSystem = LanguageManager(userDefaults: defaults,
                                               preferredLanguages: { ["zh_HK"] })
        XCTAssertEqual(followingSystem.currentLanguageCode, "zh-Hant")
        defaults.set("custom", forKey: languageModeKey)
        defaults.set("ko-KR", forKey: languageCodeKey)
        let customized = LanguageManager(userDefaults: defaults,
                                          preferredLanguages: { ["en-US"] })
        XCTAssertEqual(customized.currentLanguageCode, "ko")
    }
}
