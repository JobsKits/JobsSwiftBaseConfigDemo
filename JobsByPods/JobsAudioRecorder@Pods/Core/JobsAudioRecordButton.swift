//
//  JobsAudioRecordButton.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import UIKit

import JobsFuseAnimation
import JobsSwiftBaseDefines
import JobsSwiftTimer

public final class JobsAudioRecordButton: UIButton {
    public var duration: TimeInterval = 60
    public var minimumValidDuration: TimeInterval = 3
    public var onBegin: (() -> Bool)?
    public var onFinish: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onTooShort: (() -> Void)?

    private let outerRingLayer = CAShapeLayer()
    private let innerLayer = CAShapeLayer()
    private var countdown: JobsSwiftTimerCountdown?
    private var active = false
    private var recordingStartedAt: TimeInterval = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = JobsCor.clear
        accessibilityLabel = "按住录音"
        layer.insertSublayer(innerLayer, at: 0)
        layer.addSublayer(outerRingLayer)
        outerRingLayer.fillColor = JobsCor.clear.cgColor
        outerRingLayer.strokeColor = JobsCor.white.cgColor
        outerRingLayer.lineWidth = 4
        outerRingLayer.lineCap = .round
        innerLayer.fillColor = JobsCor.white.cgColor
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(touchCancelled), for: [.touchDragExit, .touchCancel, .touchUpOutside])
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func layoutSubviews() {
        super.layoutSubviews()
        outerRingLayer.frame = bounds
        innerLayer.frame = bounds
        outerRingLayer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: 4, dy: 4)).cgPath
        innerLayer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: 14, dy: 14)).cgPath
        byFuseOuterRingLayoutIfNeeded()
    }

    @objc private func touchDown() {
        guard onBegin?() ?? true else { return }
        active = true
        recordingStartedAt = ProcessInfo.processInfo.systemUptime
        accessibilityLabel = "松开保存"
        let normalizedDuration = max(1, duration)
        let thresholdProgress = max(
            0,
            min(1, minimumValidDuration / normalizedDuration)
        )
        byFusePressStart(
            ringConfig: JobsFuseOuterRingConfig(
                lineWidth: 4,
                strokeColor: JobsCor.systemRed,
                trackColor: nil,
                growDuration: normalizedDuration,
                repeatsWhileHolding: false,
                retreatDuration: 0.22,
                fadeOutDuration: 0.06,
                inset: 2,
                startsFromTop: true,
                thresholdProgress: thresholdProgress,
                thresholdColor: JobsCor.white
            ),
            scale: 1.08
        )
        let countdown = JobsSwiftTimerCountdown(duration: normalizedDuration)
        countdown.onFinished = { [weak self] _ in self?.finish(automatically: true) }
        self.countdown = countdown
        countdown.start()
    }

    @objc private func touchUpInside() { finish(automatically: false) }

    @objc private func touchCancelled() {
        guard active else { return }
        active = false
        resetVisuals()
        onCancel?()
    }

    private func finish(automatically: Bool) {
        guard active else { return }
        let recordedDuration = automatically
            ? max(0, duration)
            : max(0, ProcessInfo.processInfo.systemUptime - recordingStartedAt)
        let tooShort = recordedDuration < max(0, minimumValidDuration)
        active = false
        resetVisuals()
        if tooShort {
            onCancel?()
            onTooShort?()
        } else {
            onFinish?()
        }
    }

    private func resetVisuals() {
        countdown?.cancel()
        countdown = nil
        recordingStartedAt = 0
        accessibilityLabel = "按住录音"
        byFusePressStop()
    }
}
