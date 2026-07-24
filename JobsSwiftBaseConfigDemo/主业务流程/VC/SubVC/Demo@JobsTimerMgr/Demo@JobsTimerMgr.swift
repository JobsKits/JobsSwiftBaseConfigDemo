//
//  Demo@JobsTimerMgr.swift
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
import JobsBy3rdTools
import JobsSwiftBaseTools
import JobsSwiftTimer
import JobsSwiftTimerMgr
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

// MARK: - Demo Timer ID
private enum JobsTimerMgrDemoID: String, JobsSwiftTimerIdentifiable {
    case A_pauseResume
    case B_cancelInBackground
    case C_oneShot

    var identifier: String? { "com.jobs.demo.timer.\(rawValue)" }
}
// MARK: - UI Bridge（规避 @Sendable 闭包直接抓 VC）
private final class JobsTimerMgrDemoUIBridge: @unchecked Sendable {
    weak var vc: JobsTimerMgrDemoVC?

    private var aCount = 0
    private var bCount = 0

    init(_ vc: JobsTimerMgrDemoVC) {
        self.vc = vc
    }

    func resetCounters() {
        aCount = 0
        bCount = 0
        Task { @MainActor [weak vc] in
            vc?.countALabel.byText("A 持续任务\n0 次")
            vc?.countBLabel.byText("B 后台取消\n0 次")
            vc?.oneShotLabel.byText("一次性任务\n未启动")
        }
    }

    func setStatus(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.statusLabel.byText(s)
        }
    }

    func incA() {
        aCount += 1
        let v = aCount
        Task { @MainActor [weak vc] in
            vc?.countALabel.byText("A 持续任务\n\(v) 次")
        }
    }

    func incB() {
        bCount += 1
        let v = bCount
        Task { @MainActor [weak vc] in
            vc?.countBLabel.byText("B 后台取消\n\(v) 次")
        }
    }

    func setOneShot(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.oneShotLabel.byText(s)
        }
    }

    func log(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.appendLog(s)
        }
    }
}
// MARK: - VC
final class JobsTimerMgrDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 16
    private let sectionGap: CGFloat = 14
    private let buttonHeight: CGFloat = 48

    private lazy var uiBridge: JobsTimerMgrDemoUIBridge = .init(self)
    // A 策略：pauseAndResume
    // - 手动 pause：前台不会自动 resume
    // - 后台 autoPause：回前台会自动 resume
    private var aManuallyPaused = false
    private var aAutoPausedInBackground = false
    // MARK: - UI
    private lazy var scrollView: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(NO)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()

    private lazy var heroTitleLabel: UILabel = {
        UILabel()
            .byText("一个管理器，统一驾驭三种计时内核".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 23))
            .byTextColor(JobsCor.label)
            .byNumberOfLines(0)
            .byAddTo(contentView) {[unowned self] make in
                make.top.equalToSuperview().offset(20)
                make.left.right.equalToSuperview().inset(self.horizontalInset)
            }
    }()

    private lazy var heroDetailLabel: UILabel = {
        UILabel()
            .byText(
                "JobsSwiftTimerMgr 的价值不是“再造一个 Timer”，而是给 GCD、DisplayLink、NSTimer 加上统一的 identifier 管理、去重替换、暂停恢复、后台策略和集中清理。下面按步骤操作，状态与日志会同步变化。".tr
            )
            .byNumberOfLines(0)
            .byLineBreakMode(.byWordWrapping)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(self.heroTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    private lazy var guideCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.heroDetailLabel.snp.bottom).offset(18)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var guideTitleLabel: UILabel = {
        UILabel()
            .byText("这个 Demo 要证明什么？".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(guideCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var guideDetailLabel: UILabel = {
        UILabel()
            .byText(
                "① 同一个 identifier 只保留一个 Timer，新建时可原位替换旧实例。\n" +
                "② A 支持暂停 / 恢复，并能区分“手动暂停”和“后台自动暂停”。\n" +
                "③ B 进入后台后直接停止并从管理器移除。\n" +
                "④ OneShot 只触发一次，完成后自动清理。"
            )
            .byNumberOfLines(0)
            .byLineBreakMode(.byWordWrapping)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(guideCard) { [unowned self] make in
                make.top.equalTo(self.guideTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var kindCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.guideCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var kindTitleLabel: UILabel = {
        UILabel()
            .byText("先选择 A 的计时内核".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(kindCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var kindDetailLabel: UILabel = {
        UILabel()
            .byText("选择只影响 A；点击“同 ID 替换 A”会切换到下一个内核，但 identifier 保持不变。".tr)
            .byNumberOfLines(0)
            .byLineBreakMode(.byWordWrapping)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(kindCard) { [unowned self] make in
                make.top.equalTo(self.kindTitleLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var kindSegment: UISegmentedControl = {
        UISegmentedControl(items: ["GCD", "DisplayLink", "NSTimer"])
            .bySelectedSegmentIndex(0)
            .onJobsChange { [weak self] (_: UISegmentedControl) in
                self?.updateKindDescription()
            }
            .byAddTo(kindCard) { [unowned self] make in
                make.top.equalTo(self.kindDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(36)
            }
    }()

    private lazy var kindFootnoteLabel: UILabel = {
        UILabel()
            .byText("当前 GCD：适合普通周期任务，按秒观察最直观。".tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
            .byTextColor(JobsCor.systemBlue)
            .byAddTo(kindCard) { [unowned self] make in
                make.top.equalTo(self.kindSegment.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var statusCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.kindCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var statusTitleLabel: UILabel = {
        UILabel()
            .byText("实时实验状态".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(statusCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    fileprivate lazy var statusLabel: UILabel = {
        UILabel()
            .byText("等待开始：先创建 A + B，再按下面的实验顺序操作。".tr)
            .byNumberOfLines(0)
            .byLineBreakMode(.byWordWrapping)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(statusCard) { [unowned self] make in
                make.top.equalTo(self.statusTitleLabel.snp.bottom).offset(6)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var aMetricView: UIView = makeMetricView()
    private lazy var bMetricView: UIView = makeMetricView()
    private lazy var oneShotMetricView: UIView = makeMetricView()

    fileprivate lazy var countALabel: UILabel = {
        UILabel()
            .byText("A 持续任务\n0 次")
            .byNumberOfLines(2)
            .byTextAlignment(.center)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(aMetricView) { make in
                make.edges.equalToSuperview().inset(6)
            }
    }()

    fileprivate lazy var countBLabel: UILabel = {
        UILabel()
            .byText("B 后台取消\n0 次")
            .byNumberOfLines(2)
            .byTextAlignment(.center)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(bMetricView) { make in
                make.edges.equalToSuperview().inset(6)
            }
    }()

    fileprivate lazy var oneShotLabel: UILabel = {
        UILabel()
            .byText("一次性任务\n未启动")
            .byNumberOfLines(2)
            .byTextAlignment(.center)
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byAddTo(oneShotMetricView) { make in
                make.edges.equalToSuperview().inset(6)
            }
    }()

    private lazy var metricsStackView: UIStackView = {
        UIStackView(arrangedSubviews: [aMetricView, bMetricView, oneShotMetricView])
            .byAxis(.horizontal)
            .bySpacing(8)
            .byDistribution(.fillEqually)
            .byAddTo(statusCard) { [unowned self] make in
                make.top.equalTo(self.statusLabel.snp.bottom).offset(14)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(72)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var identityCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.statusCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var identityTitleLabel: UILabel = makeSectionTitle("实验 1 · 创建与同 ID 替换")
        .byAddTo(identityCard) { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var identityDetailLabel: UILabel = makeSectionDetail(
        "先创建 A、B 两个持续任务；再用相同 identifier 替换 A，观察计数继续由新内核接管。"
    )
        .byAddTo(identityCard) { [unowned self] make in
            make.top.equalTo(self.identityTitleLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var createBtn: UIButton = { [unowned self] in
        makeActionButton("创建 A + B", color: JobsCor.systemGreen)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.createTimers()
                }
            }
    }()

    private lazy var replaceABtn: UIButton = { [unowned self] in
        makeActionButton("同 ID 替换 A", color: JobsCor.systemBlue)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.replaceA()
                }
            }
    }()

    private lazy var identityButtonsStackView: UIStackView = {
        UIStackView(arrangedSubviews: [createBtn, replaceABtn])
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddTo(identityCard) { [unowned self] make in
                make.top.equalTo(self.identityDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(buttonHeight)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var lifecycleCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.identityCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var lifecycleTitleLabel: UILabel = makeSectionTitle("实验 2 · 暂停与前后台策略")
        .byAddTo(lifecycleCard) { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var lifecycleDetailLabel: UILabel = makeSectionDetail(
        "手动暂停 A 后切后台再回来，A 不会被误恢复；正常运行时切后台，A 会自动暂停并在前台恢复，B 则被直接移除。"
    )
        .byAddTo(lifecycleCard) { [unowned self] make in
            make.top.equalTo(self.lifecycleTitleLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var pauseABtn: UIButton = { [unowned self] in
        makeActionButton("手动暂停 A", color: JobsCor.systemOrange)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.pauseA()
                }
            }
    }()

    private lazy var resumeABtn: UIButton = { [unowned self] in
        makeActionButton("恢复 A", color: JobsCor.systemTeal)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.resumeA()
                }
            }
    }()

    private lazy var lifecycleButtonsStackView: UIStackView = {
        UIStackView(arrangedSubviews: [pauseABtn, resumeABtn])
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddTo(lifecycleCard) { [unowned self] make in
                make.top.equalTo(self.lifecycleDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(buttonHeight)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var oneShotCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.lifecycleCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var oneShotTitleLabel: UILabel = makeSectionTitle("实验 3 · 一次性任务")
        .byAddTo(oneShotCard) { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var oneShotDetailLabel: UILabel = makeSectionDetail(
        "启动后等待约 2 秒：任务只触发一次，并通过 cancel 完成 stop + remove；也可以在触发前手动取消。"
    )
        .byAddTo(oneShotCard) { [unowned self] make in
            make.top.equalTo(self.oneShotTitleLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var oneShotBtn: UIButton = { [unowned self] in
        makeActionButton("启动 2 秒任务", color: JobsCor.systemIndigo)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.startOneShot()
                }
            }
    }()

    private lazy var cancelOneShotBtn: UIButton = { [unowned self] in
        makeActionButton("取消并移除", color: JobsCor.systemPurple)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.cancelOneShot()
                }
            }
    }()

    private lazy var oneShotButtonsStackView: UIStackView = {
        UIStackView(arrangedSubviews: [oneShotBtn, cancelOneShotBtn])
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddTo(oneShotCard) { [unowned self] make in
                make.top.equalTo(self.oneShotDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(buttonHeight)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var managerCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.oneShotCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
        }

    private lazy var managerTitleLabel: UILabel = makeSectionTitle("实验 4 · 检查与集中清理")
        .byAddTo(managerCard) { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var managerDetailLabel: UILabel = makeSectionDetail(
        "查看当前仍由 Manager 托管的 identifier，或一次性停止并移除所有任务。"
    )
        .byAddTo(managerCard) { [unowned self] make in
            make.top.equalTo(self.managerTitleLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }

    private lazy var dumpIdsBtn: UIButton = { [unowned self] in
        makeActionButton("查看活跃 ID", color: JobsCor.systemGray)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.dumpIDs()
                }
            }
    }()

    private lazy var stopAllBtn: UIButton = { [unowned self] in
        makeActionButton("停止并清空全部", color: JobsCor.systemRed)
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    vc.stopAll()
                }
            }
    }()

    private lazy var managerButtonsStackView: UIStackView = {
        UIStackView(arrangedSubviews: [dumpIdsBtn, stopAllBtn])
            .byAxis(.horizontal)
            .bySpacing(10)
            .byDistribution(.fillEqually)
            .byAddTo(managerCard) { [unowned self] make in
                make.top.equalTo(self.managerDetailLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(buttonHeight)
                make.bottom.equalToSuperview().inset(16)
            }
    }()

    private lazy var logCard: UIView = makeCard()
        .byAddTo(contentView) { [unowned self] make in
            make.top.equalTo(self.managerCard.snp.bottom).offset(sectionGap)
            make.left.right.equalToSuperview().inset(horizontalInset)
            make.bottom.equalToSuperview().inset(24)
        }

    private lazy var logTitleLabel: UILabel = {
        UILabel()
            .byText("实验日志".tr)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.label)
            .byAddTo(logCard) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logHintLabel: UILabel = {
        UILabel()
            .byText("每次操作、前后台切换和 Manager 状态变化都会记录在这里。".tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(logCard) { [unowned self] make in
                make.top.equalTo(self.logTitleLabel.snp.bottom).offset(5)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var logView: UITextView = {
        UITextView()
            .byEditable(NO)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byBackgroundColor(JobsCor.tertiarySystemGroupedBackground)
            .byCornerRadius(10)
            .byTextContainerInset(.init(top: 10, left: 10, bottom: 10, right: 10))
            .byText("")
            .byAddTo(logCard) { [unowned self] make in
                make.top.equalTo(self.logHintLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(12)
                make.height.equalTo(220)
                make.bottom.equalToSuperview().inset(12)
            }
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "Jobs 时间管理大师".tr)
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        [
            scrollView, contentView,
            heroTitleLabel, heroDetailLabel,
            guideTitleLabel, guideDetailLabel,
            kindTitleLabel, kindDetailLabel, kindSegment, kindFootnoteLabel,
            statusTitleLabel, statusLabel,
            countALabel, countBLabel, oneShotLabel, metricsStackView,
            identityTitleLabel, identityDetailLabel, identityButtonsStackView,
            lifecycleTitleLabel, lifecycleDetailLabel, lifecycleButtonsStackView,
            oneShotTitleLabel, oneShotDetailLabel, oneShotButtonsStackView,
            managerTitleLabel, managerDetailLabel, managerButtonsStackView,
            logTitleLabel, logHintLabel, logView
        ].forEach { $0.byVisible(YES) }
        updateKindDescription()
        appendLog("页面已就绪：建议按“实验 1 → 实验 2 → 实验 3 → 实验 4”的顺序操作。")
        installAppStateObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        uninstallAppStateObservers()
        JobsSwiftTimerMgr.shared.removeAll(stopAll: true)
    }

    // MARK: - App State（统一策略落地）
    private var observers: [NSObjectProtocol] = []

    private func installAppStateObservers() {
        #if canImport(UIKit)
        let nc = NotificationCenter.default
        observers.append(
            nc.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { [weak self] _ in
                self?.handleEnterBackgroundLike()
            }
        )
        observers.append(
            nc.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: .main) { [weak self] _ in
                self?.handleEnterBackgroundLike()
            }
        )
        observers.append(
            nc.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [weak self] _ in
                self?.handleEnterForegroundLike()
            }
        )
        observers.append(
            nc.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { [weak self] _ in
                self?.handleEnterForegroundLike()
            }
        )
        #endif
    }

    private func uninstallAppStateObservers() {
        observers.forEach { NotificationCenter.default.removeObserver($0) }
        observers.removeAll()
    }

    private func handleEnterBackgroundLike() {
        let uiBridge = self.uiBridge
        // A：pauseAndResume（后台 autoPause，但不覆盖“手动暂停”）
        let aID = JobsTimerMgrDemoID.A_pauseResume.identifier!
        if JobsSwiftTimerMgr.shared.timer(for: aID) != nil {
            if !aManuallyPaused {
                do {
                    _ = try JobsSwiftTimerMgr.shared.act(.pause, identifier: aID)
                    aAutoPausedInBackground = true
                    uiBridge.log("进入后台：A 自动暂停 ✅")
                } catch {
                    uiBridge.log("进入后台：A 自动暂停失败 ❌ \(error)")
                }
            } else {
                uiBridge.log("进入后台：A 已被手动暂停，不改写其状态")
            }
        }
        // B：cancel（后台 stop+remove）
        let bID = JobsTimerMgrDemoID.B_cancelInBackground.identifier!
        if JobsSwiftTimerMgr.shared.timer(for: bID) != nil {
            do {
                _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: bID)
                uiBridge.log("进入后台：B 已停止并从 Manager 移除 ✅")
            } catch {
                uiBridge.log("进入后台：B 取消失败 ❌ \(error)")
            }
        }
        uiBridge.setStatus("已进入后台：A 按策略暂停，B 按策略取消并移除。")
    }

    private func handleEnterForegroundLike() {
        let uiBridge = self.uiBridge
        // A：只恢复“后台 autoPause”导致的暂停，不恢复手动暂停
        let aID = JobsTimerMgrDemoID.A_pauseResume.identifier!
        if JobsSwiftTimerMgr.shared.timer(for: aID) != nil {
            if aAutoPausedInBackground && !aManuallyPaused {
                do {
                    _ = try JobsSwiftTimerMgr.shared.act(.resume, identifier: aID)
                    aAutoPausedInBackground = false
                    uiBridge.log("回到前台：A 从后台自动暂停中恢复 ✅")
                } catch {
                    uiBridge.log("回到前台：A 自动恢复失败 ❌ \(error)")
                }
            }
        }
        uiBridge.setStatus(
            aManuallyPaused
            ? "已回到前台：A 仍保持手动暂停，不会被误恢复。"
            : "已回到前台：如果 A 曾被后台自动暂停，现在已经恢复。"
        )
    }

    // MARK: - Actions（按钮逻辑）
    @MainActor
    private func createTimers() {
        let uiBridge = self.uiBridge
        uiBridge.resetCounters()
        uiBridge.setStatus("正在创建 A 与 B，并通过 identifier 交给 Manager 托管…")
        aManuallyPaused = false
        aAutoPausedInBackground = false
        // A：pauseAndResume（后台自动 pause，前台恢复 autoPaused）
        do {
            let kindA = selectedKindForA()
            let intervalA: TimeInterval = (kindA == .displayLink) ? (1.0 / 30.0) : 1.0
            let cfgA = JobsSwiftTimerConfig(
                interval: intervalA,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,     // 由 VC 管
                autoManageAppState: false     // manager 会强制 false，这里显式写清楚
            )
            let tA = try JobsSwiftTimerMgr.shared.create(
                kind: kindA,
                identifier: JobsTimerMgrDemoID.A_pauseResume.identifier!,
                config: cfgA,
                dedupPolicy: .replace
            ) { [uiBridge] in
                // ✅ tick handler 是 @Sendable：不要直接碰 VC/UI，走 bridge + MainActor
                Task { @MainActor [weak self] in
                    guard self != nil else { return }
                    uiBridge.incA()
                }
            }
            tA.start()
            uiBridge.log("A 创建成功 ✅ 策略=pauseAndResume，内核=\(kindA)")
        } catch {
            uiBridge.log("A 创建失败 ❌ \(error)")
        }
        // B：cancel（进后台 stop+remove）
        do {
            let cfgB = JobsSwiftTimerConfig(
                interval: 0.7,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,
                autoManageAppState: false
            )
            let tB = try JobsSwiftTimerMgr.shared.create(
                kind: .gcd,
                identifier: JobsTimerMgrDemoID.B_cancelInBackground.identifier!,
                config: cfgB,
                dedupPolicy: .replace
            ) { [uiBridge] in
                Task { @MainActor [weak self] in
                    guard self != nil else { return }
                    uiBridge.incB()
                }
            }
            tB.start()
            uiBridge.log("B 创建成功 ✅ 进入后台时 stop + remove，内核=GCD")
        } catch {
            uiBridge.log("B 创建失败 ❌ \(error)")
        }
        uiBridge.setStatus("A 与 B 已创建。现在可做同 ID 替换，或手动暂停 A 后测试前后台策略。")
    }

    @MainActor
    private func replaceA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!
        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("替换 A 失败：请先点击“创建 A + B”")
            uiBridge.setStatus("操作未执行：A 尚未创建。")
            return
        }
        let current = selectedKindForA()
        let newKind = nextKind(current)
        let interval: TimeInterval = (newKind == .displayLink) ? (1.0 / 30.0) : 1.0
        uiBridge.setStatus("正在保留同一个 identifier，并把 A 替换为 \(newKind) 内核…")
        do {
            let cfg = JobsSwiftTimerConfig(
                interval: interval,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,
                autoManageAppState: false
            )
            let t = try JobsSwiftTimerMgr.shared.create(
                kind: newKind,
                identifier: id,
                config: cfg,
                dedupPolicy: .replace
            ) { [uiBridge] in
                Task { @MainActor [weak self] in
                    guard self != nil else { return }
                    uiBridge.incA()
                }
            }
            t.start()
            uiBridge.log("A 同 ID 替换成功 ✅ 新内核=\(newKind)")
            uiBridge.setStatus("A 已完成原位替换：identifier 不变，底层内核已切换为 \(newKind)。")
        } catch {
            uiBridge.log("A 替换失败 ❌ \(error)")
        }
    }

    @MainActor
    private func pauseA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!
        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("暂停 A 失败：A 尚未创建")
            uiBridge.setStatus("操作未执行：请先在实验 1 创建 A。")
            return
        }
        do {
            _ = try JobsSwiftTimerMgr.shared.act(.pause, identifier: id)
            aManuallyPaused = true
            aAutoPausedInBackground = false
            uiBridge.log("A 已手动暂停 ✅ 回到前台时不会被自动恢复")
            uiBridge.setStatus("A 处于手动暂停。现在切到后台再回来，计数应保持不变。")
        } catch {
            uiBridge.log("A 暂停失败 ❌ \(error)")
        }
    }

    @MainActor
    private func resumeA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!
        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("恢复 A 失败：A 尚未创建")
            uiBridge.setStatus("操作未执行：请先在实验 1 创建 A。")
            return
        }
        do {
            _ = try JobsSwiftTimerMgr.shared.act(.resume, identifier: id)
            aManuallyPaused = false
            uiBridge.log("A 已恢复 ✅")
            uiBridge.setStatus("A 已恢复运行，计数会继续增长。")
        } catch {
            uiBridge.log("A 恢复失败 ❌ \(error)")
        }
    }

    @MainActor
    private func startOneShot() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.C_oneShot.identifier!
        uiBridge.setOneShot("一次性任务\n等待触发…")
        uiBridge.setStatus("一次性任务已启动，约 2 秒后只触发一次。")
        do {
            let cfg = JobsSwiftTimerConfig(
                interval: 2.0,
                repeats: false,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,
                autoManageAppState: false
            )
            // repeats=false：tick 一次后内部会 stop；我们这里再 cancel 做 remove
            let t = try JobsSwiftTimerMgr.shared.create(
                kind: .gcd,
                identifier: id,
                config: cfg,
                dedupPolicy: .replace
            ) { [uiBridge] in
                // 立刻 stop+remove
                onMainAsync(self) { vc in
                    uiBridge.log("一次性任务已触发 ✅ repeats=false")
                    uiBridge.setOneShot("一次性任务\n已触发 ✅")
                    do {
                        _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: id)
                        uiBridge.setOneShot("一次性任务\n完成并移除")
                        uiBridge.setStatus("一次性任务已完成，并从 Manager 中自动移除。")
                    } catch {
                        uiBridge.log("一次性任务移除失败 ❌ \(error)")
                    }
                }
            }
            t.start()
            uiBridge.log("一次性任务启动成功 ✅ interval=2s，内核=GCD")
        } catch {
            uiBridge.log("一次性任务启动失败 ❌ \(error)")
            uiBridge.setOneShot("一次性任务\n启动失败")
            uiBridge.setStatus("一次性任务启动失败，请查看下方日志。")
        }
    }

    @MainActor
    private func cancelOneShot() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.C_oneShot.identifier!
        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("取消一次性任务失败：当前没有可取消的实例")
            uiBridge.setOneShot("一次性任务\n当前不存在")
            uiBridge.setStatus("操作未执行：一次性任务尚未启动或已经完成。")
            return
        }
        do {
            _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: id)
            uiBridge.log("一次性任务已取消并移除 ✅")
            uiBridge.setOneShot("一次性任务\n已取消并移除")
            uiBridge.setStatus("一次性任务已在触发前停止，并从 Manager 中移除。")
        } catch {
            uiBridge.log("一次性任务取消失败 ❌ \(error)")
        }
    }

    @MainActor
    private func dumpIDs() {
        let uiBridge = self.uiBridge
        let ids = [
            JobsTimerMgrDemoID.A_pauseResume.identifier!,
            JobsTimerMgrDemoID.B_cancelInBackground.identifier!,
            JobsTimerMgrDemoID.C_oneShot.identifier!
        ]
        let alive = ids.filter { JobsSwiftTimerMgr.shared.timer(for: $0) != nil }
        uiBridge.log("当前活跃 ID：\(alive)")
        uiBridge.setStatus(
            alive.isEmpty
            ? "Manager 当前没有托管任何 Demo Timer。"
            : "Manager 当前托管 \(alive.count) 个 Demo Timer，详情见日志。"
        )
    }

    @MainActor
    private func stopAll() {
        let uiBridge = self.uiBridge
        JobsSwiftTimerMgr.shared.removeAll(stopAll: true)
        aManuallyPaused = false
        aAutoPausedInBackground = false
        uiBridge.log("全部任务已停止并移除 ✅")
        uiBridge.setStatus("Manager 已清空，所有计数归零。")
        uiBridge.resetCounters()
    }

    // MARK: - Log
    @MainActor
    fileprivate func appendLog(_ s: String) {
        let t = ISO8601DateFormatter().string(from: Date())
        let line = "[\(t)] \(s)\n"
        logView.byText((logView.text ?? "") + line)
        let bottom = NSRange(location: max(0, (logView.text as NSString).length - 1), length: 1)
        logView.scrollRangeToVisible(bottom)
    }

    // MARK: - Helpers
    private func makeCard() -> UIView {
        UIView()
            .byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
            .byCornerRadius(16)
    }

    private func makeMetricView() -> UIView {
        UIView()
            .byBackgroundColor(JobsCor.tertiarySystemGroupedBackground)
            .byCornerRadius(12)
    }

    private func makeSectionTitle(_ text: String) -> UILabel {
        UILabel()
            .byText(text.tr)
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .bold))
            .byTextColor(JobsCor.label)
    }

    private func makeSectionDetail(_ text: String) -> UILabel {
        UILabel()
            .byText(text.tr)
            .byNumberOfLines(0)
            .byLineBreakMode(.byWordWrapping)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
    }

    private func makeActionButton(_ title: String, color: UIColor) -> UIButton {
        UIButton.sys()
            .byBackgroundColor(color, for: .normal)
            .byTitle(title.tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTitleAdjustsFontSizeToFitWidth(YES)
            .byTitleMinimumScaleFactor(0.75)
            .byContentEdgeInsets(.init(top: 10, left: 8, bottom: 10, right: 8))
            .byCornerRadius(12)
    }

    private func updateKindDescription() {
        switch kindSegment.selectedSegmentIndex {
        /// DisplayLink 跟随屏幕刷新节奏，适合逐帧任务
        case 1:
            kindFootnoteLabel.byText("当前 DisplayLink：跟随屏幕刷新节奏，适合动画或逐帧任务。".tr)
        /// NSTimer 依赖 RunLoop，适合传统定时场景
        case 2:
            kindFootnoteLabel.byText("当前 NSTimer：依赖 RunLoop，适合传统 Foundation 定时场景。".tr)
        /// GCD 是默认内核，适合普通周期任务
        default:
            kindFootnoteLabel.byText("当前 GCD：适合普通周期任务，按秒观察最直观。".tr)
        }
    }

    private func selectedKindForA() -> JobsTimerKind {
        switch kindSegment.selectedSegmentIndex {
        /// 处理 数值 1 分支
        case 1: return .displayLink
        /// 处理 数值 2 分支
        case 2: return .foundation
        /// 未匹配已知分支时执行兜底处理
        default: return .gcd
        }
    }

    private func nextKind(_ kind: JobsTimerKind) -> JobsTimerKind {
        switch kind {
        /// 处理 .gcd 分支
        case .gcd: return .displayLink
        /// 处理 .displayLink 分支
        case .displayLink: return .foundation
        /// 处理 .foundation 分支
        case .foundation: return .gcd
        /// 未匹配已知分支时执行兜底处理
        default: return .gcd
        }
    }
}
