//
//  MD5.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
import CryptoKit

// MARK: 属性
public extension String {

    /// 字符串的MD5值
    /// "32313213".md5String ➤ 53ee308c00c3fad3dde79e7bfba55dba
    var md5String: String {
        return self.md5()
    }
    /// 返回字符串的MD5值
    /// "32313213".md5() ➤ 53ee308c00c3fad3dde79e7bfba55dba
    /// - Returns: 字符串的MD5值
    func md5() -> String {
        if #available(iOS 13.0, tvOS 13.0, macOS 10.15, *) {
            return Insecure.MD5.hash(data: Data(utf8)).map {
                String(format: "%02x", $0)
            }.joined()
        } else {
            return legacyMD5()
        }
    }

    @available(iOS, introduced: 2.0, deprecated: 13.0)
    @available(tvOS, introduced: 9.0, deprecated: 13.0)
    @available(macOS, introduced: 10.4, deprecated: 10.15)
    private func legacyMD5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let utf8 = self.lengthOfBytes(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(utf8)
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLen)
        CC_MD5(str!,
               strLen,
               result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x",
                              result[i])
        }
        result.deallocate()
        return String(format: hash as String)
    }
}
