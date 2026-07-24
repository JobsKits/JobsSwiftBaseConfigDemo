//
//  UnityManager.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftDSL
import JobsSwiftTimer

#if !targetEnvironment(simulator)
// ⚠️ UnityFramework 的头文件请放在 Bridging-Header 里：
// #import "UnityFramework/UnityFramework.h"
// 这里就不用 `import UnityFramework` 了
/// 统一管理 Unity 的加载 / 展示 / 关闭
final class UnityManager: NSObject {
    private enum RuntimeState {
        case idle
        case starting
        case running
        case unloading
    }
    static let shared = UnityManager()
    /// 当前 UnityFramework 实例（运行中才有）
    private var ufw: UnityFramework?
    /// Unity Runtime 当前生命周期状态，避免启动和卸载流程互相重入。
    private var runtimeState: RuntimeState = .idle
    /// `unloadApplication` 后必须再次调用 `runEmbedded` 恢复 scene-less 状态。
    private var needsRunEmbedded = true
    /// `quitApplication` 后 Unity 官方不支持在同一进程再次启动。
    private var didQuitPermanently = false
    /// Unity 是否正在跑游戏循环
    var isRunning: Bool {
        runtimeState == .running
    }
    /// 宿主 App 的窗口（Unity 启动前的 keyWindow）
    private weak var hostWindow: UIWindow?
    /// Unity 自己的窗口（UnityAppController.window）
    private weak var unityWindow: UIWindow?
    /// 自动关闭用的定时器
    private var autoCloseTimer: JobsSwiftTimerProtocol?
    /// Unity Runtime 必须从宿主 App 的 Data 目录读取启动配置。
    private var unityBootConfigPath: String {
        Bundle.main.bundlePath + "/Data/boot.config"
    }
    private override init() {
        super.init()
    }
    // MARK: - 内部：加载 & 启动 Unity
    /// 确保拿到一个可用的 UnityFramework 实例
    @discardableResult
    private func loadUnityFramework() -> UnityFramework? {
        assert(Thread.isMainThread, "Unity Runtime 必须在主线程加载。")
        guard !didQuitPermanently else {
            print("❌ Unity 已完全退出，本次 App 进程内不能再次启动。")
            return nil
        }
        // 已经有实例了就复用
        if let ufw = self.ufw {
            // 补一下 window 引用（防止外面先拿）
            if unityWindow == nil {
                unityWindow = ufw.appController()?.window
            };return ufw
        }
        // 记录 Unity 接管前的宿主窗口
        if hostWindow == nil {
            hostWindow = UIApplication.jobsKeyWindow()
        }
        guard FileManager.default.fileExists(atPath: unityBootConfigPath) else {
            print("❌ Unity Data 未嵌入宿主 App，缺少: \(unityBootConfigPath)")
            return nil
        }
        // 1. 找到 .app/Frameworks/UnityFramework.framework
        let frameworkPath = Bundle.main.bundlePath + "/Frameworks/UnityFramework.framework"
        guard let bundle = Bundle(path: frameworkPath) else {
            print("❌ 找不到 UnityFramework.framework，路径: \(frameworkPath)")
            return nil
        }
        if !bundle.isLoaded, !bundle.load() {
            print("❌ UnityFramework.framework 加载失败，路径: \(frameworkPath)")
            return nil
        }
        // 2. 拿主类实例
        guard
            let cls = bundle.principalClass as? UnityFramework.Type,
            let ufw = cls.getInstance()
        else {
            print("❌ 无法拿到 UnityFramework 实例")
            return nil
        }
        // 3. 首次启动或 unload 后恢复 Unity Runtime
        ufw.register(self)
        if needsRunEmbedded || ufw.appController() == nil {
            // Unity 官方要求在 runEmbedded 前传入宿主 Mach-O Header。
            JobsUnitySetExecuteHeader(ufw)
            // 用宿主 App 的 Data 目录
            if let bundleId = Bundle.main.bundleIdentifier {
                ufw.setDataBundleId(bundleId)
            }
            let argc = Int32(CommandLine.argc)
            let argv = CommandLine.unsafeArgv
            ufw.runEmbedded(
                withArgc: argc,
                argv: argv,
                appLaunchOpts: nil
            )
            needsRunEmbedded = false
        }
        // 4. 缓存 Unity 引用
        self.ufw = ufw
        self.unityWindow = ufw.appController()?.window
        return ufw
    }
    // MARK: - 对外：显示 / 关闭 Unity（全屏）
    /// 启动 / 显示 Unity。
    /// - Parameters:
    ///   - autoCloseAfter: 多少秒之后自动关闭（nil 或 <=0 表示不自动关）
    ///   - unloadOnClose: `true` 回收大部分内存；`false` 暂停并隐藏，避免下次重复启动。
    func showUnity(
        autoCloseAfter seconds: TimeInterval? = nil,
        unloadOnClose: Bool = true
    ) {
        assert(Thread.isMainThread, "Unity Runtime 必须在主线程展示。")
        guard runtimeState != .starting, runtimeState != .unloading else {
            print("⚠️ Unity 正在启动或卸载，已忽略重复展示请求。")
            return
        }
        if let keyWindow = UIApplication.jobsKeyWindow(),
           keyWindow !== unityWindow {
            hostWindow = keyWindow
        }
        runtimeState = .starting
        guard let ufw = loadUnityFramework() else {
            runtimeState = .idle
            return
        }
        ufw.pause(false)
        ufw.showUnityWindow()
        unityWindow = ufw.appController()?.window
        runtimeState = .running
        setupAutoCloseTimer(after: seconds, unloadOnClose: unloadOnClose)
    }
    /// 方便保持之前的调用写法：from 参数实际上可以忽略
    func showUnity(
        from _: UIViewController,
        autoCloseAfter seconds: TimeInterval? = nil,
        unloadOnClose: Bool = true
    ) {
        showUnity(autoCloseAfter: seconds, unloadOnClose: unloadOnClose)
    }
    /// 仅隐藏 Unity 的窗口，不卸载引擎（下次可以秒开）
    func hideUnity() {
        assert(Thread.isMainThread, "Unity Runtime 必须在主线程隐藏。")
        guard runtimeState != .unloading else { return }
        autoCloseTimer?.stop()
        autoCloseTimer = nil
        ufw?.pause(true)
        unityWindow?.byHidden(true)
        hostWindow?.makeKeyAndVisible()
        runtimeState = .idle
    }
    /// 触发 Unity 的卸载流程（真正释放在 `unityDidUnload` 里完成）
    func unloadUnity() {
        assert(Thread.isMainThread, "Unity Runtime 必须在主线程卸载。")
        autoCloseTimer?.stop()
        autoCloseTimer = nil
        guard runtimeState != .unloading else { return }
        guard let ufw else {
            runtimeState = .idle
            return
        }
        runtimeState = .unloading
        ufw.unloadApplication()  // 异步，结束后会回调 unityDidUnload
    }
    // MARK: - JobsTimer 自动关闭
    private func setupAutoCloseTimer(
        after seconds: TimeInterval?,
        unloadOnClose: Bool
    ) {
        autoCloseTimer?.stop()
        autoCloseTimer = nil
        guard let seconds, seconds > 0 else { return }
        let config = JobsSwiftTimerConfig(
            interval: seconds,
            repeats: false,
            tolerance: 0.01,
            queue: .main
        )
        // 可以按需换成 .gcd / .displayLink / .runLoopCore
        let timer: JobsSwiftTimerProtocol = JobsTimer(
            kind: .foundation,
            config: config
        ) { [weak self] in
            Task { @MainActor [weak self] in
                guard let self else { return }
                if unloadOnClose {
                    self.unloadUnity()
                } else {
                    self.hideUnity()
                }
            }
        }
        autoCloseTimer = timer
        timer.start()
    }
    // MARK: - 兼容之前的 API（名字不改，内部用全屏）
    /// 以前的“嵌入容器”接口，现在其实就是全屏 Unity + 自动关闭
    func attachUnity(
        into _: UIView,
        from host: UIViewController,
        autoCloseAfter seconds: TimeInterval? = nil,
        unloadOnClose: Bool = true
    ) {
        showUnity(from: host, autoCloseAfter: seconds, unloadOnClose: unloadOnClose)
    }
    /// 以前的 detach 接口：根据需要选择只隐藏还是卸载
    func detachUnity(
        from _: UIViewController,
        unload: Bool = true
    ) {
        if unload {
            unloadUnity()
        } else {
            hideUnity()
        }
    }
}
// MARK: - UnityFrameworkListener
extension UnityManager: UnityFrameworkListener {
    /// Unity 调用了 unloadApplication 之后会回调这里
    func unityDidUnload(_ notification: Notification!) {
        finishUnityTeardown(message: "✅ Unity did unload", canRestart: true)
    }

    func unityDidQuit(_ notification: Notification!) {
        finishUnityTeardown(message: "✅ Unity did quit", canRestart: false)
    }

    private func finishUnityTeardown(message: String, canRestart: Bool) {
        if !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                self?.finishUnityTeardown(message: message, canRestart: canRestart)
            };return
        }
        print(message)
        autoCloseTimer?.stop()
        autoCloseTimer = nil
        if let ufw = ufw {
            ufw.unregisterFrameworkListener(self)
        }
        ufw = nil
        unityWindow = nil
        needsRunEmbedded = canRestart
        didQuitPermanently = !canRestart
        runtimeState = .idle
        // 卸载完 Unity 后把宿主窗口顶回来
        hostWindow?.makeKeyAndVisible()
    }
}
#else
/// 模拟器空壳：保证编译通过（不依赖 UnityFramework）
final class UnityManager: NSObject {
    static let shared = UnityManager()
    private override init() { super.init() }

    private(set) var isRunning = false

    func showUnity(autoCloseAfter _: TimeInterval? = nil, unloadOnClose _: Bool = true) {
        print("⚠️ Unity 不支持模拟器，已跳过。")
    }

    func showUnity(from _: UIViewController, autoCloseAfter _: TimeInterval? = nil, unloadOnClose _: Bool = true) {
        print("⚠️ Unity 不支持模拟器，已跳过。")
    }

    func hideUnity() {}
    func unloadUnity() {}

    func attachUnity(into _: UIView, from _: UIViewController, autoCloseAfter _: TimeInterval? = nil, unloadOnClose _: Bool = true) {}
    func detachUnity(from _: UIViewController, unload _: Bool = true) {}
}

#endif
