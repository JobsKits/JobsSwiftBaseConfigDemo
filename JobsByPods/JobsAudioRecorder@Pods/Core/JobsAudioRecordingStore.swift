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
    private let fileManager: FileManager

    public init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
        let root = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first ?? fileManager.temporaryDirectory
        directoryURL = root.appendingPathComponent("JobsAudioRecordings", isDirectory: true)
        try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
    }

    public func makeURL(mode: JobsAudioRecordingMode) -> URL {
        let formatter = DateFormatter.jobsMake { _ in }
        formatter.byDateFormat("yyyyMMdd_HHmmss_SSS")
        return directoryURL.appendingPathComponent("\(mode.rawValue)_\(formatter.string(from: Date()))_\(UUID().uuidString).m4a")
    }

    public func preparedURL(mode: JobsAudioRecordingMode) throws -> URL {
        try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
        return makeURL(mode: mode)
    }

    /// 兼容空列表回退；需要区分空目录与读取失败时使用 recordingsThrowing。
    public func recordings() -> [JobsAudioRecording] {
        (try? recordingsThrowing()) ?? []
    }

    public func recordingsThrowing() throws -> [JobsAudioRecording] {
        let keys: Set<URLResourceKey> = [.creationDateKey, .fileSizeKey]
        let urls = try fileManager.contentsOfDirectory(at: directoryURL,
                                                      includingPropertiesForKeys: Array(keys),
                                                      options: [.skipsHiddenFiles])
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
        guard recording.url.standardizedFileURL.deletingLastPathComponent() == directoryURL.standardizedFileURL else {
            throw NSError(domain: "JobsAudioRecorder", code: 9,
                          userInfo: [NSLocalizedDescriptionKey: "只允许删除本录音目录中的文件"])
        }
        try fileManager.removeItem(at: recording.url)
    }
}
