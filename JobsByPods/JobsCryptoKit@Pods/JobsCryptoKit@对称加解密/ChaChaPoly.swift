//
//  ChaChaPoly.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import Foundation
import CryptoKit
/// ChaChaPoly（有些场景比 AES 更省心，尤其不想管硬件/实现差异）
public struct ChaCha20Poly1305Box {
    public static func encrypt(plaintext: String, key: Data) throws -> String {
        let symmetricKey = SymmetricKey(data: key)
        let nonce = ChaChaPoly.Nonce()
        let sealed = try ChaChaPoly.seal(plaintext.utf8Data, using: symmetricKey, nonce: nonce)

        var out = Data()
        out.append(contentsOf: nonce)          // 12
        out.append(sealed.ciphertext)
        out.append(sealed.tag)                // 16
        return out.base64EncodedString()
    }

    public static func decrypt(base64: String, key: Data) throws -> String {
        guard let blob = Data(base64Encoded: base64) else { throw CryptoError.invalidBase64 }
        guard blob.count >= 12 + 16 else { throw CryptoError.decryptionFailed }

        let nonceData = blob.prefix(12)
        let tagData = blob.suffix(16)
        let cipherData = blob.dropFirst(12).dropLast(16)

        let nonce = try ChaChaPoly.Nonce(data: nonceData)
        let sealed = try ChaChaPoly.SealedBox(nonce: nonce, ciphertext: cipherData, tag: tagData)
        let decrypted = try ChaChaPoly.open(sealed, using: SymmetricKey(data: key))
        return String(data: decrypted, encoding: .utf8) ?? ""
    }
}
