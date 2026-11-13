//
//  JobsDeviceCollectionText.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月6日，星期五.
//

import Foundation

import Jobsl10n
import JobsSwiftDSL

enum JobsDeviceCollectionText {

    static let languages = [
        ("zh-Hans", "简体中文"), ("zh-Hant", "繁體中文"), ("bo", "བོད་ཡིག"),
        ("en", "English"), ("ja", "日本語"), ("fr", "Français"),
        ("es", "Español"), ("de", "Deutsch"), ("ru", "Русский"), ("ko", "한국어")
    ]
    private static let translations: [String: [String: String]] = {
        guard let url = Bundle.main.url(forResource: "JobsDeviceCollection",
                                        withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let values = try? JSONDecoder.make({ _ in }).decode([String: [String: String]].self,
                                                     from: data) else {
            return [:]
        }
        return values
    }()

    static var languageCode: String {
        let code = LanguageManager.shared.currentLanguageCode
        if code.hasPrefix("zh") {
            return code.contains("Hant") || code.contains("TW") || code.contains("HK") ? "zh-Hant" : "zh-Hans"
        }
        return languages.first { code.hasPrefix($0.0) }?.0 ?? "en"
    }

    static func text(_ key: String) -> String {
        translations[languageCode]?[key] ?? translations["en"]?[key] ?? key
    }
}
