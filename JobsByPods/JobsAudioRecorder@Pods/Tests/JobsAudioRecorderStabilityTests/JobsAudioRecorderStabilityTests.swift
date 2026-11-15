//
//  JobsAudioRecorderStabilityTests.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年11月14日，星期六.
//

import XCTest
@testable import JobsAudioRecorder

final class JobsAudioRecorderStabilityTests: XCTestCase {

    func testRecordingModesRoundTripAndRejectUnknownValues() throws {
        for mode in [JobsAudioRecordingMode.short, .long] {
            let data = try JSONEncoder().encode(mode)
            XCTAssertEqual(try JSONDecoder().decode(JobsAudioRecordingMode.self, from: data), mode)
        }
        XCTAssertNil(JobsAudioRecordingMode(rawValue: "unknown"))
        XCTAssertThrowsError(try JSONDecoder().decode(JobsAudioRecordingMode.self,
                                                      from: Data("\"unknown\"".utf8)))
    }

    func testRecordingMetadataKeepsTheSuppliedFileIdentity() {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("JobsAudioRecorderStability-long.m4a")
        let createdAt = Date(timeIntervalSince1970: 1_234)
        let recording = JobsAudioRecording(url: url,
                                            mode: .long,
                                            createdAt: createdAt,
                                            duration: 12.5,
                                            fileSize: 4_096)

        XCTAssertEqual(recording.url, url)
        XCTAssertEqual(recording.mode, .long)
        XCTAssertEqual(recording.createdAt, createdAt)
        XCTAssertEqual(recording.duration, 12.5)
        XCTAssertEqual(recording.fileSize, 4_096)
    }
}
