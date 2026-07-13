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
            vc?.countALabel.byText("A ticks: 0")
            vc?.countBLabel.byText("B ticks: 0")
            vc?.oneShotLabel.byText("OneShot: not started")
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
            vc?.countALabel.byText("A ticks: \(v)")
        }
    }

    func incB() {
        bCount += 1
        let v = bCount
        Task { @MainActor [weak vc] in
            vc?.countBLabel.byText("B ticks: \(v)")
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
    private let verticalGap: CGFloat = 10
    private let rowHeight: CGFloat = 44

    private lazy var uiBridge: JobsTimerMgrDemoUIBridge = .init(self)
    // A 策略：pauseAndResume
    // - 手动 pause：前台不会自动 resume
    // - 后台 autoPause：回前台会自动 resume
    private var aManuallyPaused = false
    private var aAutoPausedInBackground = false
    // MARK: - UI
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.secondaryLabel)
            .byText(
                """
                特点演示（基于你当前 JobsSwiftTimerMgr API 实现）：
                1) identifier 管理 + create(dedupPolicy:.replace) 防重复（同 id 替换旧 Timer）
                2) A: pauseAndResume（后台 autoPause；前台只恢复 autoPaused，不误恢复手动暂停）
                3) B: cancel（进后台 stop+remove）
                4) OneShot: repeats=false（handler 首次触发后 cancel=stop+remove）
                """
            )
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var kindSegment: UISegmentedControl = {
        UISegmentedControl(items: ["GCD", "DisplayLink", "NSTimer"])
            .bySelectedSegmentIndex(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(hintLabel.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(32)
            }
    }()

    public lazy var statusLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(JobsCor.label)
            .byText("Ready")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(kindSegment.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    public lazy var countALabel: UILabel = {
        UILabel()
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.label)
            .byText("A ticks: 0")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    public lazy var countBLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.label)
            .byText("B ticks: 0")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(countALabel.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    public lazy var oneShotLabel: UILabel = {
        UILabel()
            .byFont(JobsFont.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(JobsCor.label)
            .byText("OneShot: not started")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(countBLabel.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    private lazy var createBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            .byTitle("Create Timers", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.createTimers()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(oneShotLabel.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(rowHeight)
            }
    }()

    private lazy var replaceABtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byTitle("Replace A (Same ID)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.replaceA()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(createBtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var pauseABtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemOrange, for: .normal)
            .byTitle("Pause A (Manual)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.pauseA()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(replaceABtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var resumeABtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemTeal, for: .normal)
            .byTitle("Resume A", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.resumeA()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(pauseABtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var oneShotBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemIndigo, for: .normal)
            .byTitle("Start OneShot (2s)", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.startOneShot()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(resumeABtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var cancelOneShotBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemPurple, for: .normal)
            .byTitle("Cancel + Remove OneShot", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.cancelOneShot()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(oneShotBtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var dumpIdsBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemGray, for: .normal)
            .byTitle("Dump IDs", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.dumpIDs()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(cancelOneShotBtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var stopAllBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemRed, for: .normal)
            .byTitle("Stop All", for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                onMainAsync(self) { vc in
                    self.stopAll()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(dumpIdsBtn.snp.bottom).offset(verticalGap)
                make.left.right.height.equalTo(createBtn)
            }
    }()

    private lazy var logView: UITextView = {
        UITextView()
            .byEditable(NO)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byTextContainerInset(.init(top: 10, left: 10, bottom: 10, right: 10))
            .byText("")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(stopAllBtn.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(12)
            }
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "在JobsSwiftTimer基础上进行的二次封装".tr)
        view.byBackgroundColor(JobsCor.systemBackground)

        hintLabel.byVisible(YES)
        kindSegment.byVisible(YES)
        statusLabel.byVisible(YES)
        countALabel.byVisible(YES)
        countBLabel.byVisible(YES)
        oneShotLabel.byVisible(YES)

        createBtn.byVisible(YES)
        replaceABtn.byVisible(YES)
        pauseABtn.byVisible(YES)
        resumeABtn.byVisible(YES)
        oneShotBtn.byVisible(YES)
        cancelOneShotBtn.byVisible(YES)
        dumpIdsBtn.byVisible(YES)
        stopAllBtn.byVisible(YES)
        logView.byVisible(YES)

        appendLog("提示：切到后台/切回前台：B（cancel）会消失；A（pauseAndResume）仍存在且仅恢复 autoPaused。")

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
                    uiBridge.log("App->BG: A autoPaused ✅")
                } catch {
                    uiBridge.log("App->BG: A autoPause failed ❌ \(error)")
                }
            } else {
                uiBridge.log("App->BG: A is manually paused, skip autoPause")
            }
        }

        // B：cancel（后台 stop+remove）
        let bID = JobsTimerMgrDemoID.B_cancelInBackground.identifier!
        if JobsSwiftTimerMgr.shared.timer(for: bID) != nil {
            do {
                _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: bID)
                uiBridge.log("App->BG: B cancel(stop+remove) ✅")
            } catch {
                uiBridge.log("App->BG: B cancel failed ❌ \(error)")
            }
        }
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
                    uiBridge.log("App->FG: A autoResumed ✅")
                } catch {
                    uiBridge.log("App->FG: A autoResume failed ❌ \(error)")
                }
            }
        }
    }

    // MARK: - Actions（按钮逻辑）
    @MainActor
    private func createTimers() {
        let uiBridge = self.uiBridge
        uiBridge.resetCounters()
        uiBridge.setStatus("Creating...")

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

            uiBridge.log("Created A ✅ policy=pauseAndResume  kind=\(kindA)")
        } catch {
            uiBridge.log("Create A ❌ \(error)")
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

            uiBridge.log("Created B ✅ policy=cancel（后台 stop+remove） kind=GCD")
        } catch {
            uiBridge.log("Create B ❌ \(error)")
        }

        uiBridge.setStatus("Created. Try: Pause A(Manual) -> background -> foreground -> Dump IDs.")
    }

    @MainActor
    private func replaceA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!

        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("Replace A ❌ 先 Create Timers")
            return
        }

        let current = selectedKindForA()
        let newKind = nextKind(current)
        let interval: TimeInterval = (newKind == .displayLink) ? (1.0 / 30.0) : 1.0

        uiBridge.setStatus("Replacing A...")

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

            uiBridge.log("Replace A ✅ same identifier / new core = \(newKind)")
            uiBridge.setStatus("A replaced. Same identifier, different core.")
        } catch {
            uiBridge.log("Replace A ❌ \(error)")
        }
    }

    @MainActor
    private func pauseA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!

        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("Pause A ❌（A 不存在）")
            return
        }

        do {
            _ = try JobsSwiftTimerMgr.shared.act(.pause, identifier: id)
            aManuallyPaused = true
            aAutoPausedInBackground = false
            uiBridge.log("Pause A ✅（手动暂停：回前台不会自动恢复）")
            uiBridge.setStatus("A manual paused. Now background -> foreground: A should stay paused.")
        } catch {
            uiBridge.log("Pause A ❌ \(error)")
        }
    }

    @MainActor
    private func resumeA() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.A_pauseResume.identifier!

        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("Resume A ❌（A 不存在）")
            return
        }

        do {
            _ = try JobsSwiftTimerMgr.shared.act(.resume, identifier: id)
            aManuallyPaused = false
            uiBridge.log("Resume A ✅")
            uiBridge.setStatus("A resumed.")
        } catch {
            uiBridge.log("Resume A ❌ \(error)")
        }
    }

    @MainActor
    private func startOneShot() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.C_oneShot.identifier!

        uiBridge.setOneShot("OneShot: running...")
        uiBridge.setStatus("Starting OneShot...")

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
                    uiBridge.log("OneShot tick ✅ (repeats=false) -> cancel(remove)")
                    uiBridge.setOneShot("OneShot: fired ✅")
                    do {
                        _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: id)
                        uiBridge.setOneShot("OneShot: finished + removed")
                    } catch {
                        uiBridge.log("OneShot cancel failed ❌ \(error)")
                    }
                }
            }
            t.start()
            uiBridge.log("Start OneShot ✅ interval=2s repeats=false kind=GCD")
            uiBridge.setStatus("OneShot started. Wait ~2s.")
        } catch {
            uiBridge.log("Start OneShot ❌ \(error)")
            uiBridge.setOneShot("OneShot: failed")
        }
    }

    @MainActor
    private func cancelOneShot() {
        let uiBridge = self.uiBridge
        let id = JobsTimerMgrDemoID.C_oneShot.identifier!

        guard JobsSwiftTimerMgr.shared.timer(for: id) != nil else {
            uiBridge.log("Cancel OneShot ❌（不存在）")
            uiBridge.setOneShot("OneShot: not exists")
            return
        }

        do {
            _ = try JobsSwiftTimerMgr.shared.act(.cancel, identifier: id)
            uiBridge.log("Cancel+Remove OneShot ✅")
            uiBridge.setOneShot("OneShot: canceled + removed")
        } catch {
            uiBridge.log("Cancel OneShot ❌ \(error)")
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
        uiBridge.log("Active IDs: \(alive)")
    }

    @MainActor
    private func stopAll() {
        let uiBridge = self.uiBridge
        JobsSwiftTimerMgr.shared.removeAll(stopAll: true)
        aManuallyPaused = false
        aAutoPausedInBackground = false
        uiBridge.log("Stop All ✅")
        uiBridge.setStatus("All stopped & removed.")
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
    private func selectedKindForA() -> JobsTimerKind {
        switch kindSegment.selectedSegmentIndex {
        case 1: return .displayLink
        case 2: return .foundation
        default: return .gcd
        }
    }

    private func nextKind(_ kind: JobsTimerKind) -> JobsTimerKind {
        switch kind {
        case .gcd: return .displayLink
        case .displayLink: return .foundation
        case .foundation: return .gcd
        default: return .gcd
        }
    }
}
