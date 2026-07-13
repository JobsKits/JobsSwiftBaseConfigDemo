//
//  Demo@任意UIView（此例是UIButton）.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftTimer
import JobsSwiftBaseDefines
import JobsTextTools
import SnapKit
import GKNavigationBarSwift
/// Demo@任意UIView

final class JobsCountdownLayerDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 40
    private let defaultTotalSeconds: Int = 10
    // MARK: - State
    private enum TimerState {
        case idle
        case running
        case paused
        case stopped
    }
    /// 当前计时器状态（不再依赖 UIButton.timerState）
    private var timerState: TimerState = .idle
    /// 记录当前剩余秒数（用于暂停提示）
    private var remainingSeconds: Int = 0
    /// 当前总时长
    private var totalSeconds: Int = 0
    /// 当前内核（你也可以换成 .foundation / .displayLink / .runLoop；注意非 gcd 必须主线程创建/控制）
    private var currentKind: JobsTimerKind = .gcd
    /// timer 持有（不挂在 UIButton 上）
    private var countdownTimer: JobsSwiftTimerProtocol?
    // MARK: - UI
    /// 提示文案
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byText("点击按钮：开始 / 暂停 / 继续（完成后再点 = 重新开始）".tr)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(30)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
                }
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()
    /// 倒计时演示按钮（用 VC 自己的 timer 驱动）
    private lazy var countdownButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            .byTitle("开始".tr + " \(defaultTotalSeconds)s", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 16))
            .byCornerRadius(8)
            .onTap { [weak self] (btn: UIButton) in
                guard let self else { return }
                switch self.timerState {
                case .idle, .stopped:
                    self.startCountdown(on: btn, total: self.defaultTotalSeconds)

                case .running:
                    self.pauseCountdown()
                    let remain = self.remainingSeconds > 0 ? self.remainingSeconds : self.defaultTotalSeconds
                    self.hintLabel.byText("已暂停，点击继续（还剩 %lds）".tr(remain))

                    // 这里看需求：目前导火索是独立连贯动画，不跟随暂停
                    // 如果要同步暂停，就需要给 UIView+JobsCountdownFuse 再加 pause/resume API

                case .paused:
                    self.resumeCountdown()
                    self.hintLabel.byText("倒计时进行中，点击可以暂停".tr)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.hintLabel.snp.bottom).offset(30)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(50)
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsSwiftTimer 按钮倒计时 Demo".tr)
        hintLabel.byVisible(YES)
        countdownButton.byVisible(YES)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopCountdown()
        countdownButton.jobs_cancelFuseCountdown()
    }
    // MARK: - Timer Core (新版 JobsSwiftTimer)
    /// 统一创建 timer（新版 JobsSwiftTimer：JobsSwiftTimer(kind:config:handler:)）
    @MainActor
    private func makeTimer(kind: JobsTimerKind,
                           interval: TimeInterval,
                           handler: @escaping JobsTimerCallback) -> JobsSwiftTimerProtocol {
        let cfg = JobsSwiftTimerConfig(
            interval: max(0.000_001, interval),
            repeats: true,
            tolerance: 0,
            queue: .main,               // tick 统一走主队列
            runLoop: .main,
            runLoopMode: .common,
            pauseInBackground: true,
            autoManageAppState: true
        )
        return JobsTimer(kind: kind, config: cfg, handler: handler)
    }
    /// 开始 / 重新开始
    private func startCountdown(on btn: UIButton, total: Int) {
        onMainAsync(self) { vc in
            // 先停旧
            self.stopCountdown()

            self.totalSeconds = max(1, total)
            self.remainingSeconds = self.totalSeconds
            self.timerState = .running
            self.hintLabel.byText("倒计时进行中，点击可以暂停".tr)
            // 先更新一次 UI
            btn.byTitle("\(self.remainingSeconds)s", for: .normal)
            // 1）倒计时：用新版 JobsSwiftTimer 驱动
            let kind = self.currentKind
            let t = self.makeTimer(kind: kind, interval: 1.0) { [weak self, weak btn] in
                // ✅ JobsSwiftTimer 的 handler 是 @Sendable：这里不要直接碰 UIKit / self 的可变状态
                guard let self else { return }
                guard let btn else { return }
                onMainAsync(self) { vc in
                    guard self.timerState == .running else { return }

                    self.remainingSeconds -= 1
                    let remain = max(0, self.remainingSeconds)

                    print("⏱️ [\(kind)] remain=\(remain)s / total=\(self.totalSeconds)s")
                    btn.byTitle("\(remain)s", for: .normal)

                    if remain <= 0 {
                        print("✅ [\(kind)] 倒计时完成")

                        // stop timer
                        self.stopCountdown()

                        // 覆盖默认文案：完成后提示重新开始
                        btn.byTitle("重新开始".tr, for: .normal)
                        self.hintLabel.byText("倒计时完成，点击可重新开始 %lds".tr(self.defaultTotalSeconds))
                    }
                }
            }
            self.countdownTimer = t
            t.start()
            // 2）导火索：一整圈总时长 = total
            // 注意：导火索动画本身不跟随 pause/resume（除非你给 fuse 扩展加 pause/resume）
            DispatchQueue.main.async {
                btn.byFuseCountdown(
                    duration: TimeInterval(self.totalSeconds),
                    config: JobsFuseConfig(
                        lineWidth: 2,
                        color: JobsCor.white,
                        inset: 0,
                        removeOnFinish: true,
                        direction: .counterClockwise
                    )
                )
            }
        }
    }
    /// 暂停
    private func pauseCountdown() {
        onMainAsync(self) { vc in
            guard self.timerState == .running else { return }
            self.countdownTimer?.pause()
            self.timerState = .paused
        }
    }
    /// 继续
    private func resumeCountdown() {
        onMainAsync(self) { vc in
            guard self.timerState == .paused else { return }
            self.countdownTimer?.resume()
            self.timerState = .running
        }
    }
    /// 停止（不触发完成逻辑）
    private func stopCountdown() {
        onMainAsync(self) { vc in
            self.countdownTimer?.stop()
            self.countdownTimer = nil

            // 状态收口：如果没跑完，停下来算 stopped
            if self.timerState == .running || self.timerState == .paused {
                self.timerState = .stopped
            } else if self.timerState == .idle {
                self.timerState = .idle
            } else {
                self.timerState = .stopped
            }
        }
    }
}
