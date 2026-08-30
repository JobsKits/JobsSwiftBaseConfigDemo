//
//  JobsHeartRate.swift
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import Foundation

struct JobsHeartRate: Equatable, Sendable {
    enum ParseError: Error { case truncated, invalidLayout }
    let bpm: UInt16
    let contactDetected: Bool?
    let energyKJ: UInt16?
    let rrSeconds: [Double]

    static func decode(_ data: Data) throws -> Self {
        let bytes = Array(data)
        var cursor = 0
        func read8() throws -> UInt8 {
            guard cursor < bytes.count else { throw ParseError.truncated }
            defer { cursor += 1 };return bytes[cursor]
        }
        func read16() throws -> UInt16 {
            let low = try read8()
            let high = try read8()
            return UInt16(low) | (UInt16(high) << 8)
        }
        let flags = try read8()
        // 教学解析器对保留位使用严格拒绝策略。
        guard flags & 0xE0 == 0 else { throw ParseError.invalidLayout }
        let bpm = try (flags & 1 != 0) ? read16() : UInt16(read8())
        let contact: Bool? = flags & 4 != 0 ? flags & 2 != 0 : nil
        let energy: UInt16? = try flags & 8 != 0 ? read16() : nil
        var rr: [Double] = []
        if flags & 0x10 != 0 {
            guard (bytes.count - cursor).isMultiple(of: 2) else { throw ParseError.invalidLayout }
            while cursor < bytes.count { rr.append(Double(try read16()) / 1024.0) }
        }
        guard cursor == bytes.count else { throw ParseError.invalidLayout };return Self(
            bpm: bpm, contactDetected: contact, energyKJ: energy, rrSeconds: rr)
    }
}
