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
        let plainData = Data(plaintext.utf8)
        if #available(iOS 13.0, *) {
            // ===== v0x11: ChaCha20-Poly1305 =====
            let sk = SymmetricKey(data: key)
            let nonce = ChaChaPoly.Nonce()
            let sealed = try ChaChaPoly.seal(plainData, using: sk, nonce: nonce)
            var out = Data()
            out.append(0x11)
            out.append(contentsOf: nonce)        // 12
            out.append(sealed.ciphertext)
            out.append(sealed.tag)               // 16
            return out.base64EncodedString()
        } else {
            // ===== v0x02: AES-CBC-PKCS7 =====
            let iv = try randomBytes(count: kCCBlockSizeAES128) // 16
            let cipher = try aesCBCEncrypt(data: plainData, key: key, iv: iv)
            var out = Data()
            out.append(0x02)
            out.append(iv)
            out.append(cipher)
            return out.base64EncodedString()
        }
    }

    public static func decrypt(base64: String, key: Data) throws -> String {
        guard let blob = Data(base64Encoded: base64), blob.count >= 1 else {
            throw CryptoError.invalidBase64
        }
        let ver = blob[blob.startIndex]
        switch ver {
        case 0x11:
            // ChaCha20-Poly1305
            guard #available(iOS 13.0, *) else {
                // iOS12 无法解 ChaChaPoly：系统缺实现
                throw CryptoError.decryptionFailed
            }
            guard blob.count >= 1 + 12 + 16 else { throw CryptoError.invalidData }
            let nonceData = blob.subdata(in: 1 ..< 13)
            let tagData = blob.suffix(16)
            let cipherData = blob.subdata(in: 13 ..< (blob.count - 16))
            let nonce = try ChaChaPoly.Nonce(data: nonceData)
            let sealed = try ChaChaPoly.SealedBox(nonce: nonce, ciphertext: cipherData, tag: tagData)
            let plain = try ChaChaPoly.open(sealed, using: SymmetricKey(data: key))
            return String(data: plain, encoding: .utf8) ?? ""
        case 0x02:
            // AES-CBC-PKCS7
            guard blob.count >= 1 + 16 else { throw CryptoError.invalidData }
            let iv = blob.subdata(in: 1 ..< 17)
            let cipher = blob.subdata(in: 17 ..< blob.count)
            let plain = try aesCBCDecrypt(data: cipher, key: key, iv: iv)
            return String(data: plain, encoding: .utf8) ?? ""
        default:
            throw CryptoError.invalidData
        }
    }
}

// MARK: - CommonCrypto AES-CBC (iOS12- fallback)
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

private func randomBytes(count: Int) throws -> Data {
    var data = Data(count: count)
    let status = data.withUnsafeMutableBytes { buf in
        SecRandomCopyBytes(kSecRandomDefault, count, buf.baseAddress!)
    }
    guard status == errSecSuccess else { throw CryptoError.encryptionFailed };return data
}
