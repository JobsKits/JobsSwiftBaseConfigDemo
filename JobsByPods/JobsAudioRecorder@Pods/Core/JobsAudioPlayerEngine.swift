//
//  JobsAudioPlayerEngine.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import AVFoundation

public final class JobsAudioPlayerEngine: NSObject, AVAudioPlayerDelegate {
    public static let shared = JobsAudioPlayerEngine()
    public private(set) var playingURL: URL?
    private var player: AVAudioPlayer?

    public func toggle(url: URL) throws -> Bool {
        if playingURL == url, player?.isPlaying == true { stop(); return false }
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playback, mode: .default)
        try session.setActive(true)
        player = try AVAudioPlayer(contentsOf: url)
        player?.delegate = self
        playingURL = url
        player?.play()
        return true
    }

    public func stop() {
        player?.stop()
        player = nil
        playingURL = nil
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }

    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { stop() }
}
