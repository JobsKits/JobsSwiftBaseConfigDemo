//
//  JobsAudioRecordingStore.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import AVFoundation
import Foundation

import JobsSwiftDSL

public final class JobsAudioRecordingStore {
    public static let shared = JobsAudioRecordingStore()
    public let directoryURL: URL

    public init(fileManager: FileManager = .default) {
        let root = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        directoryURL = root.appendingPathComponent("JobsAudioRecordings", isDirectory: true)
        try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
    }

    public func makeURL(mode: JobsAudioRecordingMode) -> URL {
        let formatter = DateFormatter.jobsMake { _ in }
        formatter.byDateFormat("yyyyMMdd_HHmmss_SSS")
        return directoryURL.appendingPathComponent("\(mode.rawValue)_\(formatter.string(from: Date())).m4a")
    }

    public func recordings() -> [JobsAudioRecording] {
        let keys: Set<URLResourceKey> = [.creationDateKey, .fileSizeKey]
        let urls = (try? FileManager.default.contentsOfDirectory(at: directoryURL,
                                                                 includingPropertiesForKeys: Array(keys),
                                                                 options: [.skipsHiddenFiles])) ?? []
        return urls.filter { $0.pathExtension.lowercased() == "m4a" }.compactMap { url in
            let values = try? url.resourceValues(forKeys: keys)
            let player = try? AVAudioPlayer(contentsOf: url)
            let mode: JobsAudioRecordingMode = url.lastPathComponent.hasPrefix("long_") ? .long : .short
            return JobsAudioRecording(url: url,
                                      mode: mode,
                                      createdAt: values?.creationDate ?? .distantPast,
                                      duration: player?.duration ?? 0,
                                      fileSize: Int64(values?.fileSize ?? 0))
        }.sorted { $0.createdAt > $1.createdAt }
    }

    public func delete(_ recording: JobsAudioRecording) throws {
        try FileManager.default.removeItem(at: recording.url)
    }
}
