//
//  JobsAppDoorGraphicCaptchaConfig.swift
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月22日，星期三.
//

import Foundation
import JobsSwiftGraphicCaptcha

public struct JobsAppDoorGraphicCaptchaCharacterType: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let number = JobsAppDoorGraphicCaptchaCharacterType(rawValue: 1 << 0)
    public static let english = JobsAppDoorGraphicCaptchaCharacterType(rawValue: 1 << 1)
    public static let chinese = JobsAppDoorGraphicCaptchaCharacterType(rawValue: 1 << 2)
    public static let `default`: JobsAppDoorGraphicCaptchaCharacterType = [.number, .english]
    public static let all: JobsAppDoorGraphicCaptchaCharacterType = [.number, .english, .chinese]
}

public struct JobsAppDoorGraphicCaptchaConfig {
    public var length: Int
    public var caseSensitive: Bool
    public var characterTypes: JobsAppDoorGraphicCaptchaCharacterType

    public init(
        length: Int = 4,
        caseSensitive: Bool = true,
        characterTypes: JobsAppDoorGraphicCaptchaCharacterType = .default
    ) {
        self.length = length
        self.caseSensitive = caseSensitive
        self.characterTypes = characterTypes
    }

    public static var defaultConfig: Self { Self() }
    public static var numberAndEnglishConfig: Self { .defaultConfig }
    public static var numberAndChineseConfig: Self {
        Self(characterTypes: [.number, .chinese])
    }
    public static var englishAndChineseConfig: Self {
        Self(characterTypes: [.english, .chinese])
    }
    public static var allCharactersConfig: Self {
        Self(characterTypes: .all)
    }

    var resolvedConfig: JobsSwiftGraphicCaptchaConfig {
        var units: JobsSwiftGraphicCaptchaCharacterUnit = []
        var groupCount = 0
        if characterTypes.contains(.number) {
            units.insert(.number)
            groupCount += 1
        }
        if characterTypes.contains(.english) {
            units.formUnion(.letter)
            groupCount += 1
        }
        if characterTypes.contains(.chinese) {
            units.insert(.chinese)
            groupCount += 1
        }
        if units.isEmpty {
            units = .default
            groupCount = 2
        };return JobsSwiftGraphicCaptchaConfig(
            length: max(length, groupCount),
            caseSensitive: caseSensitive,
            characterUnits: units,
            mixedGroupCount: groupCount
        )
    }
}
