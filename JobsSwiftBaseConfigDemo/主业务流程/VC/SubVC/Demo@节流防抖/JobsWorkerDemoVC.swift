//
//  JobsWorkerDemoVC.swift
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

import SnapKit
import GKNavigationBarSwift
import Jobsl10n
import JobsByUIKit
import JobsSwiftWorker
import JobsInheritance
import JobsSwiftTaskCenter
import JobsSwiftBaseDefines

public final class JobsWorkerDemoVC: BaseVC {

    private let workerBag = JobsWorkerBag()
    private let count = JobsObservable<Int>(0, name: "count")
    private let keyword = JobsObservable<String>("", name: "keyword")
    private lazy var keywordDistinct = keyword.distinctUntilChanged(name: "keyword.distinct")
    private lazy var workerState = JobsObservable<(Int, String)>.combineLatest(
        count,
        keyword,
        name: "worker.state"
    )

    private var logs: [String] = []

    // MARK: - UI

    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byShowsVerticalScrollIndicator(NO)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byAddTo(scrollView) { make in
                make.edges.equalToSuperview()
                make.width.equalToSuperview()
            }
    }()

    /// 页面自述
    private lazy var introTextView: UITextView = {
        UITextView()
            .byFont(.systemFont(ofSize: 15, weight: .regular))
            .byTextColor(.label)
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(16)
            .byMasksToBounds(true)
            .byTextContainerInset(
                UIEdgeInsets(
                    top: 16,
                    left: 12,
                    bottom: 16,
                    right: 12
                )
            )
            .byEditable(NO)
            .byScrollEnabled(NO)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.right.equalToSuperview().inset(12)
            }
    }()

    /// 演示区容器
    private lazy var demoCardView: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(16)
            .byMasksToBounds(true)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(introTextView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(12)
            }
    }()

    private lazy var demoTitleLabel: UILabel = {
        UILabel()
            .byText("交互演示区")
            .byFont(.systemFont(ofSize: 20, weight: .bold))
            .byTextColor(.label)
            .byAddTo(demoCardView) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var demoDescLabel: UILabel = {
        UILabel()
            .byText("这里不是功能列表页，而是行为演示页。你只需要点按钮、输入文字，然后观察最下面的日志输出。")
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(demoTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var summaryLabel: UILabel = {
        UILabel()
            .byText("当前状态：count = 0，keyword = <empty>")
            .byFont(.systemFont(ofSize: 15, weight: .medium))
            .byTextColor(.systemBlue)
            .byNumberOfLines(0)
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(demoDescLabel.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var inputTitleLabel: UILabel = {
        UILabel()
            .byText("关键词输入（观察 debounce / distinctUntilChanged / combineLatest）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(.label)
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(summaryLabel.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var inputViewField: UITextField = {
        UITextField()
            .byPlaceholder("请输入搜索词，例如：会员、折扣、年卡")
            .byBorderStyle(.roundedRect)
            .byClearButtonMode(.whileEditing)
            .byOnInput { [weak self] _, value, _, _, _, _ in
                guard let self else { return }
                updateKeyword(value)
            }
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(inputTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(44)
            }
    }()

    private lazy var countTitleLabel: UILabel = {
        UILabel()
            .byText("计数操作（观察 ever / once / interval / skip / take / everAll / combineLatest）")
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(.label)
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(inputViewField.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var increaseButton: UIButton = {
        makeActionButton(title: "计数 +1")
            .byAddAction(for: .touchUpInside) { [weak self] (_: UIButton) in
                guard let self else { return }
                didTapIncrease()
            }
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(countTitleLabel.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(42)
                make.width.equalTo(96)
            }
    }()

    private lazy var burstButton: UIButton = {
        makeActionButton(title: "连续触发")
            .byAddAction(for: .touchUpInside) { [weak self] (_: UIButton) in
                guard let self else { return }
                didTapBurst()
            }
            .byAddTo(demoCardView) { [unowned self] make in
                make.left.equalTo(increaseButton.snp.right).offset(12)
                make.centerY.equalTo(increaseButton)
                make.height.equalTo(42)
                make.width.equalTo(96)
            }
    }()

    private lazy var replayButton: UIButton = {
        makeActionButton(title: "回放输入")
            .byAddAction(for: .touchUpInside) { [weak self] (_: UIButton) in
                guard let self else { return }
                didTapReplayKeyword()
            }
            .byAddTo(demoCardView) { [unowned self] make in
                make.left.equalTo(burstButton.snp.right).offset(12)
                make.centerY.equalTo(increaseButton)
                make.height.equalTo(42)
                make.width.equalTo(96)
                make.right.lessThanOrEqualToSuperview().inset(16)
            }
    }()

    private lazy var resetButton: UIButton = {
        makeActionButton(title: "重置演示")
            .byAddAction(for: .touchUpInside) { [weak self] (_: UIButton) in
                guard let self else { return }
                didTapReset()
            }
            .byAddTo(demoCardView) { [unowned self] make in
                make.top.equalTo(increaseButton.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(42)
                make.width.equalTo(96)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    /// 重点说明区
    private lazy var capabilityCardView: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(16)
            .byMasksToBounds(true)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(demoCardView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(12)
            }
    }()

    private lazy var capabilityTitleLabel: UILabel = {
        UILabel()
            .byText("本页重点")
            .byFont(.systemFont(ofSize: 20, weight: .bold))
            .byTextColor(.label)
            .byAddTo(capabilityCardView) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var capabilityTextView: UITextView = {
        UITextView()
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(.label)
            .byBackgroundColor(.clear)
            .byTextContainerInset(
                UIEdgeInsets(
                    top: 8,
                    left: 0,
                    bottom: 8,
                    right: 0
                )
            )
            .byEditable(NO)
            .byScrollEnabled(NO)
            .byAddTo(capabilityCardView) { [unowned self] make in
                make.top.equalTo(capabilityTitleLabel.snp.bottom).offset(4)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(12)
            }
    }()

    /// 日志结果区
    private lazy var logCardView: UIView = {
        UIView()
            .byBackgroundColor(.secondarySystemBackground)
            .byCornerRadius(16)
            .byMasksToBounds(true)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(capabilityCardView.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(12)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    private lazy var logTitleLabel: UILabel = {
        UILabel()
            .byText("实时日志")
            .byFont(.systemFont(ofSize: 20, weight: .bold))
            .byTextColor(.label)
            .byAddTo(logCardView) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logDescLabel: UILabel = {
        UILabel()
            .byText("这里会倒序输出 Worker 的实际触发结果。看这里，比看代码更直观。")
            .byFont(.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(logCardView) { [unowned self] make in
                make.top.equalTo(logTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logTextView: UITextView = {
        UITextView()
            .byFont(.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byTextColor(.label)
            .byBackgroundColor(.systemBackground)
            .byCornerRadius(12)
            .byMasksToBounds(true)
            .byTextContainerInset(
                UIEdgeInsets(
                    top: 12,
                    left: 10,
                    bottom: 12,
                    right: 10
                )
            )
            .byEditable(NO)
            .byScrollEnabled(NO)
            .byAddTo(logCardView) { [unowned self] make in
                make.top.equalTo(logDescLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(220)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsSwiftWorker Demo".tr)
        view.byBackgroundColor(.systemBackground)

        setupUI()
        setupStaticTexts()
        bindWorkers()
        reloadSummary()
        reloadLogs()
    }

    deinit {
        workerBag.removeAll()
    }
}

private extension JobsWorkerDemoVC {

    func setupUI() {
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        introTextView.byVisible(YES)
        demoCardView.byVisible(YES)
        demoTitleLabel.byVisible(YES)
        demoDescLabel.byVisible(YES)
        summaryLabel.byVisible(YES)
        inputTitleLabel.byVisible(YES)
        inputViewField.byVisible(YES)
        countTitleLabel.byVisible(YES)
        increaseButton.byVisible(YES)
        burstButton.byVisible(YES)
        replayButton.byVisible(YES)
        resetButton.byVisible(YES)
        capabilityCardView.byVisible(YES)
        capabilityTitleLabel.byVisible(YES)
        capabilityTextView.byVisible(YES)
        logCardView.byVisible(YES)
        logTitleLabel.byVisible(YES)
        logDescLabel.byVisible(YES)
        logTextView.byVisible(YES)
    }

    func setupStaticTexts() {
        introTextView.text =
        """
        这是一个 JobsSwiftWorker 的行为演示页，不是功能列表页。

        这个页面只做一件事：把 Worker / GetX-like Watchers 的触发机制，用最直观的方式演示出来。

        你在这里重点看三件事：
        1. 点“计数 +1”时，哪些监听会立即触发；
        2. 点“连续触发”时，interval / take / skip 这种策略会怎么表现；
        3. 输入或回放文本时，debounce / distinctUntilChanged / combineLatest 会如何筛选和聚合事件。

        结论不是看按钮名字，而是看最下面的“实时日志”。
        """

        capabilityTextView.text =
        """
        ever：每次变化都响应
        once：只响应第一次变化
        interval：指定时间窗口内只接收一次
        debounce：输入停止一段时间后再响应
        everAll：多个源任意一个变化都会响应
        skip：跳过前 N 次
        take：只消费前 N 次
        distinctUntilChanged：重复值不再触发
        combineLatest：把多个源的最新值合并成一个新状态

        这个 Demo 的重点不是 UI，而是让你肉眼看清“同一组输入，在不同 Worker 策略下，输出为什么不一样”。
        """
    }

    func bindWorkers() {
        count
            .ever(label: "count.ever") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("ever -> count = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        count
            .once(label: "count.once") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("once -> 首次 count = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        count
            .interval(1.seconds, label: "count.interval") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("interval -> 1 秒窗口内接收 count = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        keyword
            .debounce(600.milliseconds, label: "keyword.debounce") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("debounce -> keyword = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        [count as JobsAnyValueListenable, keyword as JobsAnyValueListenable]
            .everAll(label: "all.everAll") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("everAll -> \(change.sourceName ?? "unknown") = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        count
            .skip(2, label: "count.skip") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("skip(2) -> count = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        count
            .take(3, label: "count.take") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("take(3) -> count = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        keywordDistinct
            .ever(label: "keyword.distinct") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("distinct -> keyword = \(change.newValue)")
                }
            }
            .store(in: workerBag)

        workerState
            .ever(label: "state.combineLatest") { [weak self] change in
                onMainAsync(self) { owner in
                    owner.appendLog("combineLatest -> count = \(change.newValue.0), keyword = \(change.newValue.1)")
                }
            }
            .store(in: workerBag)

        JobsWorkerBinder.bindText(
            workerState.map(
                {
                    "当前状态：count = \($0.0)，keyword = \($0.1.isEmpty ? "<empty>" : $0.1)"
                },
                name: "summary.text"
            ),
            to: summaryLabel,
            storeIn: workerBag
        )

        JobsWorkerBinder.bindTextField(inputViewField, to: keyword)
            .store(in: workerBag)
    }

    func makeActionButton(title: String) -> UIButton {
        UIButton(type: .system)
            .byTitle(title, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold), for: .normal)
            .byBackgroundColor(.systemBlue.withAlphaComponent(0.1))
            .byCornerRadius(10)
            .byMasksToBounds(true)
    }

    func appendLog(_ message: String) {
        onMainSync { [weak self] in
            guard let self else { return }
            logs.insert(message, at: 0)
            reloadLogs()
        }
    }

    func reloadLogs() {
        if logs.isEmpty {
            logTextView.text = "暂无日志。\n\n请点击上方按钮或输入文字开始演示。"
        } else {
            logTextView.text = logs.enumerated().map { index, message in
                "[\(index + 1)] \(message)"
            }.joined(separator: "\n")
        }
    }

    func reloadSummary() {
        summaryLabel.byText(
            "当前状态：count = \(count.currentValue)，keyword = \(keyword.currentValue.isEmpty ? "<empty>" : keyword.currentValue)"
        )
    }

    func updateKeyword(_ value: String) {
        keyword.accept(value)
        reloadSummary()
    }

    @objc func didTapIncrease() {
        count.accept(count.currentValue + 1)
        reloadSummary()
    }

    @objc func didTapBurst() {
        appendLog("开始执行：连续触发 5 次 count 递增")

        (1...5).forEach { index in
            JobsWorkerScheduler.default.schedule(after: JobsPeriod(Double(index) * 0.12)) { [weak self] in
                guard let self else { return }
                let nextValue = count.currentValue + 1
                count.accept(nextValue)
                onMainAsync(self) { owner in
                    owner.reloadSummary()
                }
            }
        }
    }

    @objc func didTapReplayKeyword() {
        appendLog("开始执行：回放输入序列 a -> ab -> abc -> abc -> abcd -> abcd")

        ["a", "ab", "abc", "abc", "abcd", "abcd"].enumerated().forEach { element in
            let text = element.element
            JobsWorkerScheduler.default.schedule(after: JobsPeriod(Double(element.offset) * 0.15)) { [weak self] in
                guard let self else { return }
                onMainAsync(self) { owner in
                    owner.inputViewField.byText(text)
                    owner.updateKeyword(text)
                }
            }
        }
    }

    @objc func didTapReset() {
        count.accept(0)
        keyword.accept("")
        inputViewField.byText(nil)
        logs.removeAll()
        reloadSummary()
        reloadLogs()
        appendLog("演示已重置")
    }
}
