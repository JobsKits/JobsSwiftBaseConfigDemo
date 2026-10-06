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
    private weak var storedDelegate: JobsAudioRecorderEngineDelegate?
    public var delegate: JobsAudioRecorderEngineDelegate? {
        get { jobsAudioOnMain { storedDelegate } }
        set { jobsAudioOnMain { storedDelegate = newValue } }
    }
    private var storedMode: JobsAudioRecordingMode = .short
    private var storedURL: URL?
    public var mode: JobsAudioRecordingMode { jobsAudioOnMain { storedMode } }
    public var currentURL: URL? { jobsAudioOnMain { storedURL } }
    public var isRecording: Bool { jobsAudioOnMain { recorder?.isRecording == true } }
    public var currentTime: TimeInterval { jobsAudioOnMain { recorder?.currentTime ?? 0 } }

    private var recorder: AVAudioRecorder?
    private var keepFile = true
    private var finishing = false
    private let sessionToken = UUID()
    private var observations: [NSObjectProtocol] = []

    public override init() {
        super.init()
        for name in [AVAudioSession.interruptionNotification, AVAudioSession.mediaServicesWereResetNotification] {
            observations.append(NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { [weak self] note in
                guard let self, let recorder = self.recorder else { return }
                if note.name == AVAudioSession.interruptionNotification {
                    let raw = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? NSNumber)?.uintValue
                    guard raw == AVAudioSession.InterruptionType.began.rawValue else { return }
                }
                recorder.stop()
                self.finish(recorder, successful: false, error: self.failure(5, "音频会话中断或媒体服务重置"))
            })
        }
    }

    public func requestPermission(_ completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async { completion(granted) }
        }
    }

    @discardableResult
    public func start(mode: JobsAudioRecordingMode, maximumDuration: TimeInterval? = nil) throws -> URL {
        try jobsAudioOnMain {
            guard recorder == nil, !finishing else { throw failure(1, "已有录音或结束处理正在进行") }
            if let duration = maximumDuration {
                guard duration.isFinite, duration > 0 else { throw failure(4, "最大录音时长必须为有限正数") }
            }
            try JobsAudioSessionCoordinator.shared.acquire(sessionToken, recording: true)
            var createdURL: URL?
            do {
                let url = try JobsAudioRecordingStore.shared.preparedURL(mode: mode)
                createdURL = url
                let settings: [String: Any] = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                    AVSampleRateKey: 44_100,
                    AVNumberOfChannelsKey: 1,
                    AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                ]
                let recorder = try AVAudioRecorder(url: url, settings: settings)
                recorder.delegate = self
                recorder.isMeteringEnabled = true
                guard recorder.prepareToRecord() else { throw failure(2, "录音器准备失败") }
                let started = maximumDuration.map { recorder.record(forDuration: $0) } ?? recorder.record()
                guard started else {
                    recorder.delegate = nil
                    recorder.stop()
                    throw failure(2, "录音器未能开始录音")
                }
                storedMode = mode
                storedURL = url
                keepFile = true
                finishing = false
                self.recorder = recorder
                delegate?.audioRecorderEngineDidStart(self)
                return url
            } catch {
                if let url = createdURL { try? FileManager.default.removeItem(at: url) }
                JobsAudioSessionCoordinator.shared.release(sessionToken)
                throw error
            }
        }
    }

    public func stopAndSave() {
        jobsAudioOnMain {
            guard let recorder, !finishing else { return }
            keepFile = true
            finishing = true
            recorder.stop()
        }
    }

    public func cancel() {
        jobsAudioOnMain {
            guard let recorder else { return }
            keepFile = false
            finishing = true
            recorder.stop()
            finish(recorder, successful: true, error: nil)
        }
    }

    private func failure(_ code: Int, _ message: String) -> NSError {
        NSError(domain: "JobsAudioRecorder", code: code, userInfo: [NSLocalizedDescriptionKey: message])
    }

    private func finish(_ sender: AVAudioRecorder, successful: Bool, error: Error?) {
        guard recorder === sender else { return }
        let url = storedURL
        let saved = keepFile && successful && error == nil
        sender.delegate = nil
        recorder = nil
        storedURL = nil
        finishing = false
        if !saved, let url { try? FileManager.default.removeItem(at: url) }
        JobsAudioSessionCoordinator.shared.release(sessionToken)
        delegate?.audioRecorderEngine(self, didFinishAt: saved ? url : nil,
            error: error ?? (successful ? nil : failure(3, "录音未正常完成")))
    }

    deinit {
        observations.forEach { NotificationCenter.default.removeObserver($0) }
        recorder?.delegate = nil
        recorder?.stop()
        let token = sessionToken
        jobsAudioOnMain { JobsAudioSessionCoordinator.shared.release(token) }
    }
}

extension JobsAudioRecorderEngine: AVAudioRecorderDelegate {
    public func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        jobsAudioOnMain { finish(recorder, successful: flag, error: nil) }
    }

    public func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        jobsAudioOnMain { finish(recorder, successful: false, error: error ?? failure(6, "录音编码失败")) }
    }
}
