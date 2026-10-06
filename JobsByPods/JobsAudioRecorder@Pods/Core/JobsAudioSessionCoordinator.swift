//
//  JobsAudioSessionCoordinator.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import AVFoundation
import Foundation

func jobsAudioOnMain<T>(_ action: () throws -> T) rethrows -> T {
    if Thread.isMainThread {
        return try action()
    }
    return try DispatchQueue.main.sync(execute: action)
}

/// 只协调本模块的 recorder/player；宿主其它音频组件需要统一会话策略。
final class JobsAudioSessionCoordinator {
    static let shared = JobsAudioSessionCoordinator()
    private var owner: UUID?
    private var previous: (AVAudioSession.Category, AVAudioSession.Mode, AVAudioSession.CategoryOptions)?

    func acquire(_ token: UUID, recording: Bool) throws {
        guard owner == nil else {
            throw NSError(domain: "JobsAudioRecorder", code: 10,
                          userInfo: [NSLocalizedDescriptionKey: "本模块已有录音或播放占用音频会话"])
        }
        let session = AVAudioSession.sharedInstance()
        let snapshot = (session.category, session.mode, session.categoryOptions)
        do {
            if recording {
                try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            } else {
                try session.setCategory(.playback, mode: .default)
            }
            try session.setActive(true)
            previous = snapshot
            owner = token
        } catch {
            try? session.setCategory(snapshot.0, mode: snapshot.1, options: snapshot.2)
            throw error
        }
    }

    func release(_ token: UUID) {
        guard owner == token else {
            return
        }
        owner = nil
        let snapshot = previous
        previous = nil
        let session = AVAudioSession.sharedInstance()
        try? session.setActive(false, options: .notifyOthersOnDeactivation)
        if let snapshot {
            try? session.setCategory(snapshot.0, mode: snapshot.1, options: snapshot.2)
        }
    }
}
