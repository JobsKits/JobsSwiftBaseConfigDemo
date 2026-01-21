//
//  HMAC.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//

import Foundation
import CryptoKit
/// HMAC（带密钥的摘要）：HMAC-SHA256（常用于签名、防篡改）
public extension String {
    func hmacSHA256(key: Data) -> String {
        let k = SymmetricKey(data: key)
        let mac = HMAC<SHA256>.authenticationCode(for: utf8Data, using: k)
        return Data(mac).hexString
    }
}
