//
//  PBKDF2.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import CommonCrypto
/// PBKDF2（口令派生密钥，适合“用户密码 -> AES key”）
public struct PBKDF2 {
    public static func deriveKey(
        password: String,
        salt: Data,
        keyByteCount: Int = 32,
        rounds: Int = 100_000
    ) throws -> Data {
        var derived = Data(count: keyByteCount)
        let passwordData = password.data(using: .utf8)!

        let status = derived.withUnsafeMutableBytes { derivedBytes in
            salt.withUnsafeBytes { saltBytes in
                CCKeyDerivationPBKDF(
                    CCPBKDFAlgorithm(kCCPBKDF2),
                    password, passwordData.count,
                    saltBytes.bindMemory(to: UInt8.self).baseAddress!, salt.count,
                    CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
                    UInt32(rounds),
                    derivedBytes.bindMemory(to: UInt8.self).baseAddress!, keyByteCount
                )
            }
        }
        guard status == kCCSuccess else { throw CryptoError.encryptionFailed }
        return derived
    }
}


