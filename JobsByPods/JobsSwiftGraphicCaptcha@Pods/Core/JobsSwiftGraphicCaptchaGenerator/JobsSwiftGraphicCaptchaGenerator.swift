//
//  JobsSwiftGraphicCaptchaGenerator.swift
//  JobsSwiftGraphicCaptcha
//
//  Created by Jobs on 2026年7月8日，星期三.
//

import Foundation

public enum JobsSwiftGraphicCaptchaGenerator {
    public static let numberCharacters: [String] = Array("0123456789").map(String.init)
    public static let lowercaseLetterCharacters: [String] = Array("abcdefghijklmnopqrstuvwxyz").map(String.init)
    public static let uppercaseLetterCharacters: [String] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").map(String.init)
    public static let chineseCharacters: [String] = (0x4E00...0x9FA5).compactMap {
        UnicodeScalar($0).map { String(Character($0)) }
    }

    public static func characters(for units: JobsSwiftGraphicCaptchaCharacterUnit) -> [String] {
        var characters: [String] = []
        if units.contains(.number) {
            characters.append(contentsOf: numberCharacters)
        }
        if units.contains(.lowercaseLetter) {
            characters.append(contentsOf: lowercaseLetterCharacters)
        }
        if units.contains(.uppercaseLetter) {
            characters.append(contentsOf: uppercaseLetterCharacters)
        }
        if units.contains(.chinese) {
            characters.append(contentsOf: chineseCharacters)
        };return characters
    }

    public static func randomText(config: JobsSwiftGraphicCaptchaConfig?) -> String {
        let captchaConfig = config ?? .defaultConfig
        let length = max(captchaConfig.length, 1)
        let validCustomCharacters = captchaConfig.customCharacters.filter { !$0.isEmpty }
        if !validCustomCharacters.isEmpty {
            return randomText(characters: validCustomCharacters, length: length)
        }

        let groups = characterGroups(for: captchaConfig.characterUnits)
        if captchaConfig.mixedGroupCount > 1,
           let mixedText = randomMixedText(groups: groups,
                                           length: length,
                                           groupCount: captchaConfig.mixedGroupCount),
           !mixedText.isEmpty {
            return mixedText
        }

        var sourceCharacters = characters(for: captchaConfig.characterUnits)
        if sourceCharacters.isEmpty {
            sourceCharacters = characters(for: .default)
        };return randomText(characters: sourceCharacters, length: length)
    }

    public static func validate(input: String?,
                                captcha: String?,
                                caseSensitive: Bool) -> Bool {
        let inputText = (input ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let captchaText = (captcha ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !inputText.isEmpty, !captchaText.isEmpty else { return false }
        if caseSensitive {
            return inputText == captchaText
        };return inputText.caseInsensitiveCompare(captchaText) == .orderedSame
    }
}

private extension JobsSwiftGraphicCaptchaGenerator {
    static func characterGroups(for units: JobsSwiftGraphicCaptchaCharacterUnit) -> [[String]] {
        var groups: [[String]] = []
        if units.contains(.number) {
            groups.append(numberCharacters)
        }
        if units.contains(.lowercaseLetter) {
            groups.append(lowercaseLetterCharacters)
        }
        if units.contains(.uppercaseLetter) {
            groups.append(uppercaseLetterCharacters)
        }
        if units.contains(.chinese) {
            groups.append(chineseCharacters)
        };return groups
    }

    static func randomText(characters: [String], length: Int) -> String {
        guard !characters.isEmpty else { return "" };return (0..<length).compactMap { _ in characters.randomElement() }.joined()
    }

    static func randomMixedText(groups: [[String]], length: Int, groupCount: Int) -> String? {
        let validGroups = groups.filter { !$0.isEmpty }
        guard groupCount >= 2, validGroups.count >= 2, length >= 2 else { return nil }
        let selectedGroupCount = min(groupCount, length, validGroups.count)
        guard selectedGroupCount >= 2 else { return nil }
        let selectedGroups = Array(validGroups.shuffled().prefix(selectedGroupCount))
        var characters = selectedGroups.compactMap { $0.randomElement() }
        let sourceCharacters = validGroups.flatMap { $0 }
        while characters.count < length {
            guard let character = sourceCharacters.randomElement() else { break }
            characters.append(character)
        };return characters.shuffled().joined()
    }
}
