//
//  BaseCrypto.swift
//  JobsCryptoKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
/// Hex/Base64、Data 转换

public enum CryptoError: Error {
    case invalidHex
    case invalidBase64
    case invalidKey
    case invalidNonce
    case encryptionFailed
    case decryptionFailed
    case keyGenerationFailed
    case unsupported
    case invalidData
}

public extension Data {
    var hexString: String {
        map { String(format: "%02hhx", $0) }.joined()
    }

    init?(hex: String) {
        let hex = hex.lowercased()
        guard hex.count % 2 == 0 else { return nil }
        var data = Data()
        data.reserveCapacity(hex.count / 2)

        var i = hex.startIndex
        while i < hex.endIndex {
            let j = hex.index(i, offsetBy: 2)
            guard j <= hex.endIndex else { return nil }
            let byteStr = hex[i..<j]
            guard let byte = UInt8(byteStr, radix: 16) else { return nil }
            data.append(byte)
            i = j
        }
        self = data
    }

    static func randomBytes(count: Int) throws -> Data {
        var data = Data(count: count)
        let result = data.withUnsafeMutableBytes { ptr in
            SecRandomCopyBytes(kSecRandomDefault, count, ptr.baseAddress!)
        }
        guard result == errSecSuccess else { throw CryptoError.keyGenerationFailed };return data
    }
}

public extension String {
    var utf8Data: Data { Data(utf8) }

    func base64Encoded() -> String { utf8Data.base64EncodedString() }
    func base64DecodedString() throws -> String {
        guard let data = Data(base64Encoded: self) else { throw CryptoError.invalidBase64 };return String(data: data, encoding: .utf8) ?? ""
    }
}
