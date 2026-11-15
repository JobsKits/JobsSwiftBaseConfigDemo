//
//  JobsCryptoStabilityTests.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import Foundation
import XCTest

import JobsCryptoKit

final class JobsCryptoStabilityTests: XCTestCase {

    func testAuthenticatedEncryptionRoundTripsUnicodeAndRejectsTampering() throws {
        let key = Data(repeating: 0x42, count: 32)
        let plaintext = "Jobs\u{0}中文🙂"
        let encrypted = try JobsAES.encryptAuthenticatedCBC(plaintext: plaintext, key: key)
        XCTAssertEqual(try JobsAES.decrypt(base64: encrypted, key: key), plaintext)
        var bytes = try XCTUnwrap(Data(base64Encoded: encrypted))
        bytes[bytes.count - 1] ^= 1
        XCTAssertThrowsError(try JobsAES.decrypt(base64: bytes.base64EncodedString(), key: key))
        XCTAssertThrowsError(try JobsAES.decrypt(base64: encrypted,
                                                key: Data(repeating: 0x41, count: 32)))
    }

    func testPBKDF2UsesFullPasswordIncludingEmbeddedNull() throws {
        let derived = try PBKDF2.deriveKey(password: "pass\u{0}word",
                                           salt: Data("salt".utf8),
                                           rounds: 1)
        XCTAssertEqual(derived.hexString,
                       "7b8039efc6c785f3bd17dd7c24d0adbd499aa56ae2f5010800371b0a7219f37a")
    }

    func testInvalidDerivationAndRandomByteParametersThrow() {
        for rounds in [-1, 0] {
            XCTAssertThrowsError(try PBKDF2.deriveKey(password: "p",
                                                     salt: Data([1]),
                                                     rounds: rounds))
        }
        XCTAssertThrowsError(try PBKDF2.deriveKey(password: "p", salt: Data(), rounds: 1))
        XCTAssertThrowsError(try Data.randomBytes(count: -1))
        XCTAssertThrowsError(try Data.randomBytes(count: 1_048_577))
    }
}
