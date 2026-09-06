//
//  main.swift
//  JobsBluetoothLearningTests
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import Foundation

func mustThrow(_ operation: () throws -> Void) {
    do { try operation(); fatalError("Expected failure") }
    catch { }
}

precondition(JobsLabFrame.crc16(Array("123456789".utf8)) == 0x29B1)
let golden = try JobsLabFrame(opcode: 0x10, sequence: 1, payload: [1]).encoded()
precondition(golden == Data([0xA5, 0x5A, 1, 0x10, 1, 0, 1, 0, 1, 0x6B, 0xDE]))
print("Golden: " + golden.map { String(format: "%02x", $0) }.joined())
for size in 0...256 {
    let frame = JobsLabFrame(opcode: 0x90, sequence: UInt16.max,
                             payload: (0..<size).map { UInt8(truncatingIfNeeded: $0) })
    let decoded = try JobsLabFrame.decode(frame.encoded())
    precondition(decoded == frame)
}
for size in 0..<golden.count {
    mustThrow { _ = try JobsLabFrame.decode(golden.prefix(size)) }
}
for index in golden.indices {
    var broken = golden
    broken[index] ^= 1
    mustThrow { _ = try JobsLabFrame.decode(broken) }
}
mustThrow { _ = try JobsLabFrame(opcode: 1, sequence: 1, payload: Array(repeating: 0, count: 257)).encoded() }
let simple = try JobsHeartRate.decode(Data([0, 72]))
precondition(simple.bpm == 72 && simple.contactDetected == nil && simple.rrSeconds.isEmpty)
let full = try JobsHeartRate.decode(Data([0x1F, 0x2C, 0x01, 0x0A, 0x00, 0x00, 0x04, 0x00, 0x02]))
precondition(full.bpm == 300 && full.contactDetected == true && full.energyKJ == 10)
precondition(full.rrSeconds == [1.0, 0.5])
let unsupportedContact = try JobsHeartRate.decode(Data([2, 72]))
precondition(unsupportedContact.contactDetected == nil)
for bytes: [UInt8] in [[], [0], [1, 72], [8, 72, 1], [0x10, 72, 1], [0, 72, 1], [0x80, 72]] {
    mustThrow { _ = try JobsHeartRate.decode(Data(bytes)) }
}
print("PASS Swift: CRC, 257 lengths, corruption, bounds, Heart Rate flags/energy/RR")
