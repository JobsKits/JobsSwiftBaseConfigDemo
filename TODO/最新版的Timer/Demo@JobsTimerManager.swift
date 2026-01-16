//
//  Demo@JobsTimerManager.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/13/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

// MARK: - Demo Timer ID
private enum JobsTimerManagerDemoID: String, JobsTimerIdentifiable {
    case A_pauseResume
    case B_cancelInBackground
    case C_oneShot

    // ✅ 新协议：只要提供 identifier 即可
    var identifier: String? { "com.jobs.demo.timer.\(rawValue)" }

    // 便捷：强制非空
    var id: String { identifier! }
}

// MARK: - UI Bridge（规避 @Sendable 闭包直接抓 VC）
private final class JobsTimerManagerDemoUIBridge: @unchecked Sendable {
    weak var vc: JobsTimerManagerDemoVC?

    private var aCount = 0
    private var bCount = 0

    init(_ vc: JobsTimerManagerDemoVC) { self.vc = vc }

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
        Task { @MainActor [weak vc] in vc?.statusLabel.text = s }
    }

    func incA() {
        aCount += 1
        Task { @MainActor [weak vc] in
            vc?.countALabel.text = "A ticks: \(self.aCount)"
        }
    }

    func incB() {
        bCount += 1
        Task { @MainActor [weak vc] in
            vc?.countBLabel.text = "B ticks: \(self.bCount)"
        }
    }

    func setOneShot(_ s: String) {
        Task { @MainActor [weak vc] in vc?.oneShotLabel.text = s }
    }

    func log(_ s: String) {
        Task { @MainActor [weak vc] in vc?.appendLog(s) }
    }
}

final class JobsTimerManagerDemoVC: BaseVC {

    private let horizontalInset: CGFloat = 16
    private let verticalGap: CGFloat = 10
    private let rowHeight: CGFloat = 44

    private lazy var uiBridge: JobsTimerManagerDemoUIBridge = .init(self)

    /// A 是否因为“后台自动暂停”而暂停（用于“回前台只恢复 autoPaused，不误恢复手动暂停”）
    private var aAutoPausedByBackground = false

    // MARK: - UI
    private lazy var hintLabel: UILabel = {
        UILabel()
            .byNumberOfLines(0)
            .byFont(.systemFont(ofSize: 13, weight: .regular))
            .byTextColor(.secondaryLabel)
            .byText(
                """
                特点演示（已按最新 API 重构）：
                1) identifier 管理 + 去重策略 dedupPolicy（replace/keepExisting/error）
                2) A: pauseAndResume（后台“仅当运行中才自动 pause”，前台只恢复 autoPaused，不误恢复手动暂停）
                3) B: cancel（进后台 stop+remove）
                4) OneShot: repeats=false + onFinish + remove
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
                self.createTimers()
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
            .byTitle("Replace A (Dedup Replace)", for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .semibold))
            .onTap { [weak self] _ in
                guard let self else { return }
                self.replaceA()
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
                self.pauseA()
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
                self.resumeA()
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
                self.startOneShot()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(resumeABtn.snp.bottom).offset(verticalGap)
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
                self.dumpIDs()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(oneShotBtn.snp.bottom).offset(verticalGap)
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
                self.stopAll()
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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsTimerManager Demo (Latest API)")
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
        dumpIdsBtn.byVisible(YES)
        stopAllBtn.byVisible(YES)
        logView.byVisible(YES)

        appendLog("提示：切到后台/切回前台：B（cancel）会消失；A（仅当运行中才会被自动 pause，回前台只恢复 autoPaused）。")

        registerAppStateHooks()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterAppStateHooks()
        stopAll()
    }

    deinit { unregisterAppStateHooks() }

    // MARK: - Log
    @MainActor
    fileprivate func appendLog(_ s: String) {
        let t = ISO8601DateFormatter().string(from: Date())
        let line = "[\(t)] \(s)\n"
        logView.text = (logView.text ?? "") + line
        let bottom = NSRange(location: max(0, (logView.text as NSString).length - 1), length: 1)
        logView.scrollRangeToVisible(bottom)
    }

    // MARK: - App State Hooks (UIKit)
    private func registerAppStateHooks() {
        #if canImport(UIKit)
        NotificationCenter.default.addObserver(self,
                                              selector: #selector(onDidEnterBackground),
                                              name: UIApplication.didEnterBackgroundNotification,
                                              object: nil)
        NotificationCenter.default.addObserver(self,
                                              selector: #selector(onWillEnterForeground),
                                              name: UIApplication.willEnterForegroundNotification,
                                              object: nil)
        #endif
    }

    private func unregisterAppStateHooks() {
        #if canImport(UIKit)
        NotificationCenter.default.removeObserver(self,
                                                 name: UIApplication.didEnterBackgroundNotification,
                                                 object: nil)
        NotificationCenter.default.removeObserver(self,
                                                 name: UIApplication.willEnterForegroundNotification,
                                                 object: nil)
        #endif
    }

    @objc private func onDidEnterBackground() {
        // B：进后台 stop+remove
        do {
            _ = try JobsTimerManager.shared.act(.cancel, identifier: JobsTimerManagerDemoID.B_cancelInBackground.id)
            uiBridge.log("App -> Background: B cancel ✅ (stop+remove)")
        } catch {
            uiBridge.log("App -> Background: B cancel ignored (not found)")
        }

        // A：仅当“正在运行”时才自动 pause；如果是手动 pause，则不打扰
        if let a = JobsTimerManager.shared.timer(for: JobsTimerManagerDemoID.A_pauseResume.id), a.isRunning {
            do {
                _ = try JobsTimerManager.shared.act(.pause, identifier: JobsTimerManagerDemoID.A_pauseResume.id)
                aAutoPausedByBackground = true
                uiBridge.log("App -> Background: A auto-pause ✅")
            } catch { }
        } else {
            aAutoPausedByBackground = false
        }
    }

    @objc private func onWillEnterForeground() {
        // A：只恢复 autoPaused
        guard aAutoPausedByBackground else {
            uiBridge.log("App -> Foreground: A NOT resumed (manual paused or not running before)")
            return
        }
        do {
            _ = try JobsTimerManager.shared.act(.resume, identifier: JobsTimerManagerDemoID.A_pauseResume.id)
            uiBridge.log("App -> Foreground: A auto-resume ✅")
        } catch {
            uiBridge.log("App -> Foreground: A auto-resume failed (not found)")
        }
        aAutoPausedByBackground = false
    }

    // MARK: - Actions
    private func createTimers() {
        let uiBridge = self.uiBridge
        uiBridge.resetCounters()
        uiBridge.setStatus("Creating...")

        // ✅ A
        do {
            let kindA = selectedKindForA()
            let intervalA: TimeInterval = (kindA == .displayLink) ? (1.0 / 30.0) : 1.0

            let cfgA = JobsTimerConfig(interval: intervalA,
                                       repeats: true,
                                       tolerance: 0.01,
                                       queue: .main,
                                       runLoop: .main,
                                       runLoopMode: .common,
                                       pauseInBackground: true,
                                       autoManageAppState: false) // 关键：Demo 自己管

            let timerA = try JobsTimerManager.shared.create(kind: kindA,
                                                           identifier: JobsTimerManagerDemoID.A_pauseResume.id,
                                                           config: cfgA,
                                                           dedupPolicy: .replace) { [uiBridge] in
                uiBridge.log("A initial handler tick")
            }

            timerA.onTick { [uiBridge] in uiBridge.incA() }
            timerA.start()

            uiBridge.log("Created A ✅  dedup=replace  kind=\(kindA.jobs_displayName)")
        } catch {
            uiBridge.log("Create A ❌ \(error)")
        }

        // ✅ B（后台 cancel：stop+remove）
        do {
            let cfgB = JobsTimerConfig(interval: 0.7,
                                       repeats: true,
                                       tolerance: 0.01,
                                       queue: .main,
                                       runLoop: .main,
                                       runLoopMode: .common,
                                       pauseInBackground: true,
                                       autoManageAppState: false)

            let timerB = try JobsTimerManager.shared.create(kind: .gcd,
                                                           identifier: JobsTimerManagerDemoID.B_cancelInBackground.id,
                                                           config: cfgB,
                                                           dedupPolicy: .replace) { [uiBridge] in
                uiBridge.log("B initial handler tick")
            }

            timerB.onTick { [uiBridge] in uiBridge.incB() }
            timerB.start()

            uiBridge.log("Created B ✅  (后台会 cancel: stop+remove) kind=GCD")
        } catch {
            uiBridge.log("Create B ❌ \(error)")
        }

        uiBridge.setStatus("Created. Try: Pause A(Manual) -> background -> foreground -> Dump IDs.")
    }

    private func replaceA() {
        let uiBridge = self.uiBridge
        let current = selectedKindForA()
        let newKind = nextKind(current)
        let interval: TimeInterval = (newKind == .displayLink) ? (1.0 / 30.0) : 1.0

        guard JobsTimerManager.shared.timer(for: JobsTimerManagerDemoID.A_pauseResume.id) != nil else {
            uiBridge.log("Replace A ❌ 先 Create Timers")
            return
        }

        uiBridge.setStatus("Replacing A...")

        do {
            let cfg = JobsTimerConfig(interval: interval,
                                      repeats: true,
                                      tolerance: 0.01,
                                      queue: .main,
                                      runLoop: .main,
                                      runLoopMode: .common,
                                      pauseInBackground: true,
                                      autoManageAppState: false)

            let t = try JobsTimerManager.shared.create(kind: newKind,
                                                       identifier: JobsTimerManagerDemoID.A_pauseResume.id,
                                                       config: cfg,
                                                       dedupPolicy: .replace) { [uiBridge] in
                uiBridge.log("A replaced initial handler tick")
            }

            t.onTick { [uiBridge] in uiBridge.incA() }
            t.start()

            uiBridge.log("Replace A ✅  same identifier / new core = \(newKind.jobs_displayName)")
            uiBridge.setStatus("A replaced. Same identifier, different core.")
        } catch {
            uiBridge.log("Replace A ❌ \(error)")
        }
    }

    private func pauseA() {
        let uiBridge = self.uiBridge
        do {
            _ = try JobsTimerManager.shared.act(.pause, identifier: JobsTimerManagerDemoID.A_pauseResume.id)
            aAutoPausedByBackground = false // ✅ 手动 pause：回前台不准 auto resume
            uiBridge.log("Pause A ✅（手动暂停：回前台不会自动恢复）")
            uiBridge.setStatus("A manual paused. Now background -> foreground: A should stay paused.")
        } catch {
            uiBridge.log("Pause A ❌（A 不存在或不可暂停）")
        }
    }

    private func resumeA() {
        let uiBridge = self.uiBridge
        do {
            _ = try JobsTimerManager.shared.act(.resume, identifier: JobsTimerManagerDemoID.A_pauseResume.id)
            uiBridge.log("Resume A ✅")
            uiBridge.setStatus("A resumed.")
        } catch {
            uiBridge.log("Resume A ❌（A 不存在或不可恢复）")
        }
    }

    private func startOneShot() {
        let uiBridge = self.uiBridge
        uiBridge.setOneShot("OneShot: running...")
        uiBridge.setStatus("Starting OneShot...")

        do {
            let cfg = JobsTimerConfig(interval: 2.0,
                                      repeats: false,
                                      tolerance: 0.01,
                                      queue: .main,
                                      runLoop: .main,
                                      runLoopMode: .common,
                                      pauseInBackground: true,
                                      autoManageAppState: false)

            let t = try JobsTimerManager.shared.create(kind: .gcd,
                                                       identifier: JobsTimerManagerDemoID.C_oneShot.id,
                                                       config: cfg,
                                                       dedupPolicy: .replace) { [uiBridge] in
                uiBridge.log("OneShot tick (repeats=false)")
            }

            t.onFinish { [uiBridge] in
                uiBridge.log("OneShot onFinish ✅ -> stop+remove")
                do {
                    _ = try JobsTimerManager.shared.act(.cancel, identifier: JobsTimerManagerDemoID.C_oneShot.id)
                } catch { }
                uiBridge.setOneShot("OneShot: finished + removed")
            }

            t.start()
            uiBridge.log("Start OneShot ✅ interval=2s repeats=false kind=GCD")
            uiBridge.setStatus("OneShot started. Wait ~2s.")
        } catch {
            uiBridge.log("Start OneShot ❌ \(error)")
            uiBridge.setOneShot("OneShot: failed")
        }
    }

    private func dumpIDs() {
        let uiBridge = self.uiBridge
        let ids = [
            JobsTimerManagerDemoID.A_pauseResume.id,
            JobsTimerManagerDemoID.B_cancelInBackground.id,
            JobsTimerManagerDemoID.C_oneShot.id
        ].filter { JobsTimerManager.shared.timer(for: $0) != nil }
        uiBridge.log("Active IDs: \(ids)")
    }

    private func stopAll() {
        let uiBridge = self.uiBridge
        JobsTimerManager.shared.removeAll(stopAll: true)
        aAutoPausedByBackground = false
        uiBridge.log("Stop All ✅")
        uiBridge.setStatus("All stopped & removed.")
        uiBridge.resetCounters()
    }

    // MARK: - Kind helpers
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
// MARK: - display name (helper)
private extension JobsTimerKind {
    var jobs_displayName: String {
        switch self {
        case .gcd: return "GCD"
        case .foundation: return "NSTimer"
        case .displayLink: return "DisplayLink"
        case .runLoop: return "RunLoop"
        }
    }
}
