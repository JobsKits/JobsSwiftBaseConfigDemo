//
//  TaskCenterComponentDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by OpenAI Assistant on 2026/03/15.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsToast
import JobsByUIKit
import JobsInheritance
import JobsSwiftTaskCenter
import JobsSwiftBaseDefines

final class TaskCenterComponentDemoVC: BaseVC {
    
    private let heartbeatTag = "TaskCenterDemo.heartbeat"
    private var heartbeatComponent: JobsTaskCenterComponent?
    private var heartbeatItem: JobsTaskItem?
    private var heartbeatCounter = 0

    private let burstPlannedCount = 3
    private let burstInitialDelaySeconds = 2
    private var burstComponent: JobsTaskCenterComponent?
    private var burstExecutedCount = 0

    private var logs: [String] = []

    private lazy var timestampFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()

    private lazy var scrollView: UIScrollView = { [unowned self] in
        UIScrollView()
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(false)
            .byBackgroundColor(.clear)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                }
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    private lazy var contentView: UIView = { [unowned self] in
        UIView()
            .byBackgroundColor(.clear)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalToSuperview()
                make.width.equalTo(scrollView.snp.width)
                make.bottom.equalToSuperview()
            }
    }()

    private lazy var introLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 15, weight: .medium))
            .byText("JobsSwiftTaskCenterComponent 负责把 RunLoop / GCD 定时任务统一封装成可管理的任务。下面示范：① 心跳任务通过 tag 接入 TaskManager，可暂停、恢复、瞬时执行。② 批量刷新任务使用 Configuration 配置首次延迟 + 次数限制。")
            .byAddTo(contentView) { make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatCard: UIView = { [unowned self] in
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(14)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(introLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(.systemFont(ofSize: 16, weight: .bold))
            .byText("心跳任务（绑定 TaskManager）")
            .byAddTo(heartbeatCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatStateLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14))
            .byText("当前状态：--\n下次触发：--")
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatMetricsLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byText("累计执行：0 次")
            .byTextColor(.secondaryLabel)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatStateLabel.snp.bottom).offset(4)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatButtonsStack: UIStackView = { [unowned self] in
        UIStackView(arrangedSubviews: [heartbeatStartBtn,
                                       heartbeatPauseBtn,
                                       heartbeatFireBtn,
                                       heartbeatResetBtn])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatMetricsLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatStartBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("开始")
            .onTap { [weak self] _ in self?.startHeartbeat() }
    }()

    private lazy var heartbeatPauseBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("暂停")
            .onTap { [weak self] _ in self?.pauseHeartbeat() }
    }()

    private lazy var heartbeatFireBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("立即执行")
            .onTap { [weak self] _ in self?.fireHeartbeatOnce() }
    }()

    private lazy var heartbeatResetBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("重置")
            .onTap { [weak self] _ in self?.resetHeartbeatTask(showToast: true) }
    }()

    private lazy var burstCard: UIView = { [unowned self] in
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(14)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(heartbeatCard.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(.systemFont(ofSize: 16, weight: .bold))
            .byText("批量刷新任务（首延迟2秒，执行3次）")
            .byAddTo(burstCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstStateLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14))
            .byText("状态：尚未创建")
            .byAddTo(burstCard) { [unowned self] make in
                make.top.equalTo(burstTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstButtonsStack: UIStackView = { [unowned self] in
        UIStackView(arrangedSubviews: [burstStartBtn, burstCancelBtn])
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddTo(burstCard) { [unowned self] make in
                make.top.equalTo(burstStateLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstStartBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("启动任务")
            .onTap { [weak self] _ in self?.startBurstTask() }
    }()

    private lazy var burstCancelBtn: UIButton = {
        UIButton(type: .system)
            .byTitle("终止任务")
            .onTap { [weak self] _ in self?.cancelBurstTask() }
    }()

    private lazy var logTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(.systemFont(ofSize: 15, weight: .semibold))
            .byText("任务日志")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(burstCard.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logTextView: UITextView = { [unowned self] in
        UITextView()
            .byEditable(false)
            .byFont(.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byBackgroundColor(.tertiarySystemBackground)
            .byCornerRadius(12)
            .byText("--")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(logTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(200)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "任务中枢组件演示")

        [scrollView, contentView, introLabel,
         heartbeatCard, heartbeatTitleLabel, heartbeatStateLabel, heartbeatMetricsLabel, heartbeatButtonsStack,
         burstCard, burstTitleLabel, burstStateLabel, burstButtonsStack,
         logTitleLabel, logTextView].forEach { $0.byVisible(YES) }

        resetHeartbeatTask(showToast: false)
        updateBurstStateLabel(extra: "点击“启动任务”后开始演示")
    }
    
    deinit {
        heartbeatComponent?.cancel()
        burstComponent?.cancel()
        JobsTaskManager.default.removeTask(by: heartbeatTag)
    }
}

private extension TaskCenterComponentDemoVC {
    
    func startHeartbeat() {
        JobsTaskManager.default.resume(by: heartbeatTag)
        updateHeartbeatState()
        appendLog("✅ 心跳任务已开始")
    }

    func pauseHeartbeat() {
        JobsTaskManager.default.suspend(by: heartbeatTag)
        updateHeartbeatState()
        appendLog("⏸️ 心跳任务已暂停")
    }

    func fireHeartbeatOnce() {
        JobsTaskManager.default.executeNow(by: heartbeatTag)
        updateHeartbeatState()
        appendLog("⚡️ 手动触发心跳一次")
    }

    func resetHeartbeatTask(showToast: Bool) {
        JobsTaskManager.default.removeTask(by: heartbeatTag)
        heartbeatComponent?.cancel()
        heartbeatCounter = 0

        let config = JobsTaskCenterComponent.Configuration(
            interval: 1.seconds,
            initialDelay: .zero,
            repeatCount: nil,
            queue: .main,
            runLoopMode: nil,
            fireImmediately: true
        )
        let component = JobsTaskCenterComponent.schedule(configuration: config) { [weak self] in
            self?.handleHeartbeatTick()
        }
        heartbeatComponent = component
        heartbeatItem = component.attach(tag: heartbeatTag, manager: .default, autoResume: false)
        heartbeatMetricsLabel.byText("累计执行：0 次")
        updateHeartbeatState()
        if showToast { "已重置心跳任务".toast }
        appendLog("♻️ 心跳任务已重置，等待手动开始")
    }

    func handleHeartbeatTick() {
        heartbeatCounter += 1
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            heartbeatMetricsLabel.byText("累计执行：\(heartbeatCounter) 次")
            updateHeartbeatState()
            appendLog("❤️ 心跳第\(heartbeatCounter)次触发")
        }
    }

    func updateHeartbeatState() {
        guard let component = heartbeatComponent else {
            heartbeatStateLabel.byText("当前状态：未创建\n下次触发：--")
            return
        }
        let status = describeLifecycle(component.lifecycle)
        let next = component.nextFireDate.map { timestampFormatter.string(from: $0) } ?? "--"
        heartbeatStateLabel.byText("当前状态：\(status)\n下次触发：\(next)")
    }

    func startBurstTask() {
        burstComponent?.cancel()
        burstExecutedCount = 0
        let config = JobsTaskCenterComponent.Configuration(
            interval: 1.seconds,
            initialDelay: burstInitialDelaySeconds.seconds,
            repeatCount: burstPlannedCount,
            queue: .main,
            runLoopMode: nil,
            fireImmediately: false
        )
        burstComponent = JobsTaskCenterComponent.schedule(configuration: config) { [weak self] in
            self?.handleBurstTick()
        }
        updateBurstStateLabel(extra: "等待 \(burstInitialDelaySeconds)s 后开始……")
        appendLog("🚀 已创建批量任务：首次延迟\(burstInitialDelaySeconds)s，连续\(burstPlannedCount)次")
    }

    func handleBurstTick() {
        burstExecutedCount += 1
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            appendLog("🎯 批量任务第\(burstExecutedCount)次触发")
            if burstExecutedCount >= burstPlannedCount {
                appendLog("✅ 批量任务完成")
            }
            updateBurstStateLabel(extra: burstExecutedCount >= burstPlannedCount ? "任务已完成" : nil)
        }
    }

    func cancelBurstTask() {
        burstComponent?.cancel()
        burstComponent = nil
        burstExecutedCount = 0
        updateBurstStateLabel(extra: "已手动终止")
        appendLog("🛑 批量任务已终止")
    }

    func updateBurstStateLabel(extra: String?) {
        guard let component = burstComponent else {
            burstStateLabel.byText("状态：尚未创建\n剩余次数：--\n下次触发：--")
            return
        }
        var rows = ["状态：\(describeLifecycle(component.lifecycle))",
                    "剩余次数：\(max(0, burstPlannedCount - burstExecutedCount)) / \(burstPlannedCount)"]
        if let next = component.nextFireDate {
            rows.append("下次触发：\(timestampFormatter.string(from: next))")
        } else {
            rows.append("下次触发：--")
        }
        if let extra { rows.append(extra) }
        burstStateLabel.byText(rows.joined(separator: "\n"))
    }

    func describeLifecycle(_ lifecycle: JobsTask.Lifecycle) -> String {
        switch lifecycle {
        case .idle: return "待启动"
        case .running: return "运行中"
        case .suspended: return "已挂起"
        case .cancelled: return "已取消"
        case .finished: return "已结束"
        }
    }

    func appendLog(_ text: String) {
        let timestamp = timestampFormatter.string(from: Date())
        logs.append("[\(timestamp)] \(text)")
        if logs.count > 80 {
            logs.removeFirst(logs.count - 80)
        }
        let body = logs.joined(separator: "\n")
        logTextView.byText(body.isEmpty ? "--" : body)
        if !body.isEmpty {
            logTextView.scrollRangeToVisible( NSRange(location: (body as NSString).length - 1, length: 1))
        }
    }
}
