//
//  Jobsl10n.swift
//  Jobsl10n
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum LanguageMode: Equatable {
    case system
    case custom(String)
}

public let languageModeKey = "Jobs.LanguageMode"
public let languageCodeKey = "Jobs.LanguageCode"
public func resolveLanguageCode() -> String {
    switch loadLanguageMode() {
    case .system:
        return (Locale.preferredLanguages.first ?? "en").normalizedLanguageCode
    case .custom(let code):
        return code.normalizedLanguageCode
    }
}

public func loadLanguageMode() -> LanguageMode {
    let ud = UserDefaults.standard
    // 1、取模式标识
    guard let rawMode = ud.string(forKey: languageModeKey),
          rawMode == "custom" else {
        return .system
    }
    // 2、custom 模式下必须要有有效语言码
    guard let code = ud.string(forKey: languageCodeKey),
          !code.isEmpty else {
        return .system
    };return .custom(code)
}
