//
//  JobsAudioPlayerEngine.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import AVFoundation

public final class JobsAudioPlayerEngine: NSObject, AVAudioPlayerDelegate {
    public static let shared = JobsAudioPlayerEngine()
    private var storedURL: URL?
    public var playingURL: URL? { jobsAudioOnMain { storedURL } }
    private var storedOnError: ((Error) -> Void)?
    public var onError: ((Error) -> Void)? {
        get { jobsAudioOnMain { storedOnError } }
        set { jobsAudioOnMain { storedOnError = newValue } }
    }
    private var player: AVAudioPlayer?
    private let sessionToken = UUID()
    private var observations: [NSObjectProtocol] = []

    public override init() {
        super.init()
        for name in [AVAudioSession.interruptionNotification, AVAudioSession.mediaServicesWereResetNotification] {
            observations.append(NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main) { [weak self] note in
                guard let self, self.player != nil else { return }
                if note.name == AVAudioSession.interruptionNotification {
                    let raw = (note.userInfo?[AVAudioSessionInterruptionTypeKey] as? NSNumber)?.uintValue
                    guard raw == AVAudioSession.InterruptionType.began.rawValue else { return }
                }
                self.stop()
                self.onError?(NSError(domain: "JobsAudioRecorder", code: 5,
                    userInfo: [NSLocalizedDescriptionKey: "音频播放被中断或媒体服务重置"]))
            })
        }
    }

    public func toggle(url: URL) throws -> Bool {
        try jobsAudioOnMain {
            if storedURL == url, player?.isPlaying == true {
                stop()
                return false
            }
            stop()
            try JobsAudioSessionCoordinator.shared.acquire(sessionToken, recording: false)
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.delegate = self
                guard player.prepareToPlay(), player.play() else {
                    player.delegate = nil
                    player.stop()
                    throw NSError(domain: "JobsAudioRecorder", code: 7,
                        userInfo: [NSLocalizedDescriptionKey: "播放器未能开始播放"])
                }
                self.player = player
                storedURL = url
                return true
            } catch {
                JobsAudioSessionCoordinator.shared.release(sessionToken)
                throw error
            }
        }
    }

    public func stop() {
        jobsAudioOnMain {
            player?.delegate = nil
            player?.stop()
            player = nil
            storedURL = nil
            JobsAudioSessionCoordinator.shared.release(sessionToken)
        }
    }

    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        jobsAudioOnMain {
            guard self.player === player else { return }
            stop()
            if !flag {
                onError?(NSError(domain: "JobsAudioRecorder", code: 8,
                    userInfo: [NSLocalizedDescriptionKey: "播放未正常完成"]))
            }
        }
    }

    public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        jobsAudioOnMain {
            guard self.player === player else { return }
            stop()
            if let error { onError?(error) }
        }
    }

    deinit {
        observations.forEach { NotificationCenter.default.removeObserver($0) }
        player?.delegate = nil
        player?.stop()
        let token = sessionToken
        jobsAudioOnMain { JobsAudioSessionCoordinator.shared.release(token) }
    }
}
