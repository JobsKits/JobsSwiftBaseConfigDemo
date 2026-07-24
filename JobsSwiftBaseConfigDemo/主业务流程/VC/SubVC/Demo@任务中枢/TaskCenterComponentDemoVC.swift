//
//  TaskCenterComponentDemoVC.swift
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

import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftTaskCenter
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class TaskCenterComponentDemoVC: BaseVC {
    private enum DemoTag {
        static let heartbeat = "TaskCenterDemo.heartbeat"
        static let burst = "TaskCenterDemo.burst"
    }

    private let burstPlannedCount = 3
    private let burstInitialDelaySeconds = 2

    private var heartbeatComponent: JobsTaskCenterComponent?
    private var burstComponent: JobsTaskCenterComponent?

    private var heartbeatCounter = 0
    private var burstExecutedCount = 0
    private var logs: [String] = []

    private var statusObserverTask: Task<Void, Never>?
    private var heartbeatExecutionObserverTask: Task<Void, Never>?
    private var burstExecutionObserverTask: Task<Void, Never>?

    private var isObserving = false {
        didSet { updateObserverStateLabel() }
    }

    private lazy var timestampFormatter: DateFormatter = {
        DateFormatter().byDateFormat("HH:mm:ss")
    }()

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(false)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                }
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalToSuperview()
                make.width.equalTo(scrollView.snp.width)
                make.bottom.equalToSuperview()
            }
    }()

    private lazy var introLabel: UILabel = {
        UILabel()
            .byText(
                "这个页面不再只演示‘定时器会响’，而是把 JobsSwiftTaskCenter 的三层职责拆开看：\n" +
                "1）JobsTaskCenterComponent 负责创建任务与配置调度计划。\n" +
                "2）JobsTaskManager 负责按 tag 托管、暂停、恢复、立即执行、移除。\n" +
                "3）AsyncSequence 负责把状态变化与执行事件暴露出来，方便你做观察、日志、调试和业务联动。"
            )
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalToSuperview()
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var conceptCard: UIView = makeCard(top: introLabel.snp.bottom, offset: 16)

    private lazy var conceptTitleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byText("框架定位".tr)
            .byAddTo(conceptCard) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var conceptDetailLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byText(
                "• JobsSwiftTimer 解决的是‘怎么准时触发’。\n" +
                "• JobsSwiftTaskCenter 解决的是‘任务如何计划、归档、控制、观测’。\n" +
                "• 所以这个框架的价值不在于再包一层 timer，而在于把任务调度语义做完整。"
            )
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(conceptCard) { [unowned self] make in
                make.top.equalTo(conceptTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatCard: UIView = makeCard(top: conceptCard.snp.bottom, offset: 16)

    private lazy var heartbeatTitleLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byText("演示一：心跳任务 = Component + Manager".tr)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatExplainLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byText("配置：interval = 1s，initialDelay = 0，repeatCount = nil，fireImmediately = true。先 attach 到 Manager，再决定是否 resume。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatStateLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byText("Component.lifecycle: --\nManager.status: --\nnextFireDate: --")
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatExplainLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatMetricsLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byText("累计执行：0 次\nattach tag：\(DemoTag.heartbeat)")
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatStateLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatButtonsRow1: UIStackView = {
        UIStackView(arrangedSubviews: [heartbeatStartBtn, heartbeatPauseBtn, heartbeatFireBtn])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatMetricsLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatButtonsRow2: UIStackView = {
        UIStackView(arrangedSubviews: [heartbeatAsyncFireBtn, heartbeatResetBtn, heartbeatRemoveBtn])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(heartbeatCard) { [unowned self] make in
                make.top.equalTo(heartbeatButtonsRow1.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var heartbeatStartBtn: UIButton = {
        UIButton.sys()
            .byTitle("开始".tr)
            .onTap { [weak self] _ in
                self?.startHeartbeat()
            }
    }()

    private lazy var heartbeatPauseBtn: UIButton = {
        UIButton.sys()
            .byTitle("暂停".tr)
            .onTap { [weak self] _ in self?.pauseHeartbeat() }
    }()

    private lazy var heartbeatFireBtn: UIButton = {
        UIButton.sys()
            .byTitle("立即执行".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                JobsTaskManager.default.executeNow(by: DemoTag.heartbeat)
                updateHeartbeatState()
                appendLog("⚡️ heartbeat 已 executeNow")
            }
    }()

    private lazy var heartbeatAsyncFireBtn: UIButton = {
        UIButton.sys()
            .byTitle("异步触发".tr)
            .onTap { [weak self] sender in
                onMainAsync { [weak self] in
                    guard let self else { return }
                    let success = await JobsTaskManager.default.executeNowAsync(by: DemoTag.heartbeat)
                    self.updateHeartbeatState()
                    self.appendLog(success ? "🧵 heartbeat executeNowAsync 完成" : "⚠️ heartbeat executeNowAsync 失败")
                }
            }
    }()

    private lazy var heartbeatResetBtn: UIButton = {
        UIButton.sys()
            .byTitle("重建".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.resetHeartbeatTask(showToast: true)
            }
    }()

    private lazy var heartbeatRemoveBtn: UIButton = {
        UIButton.sys()
            .byTitle("移除".tr)
            .onTap { [weak self] _ in self?.removeHeartbeat() }
    }()

    private lazy var burstCard: UIView = makeCard(top: heartbeatCard.snp.bottom, offset: 16)

    private lazy var burstTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byText("演示二：有限计划任务 = Configuration 表达调度意图".tr)
            .byAddTo(burstCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstExplainLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byText("配置：2 秒后开始，每 1 秒执行 1 次，总共执行 3 次。这个例子强调的是‘计划表达能力’，不是单纯的 timer。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(burstCard) { [unowned self] make in
                make.top.equalTo(burstTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstStateLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byText("状态：尚未创建".tr)
            .byAddTo(burstCard) { [unowned self] make in
                make.top.equalTo(burstExplainLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstButtonsStack: UIStackView = { [unowned self] in
        UIStackView(arrangedSubviews: [burstStartBtn, burstCancelBtn, burstRebuildBtn])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(burstCard) { [unowned self] make in
                make.top.equalTo(burstStateLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var burstStartBtn: UIButton = {
        UIButton.sys()
            .byTitle("启动".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.startBurstTask()
            }
    }()

    private lazy var burstCancelBtn: UIButton = {
        UIButton.sys()
            .byTitle("终止".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.cancelBurstTask()
            }
    }()

    private lazy var burstRebuildBtn: UIButton = {
        UIButton.sys()
            .byTitle("重建".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.cancelBurstTask(showToast: false, shouldLog: false)
                self.startBurstTask()
            }
    }()

    private lazy var observerCard: UIView = makeCard(top: burstCard.snp.bottom, offset: 16)

    private lazy var observerTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byText("演示三：观察流 = statusChanges + executionStream".tr)
            .byAddTo(observerCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var observerExplainLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byText("打开观察后，这个页面会同时监听：\n• Manager 级状态变化流\n• heartbeat 的执行流\n• burst 的执行流\n这样你就能直观看到 TaskCenter 的真正价值：不只是调度，还有可观测性。".tr)
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(observerCard) { [unowned self] make in
                make.top.equalTo(observerTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var observerStateLabel: UILabel = { [unowned self] in
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byText("观察状态：未开启".tr)
            .byAddTo(observerCard) { [unowned self] make in
                make.top.equalTo(observerExplainLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var observerButtonsStack: UIStackView = { [unowned self] in
        UIStackView(arrangedSubviews: [startObserveBtn, stopObserveBtn, clearLogBtn])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(observerCard) { [unowned self] make in
                make.top.equalTo(observerStateLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var startObserveBtn: UIButton = {
        UIButton.sys()
            .byTitle("开启观察".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.startObservation()
            }
    }()

    private lazy var stopObserveBtn: UIButton = {
        UIButton.sys()
            .byTitle("停止观察".tr)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.stopObservation(showLog: true)
            }
    }()

    private lazy var clearLogBtn: UIButton = {
        UIButton.sys()
            .byTitle("清空日志".tr)
            .onTap { [weak self] sender in
                guard let self else { return }
                logs.removeAll()
                logTextView.byText("--")
            }
    }()

    private lazy var logTitleLabel: UILabel = { [unowned self] in
        UILabel()
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byText("任务日志".tr)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(observerCard.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logTextView: UITextView = { [unowned self] in
        UITextView()
            .byEditable(false)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byBackgroundColor(JobsCor.tertiarySystemBackground)
            .byCornerRadius(12)
            .byText("--")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(logTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(280)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "任务中枢组件演示".tr)
        [scrollView, contentView, introLabel,
         conceptCard, conceptTitleLabel, conceptDetailLabel,
         heartbeatCard, heartbeatTitleLabel, heartbeatExplainLabel, heartbeatStateLabel, heartbeatMetricsLabel, heartbeatButtonsRow1, heartbeatButtonsRow2,
         burstCard, burstTitleLabel, burstExplainLabel, burstStateLabel, burstButtonsStack,
         observerCard, observerTitleLabel, observerExplainLabel, observerStateLabel, observerButtonsStack,
         logTitleLabel, logTextView].forEach { $0.byVisible(YES) }
        resetHeartbeatTask(showToast: false)
        updateBurstStateLabel(extra: "点击“启动”后开始演示")
        updateObserverStateLabel()
        appendLog("📌 页面初始化完成：已重建 heartbeat，等待你手动控制")
    }

    deinit {
        stopObservation(showLog: false)
        heartbeatComponent?.cancel()
        burstComponent?.cancel()
        JobsTaskManager.default.removeTask(by: DemoTag.heartbeat)
        JobsTaskManager.default.removeTask(by: DemoTag.burst)
    }
}

private extension TaskCenterComponentDemoVC {
    func makeCard(top: ConstraintItem, offset: CGFloat) -> UIView {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(14)
            .byAddTo(contentView) { make in
                make.top.equalTo(top).offset(offset)
                make.left.right.equalToSuperview().inset(16)
            }
    }

    func startHeartbeat() {
        JobsTaskManager.default.resume(by: DemoTag.heartbeat)
        updateHeartbeatState()
        appendLog("✅ heartbeat 已 resume")
    }

    func pauseHeartbeat() {
        JobsTaskManager.default.suspend(by: DemoTag.heartbeat)
        updateHeartbeatState()
        appendLog("⏸️ heartbeat 已 suspend")
    }

    func removeHeartbeat() {
        JobsTaskManager.default.removeTask(by: DemoTag.heartbeat)
        heartbeatComponent?.cancel()
        heartbeatComponent = nil
        heartbeatCounter = 0
        heartbeatMetricsLabel.byText("累计执行：0 次\nattach tag：\(DemoTag.heartbeat)")
        updateHeartbeatState()
        appendLog("🗑️ heartbeat 已从 Manager 移除")
    }

    func resetHeartbeatTask(showToast: Bool) {
        JobsTaskManager.default.removeTask(by: DemoTag.heartbeat)
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
        _ = component.attach(tag: DemoTag.heartbeat, manager: .default, autoResume: false, executeImmediately: false)
        heartbeatMetricsLabel.byText("累计执行：0 次\nattach tag：\(DemoTag.heartbeat)")
        updateHeartbeatState()
        if showToast { "已重建 heartbeat 任务".tr.toast }
        appendLog("♻️ heartbeat 已重建：已 attach，但默认不自动启动")
    }

    func handleHeartbeatTick() {
        heartbeatCounter += 1
        onMainAsync { [weak self] in
            guard let self else { return }
            self.heartbeatMetricsLabel.byText("累计执行：\(heartbeatCounter) 次\nattach tag：\(DemoTag.heartbeat)")
            self.updateHeartbeatState()
            self.appendLog("❤️ heartbeat 第\(heartbeatCounter)次触发")
        }
    }

    func updateHeartbeatState() {
        let lifecycleText = heartbeatComponent.map { describeLifecycle($0.lifecycle) } ?? "未创建".tr
        let managerStatusText = JobsTaskManager.default.task(by: DemoTag.heartbeat).map { describeStatus($0.status) } ?? "未注册".tr
        let nextText = heartbeatComponent?.nextFireDate.map { timestampFormatter.string(from: $0) } ?? "--"
        heartbeatStateLabel.byText(
            "Component.lifecycle: \(lifecycleText)\n" +
            "Manager.status: \(managerStatusText)\n" +
            "nextFireDate: \(nextText)"
        )
    }

    func startBurstTask() {
        JobsTaskManager.default.removeTask(by: DemoTag.burst)
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
        let component = JobsTaskCenterComponent.schedule(configuration: config) { [weak self] in
            self?.handleBurstTick()
        }
        burstComponent = component
        _ = component.attach(tag: DemoTag.burst, manager: .default, autoResume: true, executeImmediately: false)
        updateBurstStateLabel(extra: "等待 \(burstInitialDelaySeconds)s 后开始……")
        appendLog("🚀 burst 已创建并 attach：2 秒后开始，执行 3 次")
    }

    func handleBurstTick() {
        burstExecutedCount += 1
        onMainAsync { [weak self] in
            guard let self else { return }
            self.appendLog("🎯 burst 第\(burstExecutedCount)次触发")
            self.updateBurstStateLabel(
                extra: burstExecutedCount >= burstPlannedCount ? "计划已执行完毕" : nil
            )
            if burstExecutedCount >= burstPlannedCount {
                self.appendLog("✅ burst 到达 repeatCount 上限")
            }
        }
    }

    func cancelBurstTask(showToast: Bool = true, shouldLog: Bool = true) {
        JobsTaskManager.default.removeTask(by: DemoTag.burst)
        burstComponent?.cancel()
        burstComponent = nil
        burstExecutedCount = 0
        updateBurstStateLabel(extra: "已手动终止")
        if showToast { "已终止 burst 任务".tr.toast }
        if shouldLog { appendLog("🛑 burst 已终止并从 Manager 移除") }
    }

    func updateBurstStateLabel(extra: String?) {
        guard let component = burstComponent else {
            burstStateLabel.byText("状态：尚未创建\n剩余次数：--\n下次触发：--\nattach tag：\(DemoTag.burst)")
            return
        }
        let lifecycle = describeLifecycle(component.lifecycle)
        let managerStatus = JobsTaskManager.default.task(by: DemoTag.burst).map { describeStatus($0.status) } ?? "未注册"
        let remaining = max(0, burstPlannedCount - burstExecutedCount)
        let nextText = component.nextFireDate.map { timestampFormatter.string(from: $0) } ?? "--"
        var rows = [
            "Component.lifecycle: \(lifecycle)",
            "Manager.status: \(managerStatus)",
            "剩余次数：\(remaining) / \(burstPlannedCount)",
            "nextFireDate: \(nextText)",
            "attach tag：\(DemoTag.burst)"
        ]
        if let extra { rows.append(extra) }
        burstStateLabel.byText(rows.joined(separator: "\n"))
    }

    func startObservation() {
        guard !isObserving else {
            appendLog("ℹ️ 观察已开启，无需重复开启")
            return
        }
        isObserving = true
        appendLog("👀 已开启观察：statusChanges + heartbeat.executionStream + burst.executionStream")
        statusObserverTask = observeOnMain(
            JobsTaskManager.default.statusChanges()
        ) { [weak self] change in
            guard let self else { return }
            self.handleStatusChange(change)
        }
        heartbeatExecutionObserverTask = observeOnMain(
            JobsTaskManager.default.executionStream(for: DemoTag.heartbeat)
        ) { [weak self] execution in
            guard let self else { return }
            self.handleExecution(execution, tag: DemoTag.heartbeat)
        }
        burstExecutionObserverTask = observeOnMain(
            JobsTaskManager.default.executionStream(for: DemoTag.burst)
        ) { [weak self] execution in
            guard let self else { return }
            self.handleExecution(execution, tag: DemoTag.burst)
        }
    }

    func stopObservation(showLog: Bool) {
        statusObserverTask?.cancel()
        heartbeatExecutionObserverTask?.cancel()
        burstExecutionObserverTask?.cancel()
        statusObserverTask = nil
        heartbeatExecutionObserverTask = nil
        burstExecutionObserverTask = nil
        let wasObserving = isObserving
        isObserving = false
        if showLog, wasObserving {
            appendLog("🧹 已停止所有观察流")
        }
    }

    func handleStatusChange(_ change: JobsTaskStatusChange) {
        let oldText = change.oldStatus.map(describeStatus) ?? "nil"
        let newText = change.newStatus.map(describeStatus) ?? "nil"
        appendLog("📡 状态流 [\(change.tag)] \(oldText) -> \(newText)")
        updateHeartbeatState()
        updateBurstStateLabel(extra: nil)
    }

    func handleExecution(_ execution: TaskExecution, tag: String) {
        let dateText = timestampFormatter.string(from: execution.date)
        let lifecycleText = describeLifecycle(execution.lifecycle)
        let nextText = execution.nextFireDate.map { timestampFormatter.string(from: $0) } ?? "--"
        appendLog("🪵 执行流 [\(tag)] count=\(execution.count) at=\(dateText) lifecycle=\(lifecycleText) next=\(nextText)")
        updateHeartbeatState()
        updateBurstStateLabel(extra: nil)
    }

    func updateObserverStateLabel() {
        let currentTasks = JobsTaskManager.default.allTasks.map(\.tag)
        observerStateLabel.byText(
            "观察状态：\(isObserving ? "已开启" : "未开启")\n" +
            "当前托管任务：\(currentTasks.isEmpty ? "无" : currentTasks.joined(separator: ", "))\n" +
            "说明：状态变化来自 Manager，执行事件来自每个 Task 的 AsyncSequence。"
        )
    }

    func describeLifecycle(_ lifecycle: JobsTaskLifecycle) -> String {
        switch lifecycle {
        /// 处理 .idle 分支
        case .idle: return "idle / 待启动"
        /// 处理 .running 分支
        case .running: return "running / 运行中"
        /// 处理 .suspended 分支
        case .suspended: return "suspended / 已挂起"
        /// 处理 .cancelled 分支
        case .cancelled: return "cancelled / 已取消"
        /// 处理 .finished 分支
        case .finished: return "finished / 已结束"
        }
    }

    func describeStatus(_ status: JobsTaskStatus) -> String {
        switch status {
        /// 处理 .expire 分支
        case .expire: return "expire / 过期"
        /// 处理 .suspend 分支
        case .suspend: return "suspend / 暂停"
        /// 处理 .prepare 分支
        case .prepare: return "prepare / 准备"
        /// 处理 .execute 分支
        case .execute: return "excute / 执行中"
        /// 处理 .ended 分支
        case .ended: return "ended / 已结束"
        /// 处理 .background 分支
        case .background: return "background / 后台"
        }
    }

    func appendLog(_ text: String) {
        let timestamp = timestampFormatter.string(from: Date())
        logs.append("[\(timestamp)] \(text)")
        if logs.count > 120 {
            logs.removeFirst(logs.count - 120)
        }
        let body = logs.joined(separator: "\n")
        logTextView.byText(body.isEmpty ? "--" : body)
        if !body.isEmpty {
            logTextView.scrollRangeToVisible(NSRange(location: max(0, (body as NSString).length - 1), length: 1))
        }
        updateObserverStateLabel()
    }
}
