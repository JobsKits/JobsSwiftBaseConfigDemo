//
//  AESCBC.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
/// 兼容老后端：AES-CBC + PKCS7（可解密，但要注意“必须另做认证”）
/// CBC 不带完整性校验，如果用于网络传输/安全场景，最好“CBC + HMAC”（或直接换 AES-GCM）。

public struct AESCBC {
    public static func encrypt(plaintext: String, key: Data, iv: Data) throws -> Data {
        try crypt(data: plaintext.utf8Data, key: key, iv: iv, operation: CCOperation(kCCEncrypt))
    }

    public static func decrypt(ciphertext: Data, key: Data, iv: Data) throws -> String {
        let data = try crypt(data: ciphertext, key: key, iv: iv, operation: CCOperation(kCCDecrypt))
        return String(data: data, encoding: .utf8) ?? ""
    }

    private static func crypt(data: Data, key: Data, iv: Data, operation: CCOperation) throws -> Data {
        guard key.count == kCCKeySizeAES128 || key.count == kCCKeySizeAES192 || key.count == kCCKeySizeAES256 else {
            throw CryptoError.invalidKey
        }
        guard iv.count == kCCBlockSizeAES128 else { throw CryptoError.invalidNonce }
        var out = Data(count: data.count + kCCBlockSizeAES128)
        var outLength: size_t = 0
        let status: CCCryptorStatus = out.withUnsafeMutableBytes { outBytes in
            data.withUnsafeBytes { dataBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(
                            operation,
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            keyBytes.baseAddress, key.count,
                            ivBytes.baseAddress,
                            dataBytes.baseAddress, data.count,
                            outBytes.baseAddress, outBytes.count,   // ✅ 关键：别用 out.count
                            &outLength
                        )
                    }
                }
            }
        }
        guard status == kCCSuccess else { throw CryptoError.encryptionFailed }
        out.removeSubrange(outLength..<out.count)
        return out
    }
}
