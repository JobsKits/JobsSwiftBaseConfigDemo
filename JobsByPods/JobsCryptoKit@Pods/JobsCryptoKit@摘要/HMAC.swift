//
//  HMAC.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import CommonCrypto
import CryptoKit

public extension String {
    /// HMAC-SHA256，返回 hex string
    func hmacSHA256(key: Data) -> String {
        let msg = Data(self.utf8)
        if #available(iOS 13.0, *) {
            let sk = SymmetricKey(data: key)
            let mac = HMAC<SHA256>.authenticationCode(for: msg, using: sk)
            return Data(mac).hexString
        } else {
            var mac = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            msg.withUnsafeBytes { msgBuf in
                key.withUnsafeBytes { keyBuf in
                    CCHmac(
                        CCHmacAlgorithm(kCCHmacAlgSHA256),
                        keyBuf.baseAddress, key.count,
                        msgBuf.baseAddress, msg.count,
                        &mac
                    )
                }
            };return mac.map { String(format: "%02hhx", $0) }.joined()
        }
    }
}
