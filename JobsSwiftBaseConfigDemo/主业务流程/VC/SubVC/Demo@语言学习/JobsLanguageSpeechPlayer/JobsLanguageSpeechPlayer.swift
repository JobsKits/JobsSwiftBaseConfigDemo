//
//  JobsLanguageSpeechPlayer.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//

import AVFoundation
import JobsByUIKit

/// 每个页面独立持有。用 utterance 身份过滤旧回调，快速切换不会串音。
@MainActor
final class JobsLanguageSpeechPlayer: NSObject, AVSpeechSynthesizerDelegate {
    var onStart: ((String) -> Void)?
    var onFinish: (() -> Void)?
    var onError: ((String) -> Void)?
    private var pending: [ObjectIdentifier: String] = [:]
    private lazy var synthesizer = AVSpeechSynthesizer.jobsMake {
        $0.byLessonDelegate(self)
            .byLessonAudioSession(false)
    }

    func play(_ texts: [String], language: String, rate: Float, repeats: Int) {
        stop()
        guard let voice = AVSpeechSynthesisVoice.make(lessonLanguage: language) else {
            onError?("未找到俄语声音。请在系统设置的辅助功能朗读设置中下载俄语声音后重试。")
            return
        }
        for text in texts {
            for _ in 0..<max(1, min(repeats, 3)) {
                let utterance = AVSpeechUtterance.make(lessonText: text)
                    .byLessonVoice(voice)
                    .byLessonRate(rate)
                    .byLessonPause(0.35)
                pending[ObjectIdentifier(utterance)] = text
                synthesizer.byLessonSpeak(utterance)
            }
        }
    }

    func stop() {
        pending.removeAll()
        synthesizer.byLessonStop()
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        let identifier = ObjectIdentifier(utterance)
        Task { @MainActor [weak self] in
            guard let self, let text = pending[identifier] else { return }
            onStart?(text)
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        let identifier = ObjectIdentifier(utterance)
        Task { @MainActor [weak self] in
            guard let self, pending.removeValue(forKey: identifier) != nil else { return }
            if pending.isEmpty { onFinish?() }
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        let identifier = ObjectIdentifier(utterance)
        Task { @MainActor [weak self] in
            guard let self, pending.removeValue(forKey: identifier) != nil else { return }
            if pending.isEmpty { onFinish?() }
        }
    }
}

/// 点读内部的系统适配，业务层只操作课程播放器，不扩大公共 Pod API。
private extension AVSpeechSynthesizer {
    @discardableResult func byLessonDelegate(_ value: AVSpeechSynthesizerDelegate) -> Self {
        delegate = value
        return self
    }
    @discardableResult func byLessonAudioSession(_ value: Bool) -> Self {
        usesApplicationAudioSession = value
        return self
    }
    @discardableResult func byLessonSpeak(_ value: AVSpeechUtterance) -> Self {
        speak(value)
        return self
    }
    @discardableResult func byLessonStop() -> Self {
        stopSpeaking(at: .immediate)
        return self
    }
}

private extension AVSpeechUtterance {
    static func make(lessonText text: String) -> AVSpeechUtterance { AVSpeechUtterance(string: text) }
    @discardableResult func byLessonVoice(_ value: AVSpeechSynthesisVoice) -> Self {
        voice = value
        return self
    }
    @discardableResult func byLessonRate(_ value: Float) -> Self {
        rate = value
        return self
    }
    @discardableResult func byLessonPause(_ value: TimeInterval) -> Self {
        postUtteranceDelay = value
        return self
    }
}

private extension AVSpeechSynthesisVoice {
    static func make(lessonLanguage language: String) -> AVSpeechSynthesisVoice? { AVSpeechSynthesisVoice(language: language) }
}
