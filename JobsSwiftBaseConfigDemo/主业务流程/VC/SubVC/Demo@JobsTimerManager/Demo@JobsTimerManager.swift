//
//  Demo@JobsTimerManager.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/13/25.
//
//  ✅ 适配你当前 JobsTimerManager.swift：仅依赖
//  - JobsTimerManager.shared.create(kind:identifier:config:dedupPolicy:onTick:)
//  - JobsTimerManager.shared.act(.start/.pause/.resume/.stop/.cancel, identifier:)
//  - JobsTimerManager.shared.timer(for:)
//  - JobsTimerManager.shared.removeAll(stopAll:)
//  并统一用 VC 监听 App 前后台来执行策略（因为 Manager 内部将 autoManageAppState=false）
//
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import Inheritance
import JobsByUIKit
import JobsBy3rdTools
import JobsSwiftBaseTools
import JobsSwiftTimer
import JobsTextTools
import JobsSwiftBaseDefines
// MARK: - Demo Timer ID
private enum JobsTimerManagerDemoID: String, JobsTimerIdentifiable {
    case A_pauseResume
    case B_cancelInBackground
    case C_oneShot

    var identifier: String? { "com.jobs.demo.timer.\(rawValue)" }
}
// MARK: - UI Bridge（规避 @Sendable 闭包直接抓 VC）
private final class JobsTimerManagerDemoUIBridge: @unchecked Sendable {
    weak var vc: JobsTimerManagerDemoVC?

    private var aCount = 0
    private var bCount = 0

    init(_ vc: JobsTimerManagerDemoVC) {
        self.vc = vc
    }

    func resetCounters() {
        aCount = 0
        bCount = 0
        Task { @MainActor [weak vc] in
            vc?.countALabel.text = "A ticks: 0"
            vc?.countBLabel.text = "B ticks: 0"
            vc?.oneShotLabel.text = "OneShot: not started"
        }
    }

    func setStatus(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.statusLabel.text = s
        }
    }

    func incA() {
        aCount += 1
        let v = aCount
        Task { @MainActor [weak vc] in
            vc?.countALabel.text = "A ticks: \(v)"
        }
    }

    func incB() {
        bCount += 1
        let v = bCount
        Task { @MainActor [weak vc] in
            vc?.countBLabel.text = "B ticks: \(v)"
        }
    }

    func setOneShot(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.oneShotLabel.text = s
        }
    }

    func log(_ s: String) {
        Task { @MainActor [weak vc] in
            vc?.appendLog(s)
        }
    }
}

// MARK: - VC
final class JobsTimerManagerDemoVC: BaseVC {

    private let horizontalInset: CGFloat = 16
    private let verticalGap: CGFloat = 10
    private let rowHeight: CGFloat = 44

    private lazy var uiBridge: JobsTimerManagerDemoUIBridge = .init(self)

    // A 策略：pauseAndResume
    // - 手动 pause：前台不会自动 resume
    // - 后台 autoPause：回前台会自动 resume
    private var aManuallyPaused = false
    private var aAutoPausedInBackground = false

    // MARK: - UI
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byText(
                """
                特点演示（基于你当前 JobsTimerManager API 实现）：
                1) identifier 管理 + create(dedupPolicy:.replace) 防重复（同 id 替换旧 Timer）
                2) A: pauseAndResume（后台 autoPause；前台只恢复 autoPaused，不误恢复手动暂停）
                3) B: cancel（进后台 stop+remove）
                4) OneShot: repeats=false（handler 首次触发后 cancel=stop+remove）
                """
            )
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
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

    fileprivate lazy var statusLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(.label)
            .byText("Ready")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(kindSegment.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    fileprivate lazy var countALabel: UILabel = {
        UILabel()
            .byFont(.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(.label)
            .byText("A ticks: 0")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    fileprivate lazy var countBLabel: UILabel = {
        UILabel()
            .byFont(.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(.label)
            .byText("B ticks: 0")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(countALabel.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    fileprivate lazy var oneShotLabel: UILabel = {
        UILabel()
            .byFont(.monospacedDigitSystemFont(ofSize: 15, weight: .regular))
            .byTextColor(.label)
            .byText("OneShot: not started")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(countBLabel.snp.bottom).offset(8)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    private lazy var createBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemGreen, for: .normal)
            .byTitle("Create Timers", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemBlue, for: .normal)
            .byTitle("Replace A (Same ID)", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemOrange, for: .normal)
            .byTitle("Pause A (Manual)", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemTeal, for: .normal)
            .byTitle("Resume A", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemIndigo, for: .normal)
            .byTitle("Start OneShot (2s)", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemPurple, for: .normal)
            .byTitle("Cancel + Remove OneShot", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemGray, for: .normal)
            .byTitle("Dump IDs", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byBackgroundColor(.systemRed, for: .normal)
            .byTitle("Stop All", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                Task { @MainActor in
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
            .byFont(.monospacedSystemFont(ofSize: 12, weight: .regular))
            .byBgColor(.secondarySystemBackground)
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
        jobsSetupGKNav(title: "在JobsTimer基础上进行的二次封装")
        view.backgroundColor = .systemBackground

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
        JobsTimerManager.shared.removeAll(stopAll: true)
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
        let aID = JobsTimerManagerDemoID.A_pauseResume.identifier!
        if JobsTimerManager.shared.timer(for: aID) != nil {
            if !aManuallyPaused {
                do {
                    _ = try JobsTimerManager.shared.act(.pause, identifier: aID)
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
        let bID = JobsTimerManagerDemoID.B_cancelInBackground.identifier!
        if JobsTimerManager.shared.timer(for: bID) != nil {
            do {
                _ = try JobsTimerManager.shared.act(.cancel, identifier: bID)
                uiBridge.log("App->BG: B cancel(stop+remove) ✅")
            } catch {
                uiBridge.log("App->BG: B cancel failed ❌ \(error)")
            }
        }
    }

    private func handleEnterForegroundLike() {
        let uiBridge = self.uiBridge

        // A：只恢复“后台 autoPause”导致的暂停，不恢复手动暂停
        let aID = JobsTimerManagerDemoID.A_pauseResume.identifier!
        if JobsTimerManager.shared.timer(for: aID) != nil {
            if aAutoPausedInBackground && !aManuallyPaused {
                do {
                    _ = try JobsTimerManager.shared.act(.resume, identifier: aID)
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

            let cfgA = JobsTimerConfig(
                interval: intervalA,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,     // 由 VC 管
                autoManageAppState: false     // manager 会强制 false，这里显式写清楚
            )

            let tA = try JobsTimerManager.shared.create(
                kind: kindA,
                identifier: JobsTimerManagerDemoID.A_pauseResume.identifier!,
                config: cfgA,
                dedupPolicy: .replace
            ) { [uiBridge] in
                // ✅ tick handler 是 @Sendable：不要直接碰 VC/UI，走 bridge + MainActor
                Task { @MainActor [weak self] in
                    guard let self else { return }
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
            let cfgB = JobsTimerConfig(
                interval: 0.7,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,
                autoManageAppState: false
            )

            let tB = try JobsTimerManager.shared.create(
                kind: .gcd,
                identifier: JobsTimerManagerDemoID.B_cancelInBackground.identifier!,
                config: cfgB,
                dedupPolicy: .replace
            ) { [uiBridge] in
                Task { @MainActor [weak self] in
                    guard let self else { return }
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
        let id = JobsTimerManagerDemoID.A_pauseResume.identifier!

        guard JobsTimerManager.shared.timer(for: id) != nil else {
            uiBridge.log("Replace A ❌ 先 Create Timers")
            return
        }

        let current = selectedKindForA()
        let newKind = nextKind(current)
        let interval: TimeInterval = (newKind == .displayLink) ? (1.0 / 30.0) : 1.0

        uiBridge.setStatus("Replacing A...")

        do {
            let cfg = JobsTimerConfig(
                interval: interval,
                repeats: true,
                tolerance: 0.01,
                queue: .main,
                runLoop: .main,
                runLoopMode: .common,
                pauseInBackground: false,
                autoManageAppState: false
            )

            let t = try JobsTimerManager.shared.create(
                kind: newKind,
                identifier: id,
                config: cfg,
                dedupPolicy: .replace
            ) { [uiBridge] in
                Task { @MainActor [weak self] in
                    guard let self else { return }
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
        let id = JobsTimerManagerDemoID.A_pauseResume.identifier!

        guard JobsTimerManager.shared.timer(for: id) != nil else {
            uiBridge.log("Pause A ❌（A 不存在）")
            return
        }

        do {
            _ = try JobsTimerManager.shared.act(.pause, identifier: id)
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
        let id = JobsTimerManagerDemoID.A_pauseResume.identifier!

        guard JobsTimerManager.shared.timer(for: id) != nil else {
            uiBridge.log("Resume A ❌（A 不存在）")
            return
        }

        do {
            _ = try JobsTimerManager.shared.act(.resume, identifier: id)
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
        let id = JobsTimerManagerDemoID.C_oneShot.identifier!

        uiBridge.setOneShot("OneShot: running...")
        uiBridge.setStatus("Starting OneShot...")

        do {
            let cfg = JobsTimerConfig(
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
            let t = try JobsTimerManager.shared.create(
                kind: .gcd,
                identifier: id,
                config: cfg,
                dedupPolicy: .replace
            ) { [uiBridge] in
                // 立刻 stop+remove
                Task { @MainActor in
                    uiBridge.log("OneShot tick ✅ (repeats=false) -> cancel(remove)")
                    uiBridge.setOneShot("OneShot: fired ✅")
                    do {
                        _ = try JobsTimerManager.shared.act(.cancel, identifier: id)
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
        let id = JobsTimerManagerDemoID.C_oneShot.identifier!

        guard JobsTimerManager.shared.timer(for: id) != nil else {
            uiBridge.log("Cancel OneShot ❌（不存在）")
            uiBridge.setOneShot("OneShot: not exists")
            return
        }

        do {
            _ = try JobsTimerManager.shared.act(.cancel, identifier: id)
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
            JobsTimerManagerDemoID.A_pauseResume.identifier!,
            JobsTimerManagerDemoID.B_cancelInBackground.identifier!,
            JobsTimerManagerDemoID.C_oneShot.identifier!
        ]
        let alive = ids.filter { JobsTimerManager.shared.timer(for: $0) != nil }
        uiBridge.log("Active IDs: \(alive)")
    }

    @MainActor
    private func stopAll() {
        let uiBridge = self.uiBridge
        JobsTimerManager.shared.removeAll(stopAll: true)
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
        logView.text = (logView.text ?? "") + line
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
