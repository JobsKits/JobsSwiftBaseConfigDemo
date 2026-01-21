//
//  RSA.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
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
