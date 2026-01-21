//
//  SHA1.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import Foundation
import CommonCrypto
import CryptoKit
/// 摘要（不可逆）
public extension String {
    /// 字符串的散列算法加密后的值
    /// "32313213".sha1 ➤ ca732abf1d912a9857bb5d05c0fa7fc4271dae06
    var sha1: String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
    
    var sha256: String { SHA256.hash(data: utf8Data).data.hexString }
    var sha384: String { SHA384.hash(data: utf8Data).data.hexString }
    var sha512: String { SHA512.hash(data: utf8Data).data.hexString }
}

private extension Digest {
    var data: Data { Data(makeIterator()) }
}
