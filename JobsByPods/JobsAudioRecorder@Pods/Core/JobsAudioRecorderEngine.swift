//
//  JobsAudioRecorderEngine.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import AVFoundation
import Foundation

public protocol JobsAudioRecorderEngineDelegate: AnyObject {
    func audioRecorderEngineDidStart(_ engine: JobsAudioRecorderEngine)
    func audioRecorderEngine(_ engine: JobsAudioRecorderEngine, didFinishAt url: URL?, error: Error?)
}

public final class JobsAudioRecorderEngine: NSObject {
    public static let shared = JobsAudioRecorderEngine()
    public weak var delegate: JobsAudioRecorderEngineDelegate?
    public private(set) var mode: JobsAudioRecordingMode = .short
    public private(set) var currentURL: URL?
    public var isRecording: Bool { recorder?.isRecording == true }
    public var currentTime: TimeInterval { recorder?.currentTime ?? 0 }

    private var recorder: AVAudioRecorder?
    private var keepFile = true

    public func requestPermission(_ completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async { completion(granted) }
        }
    }

    @discardableResult
    public func start(mode: JobsAudioRecordingMode, maximumDuration: TimeInterval? = nil) throws -> URL {
        guard !isRecording else { throw NSError(domain: "JobsAudioRecorder", code: 1, userInfo: [NSLocalizedDescriptionKey: "已有录音正在进行"]) }
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
        try session.setActive(true)
        self.mode = mode
        let url = JobsAudioRecordingStore.shared.makeURL(mode: mode)
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 44_100,
            AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        let recorder = try AVAudioRecorder(url: url, settings: settings)
        recorder.delegate = self
        recorder.isMeteringEnabled = true
        guard recorder.prepareToRecord() else { throw NSError(domain: "JobsAudioRecorder", code: 2, userInfo: [NSLocalizedDescriptionKey: "录音器准备失败"]) }
        keepFile = true
        currentURL = url
        self.recorder = recorder
        if let duration = maximumDuration, duration > 0 { recorder.record(forDuration: duration) }
        else { recorder.record() }
        delegate?.audioRecorderEngineDidStart(self)
        return url
    }

    public func stopAndSave() {
        keepFile = true
        recorder?.stop()
    }

    public func cancel() {
        keepFile = false
        recorder?.stop()
    }
}

extension JobsAudioRecorderEngine: AVAudioRecorderDelegate {
    public func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        let url = currentURL
        if !keepFile || !flag, let url { try? FileManager.default.removeItem(at: url) }
        self.recorder = nil
        currentURL = nil
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        delegate?.audioRecorderEngine(self, didFinishAt: keepFile && flag ? url : nil, error: flag ? nil : NSError(domain: "JobsAudioRecorder", code: 3, userInfo: [NSLocalizedDescriptionKey: "录音未正常完成"]))
    }
}
