//
//  RSA.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Security
import Foundation

public struct RSA {
    public static func encrypt(data: Data, publicKey: SecKey) throws -> Data {
        var error: Unmanaged<CFError>?
        guard let out = SecKeyCreateEncryptedData(
            publicKey,
            .rsaEncryptionOAEPSHA256,
            data as CFData,
            &error
        ) else {
            throw error?.takeRetainedValue() ?? CryptoError.encryptionFailed
        }
        return out as Data
    }

    public static func decrypt(data: Data, privateKey: SecKey) throws -> Data {
        var error: Unmanaged<CFError>?
        guard let out = SecKeyCreateDecryptedData(
            privateKey,
            .rsaEncryptionOAEPSHA256,
            data as CFData,
            &error
        ) else {
            throw error?.takeRetainedValue() ?? CryptoError.decryptionFailed
        }
        return out as Data
    }
}
