//
//  ChaChaPoly.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
import CryptoKit

public struct JobsChaCha20Poly1305Box {
    public static func encrypt(plaintext: String, key: Data) throws -> String {
        guard key.count == 32 else { throw CryptoError.invalidKey }
        if #available(iOS 13.0, *) {
            let sealed = try ChaChaPoly.seal(Data(plaintext.utf8), using: SymmetricKey(data: key))
            return (Data([0x11]) + sealed.combined).base64EncodedString()
        }
        return try JobsAES.encryptAuthenticatedCBC(plaintext: plaintext, key: key)
    }

    public static func decrypt(base64: String, key: Data) throws -> String {
        guard key.count == 32 else { throw CryptoError.invalidKey }
        guard let blob = Data(base64Encoded: base64) else { throw CryptoError.invalidBase64 }
        guard let version = blob.first else { throw CryptoError.invalidData }
        if version == 0x03 {
            return try JobsAES.decrypt(base64: base64, key: key)
        }
        guard version == 0x11 else { throw CryptoError.unsupported }
        guard #available(iOS 13.0, *) else { throw CryptoError.unsupported }
        guard blob.count >= 29 else { throw CryptoError.invalidData }
        let sealed = try ChaChaPoly.SealedBox(combined: blob.dropFirst())
        let plain = try ChaChaPoly.open(sealed, using: SymmetricKey(data: key))
        guard let string = String(data: plain, encoding: .utf8) else { throw CryptoError.invalidData }
        return string
    }

    public static func decryptLegacyCBC(base64: String, key: Data) throws -> String {
        try JobsAES.decryptLegacyCBC(base64: base64, key: key)
    }
}
