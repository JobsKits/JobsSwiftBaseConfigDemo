//
//  CrashLogCenter.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation
import Darwin // Darwin 层的 C 标准库 + POSIX + 系统底层 API
import UIKit

// ================================== CrashLogCenter ==================================
/// 负责写入/读取/清理 app sandbox Documents 下的 jobs_crash.log
/// 目标：
/// 1) 真机脱离 Xcode 也能保留日志（同步落盘）
/// 2) UI 可读取展示（CrashLogDemoVC）
/// 3) 尽量避免在 signal/terminate handler 里做“复杂事”（只做最小写入）
///
/// ⚠️ 注意：严格来说，signal handler 里调用 Swift/ObjC/IO 都不安全。
/// 本文件做的是“工程可用、尽量稳”的折中：
/// - signal/terminate 里只做一次“同步追加写入 + fsync”
/// - 不在 handler 里拿堆栈/创建大对象/做网络请求
public final class CrashLogCenter {
    public static let shared = CrashLogCenter()
    // ================================== Config ==================================
    /// 你要的文件名：jobs_crash.log
    private let fileName = "jobs_crash.log"
    /// “上次是否正常退出”的标记：用于判断上次是不是崩溃/被杀
    /// - App 进入前台(激活)：写 false（代表正在运行中）
    /// - 进入后台/terminate：写 true（代表到达安全点）
    private let safeExitKey = "com.jobs.crashlog.safe_exit"
    /// 启动时冻结的“上一次退出结果”，避免当前会话的 false 被误判成上次崩溃
    private let previousRunCrashedKey = "com.jobs.crashlog.previous_run_crashed"
    /// 文件写入队列（业务侧日志用，避免多线程乱序）
    private let ioQueue = DispatchQueue(label: "com.jobs.crashlog.center.io", qos: .utility)
    private let sampleInterval: TimeInterval = 5
    private let maxLogBytes: Int64 = 1024 * 1024
    private let retainedLogBytes: Int64 = 512 * 1024
    private var memoryTimer: DispatchSourceTimer?
    private var notificationTokens = [NSObjectProtocol]()
    private var sessionID = ""
    private var sessionStartedAt = Date()
    private var sessionStartFootprint: UInt64 = 0
    private var peakFootprint: UInt64 = 0
    private var latestSnapshot: MemorySnapshot?
    private var hasStartedSession = false
    private init() {}
    // ================================== Path ==================================
    /// Documents/jobs_crash.log
    var crashLogURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent(fileName)
    }
    /// 给 UI 打印用：完整路径提示
    func logPathHint() -> String { crashLogURL.path }
    // ================================== Session & Memory Monitor ==================================
    public struct MemorySnapshot {
        public let footprintBytes: UInt64
        public let residentBytes: UInt64
        public let peakFootprintBytes: UInt64
        public let growthBytes: Int64
        public let screen: String
        public let appState: String
        public let timestamp: Date
    }

    /// 尽可能早地启动。SIGKILL / Jetsam 没有回调，只能依靠被杀前持续落盘的轨迹。
    public func startMonitoring() {
        guard !hasStartedSession else { return }
        hasStartedSession = true

        let defaults = UserDefaults.standard
        let hadPreviousSession = defaults.object(forKey: safeExitKey) != nil
        let previousRunCrashed = hadPreviousSession && !defaults.bool(forKey: safeExitKey)
        defaults.set(previousRunCrashed, forKey: previousRunCrashedKey)
        defaults.set(false, forKey: safeExitKey)
        defaults.synchronize()

        sessionID = UUID().uuidString
        sessionStartedAt = Date()
        if let snapshot = captureMemorySnapshot() {
            sessionStartFootprint = snapshot.footprintBytes
            peakFootprint = snapshot.footprintBytes
            latestSnapshot = snapshot
        }

        _ = ensureFileExists()
        writeCrashSync(sessionBanner(previousRunCrashed: previousRunCrashed))
        CrashCatcher.installOnce()
        installLifecycleObservers()
        startMemoryTimer()
        captureAndPersistMemory(event: "launch")
    }

    /// 页面展示用的最近一次内存快照。
    public func latestMemorySnapshot() -> MemorySnapshot? { latestSnapshot }

    /// App 进入前台(激活)时调用：标记“本次会话正在运行中（非安全点）”
    /// 建议放在：
    /// - SceneDelegate.sceneDidBecomeActive
    /// - AppDelegate.applicationDidBecomeActive
    public func markAppLaunched() {
        startMonitoring()
        UserDefaults.standard.set(false, forKey: safeExitKey)
        UserDefaults.standard.synchronize()
        append("[LIFECYCLE] time=\(Date()) event=active session=\(sessionID)")
    }
    /// App 进入后台/退出前调用：标记“到达安全退出点”
    /// 你问的：CrashLogCenter.shared.markSafeExitPoint() 写在哪里？
    /// ✅ SceneDelegate.sceneDidEnterBackground
    /// ✅ AppDelegate.applicationDidEnterBackground / applicationWillTerminate
    public func markSafeExitPoint() {
        UserDefaults.standard.set(true, forKey: safeExitKey)
        UserDefaults.standard.synchronize()
        captureAndPersistMemory(event: "safe_exit")
    }
    /// 上次是否疑似崩溃（或被系统杀掉/强退）
    /// - 规则：上次没有写到安全退出点 => 认为“异常退出”
    public func didCrashLastRun() -> Bool {
        UserDefaults.standard.bool(forKey: previousRunCrashedKey)
    }

    private func startMemoryTimer() {
        let timer = DispatchSource.makeTimerSource(queue: .main)
        timer.schedule(deadline: .now() + sampleInterval, repeating: sampleInterval, leeway: .milliseconds(500))
        timer.setEventHandler { [weak self] in
            self?.captureAndPersistMemory(event: "sample")
        }
        memoryTimer = timer
        timer.resume()
    }

    private func installLifecycleObservers() {
        let center = NotificationCenter.default
        let events: [(Notification.Name, String)] = [
            (UIApplication.didReceiveMemoryWarningNotification, "memory_warning"),
            (UIApplication.willResignActiveNotification, "will_resign_active"),
            (UIApplication.didEnterBackgroundNotification, "did_enter_background"),
            (UIApplication.willEnterForegroundNotification, "will_enter_foreground"),
            (UIApplication.didBecomeActiveNotification, "did_become_active"),
            (UIApplication.willTerminateNotification, "will_terminate")
        ]
        notificationTokens = events.map { name, event in
            center.addObserver(forName: name, object: nil, queue: .main) { [weak self] _ in
                self?.captureAndPersistMemory(event: event, synchronous: event == "memory_warning")
            }
        }
    }

    private func captureAndPersistMemory(event: String, synchronous: Bool = false) {
        guard var snapshot = captureMemorySnapshot() else {
            append("[MEM] time=\(Date()) event=\(event) error=task_info_failed session=\(sessionID)")
            return
        }
        peakFootprint = max(peakFootprint, snapshot.footprintBytes)
        snapshot = MemorySnapshot(
            footprintBytes: snapshot.footprintBytes,
            residentBytes: snapshot.residentBytes,
            peakFootprintBytes: peakFootprint,
            growthBytes: Int64(snapshot.footprintBytes) - Int64(sessionStartFootprint),
            screen: currentScreenName(),
            appState: currentAppState(),
            timestamp: snapshot.timestamp
        )
        latestSnapshot = snapshot
        let line = memoryLine(snapshot: snapshot, event: event)
        if synchronous {
            writeCrashSync(line)
        } else {
            append(line)
        }
    }

    private func captureMemorySnapshot() -> MemorySnapshot? {
        var info = task_vm_info_data_t()
        var count = mach_msg_type_number_t(
            MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<natural_t>.size
        )
        let result = withUnsafeMutablePointer(to: &info) { pointer in
            pointer.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        guard result == KERN_SUCCESS else { return nil };return MemorySnapshot(
            footprintBytes: UInt64(info.phys_footprint),
            residentBytes: UInt64(info.resident_size),
            peakFootprintBytes: peakFootprint,
            growthBytes: 0,
            screen: "-",
            appState: "-",
            timestamp: Date()
        )
    }

    private func memoryLine(snapshot: MemorySnapshot, event: String) -> String {
        let elapsed = snapshot.timestamp.timeIntervalSince(sessionStartedAt)
        return String(
            format: "[MEM] time=%@ event=%@ elapsed=%.1fs footprint=%.1fMB resident=%.1fMB peak=%.1fMB growth=%+.1fMB state=%@ screen=%@ session=%@",
            String(describing: snapshot.timestamp),
            event,
            elapsed,
            megabytes(snapshot.footprintBytes),
            megabytes(snapshot.residentBytes),
            megabytes(snapshot.peakFootprintBytes),
            signedMegabytes(snapshot.growthBytes),
            snapshot.appState,
            snapshot.screen,
            sessionID
        )
    }

    private func sessionBanner(previousRunCrashed: Bool) -> String {
        let bundle = Bundle.main
        let version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "-"
        let build = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "-"
        return """

        ==================== MEMORY SESSION ====================
        time: \(sessionStartedAt)
        session: \(sessionID)
        app: \(version) (\(build))
        system: \(UIDevice.current.systemName) \(UIDevice.current.systemVersion)
        previousRunCrashed: \(previousRunCrashed ? "YES" : "NO")
        sampleInterval: \(Int(sampleInterval))s
        ========================================================
        """
    }

    private func currentScreenName() -> String {
        let windows: [UIWindow]
        if #available(iOS 13.0, tvOS 13.0, *) {
            windows = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
        } else {
            windows = UIApplication.shared.windows
        }
        let window = windows.first(where: { $0.isKeyWindow }) ?? windows.first
        guard let visible = visibleViewController(from: window?.rootViewController) else { return "-" };return NSStringFromClass(type(of: visible)).replacingOccurrences(of: " ", with: "_")
    }

    private func visibleViewController(from root: UIViewController?) -> UIViewController? {
        if let presented = root?.presentedViewController {
            return visibleViewController(from: presented)
        }
        if let navigation = root as? UINavigationController {
            return visibleViewController(from: navigation.visibleViewController)
        }
        if let tab = root as? UITabBarController {
            return visibleViewController(from: tab.selectedViewController)
        }
        if let split = root as? UISplitViewController {
            return visibleViewController(from: split.viewControllers.last)
        };return root
    }

    private func currentAppState() -> String {
        switch UIApplication.shared.applicationState {
        /// 处理 .active 分支
        case .active: return "active"
        /// 处理 .inactive 分支
        case .inactive: return "inactive"
        /// 处理 .background 分支
        case .background: return "background"
        /// 处理系统后续新增的未知枚举值
        @unknown default: return "unknown"
        }
    }

    private func megabytes(_ bytes: UInt64) -> Double {
        Double(bytes) / 1024 / 1024
    }

    private func signedMegabytes(_ bytes: Int64) -> Double {
        Double(bytes) / 1024 / 1024
    }
    // ================================== File Info ==================================
    public struct FileInfo {
        public let path: String
        public let exists: Bool
        public let sizeBytes: Int64
        public let mtime: Date?
    }
    /// UI 用：文件信息（路径/是否存在/大小/修改时间）
    public func fileInfo() -> FileInfo {
        let url = crashLogURL
        let path = url.path
        guard FileManager.default.fileExists(atPath: path) else {
            return FileInfo(path: path, exists: false, sizeBytes: 0, mtime: nil)
        }
        do {
            let attrs = try FileManager.default.attributesOfItem(atPath: path)
            let size = (attrs[.size] as? NSNumber)?.int64Value ?? 0
            let mtime = attrs[.modificationDate] as? Date
            return FileInfo(path: path, exists: true, sizeBytes: size, mtime: mtime)
        } catch {
            return FileInfo(path: path, exists: true, sizeBytes: 0, mtime: nil)
        }
    }
    // ================================== Ensure File ==================================
    /// 确保文件存在（不存在就创建空文件）
    @discardableResult
    public func ensureFileExists() -> Bool {
        let url = crashLogURL
        if FileManager.default.fileExists(atPath: url.path) { return true }
        do {
            try Data().write(to: url, options: .atomic)
            return true
        } catch {
            return false
        }
    }
    // ================================== Write (Async) ==================================
    /// 追加写入（业务日志推荐：异步写，顺序稳定）
    public func append(_ text: String) {
        guard !text.isEmpty else { return }
        ioQueue.async { [weak self] in
            guard let self else { return }
            _ = self.ensureFileExists()
            self.trimLogIfNeeded()
            self.writeSync(text)
        }
    }

    /// 日志只保留最近内容，防止诊断工具自身无限增长。
    private func trimLogIfNeeded() {
        let url = crashLogURL
        guard let attrs = try? FileManager.default.attributesOfItem(atPath: url.path),
              let number = attrs[.size] as? NSNumber,
              number.int64Value > maxLogBytes,
              let handle = try? FileHandle(forReadingFrom: url) else { return }
        defer {
            if #available(iOS 13.0, *) { try? handle.close() } else { handle.closeFile() }
        }
        let start = UInt64(max(0, number.int64Value - retainedLogBytes))
        if #available(iOS 13.4, *) {
            try? handle.seek(toOffset: start)
        } else {
            handle.seek(toFileOffset: start)
        }
        let tail: Data
        if #available(iOS 13.4, *) {
            tail = (try? handle.readToEnd()) ?? Data()
        } else {
            tail = handle.readDataToEndOfFile()
        }
        var data = Data("[LOG_ROTATED] time=\(Date()) retained=\(tail.count)bytes\n".utf8)
        data.append(tail)
        try? data.write(to: url, options: .atomic)
    }
    /// 给 crash handler 用：同步写入（落盘 + fsync）
    /// - 发生崩溃时，优先用这个（避免异步来不及写）
    public func writeCrashSync(_ text: String) {
        guard !text.isEmpty else { return }
        _ = ensureFileExists()
        writeSync(text)
    }
    /// POSIX 同步写（尽量在崩溃场景保留）
    private func writeSync(_ text: String) {
        let url = crashLogURL
        let line = text.hasSuffix("\n") ? text : (text + "\n")
        guard let data = line.data(using: .utf8) else { return }
        let path = url.path
        path.withCString { cPath in
            // O_APPEND：始终追加；0644：rw-r--r--
            let fd = open(cPath, O_CREAT | O_WRONLY | O_APPEND, 0o644)
            guard fd >= 0 else { return }
            data.withUnsafeBytes { raw in
                _ = Darwin.write(fd, raw.baseAddress, raw.count)
            }
            _ = fsync(fd)
            close(fd)
        }
    }
    // ================================== Read ==================================
    /// 读取整个文件（UI 展示用）
    public func readAll() -> String {
        let url = crashLogURL
        guard FileManager.default.fileExists(atPath: url.path) else { return "" }
        do {
            let data = try Data(contentsOf: url)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return "❌ readAll() 失败：\(error)"
        }
    }
    /// 读取最后 N KB（日志很大时更稳）
    public func readTail(kilobytes: Int = 256) -> String {
        let url = crashLogURL
        guard FileManager.default.fileExists(atPath: url.path) else { return "" }
        do {
            let fh = try FileHandle(forReadingFrom: url)
            defer {
                if #available(iOS 13.0, *) { try? fh.close() } else { fh.closeFile() }
            }
            let attr = try FileManager.default.attributesOfItem(atPath: url.path)
            let size = (attr[.size] as? NSNumber)?.int64Value ?? 0
            let tail = Int64(max(0, size - Int64(kilobytes) * 1024))
            if #available(iOS 13.4, *) {
                try fh.seek(toOffset: UInt64(tail))
                let data = try fh.readToEnd() ?? Data()
                return String(data: data, encoding: .utf8) ?? ""
            } else {
                fh.seek(toFileOffset: UInt64(tail))
                let data = fh.readDataToEndOfFile()
                return String(data: data, encoding: .utf8) ?? ""
            }
        } catch {
            return "❌ readTail() 失败：\(error)"
        }
    }
    // ================================== Clear ==================================
    @discardableResult
    public func clear() -> (Bool, String) {
        let url = crashLogURL
        guard FileManager.default.fileExists(atPath: url.path) else {
            return (true, "✅ 空文件（不存在）：\(url.path)")
        }
        do {
            try FileManager.default.removeItem(at: url)
            return (true, "✅ 已删除：\(url.path)")
        } catch {
            return (false, "❌ 清理失败：\(error)\n\(url.path)")
        }
    }
    // ================================== Debug Helper ==================================
    /// 给 CrashCatcher.installOnce() 打印用
    public func installedBanner() -> String {
        """
        log: \(logPathHint())

        ====== CrashCatcher Installed ======
        time: \(Date())
        log: \(logPathHint())
        didCrashLastRun: \(didCrashLastRun() ? "YES" : "NO")
        """
    }
}
// ================================== CrashCatcher ==================================
/// 崩溃捕获：Exception + signal + terminate
/// 重点：脱机/脱离 Xcode 也尽量能写到 jobs_crash.log
///
/// ✅ 修复你截图里的两个报错：
/// 1) terminate handler / signal handler 必须是 @convention(c) 且不能捕获上下文
/// 2) 不要用参数名 signal 覆盖 C 的 signal() 函数（用 signo / sig）
final class CrashCatcher {
    private static var installed = false
    // ================================== Install ==================================
    /// 必须尽早安装（App 启动时）
    static func installOnce() {
        guard !installed else { return }
        installed = true
        // 1) Uncaught Exception（Swift fatalError 不走这里）
        NSSetUncaughtExceptionHandler { exception in
            let msg = """
            \n==================== ❌ Uncaught NSException ====================
            time: \(Date())
            name: \(exception.name.rawValue)
            reason: \(exception.reason ?? "-")
            callStack:
            \(exception.callStackSymbols.joined(separator: "\n"))
            ===============================================================
            """
            CrashLogCenter.shared.writeCrashSync(msg)
        }
        // 2) signals
        jobs_installSignalHandlers()
        // 3) terminate
        // Swift runtime 的 terminate hook（_stdlib_get_terminate/_stdlib_set_terminate）在 iOS
        // 的部分环境/版本里可能不存在，直接链接会导致 Undefined symbols（你现在遇到的情况）。
        // 这里做平台隔离：
        // - macOS：安装 terminate handler
        // - iOS/tvOS：不安装（依赖 signal + NSException）
        #if os(macOS)
        jobs_installTerminateHandler()
        #endif
        // 4) 安装 banner（可选）
        CrashLogCenter.shared.writeCrashSync(CrashLogCenter.shared.installedBanner())
    }

    // ================================== Handlers ==================================
    fileprivate static func handleSignal(_ signo: Int32) {
        let name = jobs_signalName(signo)
        let msg = """
        \n==================== ❌ Signal Crash ====================
        time: \(Date())
        signal: \(signo) (\(name))
        ===============================================================
        """
        CrashLogCenter.shared.writeCrashSync(msg)
        // 还原默认处理并重新触发，让系统生成标准 crash（方便系统日志/三方平台抓）
        Darwin.signal(signo, SIG_DFL)
        raise(signo)
    }

    fileprivate static func handleTerminate() {
        let msg = """
        \n==================== ❌ terminate() ====================
        time: \(Date())
        ===============================================================
        """
        CrashLogCenter.shared.writeCrashSync(msg)
    }
}
// MARK: - Terminate handler (macOS only)
#if os(macOS)
/// terminate handler 需要存旧值，且不能捕获上下文
private var jobs_oldTerminate: (@convention(c) () -> Void)?

/// 不能捕获上下文的 terminate handler
private func jobs_terminate_handler() -> Void {
    CrashCatcher.handleTerminate()
    if let old = jobs_oldTerminate { old() }
}
/// 安装 terminate handler
private func jobs_installTerminateHandler() {
    jobs_oldTerminate = _stdlib_get_terminate()
    _stdlib_set_terminate(jobs_terminate_handler)
}
#endif
/// signal handler：必须 @convention(c)，不能捕获上下文
private func jobs_signal_handler(_ signo: Int32) -> Void {
    CrashCatcher.handleSignal(signo)
}
/// 安装 signal handlers
private func jobs_installSignalHandlers() {
    let signals: [Int32] = [
        SIGABRT, SIGILL, SIGSEGV, SIGFPE, SIGBUS, SIGPIPE
    ]
    for s in signals {
        Darwin.signal(s, jobs_signal_handler)
    }
}
/// 信号名（用于日志）
private func jobs_signalName(_ signo: Int32) -> String {
    switch signo {
    /// 处理 SIGABRT 分支
    case SIGABRT: return "SIGABRT"
    /// 处理 SIGILL 分支
    case SIGILL:  return "SIGILL"
    /// 处理 SIGSEGV 分支
    case SIGSEGV: return "SIGSEGV"
    /// 处理 SIGFPE 分支
    case SIGFPE:  return "SIGFPE"
    /// 处理 SIGBUS 分支
    case SIGBUS:  return "SIGBUS"
    /// 处理 SIGPIPE 分支
    case SIGPIPE: return "SIGPIPE"
    /// 未匹配已知分支时执行兜底处理
    default:      return "SIG(\(signo))"
    }
}
// ================================== Terminate Hook Helpers ==================================
#if os(macOS)
/// 这两个函数是 Swift runtime 的 terminate hook（为了让 terminate handler 可用）
/// 不建议你在别处使用，只服务 CrashCatcher
@_silgen_name("_stdlib_get_terminate")
private func _stdlib_get_terminate() -> @convention(c) () -> Void

@_silgen_name("_stdlib_set_terminate")
private func _stdlib_set_terminate(_ fn: @escaping @convention(c) () -> Void)
#endif
