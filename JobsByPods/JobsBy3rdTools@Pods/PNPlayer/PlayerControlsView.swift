//
//  PlayerControlsView.swift
//  PNPlayer
//
//  Created by linghugoogle on 2025/10/11.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import AVFoundation
import SnapKit
import JobsByUIKit

public protocol PlayerControlsDelegate: AnyObject {
    func didTapPlayPause()
    func didSeekToTime(_ time: TimeInterval)
}

open class PlayerControlsView: UIView {
    // MARK: - Public
    weak var delegate: PlayerControlsDelegate?
    @discardableResult
    public func byDelegate(_ d: PlayerControlsDelegate?) -> Self {
        delegate = d
        return self
    }
    // MARK: - Private State
    private var isPlaying = false
    private var duration: TimeInterval = 0
    private var currentTime: TimeInterval = 0
    private var isUserDragging = false

    // MARK: - UI (lazy + 的 DSL，不做相互引用)
    private lazy var playPauseButton: UIButton = {
        let v = UIButton.sys()
            .byImage("play.fill".sysImg, for: .normal)
            .byContentEdgeInsets(.zero)
            .byTintColor(.white)
            .onTap { [weak self] _ in
                self?.delegate?.didTapPlayPause()
            }
        // 不被拉伸
        v.setContentHuggingPriority(.required, for: .horizontal)
        v.setContentCompressionResistancePriority(.required, for: .horizontal)
        return v
    }()

    private lazy var progressSlider: UISlider = {
        let v = UISlider()
            .byMinimumValue(0)
            .byMaximumValue(1)
            .byValue(0)
            .byThumbTintColor(.white)
            .byMinimumTrackTintColor(.white)
            .byMaximumTrackTintColor(UIColor.white.withAlphaComponent(0.3))
            // 拖动中：只更新 UI 显示，不真正 seek
            .onJobsChange { [weak self] (s: UISlider) in
                guard let self, self.isUserDragging else { return }
                let t = TimeInterval(s.value) * self.duration
                self.currentTime = t
                self.updateCurrentTimeLabel()
            }
            // 手指按下：进入拖动态
            .onJobsEvent(.touchDown) { [weak self] (_: UISlider) in
                self?.isUserDragging = true
            }
            // 松手 / 取消：发起 seek，稍后退出拖动态
            .onJobsEvent([.touchUpInside, .touchUpOutside, .touchCancel]) { [weak self] (s: UISlider) in
                guard let self else { return }
                let t = TimeInterval(s.value) * self.duration
                self.delegate?.didSeekToTime(t)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                    self?.isUserDragging = false
                }
            }
        // 让 slider 吃掉横向剩余空间
        v.setContentHuggingPriority(.defaultLow, for: .horizontal)
        v.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return v
    }()

    private lazy var currentTimeLabel: UILabel = {
        UILabel()
            .byText("00:00")
            .byTextColor(.white)
            .byFont(.monospacedDigitSystemFont(ofSize: 12, weight: .regular))
            .byTextAlignment(.center)
            .byHugging(.required)
            .byCompressionResistance(.required)
    }()

    private lazy var durationLabel: UILabel = {
        UILabel()
            .byText("00:00")
            .byTextColor(.white)
            .byFont(.monospacedDigitSystemFont(ofSize: 12, weight: .regular))
            .byTextAlignment(.center)
            .byHugging(.required)
            .byCompressionResistance(.required)
    }()

    private lazy var controlsStackView: UIStackView = {
        UIStackView()
            .byAxis(.horizontal)
            .byAlignment(.center)
            .byDistribution(.fill)
            .bySpacing(12)
    }()

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupLayout()
    }

    // MARK: - Setup
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 8
        layer.masksToBounds = true

        // 先把 arrangedSubviews 塞进去，避免懒加载循环引用
        _ = controlsStackView.byAddArrangedSubviews([playPauseButton, currentTimeLabel, progressSlider, durationLabel])

        // 再把 stack 加到自己身上并约束
        _ = controlsStackView.byAddTo(self) { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
        }
    }

    private func setupLayout() {
        // 固定按钮与时间标签的尺寸（其余空间交给 slider）
        playPauseButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        currentTimeLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        durationLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
    }

    // MARK: - Public API（对外协议不变）
    public func updatePlayPauseButton(isPlaying: Bool) {
        self.isPlaying = isPlaying
        let imageName = isPlaying ? "pause.fill" : "play.fill"
        _ = playPauseButton.byImage(imageName.sysImg, for: .normal)
    }

    public func updateProgress(currentTime: TimeInterval, duration: TimeInterval) {
        guard currentTime.isFinite, !currentTime.isNaN, currentTime >= 0,
              duration.isFinite, !duration.isNaN, duration > 0 else { return }

        self.duration = duration

        if isUserDragging {
            updateDurationLabel()
            return
        }

        self.currentTime = currentTime
        progressSlider.setValue(Float(currentTime / duration), animated: false)
        updateCurrentTimeLabel()
        updateDurationLabel()
    }

    public func show(animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: 0.3) { self.alpha = 1.0 }
        } else {
            alpha = 1.0
        }
    }

    public func hide(animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: 0.3) { self.alpha = 0.0 }
        } else {
            alpha = 0.0
        }
    }

    // MARK: - Helpers
    private func updateCurrentTimeLabel() {
        _ = currentTimeLabel.byText(formatTime(currentTime))
    }

    private func updateDurationLabel() {
        _ = durationLabel.byText(formatTime(duration))
    }

    private func formatTime(_ time: TimeInterval) -> String {
        guard time.isFinite, !time.isNaN, time >= 0 else { return "00:00" }
        let total = Int(time.rounded(.down))
        let hours = total / 3600
        let minutes = (total % 3600) / 60
        let seconds = total % 60
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
