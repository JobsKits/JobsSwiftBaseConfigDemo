//
//  JobsLabFrame.swift
//  JobsBluetoothLearning
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import Foundation

struct JobsLabFrame: Equatable, Sendable {
    enum CodecError: Error { case malformed, crc, payloadTooLarge }
    let opcode: UInt8
    let sequence: UInt16
    let payload: [UInt8]

    static func crc16(_ bytes: [UInt8]) -> UInt16 {
        var crc: UInt16 = 0xFFFF
        for byte in bytes {
            crc ^= UInt16(byte) << 8
            for _ in 0..<8 {
                crc = (crc & 0x8000) != 0 ? (crc &<< 1) ^ 0x1021 : crc &<< 1
            }
        };return crc
    }

    func encoded() throws -> Data {
        guard payload.count <= 256 else { throw CodecError.payloadTooLarge }
        let length = UInt16(payload.count)
        var bytes: [UInt8] = [0xA5, 0x5A, 1, opcode,
                              UInt8(truncatingIfNeeded: sequence), UInt8(sequence >> 8),
                              UInt8(truncatingIfNeeded: length), UInt8(length >> 8)]
        bytes += payload
        let crc = Self.crc16(Array(bytes.dropFirst(2)))
        bytes += [UInt8(truncatingIfNeeded: crc), UInt8(crc >> 8)]
        return Data(bytes)
    }

    static func decode(_ data: Data) throws -> Self {
        let bytes = Array(data)
        guard bytes.count >= 10, bytes[0] == 0xA5, bytes[1] == 0x5A, bytes[2] == 1 else {
            throw CodecError.malformed
        }
        let length = Int(bytes[6]) | (Int(bytes[7]) << 8)
        guard length <= 256, bytes.count == length + 10 else { throw CodecError.malformed }
        let receivedCRC = UInt16(bytes[8 + length]) | (UInt16(bytes[9 + length]) << 8)
        guard receivedCRC == crc16(Array(bytes[2..<(8 + length)])) else { throw CodecError.crc };return Self(
            opcode: bytes[3], sequence: UInt16(bytes[4]) | (UInt16(bytes[5]) << 8),
            payload: Array(bytes[8..<(8 + length)]))
    }
}
