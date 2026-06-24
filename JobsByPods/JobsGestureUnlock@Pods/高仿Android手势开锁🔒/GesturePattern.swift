//
//  GesturePattern.swift
//  JobsGestureUnlock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import CommonCrypto
import CryptoKit

public struct GesturePattern: Equatable {
    public let indices: [Int]

    public init(indices: [Int]) {
        self.indices = indices
    }

    public var string: String {
        indices.map(String.init).joined(separator: "-")
    }

    public func sha256Hex(salt: String) -> String {
        let data = Data("\(salt)|\(string)".utf8)

        if #available(iOS 13.0, *) {
            let digest = SHA256.hash(data: data)
            return digest.map { String(format: "%02x", $0) }.joined()
        } else {
            var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            data.withUnsafeBytes { buf in
                _ = CC_SHA256(buf.baseAddress, CC_LONG(data.count), &hash)
            };return hash.map { String(format: "%02x", $0) }.joined()
        }
    }
}
