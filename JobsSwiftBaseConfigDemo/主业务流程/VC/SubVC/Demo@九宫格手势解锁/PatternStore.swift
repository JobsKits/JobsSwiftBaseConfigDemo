//
//  PatternStore.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsGestureUnlock
// MARK: - Demo Store（示例用 UserDefaults + SHA256）
final class PatternStore {
    
    private let keyHash = "gesture_unlock.pattern_hash"
    private let keySalt = "gesture_unlock.salt"

    var hasPattern: Bool { UserDefaults.standard.string(forKey: keyHash) != nil }

    func save(pattern: GesturePattern) {
        let salt = saltValue()
        let hash = pattern.sha256Hex(salt: salt)
        UserDefaults.standard.set(hash, forKey: keyHash)
    }

    func verify(pattern: GesturePattern) -> Bool {
        guard let saved = UserDefaults.standard.string(forKey: keyHash) else { return false }
        let hash = pattern.sha256Hex(salt: saltValue())
        return hash == saved
    }

    private func saltValue() -> String {
        if let s = UserDefaults.standard.string(forKey: keySalt) { return s }
        let new = UUID().uuidString
        UserDefaults.standard.set(new, forKey: keySalt)
        return new
    }
}
