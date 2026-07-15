//
//  JobsAudioRecording.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import Foundation

public enum JobsAudioRecordingMode: String, Codable {
    case short
    case long
}

public struct JobsAudioRecording {
    public let url: URL
    public let mode: JobsAudioRecordingMode
    public let createdAt: Date
    public let duration: TimeInterval
    public let fileSize: Int64
}
