//
//  JobsSwiftGraphicCaptchaConfig.swift
//  JobsSwiftGraphicCaptcha
//
//  Created by Jobs on 2026年7月8日，星期三.
//

import Foundation

public struct JobsSwiftGraphicCaptchaCharacterUnit: OptionSet, Sendable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let number = JobsSwiftGraphicCaptchaCharacterUnit(rawValue: 1 << 0)
    public static let lowercaseLetter = JobsSwiftGraphicCaptchaCharacterUnit(rawValue: 1 << 1)
    public static let uppercaseLetter = JobsSwiftGraphicCaptchaCharacterUnit(rawValue: 1 << 2)
    public static let chinese = JobsSwiftGraphicCaptchaCharacterUnit(rawValue: 1 << 3)
    public static let letter: JobsSwiftGraphicCaptchaCharacterUnit = [.lowercaseLetter, .uppercaseLetter]
    public static let `default`: JobsSwiftGraphicCaptchaCharacterUnit = [.number, .letter]
}

public struct JobsSwiftGraphicCaptchaConfig: Sendable {
    public var length: Int
    public var caseSensitive: Bool
    public var characterUnits: JobsSwiftGraphicCaptchaCharacterUnit
    public var customCharacters: [String]
    public var mixedGroupCount: Int

    public init(length: Int = 4,
                caseSensitive: Bool = true,
                characterUnits: JobsSwiftGraphicCaptchaCharacterUnit = .default,
                customCharacters: [String] = [],
                mixedGroupCount: Int = 0) {
        self.length = length
        self.caseSensitive = caseSensitive
        self.characterUnits = characterUnits
        self.customCharacters = customCharacters
        self.mixedGroupCount = mixedGroupCount
    }
}

public extension JobsSwiftGraphicCaptchaConfig {
    static var defaultConfig: Self {
        Self()
    }

    static var numberConfig: Self {
        Self(characterUnits: .number)
    }

    static var chineseConfig: Self {
        Self(characterUnits: .chinese)
    }

    static var letterCaseSensitiveConfig: Self {
        Self(caseSensitive: true, characterUnits: .letter)
    }

    static var letterCaseInsensitiveConfig: Self {
        Self(caseSensitive: false, characterUnits: .letter)
    }

    static var mixedConfig: Self {
        fullMixedConfig
    }

    static var twoMixedConfig: Self {
        Self(caseSensitive: true,
             characterUnits: [.uppercaseLetter, .lowercaseLetter, .number, .chinese],
             mixedGroupCount: 2)
    }

    static var threeMixedConfig: Self {
        var config = twoMixedConfig
        config.mixedGroupCount = 3
        return config
    }

    static var fullMixedConfig: Self {
        var config = twoMixedConfig
        config.mixedGroupCount = 4
        return config
    }
}
