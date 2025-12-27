//
//  GesturePattern.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

import Foundation
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
        let digest = SHA256.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}
