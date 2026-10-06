//
//  CryptoRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

@main
struct CryptoRegression {
    static func main() throws {
        let key = Data(repeating: 0x42, count: 32)
        let plaintext = "Jobs\u{0}中文"
        let authenticated = try JobsAES.encryptAuthenticatedCBC(plaintext: plaintext, key: key)
        try check(try JobsAES.decrypt(base64: authenticated, key: key) == plaintext)
        let original = Data(base64Encoded: authenticated)!
        let emptyAuthenticated = try JobsAES.encryptAuthenticatedCBC(plaintext: "", key: key)
        try check(try JobsAES.decrypt(base64: emptyAuthenticated, key: key) == "")
        for index in [0, 1, 17, original.count - 1] {
            var mutated = original
            mutated[index] ^= 1
            expectFailure { _ = try JobsAES.decrypt(base64: mutated.base64EncodedString(), key: key) }
        }
        expectFailure { _ = try JobsAES.decrypt(base64: authenticated, key: Data(repeating: 0x41, count: 32)) }
        let legacy = try JobsAES.encryptLegacyCBC(plaintext: plaintext, key: key)
        expectFailure { _ = try JobsAES.decrypt(base64: legacy, key: key) }
        try check(try JobsAES.decryptLegacyCBC(base64: legacy, key: key) == plaintext)
        let emptyLegacy = try JobsAES.encryptLegacyCBC(plaintext: "", key: key)
        try check(try JobsAES.decryptLegacyCBC(base64: emptyLegacy, key: key) == "")
        for count in [-1, 1_048_577] {
            expectFailure { _ = try Data.randomBytes(count: count) }
        }
        try check(try Data.randomBytes(count: 0).isEmpty)
        for rounds in [-1, 0, Int(UInt32.max) + 1] {
            expectFailure { _ = try PBKDF2.deriveKey(password: "p", salt: Data([1]), rounds: rounds) }
        }
        expectFailure { _ = try PBKDF2.deriveKey(password: "p", salt: Data(), keyByteCount: 32, rounds: 1) }
        expectFailure { _ = try PBKDF2.deriveKey(password: "p", salt: Data([1]), keyByteCount: -1, rounds: 1) }
        let vector = try PBKDF2.deriveKey(password: "pass\u{0}word", salt: Data("salt".utf8), rounds: 1)
        precondition(vector.hexString == "7b8039efc6c785f3bd17dd7c24d0adbd499aa56ae2f5010800371b0a7219f37a")
        expectFailure { _ = try "/w==".base64DecodedString() }
        let encrypted = try JobsAES.encrypt(plaintext: plaintext, key: key)
        try check(try JobsAES.decrypt(base64: encrypted, key: key) == plaintext)
        let chacha = try JobsChaCha20Poly1305Box.encrypt(plaintext: plaintext, key: key)
        try check(try JobsChaCha20Poly1305Box.decrypt(base64: chacha, key: key) == plaintext)
        let emptyPassword = try PBKDF2.deriveKey(password: "", salt: Data("salt".utf8), rounds: 1)
        precondition(emptyPassword.count == 32)
        print("CryptoRegression: authenticated tamper, legacy migration, numeric bounds, UTF-8, PBKDF2 NUL vector passed")
    }

    static func check(_ value: @autoclosure () throws -> Bool) rethrows {
        let result = try value()
        precondition(result)
    }

    static func expectFailure(_ action: () throws -> Void) {
        do {
            try action()
            preconditionFailure("Expected a typed failure")
        } catch { }
    }
}
