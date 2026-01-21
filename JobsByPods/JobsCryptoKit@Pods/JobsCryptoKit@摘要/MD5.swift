//
//  MD5.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import Foundation
import CommonCrypto
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
        let str = self.cString(using: String.Encoding.utf8)
        let utf8 = self.lengthOfBytes(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(utf8)
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deallocate()
        return String(format: hash as String)
    }
}
