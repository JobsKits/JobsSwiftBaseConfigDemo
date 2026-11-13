//
//  JobsARKitText.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import Foundation

import Jobsl10n
import JobsSwiftDSL

enum JobsARKitText {

    private static let values: [String: [String: String]] = {
        guard let url = Bundle.main.url(forResource: "JobsARKit", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let value = try? JSONDecoder.make({ _ in }).decode([String: [String: String]].self,
                                                                from: data) else {
            return [:]
        }
        return value
    }()

    static var language: String {
        let code = LanguageManager.shared.currentLanguageCode
        if code.hasPrefix("zh") {
            return code.contains("Hant") || code.contains("TW") || code.contains("HK") ? "zh-Hant" : "zh-Hans"
        }
        return code.split(separator: "-").first.map(String.init) ?? "en"
    }

    static func text(_ key: String) -> String {
        return values[language]?[key] ?? values["en"]?[key] ?? key
    }
}
