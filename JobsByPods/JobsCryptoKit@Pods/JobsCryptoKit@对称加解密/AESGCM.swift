//
//  JobsSymmetryCryptoKit.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import Foundation
import CryptoKit

public struct AESGCM {
    public static func encrypt(plaintext: String, key: Data) throws -> String {
        let symmetricKey = SymmetricKey(data: key)
        let nonce = AES.GCM.Nonce()
        let sealed = try AES.GCM.seal(plaintext.utf8Data, using: symmetricKey, nonce: nonce)

        // 拼接：nonce(12) + ciphertext + tag(16)
        var out = Data()
        out.append(contentsOf: nonce)
        out.append(sealed.ciphertext)
        out.append(sealed.tag)
        return out.base64EncodedString()
    }

    public static func decrypt(base64: String, key: Data) throws -> String {
        guard let blob = Data(base64Encoded: base64) else { throw CryptoError.invalidBase64 }
        guard blob.count >= 12 + 16 else { throw CryptoError.decryptionFailed }

        let nonceData = blob.prefix(12)
        let tagData = blob.suffix(16)
        let cipherData = blob.dropFirst(12).dropLast(16)

        let nonce = try AES.GCM.Nonce(data: nonceData)
        let sealed = try AES.GCM.SealedBox(nonce: nonce, ciphertext: cipherData, tag: tagData)
        let decrypted = try AES.GCM.open(sealed, using: SymmetricKey(data: key))
        return String(data: decrypted, encoding: .utf8) ?? ""
    }
}
