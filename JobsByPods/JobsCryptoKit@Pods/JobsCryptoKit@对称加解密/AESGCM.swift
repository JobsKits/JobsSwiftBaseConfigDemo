//
//  AESGCM.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
import CryptoKit

public struct JobsAES {
    /// iOS 13+ 默认写入 0x01 AES-GCM；iOS 12 写入 0x03 AES-CBC + HMAC-SHA256。
    public static func encrypt(plaintext: String, key: Data) throws -> String {
        if #available(iOS 13.0, *) {
            let sealed = try AES.GCM.seal(Data(plaintext.utf8), using: makeSymmetricKey(key))
            guard let combined = sealed.combined else { throw CryptoError.encryptionFailed }
            return (Data([0x01]) + combined).base64EncodedString()
        }
        return try encryptAuthenticatedCBC(plaintext: plaintext, key: key)
    }

    public static func decrypt(base64: String, key: Data) throws -> String {
        guard let blob = Data(base64Encoded: base64) else { throw CryptoError.invalidBase64 }
        guard let version = blob.first else { throw CryptoError.invalidData }
        switch version {
        case 0x01:
            guard #available(iOS 13.0, *) else { throw CryptoError.unsupported }
            guard blob.count >= 29 else { throw CryptoError.invalidData }
            let sealed = try AES.GCM.SealedBox(combined: blob.dropFirst())
            return try utf8(try AES.GCM.open(sealed, using: makeSymmetricKey(key)))
        case 0x03:
            guard blob.count >= 1 + 16 + 16 + 32 else { throw CryptoError.invalidData }
            let keys = try authenticatedKeys(key)
            let authenticated = Data(blob.dropLast(32))
            let expected = authenticationCode(authenticated, key: keys.mac)
            guard constantTimeEqual(expected, Data(blob.suffix(32))) else { throw CryptoError.decryptionFailed }
            let iv = blob.subdata(in: 1..<17)
            let cipher = blob.subdata(in: 17..<(blob.count - 32))
            return try utf8(aesCBCDecrypt(data: cipher, key: keys.encryption, iv: iv))
        default:
            // 未认证的历史 0x02 数据只能经显式兼容入口迁移。
            throw CryptoError.unsupported
        }
    }

    /// 所有受支持系统均可读写；版本、IV 和密文在解密前一起认证。
    public static func encryptAuthenticatedCBC(plaintext: String, key: Data) throws -> String {
        let keys = try authenticatedKeys(key)
        let iv = try Data.randomBytes(count: kCCBlockSizeAES128)
        let cipher = try aesCBCEncrypt(data: Data(plaintext.utf8), key: keys.encryption, iv: iv)
        var blob = Data([0x03]) + iv + cipher
        blob.append(authenticationCode(blob, key: keys.mac))
        return blob.base64EncodedString()
    }

    /// 仅用于必须保持旧后端 0x02 协议的边界；此格式无法检测篡改。
    public static func encryptLegacyCBC(plaintext: String, key: Data) throws -> String {
        let iv = try Data.randomBytes(count: kCCBlockSizeAES128)
        let cipher = try aesCBCEncrypt(data: Data(plaintext.utf8), key: key, iv: iv)
        return (Data([0x02]) + iv + cipher).base64EncodedString()
    }

    public static func decryptLegacyCBC(base64: String, key: Data) throws -> String {
        guard let blob = Data(base64Encoded: base64) else { throw CryptoError.invalidBase64 }
        guard blob.first == 0x02, blob.count >= 33 else { throw CryptoError.invalidData }
        return try utf8(aesCBCDecrypt(data: Data(blob.dropFirst(17)), key: key, iv: blob.subdata(in: 1..<17)))
    }

    private static func utf8(_ data: Data) throws -> String {
        guard let value = String(data: data, encoding: .utf8) else { throw CryptoError.invalidData }
        return value
    }

    private static func authenticatedKeys(_ key: Data) throws -> (encryption: Data, mac: Data) {
        guard [16, 24, 32].contains(key.count) else { throw CryptoError.invalidKey }
        let encryption = authenticationCode(Data("JobsCryptoKit/v3/encryption".utf8), key: key)
        let mac = authenticationCode(Data("JobsCryptoKit/v3/authentication".utf8), key: key)
        return (encryption, mac)
    }

    private static func authenticationCode(_ data: Data, key: Data) -> Data {
        var code = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        code.withUnsafeMutableBytes { output in
            key.withUnsafeBytes { keyBytes in
                data.withUnsafeBytes { bytes in
                    CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), keyBytes.baseAddress, key.count,
                           bytes.baseAddress, data.count, output.baseAddress)
                }
            }
        }
        return code
    }

    private static func constantTimeEqual(_ lhs: Data, _ rhs: Data) -> Bool {
        guard lhs.count == rhs.count else { return false }
        var difference: UInt8 = 0
        for (left, right) in zip(lhs, rhs) {
            difference |= left ^ right
        }
        return difference == 0
    }
}

// MARK: - iOS13+ helpers (CryptoKit)
@available(iOS 13.0, *)
private func makeSymmetricKey(_ key: Data) throws -> SymmetricKey {
    // AES key 必须是 16/24/32 bytes
    guard [16, 24, 32].contains(key.count) else { throw CryptoError.invalidKey }
    return SymmetricKey(data: key)
}

// MARK: - iOS12- helpers (CommonCrypto AES-CBC)
private func aesCBCEncrypt(data: Data, key: Data, iv: Data) throws -> Data {
    guard [16, 24, 32].contains(key.count) else { throw CryptoError.invalidKey }
    guard iv.count == kCCBlockSizeAES128 else { throw CryptoError.invalidData }

    var outLength: size_t = 0
    var out = Data(count: data.count + kCCBlockSizeAES128)
    let outCapacity = out.count

    let status: CCCryptorStatus = out.withUnsafeMutableBytes { outBuf in
        data.withUnsafeBytes { dataBuf in
            key.withUnsafeBytes { keyBuf in
                iv.withUnsafeBytes { ivBuf in
                    CCCrypt(
                        CCOperation(kCCEncrypt),
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding),
                        keyBuf.baseAddress, key.count,
                        ivBuf.baseAddress,
                        dataBuf.baseAddress, data.count,
                        outBuf.baseAddress, outCapacity,
                        &outLength
                    )
                }
            }
        }
    }

    guard status == kCCSuccess else { throw CryptoError.encryptionFailed }
    out.count = outLength
    return out
}

private func aesCBCDecrypt(data: Data, key: Data, iv: Data) throws -> Data {
    guard !data.isEmpty, data.count % kCCBlockSizeAES128 == 0 else { throw CryptoError.invalidData }
    guard [16, 24, 32].contains(key.count) else { throw CryptoError.invalidKey }
    guard iv.count == kCCBlockSizeAES128 else { throw CryptoError.invalidData }

    var outLength: size_t = 0
    var out = Data(count: data.count + kCCBlockSizeAES128)
    let outCapacity = out.count

    let status: CCCryptorStatus = out.withUnsafeMutableBytes { outBuf in
        data.withUnsafeBytes { dataBuf in
            key.withUnsafeBytes { keyBuf in
                iv.withUnsafeBytes { ivBuf in
                    CCCrypt(
                        CCOperation(kCCDecrypt),
                        CCAlgorithm(kCCAlgorithmAES),
                        CCOptions(kCCOptionPKCS7Padding),
                        keyBuf.baseAddress, key.count,
                        ivBuf.baseAddress,
                        dataBuf.baseAddress, data.count,
                        outBuf.baseAddress, outCapacity,
                        &outLength
                    )
                }
            }
        }
    }

    guard status == kCCSuccess else { throw CryptoError.decryptionFailed }
    out.count = outLength
    return out
}
