//
//  TimerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/4/25.
//
//  概要
//  -----------------------------------------------------------------------------
//  ✅ Swift 6 / 新版 JobsTimer 适配版（完整可编译）
//  - 支持四种实现：Foundation.Timer / DispatchSourceTimer(GCD) / CADisplayLink / CFRunLoopTimer
//  - 统一控制：start / pause / resume / fireOnce(手动触发一次逻辑+stop) / stop
//  - 不再把 timer 挂在 UIButton 内部（旧扩展不再依赖）
//  - ✅ Swift 6 并发“同等待遇”
//    1) @Sendable tick 回调里：先冻结 weak self -> strongSelf
//    2) 再 Task { @MainActor in ... } 安全触碰 UIKit
//  - 输入 interval：结束编辑后若有活动 timer，按“当前模式”重建
//  - 切换内核：若有活动 timer，按“当前模式”用新内核重建并延续
// -----------------------------------------------------------------------------

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import Inheritance
import GKNavigationBarSwift
import JobsByUIKit
import JobsTimer
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftAppTools

final class TimerDemoVC: BaseVC {

    // MARK: - Layout 常量
    let horizontalInset: CGFloat = 40
    let spacing: CGFloat = 12

    // MARK: - TimerState（旧文件依赖 TimerState，这里完整补齐）
    private enum TimerState {
        case idle
        case running
        case paused
        case stopped
    }

    // MARK: - 计时器配置（由 UI 驱动）
    private var currentKind: JobsTimerKind = .gcd
    private var intervalSec: TimeInterval = 1.0   // 步长（秒），由输入框维护

    // MARK: - 运行状态（VC 自己管理，不再依赖 UIButton.timer 扩展）
    private var countUpTimer: JobsTimerProtocol?
    private var countdownTimer: JobsTimerProtocol?

    private var countUpState: TimerState = .idle
    private var countdownState: TimerState = .idle

    private var elapsed: TimeInterval = 0
    private var countdownTotal: TimeInterval = 0
    private var countdownRemaining: TimeInterval = 0

    deinit {
        countUpTimer?.stop()
        countdownTimer?.stop()
    }

    // MARK: - Segmented（选择计时器内核）
    private lazy var kindSelector = UISegmentedControl(items: ["NSTimer".tr, "GCD".tr, "DisplayLink".tr, "RunLoop".tr])
        .bySelectedSegmentIndex(1) // 默认 GCD
        .onJobsChange { [weak self] (seg: UISegmentedControl) in
            guard let strongSelf = self else { return }
            Task { @MainActor in
                let mapping: [JobsTimerKind] = [.foundation, .gcd, .displayLink, .runLoop]
                let idx = max(0, min(seg.selectedSegmentIndex, mapping.count - 1))
                strongSelf.currentKind = mapping[idx]
                strongSelf.rebuildActiveTimersForNewKind()
            }
        }
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(40)
            make.height.equalTo(36)
        }

    // MARK: - 最近一次触发时间
    private lazy var lastFireLabel = UILabel()
        .byText("Last: -")
        .byFont(.monospacedDigitSystemFont(ofSize: 14, weight: .regular))
        .byTextColor(.secondaryLabel)
        .byTextAlignment(.center)
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(self.kindSelector.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }

    // MARK: - 步长输入框（修改 interval）
    private lazy var intervalField = UITextField()
        .byText("1.0")
        .byKeyboardType(.decimalPad)
        .byBorderStyle(.roundedRect)
        .byTextAlignment(.center)
        .byFont(.systemFont(ofSize: 16))
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(self.lastFireLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
        // 输入时仅更新内存值，不重建（避免频繁抖动）
        .onJobsEvent(.editingChanged) { [weak self] (tf: UITextField) in
            self?.applyIntervalFromField(tf, commit: false)
        }
        // 结束编辑后：若有正在运行/暂停的计时器，立即“停旧并用新步长重启”（重建）
        .onJobsEvent(.editingDidEnd) { [weak self] (tf: UITextField) in
            self?.applyIntervalFromField(tf, commit: true)
        }

    // MARK: - 倒计时峰值输入框（只允许数字）
    private lazy var countdownField = UITextField()
        .byText("10")
        .byKeyboardType(.numberPad)
        .byBorderStyle(.roundedRect)
        .byTextAlignment(.center)
        .byFont(.systemFont(ofSize: 16))
        .byAddTo(view) { [unowned self] make in
            make.top.equalTo(self.intervalField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }

    // MARK: - 开始按钮（正计时）
    private lazy var startButton: UIButton = {
        UIButton(type: .system)
            .byTitle("开始", for: .normal)
            .byTitleFont(.systemFont(ofSize: 22, weight: .bold))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemBlue, for: .normal)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .onTap { [weak self] _ in
                guard let strongSelf = self else { return }
                Task { @MainActor in
                    strongSelf.lastFireLabel.text = "Last: -"
                    strongSelf.startCountUp()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(countdownField.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(56)
            }
    }()

    // MARK: - 控制键：暂停 / 继续 / Fire / 停止
    private lazy var pauseButton = makeActionButton(
        title: "暂停",
        titleColor: .systemBlue,
        subtitle: "悬空"
    ) { [weak self] _ in
        guard let strongSelf = self else { return }
        Task { @MainActor in
            strongSelf.pauseAll()
        }
    }

    private lazy var resumeButton = makeActionButton(
        title: "继续",
        titleColor: .systemBlue,
        subtitle: "恢复计时"
    ) { [weak self] _ in
        guard let strongSelf = self else { return }
        Task { @MainActor in
            strongSelf.resumeAll()
        }
    }

    private lazy var fireButton = makeActionButton(
        title: "Fire",
        titleColor: .systemTeal,
        subtitle: "触发并销毁"
    ) { [weak self] _ in
        guard let strongSelf = self else { return }
        Task { @MainActor in
            strongSelf.fireOnceAll()
        }
    }

    private lazy var stopButton = makeActionButton(
        title: "停止",
        titleColor: .systemRed,
        subtitle: "销毁(无回调)"
    ) { [weak self] _ in
        guard let strongSelf = self else { return }
        Task { @MainActor in
            strongSelf.stopAll()
        }
    }

    // MARK: - 说明 Fire 与 Stop 的区别
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byText("Fire：触发回调后销毁定时器；\n停止：销毁但不触发回调。")
            .byFont(.systemFont(ofSize: 12))
            .byTextColor(.secondaryLabel)
            .byTextAlignment(.left)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(stopButton.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            }
    }()

    // MARK: - 倒计时演示按钮
    private lazy var countdownButton: UIButton = {
        UIButton(type: .system)
            .byTitle("获取验证码", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemGreen, for: .normal)
            .onTap { [weak self] btn in
                guard let strongSelf = self else { return }
                Task { @MainActor in
                    let total = strongSelf.parseCountdownTotal(10)
                    strongSelf.startCountDown(total: total)
                    btn.byTitle("还剩 \(total)s", for: .normal)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(20)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(50)
            }
    }()

    // MARK: - 布局（两排：开始 / 暂停-继续-Fire-停止）
    private func layoutButtons() {
        let totalWidth = UIScreen.main.bounds.width - horizontalInset * 2
        let itemWidth = (totalWidth - spacing * 3) / 4.0

        // 第一排：开始
        startButton.byAlpha(1)

        // 第二排：暂停 / 继续 / Fire / 停止
        for (i, btn) in [pauseButton, resumeButton, fireButton, stopButton].enumerated() {
            btn.byAddTo(view) { [unowned self] make in
                make.top.equalTo(startButton.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(horizontalInset + CGFloat(i) * (itemWidth + spacing))
                make.width.equalTo(itemWidth)
                make.height.greaterThanOrEqualTo(52)
            }
        }

        hintLabel.byAlpha(1)
        _ = countdownButton
    }

    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "Timer Demo")

        _ = kindSelector
        _ = lastFireLabel
        _ = intervalField
        _ = countdownField

        layoutButtons()
        updateControlButtons(by: .idle)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 离开页面时清掉 timer
        stopAll()
    }

    // MARK: - Timer 构建（统一入口）
    @MainActor
    private func makeTimer(kind: JobsTimerKind,
                           interval: TimeInterval,
                           handler: @escaping JobsTimerCallback) -> JobsTimerProtocol {
        let cfg = JobsTimerConfig(
            interval: max(0.000_001, interval),
            repeats: true,
            tolerance: 0,
            queue: .main,
            runLoop: .main,
            runLoopMode: .common,
            pauseInBackground: true,
            autoManageAppState: true
        )
        return JobsTimer(kind: kind, config: cfg, handler: handler)
    }

    // MARK: - 正计时：Start
    @MainActor
    private func startCountUp() {
        // 重投：先停旧
        countUpTimer?.stop()
        countUpTimer = nil

        elapsed = 0
        countUpState = .running
        updateControlButtons(by: .running)

        startButton.byTitle("0.0s", for: .normal)
        lastFireLabel.text = "Last: -"

        let kind = currentKind
        let interval = intervalSec

        let t = makeTimer(kind: kind, interval: interval) { [weak self] in
            // ✅ Swift 6 / Sendable 同等待遇：冻结 + MainActor
            guard let strongSelf = self else { return }
            Task { @MainActor in
                guard strongSelf.countUpState == .running else { return }
                strongSelf.elapsed += interval
                strongSelf.startButton.byTitle(String(format: "%.1fs", strongSelf.elapsed), for: .normal)
                strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
            }
        }

        countUpTimer = t
        t.start()
    }

    // MARK: - 倒计时：Start
    @MainActor
    private func startCountDown(total: Int) {
        countdownTimer?.stop()
        countdownTimer = nil

        countdownTotal = TimeInterval(max(1, total))
        countdownRemaining = countdownTotal
        countdownState = .running
        updateControlButtons(by: .running)

        countdownButton.byTitle("还剩 \(Int(countdownRemaining))s", for: .normal)
        lastFireLabel.text = "Last: -"

        let kind = currentKind
        let interval = intervalSec

        let t = makeTimer(kind: kind, interval: interval) { [weak self] in
            // ✅ Swift 6 / Sendable 同等待遇：冻结 + MainActor
            guard let strongSelf = self else { return }
            Task { @MainActor in
                guard strongSelf.countdownState == .running else { return }

                strongSelf.countdownRemaining -= interval
                if strongSelf.countdownRemaining <= 0 {
                    strongSelf.countdownRemaining = 0
                    strongSelf.countdownButton.byTitle("获取验证码", for: .normal)
                    strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
                    print("✅ [\(strongSelf.currentKind)] 倒计时完成")

                    strongSelf.countdownTimer?.stop()
                    strongSelf.countdownTimer = nil
                    strongSelf.countdownState = .stopped
                    strongSelf.syncGlobalStateAfterStop()
                    return
                }

                let remainInt = max(0, Int(ceil(strongSelf.countdownRemaining)))
                strongSelf.countdownButton.byTitle("还剩 \(remainInt)s", for: .normal)
                strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
                print("⏱️ [\(strongSelf.currentKind)] \(remainInt)/\(Int(strongSelf.countdownTotal))")
            }
        }

        countdownTimer = t
        t.start()
    }

    // MARK: - 控制行为
    @MainActor
    private func pauseAll() {
        if countUpState == .running {
            countUpTimer?.pause()
            countUpState = .paused
        }
        if countdownState == .running {
            countdownTimer?.pause()
            countdownState = .paused
        }
        updateControlButtons(by: .paused)
    }

    @MainActor
    private func resumeAll() {
        if countUpState == .paused {
            countUpTimer?.resume()
            countUpState = .running
        }
        if countdownState == .paused {
            countdownTimer?.resume()
            countdownState = .running
        }
        updateControlButtons(by: .running)
    }

    /// Fire：手动执行一次 tick 语义 + stop（✅ 不依赖 JobsTimerProtocol.fireOnce）
    @MainActor
    private func fireOnceAll() {
        // 手动触发一次“正计时 tick”
        if countUpState == .running {
            elapsed += intervalSec
            startButton.byTitle(String(format: "%.1fs", elapsed), for: .normal)
            lastFireLabel.text = "Last: " + fmt(Date())
        }

        // 手动触发一次“倒计时 tick”
        if countdownState == .running {
            countdownRemaining -= intervalSec
            let remainInt = max(0, Int(ceil(countdownRemaining)))
            if remainInt <= 0 {
                countdownRemaining = 0
                countdownButton.byTitle("获取验证码", for: .normal)
                print("✅ [\(currentKind)] 倒计时完成（Fire）")
            } else {
                countdownButton.byTitle("还剩 \(remainInt)s", for: .normal)
            }
            lastFireLabel.text = "Last: " + fmt(Date())
        }

        // 然后 stop（触发并销毁）
        countUpTimer?.stop()
        countdownTimer?.stop()

        countUpTimer = nil
        countdownTimer = nil

        countUpState = .stopped
        countdownState = .stopped
        updateControlButtons(by: .stopped)
    }

    /// Stop：直接 stop（不额外触发）
    @MainActor
    private func stopAll() {
        countUpTimer?.stop()
        countdownTimer?.stop()

        countUpTimer = nil
        countdownTimer = nil

        countUpState = .stopped
        countdownState = .stopped
        updateControlButtons(by: .stopped)

        // UI 复位（按你原 demo 习惯：start 允许再次点击）
        startButton.byTitle("开始", for: .normal)
        if countdownState == .stopped {
            countdownButton.byTitle("获取验证码", for: .normal)
        }
    }

    @MainActor
    private func syncGlobalStateAfterStop() {
        let runningOrPaused =
            (countUpState == .running || countUpState == .paused) ||
            (countdownState == .running || countdownState == .paused)

        if !runningOrPaused {
            updateControlButtons(by: .idle)
        }
    }

    // MARK: - 切换内核 / 修改步长：按“当前模式”重建
    @MainActor
    private func rebuildActiveTimersForNewKind() {
        rebuildActiveTimersForNewParams()
    }

    @MainActor
    private func rebuildActiveTimersForNewInterval() {
        rebuildActiveTimersForNewParams()
    }

    /// 同时重建两个 timer（保留 elapsed / remaining）
    @MainActor
    private func rebuildActiveTimersForNewParams() {
        // 正计时：running/paused 则重建
        if countUpState == .running || countUpState == .paused {
            let wasPaused = (countUpState == .paused)

            // 先停旧
            countUpTimer?.stop()
            countUpTimer = nil

            // 用新 kind/interval 继续（不清 elapsed）
            countUpState = .running
            updateControlButtons(by: .running)

            let kind = currentKind
            let interval = intervalSec

            let t = makeTimer(kind: kind, interval: interval) { [weak self] in
                guard let strongSelf = self else { return }
                Task { @MainActor in
                    guard strongSelf.countUpState == .running else { return }
                    strongSelf.elapsed += interval
                    strongSelf.startButton.byTitle(String(format: "%.1fs", strongSelf.elapsed), for: .normal)
                    strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
                }
            }

            countUpTimer = t
            t.start()

            if wasPaused {
                t.pause()
                countUpState = .paused
                updateControlButtons(by: .paused)
            }
        }

        // 倒计时：running/paused 则用剩余时间近似重建
        if countdownState == .running || countdownState == .paused {
            let wasPaused = (countdownState == .paused)

            countdownTimer?.stop()
            countdownTimer = nil

            countdownState = .running
            updateControlButtons(by: .running)

            let kind = currentKind
            let interval = intervalSec

            let t = makeTimer(kind: kind, interval: interval) { [weak self] in
                guard let strongSelf = self else { return }
                Task { @MainActor in
                    guard strongSelf.countdownState == .running else { return }

                    strongSelf.countdownRemaining -= interval
                    if strongSelf.countdownRemaining <= 0 {
                        strongSelf.countdownRemaining = 0
                        strongSelf.countdownButton.byTitle("获取验证码", for: .normal)
                        strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
                        print("✅ [\(strongSelf.currentKind)] 倒计时完成")

                        strongSelf.countdownTimer?.stop()
                        strongSelf.countdownTimer = nil
                        strongSelf.countdownState = .stopped
                        strongSelf.syncGlobalStateAfterStop()
                        return
                    }

                    let remainInt = max(0, Int(ceil(strongSelf.countdownRemaining)))
                    strongSelf.countdownButton.byTitle("还剩 \(remainInt)s", for: .normal)
                    strongSelf.lastFireLabel.text = "Last: " + fmt(Date())
                }
            }

            countdownTimer = t
            t.start()

            if wasPaused {
                t.pause()
                countdownState = .paused
                updateControlButtons(by: .paused)
            }
        }
    }

    // MARK: - 控制键 UI（由 VC 状态驱动）
    @MainActor
    private func updateControlButtons(by state: TimerState) {
        func set(_ btn: UIButton, _ enabled: Bool, _ color: UIColor) {
            btn.byAlpha(enabled ? 1.0 : 0.5)
                .byUserInteractionEnabled(enabled)
                .byBackgroundColor(color, for: .normal)
                .bySetNeedsUpdateConfiguration()
        }

        switch state {
        case .idle, .stopped:
            set(startButton,  true,  .systemBlue)
            set(pauseButton,  false, .systemGray3)
            set(resumeButton, false, .systemGray3)
            set(fireButton,   false, .systemGray3)
            set(stopButton,   false, .systemGray3)

        case .running:
            set(startButton,  false, .systemGray3)
            set(pauseButton,  true,  .systemBlue)
            set(resumeButton, false, .systemGray3)
            set(fireButton,   true,  .systemTeal)
            set(stopButton,   true,  .systemRed)

        case .paused:
            set(startButton,  false, .systemGray3)
            set(pauseButton,  false, .systemGray3)
            set(resumeButton, true,  .systemBlue)
            set(fireButton,   true,  .systemTeal)
            set(stopButton,   true,  .systemRed)
        }
    }

    // MARK: - 工具：构造次级按钮
    private func makeActionButton(
        title: String,
        titleFont: UIFont = .systemFont(ofSize: 16, weight: .semibold),
        titleColor: UIColor,
        subtitle: String? = nil,
        subtitleFont: UIFont = .systemFont(ofSize: 11, weight: .regular),
        subtitleColor: UIColor = UIColor.white.withAlphaComponent(0.85),
        _ action: @escaping (UIButton) -> Void
    ) -> UIButton {
        UIButton(type: .system)
            .byTitle(title, for: .normal)
            .byTitleFont(titleFont)
            .byTitleColor(.white, for: .normal)
            .byAdoptConfigurationIfAvailable()
            .bySubTitle(subtitle, for: .normal)
            .bySubTitleFont(subtitleFont, for: .normal)
            .bySubTitleColor(subtitleColor, for: .normal)
            .byBackgroundColor(titleColor, for: .normal)
            .byCornerRadius(8)
            .byMasksToBounds(true)
            .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .onTap(action)
            .byAddTo(view) { make in
                make.height.greaterThanOrEqualTo(52)
            }
    }

    // MARK: - 步长解析 & 应用（commit=true 时，重建并沿用“当前模式+新步长+当前内核”）
    private func applyIntervalFromField(_ t: UITextField, commit: Bool) {
        let v = (t.text ?? "").trimmingCharacters(in: .whitespaces)
        if let x = Double(v), x > 0 {
            intervalSec = x
        } else {
            intervalSec = 1.0
            t.text = "1.0"
        }
        guard commit else { return }
        Task { @MainActor in
            self.rebuildActiveTimersForNewInterval()
        }
    }

    // MARK: - 工具
    private func parseCountdownTotal(_ time: Int) -> Int {
        let v = (countdownField.text ?? "").trimmingCharacters(in: .whitespaces)
        return max(1, Int(v) ?? time)
    }
}
