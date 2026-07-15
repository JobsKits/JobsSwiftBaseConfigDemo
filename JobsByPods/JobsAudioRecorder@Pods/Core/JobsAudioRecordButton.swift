//
//  JobsAudioRecordButton.swift
//  JobsAudioRecorder
//
//  Created by Jobs on 2026年7月14日，星期二.
//

import UIKit

import JobsSwiftTimer

public final class JobsAudioRecordButton: UIButton {
    public var duration: TimeInterval = 60
    public var minimumValidDuration: TimeInterval = 3
    public var onBegin: (() -> Bool)?
    public var onFinish: (() -> Void)?
    public var onCancel: (() -> Void)?
    public var onTooShort: (() -> Void)?

    private let trackLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    private let innerLayer = CAShapeLayer()
    private var countdown: JobsSwiftTimerCountdown?
    private var active = false
    private var recordingStartedAt: TimeInterval = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        tintColor = .white
        setImage(UIImage(systemName: "mic.fill"), for: .normal)
        setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(pointSize: 29, weight: .semibold),
            forImageIn: .normal
        )
        accessibilityLabel = "按住录音"
        layer.addSublayer(trackLayer)
        layer.addSublayer(progressLayer)
        layer.insertSublayer(innerLayer, at: 0)
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.systemGray4.cgColor
        trackLayer.lineWidth = 6
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.systemRed.cgColor
        progressLayer.lineWidth = 6
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        innerLayer.fillColor = UIColor.systemBlue.cgColor
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(touchCancelled), for: [.touchDragExit, .touchCancel, .touchUpOutside])
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(ovalIn: bounds.insetBy(dx: 4, dy: 4)).cgPath
        trackLayer.path = path
        progressLayer.path = path
        innerLayer.path = UIBezierPath(ovalIn: bounds.insetBy(dx: 13, dy: 13)).cgPath
    }

    @objc private func touchDown() {
        guard onBegin?() ?? true else { return }
        active = true
        recordingStartedAt = ProcessInfo.processInfo.systemUptime
        accessibilityLabel = "松开保存"
        innerLayer.fillColor = UIColor.systemRed.cgColor
        UIView.animate(withDuration: 0.15) {
            self.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
        }
        let countdown = JobsSwiftTimerCountdown(duration: max(1, duration))
        countdown.onProgress = { [weak self] snapshot in self?.progressLayer.strokeEnd = CGFloat(snapshot.progress) }
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
        progressLayer.strokeEnd = 0
        accessibilityLabel = "按住录音"
        innerLayer.fillColor = UIColor.systemBlue.cgColor
        UIView.animate(withDuration: 0.24) { self.transform = .identity }
    }
}
