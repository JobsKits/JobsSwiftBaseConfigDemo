//
//  JobsCInteropTests.swift
//  JobsBluetoothLearningTests
//
//  Created by Jobs on 2026年8月30日，星期日.
//

import Foundation

@main
enum JobsCInteropTests {
    static func main() throws {
        let incomingData = try JobsLabFrame(opcode: 0x10, sequence: 1, payload: [1]).encoded()
        let result: (JobsCodecStatus, Data?) = incomingData.withUnsafeBytes { raw in
            var frame = JobsFrameView()
            let status = jobs_decode(raw.bindMemory(to: UInt8.self).baseAddress, raw.count, &frame)
            guard status == JOBS_CODEC_OK, let payload = frame.payload else { return (status, nil) };return (
                status, Data(bytes: payload, count: Int(frame.length)))
        }
        precondition(result.0 == JOBS_CODEC_OK && result.1 == Data([1]))
        print("PASS Swift/C interop: Swift encoder -> C decoder -> owned Data")
    }
}
