//
//  SHA.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
import CryptoKit

public extension String {
    // MARK: - SHA1 (CommonCrypto 全版本可用)
    var sha1: String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes { buf in
            _ = CC_SHA1(buf.baseAddress, CC_LONG(data.count), &digest)
        };return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    // MARK: - SHA256 (iOS13+ CryptoKit, else CommonCrypto)
    var sha256: String {
        let data = Data(self.utf8)
        if #available(iOS 13.0, *) {
            return SHA256.hash(data: data).hexString
        } else {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            data.withUnsafeBytes { buf in
                _ = CC_SHA256(buf.baseAddress, CC_LONG(data.count), &digest)
            };return digest.map { String(format: "%02hhx", $0) }.joined()
        }
    }
    // MARK: - SHA384
    var sha384: String {
        let data = Data(self.utf8)
        if #available(iOS 13.0, *) {
            return SHA384.hash(data: data).hexString
        } else {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA384_DIGEST_LENGTH))
            data.withUnsafeBytes { buf in
                _ = CC_SHA384(buf.baseAddress, CC_LONG(data.count), &digest)
            };return digest.map { String(format: "%02hhx", $0) }.joined()
        }
    }
    // MARK: - SHA512
    var sha512: String {
        let data = Data(self.utf8)
        if #available(iOS 13.0, *) {
            return SHA512.hash(data: data).hexString
        } else {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
            data.withUnsafeBytes { buf in
                _ = CC_SHA512(buf.baseAddress, CC_LONG(data.count), &digest)
            };return digest.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}

@available(iOS 13.0, *)
private extension Digest {
    var hexString: String {
        self.map { String(format: "%02hhx", $0) }.joined()
    }
}
