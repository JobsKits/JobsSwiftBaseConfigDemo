//
//  FlutterBridge.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftDSL

#if canImport(Flutter)
import Flutter
import FlutterPluginRegistrant
#endif

/// https://github.com/JobsKits/JobsDocs/blob/main/iOS相关的文档和资料.md/Swift ➤ Flutter.md/Swift ➤ Flutter.md
/// 需要安装Flutter环境
/// 必须进入Flutter目录中执行flutter pub get  生成中间产物podhelper.rb 才能跑通 pod install

@MainActor
public final class FlutterBridge {
    public static let shared = FlutterBridge()
    private init() {}
    // MARK: - Config
    private let channelName = "com.jobs/native_flutter"

    private var engine: FlutterEngine?
    private var channel: FlutterMethodChannel?

    public typealias Payload = [String: Any]
    public typealias Completion = (Payload) -> Void
    public typealias Configure = (FlutterViewController) -> Void

    private var callbacks: [String: Completion] = [:]
    private var vcBoxes: [String: WeakBox<FlutterViewController>] = [:]
    private var pendingOpenArgs: [String: Payload] = [:]
    private var timeouts: [String: DispatchWorkItem] = [:]
    private weak var channelEngine: FlutterEngine?
    public var resultTimeout: TimeInterval = 300
    // 用本地集合记录“已 run / 已注册”
    private var startedEngines = Set<ObjectIdentifier>()
    private var registeredEngines = Set<ObjectIdentifier>()
    // MARK: - Setup（推荐在 App 启动时调用一次；但忘了也没关系，内部会兜底）
    public func setup(engine: FlutterEngine) {
        if let current = self.engine, current !== engine {
            for id in Array(callbacks.keys) {
                finishSession(id, payload: ["requestId": id, "status": "cancelled", "reason": "engineReplaced"])
            }
            channel?.setMethodCallHandler(nil)
            channel = nil
            channelEngine = nil
        }
        self.engine = engine
        _ = runEngineIfNeeded(engine)
        registerPluginsIfNeeded(engine)
        installChannelIfNeeded(engine)
    }
    // MARK: - Present
    @discardableResult
    public func presentFlutter(
        from host: UIResponder?,
        route: String = "/page",
        arguments: Payload = [:],
        animated: Bool = true,
        policy: JobsPresentPolicy = .ignoreIfBusy,
        configure: Configure? = nil,
        completion: @escaping Completion
    ) -> String {
        let requestId = normalizedRequestId(from: arguments)
        guard callbacks[requestId] == nil else {
            completion(["requestId": requestId, "status": "error", "reason": "duplicateRequestId"])
            return requestId
        }
        callbacks[requestId] = completion
        installTimeout(for: requestId)
        guard let flutterVC = makeFlutterVC(
            requestId: requestId,
            route: route,
            arguments: arguments,
            configure: configure
        ) else {
            finishSession(requestId, payload: ["requestId": requestId, "status": "error", "reason": "engineUnavailable"])
            return requestId
        }
        DispatchQueue.main.async {
            flutterVC.byPresent(host, animated: animated, policy: policy, jobsByVoidBlock: nil)
        };return requestId
    }
    // MARK: - Push
    @discardableResult
    func pushFlutter(
        from host: UIResponder?,
        route: String = "/page",
        arguments: Payload = [:],
        duration: CFTimeInterval = 0.32,
        timing: CAMediaTimingFunctionName = .easeInEaseOut,
        configure: Configure? = nil,
        completion: @escaping Completion
    ) -> String {
        let requestId = normalizedRequestId(from: arguments)
        guard callbacks[requestId] == nil else {
            completion(["requestId": requestId, "status": "error", "reason": "duplicateRequestId"])
            return requestId
        }
        callbacks[requestId] = completion
        installTimeout(for: requestId)
        guard let flutterVC = makeFlutterVC(
            requestId: requestId,
            route: route,
            arguments: arguments,
            configure: configure
        ) else {
            finishSession(requestId, payload: ["requestId": requestId, "status": "error", "reason": "engineUnavailable"])
            return requestId
        }
        DispatchQueue.main.async {
            flutterVC.byPush(host, duration: duration, timing: timing)
        };return requestId
    }

    // MARK: - Private
    private func makeFlutterVC(
        requestId: String,
        route: String,
        arguments: Payload,
        configure: Configure?
    ) -> FlutterViewController? {
        let engine = ensureEngineReady()
        guard runEngineIfNeeded(engine) else { return nil }
        installChannelIfNeeded(engine)
        guard let channel else { return nil }
        guard engine.viewController == nil else { return nil }
        let vc = JobsManagedFlutterViewController(engine: engine, nibName: nil, bundle: nil)
        vc.onNativeClose = { [weak self] in
            self?.finishSession(requestId, payload: ["requestId": requestId, "status": "cancelled", "reason": "nativeDismissed"])
        }
        configure?(vc)
        vcBoxes[requestId] = WeakBox(vc)
        var args = arguments
        args["route"] = route
        args["requestId"] = requestId
        pendingOpenArgs[requestId] = args
        // ✅ 等真正显示后再发 open（时序稳）
        _ = vc.byCompletion { [weak self] in
            guard let self else { return }
            guard let openArgs = self.pendingOpenArgs.removeValue(forKey: requestId) else { return }
            channel.invokeMethod("open", arguments: openArgs)
        };return vc
    }

    private func ensureEngineReady() -> FlutterEngine {
        if let e = engine {
            _ = runEngineIfNeeded(e)
            registerPluginsIfNeeded(e)
            return e
        }
        let e = FlutterEngine(name: "jobs_flutter_engine.auto")
        _ = runEngineIfNeeded(e)
        registerPluginsIfNeeded(e)
        engine = e
        return e
    }

    @discardableResult
    private func runEngineIfNeeded(_ engine: FlutterEngine) -> Bool {
        let key = ObjectIdentifier(engine)
        if startedEngines.contains(key) { return true }
        let started = engine.run()
        if started { startedEngines.insert(key) }
        return started
    }

    private func registerPluginsIfNeeded(_ engine: FlutterEngine) {
        let key = ObjectIdentifier(engine)
        if registeredEngines.contains(key) { return }
        registeredEngines.insert(key)
        GeneratedPluginRegistrant.register(with: engine)
    }

    private func installChannelIfNeeded(_ engine: FlutterEngine) {
        if channel != nil, channelEngine === engine { return }
        channel?.setMethodCallHandler(nil)
        channelEngine = engine
        let ch = FlutterMethodChannel(name: channelName, binaryMessenger: engine.binaryMessenger)
        channel = ch
        ch.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            switch call.method {
            /// 处理 "result" 分支
            case "result":
                let payload = (call.arguments as? Payload) ?? [:]
                let requestId = (payload["requestId"] as? String) ?? ""
                self.finishSession(requestId, payload: payload)
                result(true)
            /// 处理 "close" 分支
            case "close":
                let payload = (call.arguments as? Payload) ?? [:]
                let requestId = (payload["requestId"] as? String) ?? ""
                self.finishSession(requestId, payload: ["requestId": requestId, "status": "cancelled", "reason": "flutterClosed"])
                result(true)
            /// 未匹配已知分支时执行兜底处理
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private func installTimeout(for requestId: String) {
        let timeout = resultTimeout.isFinite ? max(1, min(86_400, resultTimeout)) : 300
        let work = DispatchWorkItem { [weak self] in
            self?.finishSession(requestId, payload: ["requestId": requestId, "status": "error", "reason": "timeout"])
        }
        timeouts[requestId] = work
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout, execute: work)
    }

    private func finishSession(_ requestId: String, payload: Payload) {
        guard let completion = callbacks.removeValue(forKey: requestId) else { return }
        timeouts.removeValue(forKey: requestId)?.cancel()
        closeFlutterPage(requestId: requestId)
        completion(payload)
    }

    private func closeFlutterPage(requestId: String) {
        pendingOpenArgs.removeValue(forKey: requestId)
        let vc = vcBoxes[requestId]?.value
        // 注意：这里再清理，别提前清掉
        vcBoxes.removeValue(forKey: requestId)
        guard let vc else { return }
        // present 场景
        if vc.presentingViewController != nil {
            vc.dismiss(animated: true)
            return
        }
        // push 场景 / byPush 包了一层 nav 再 present 的场景
        if let nav = vc.navigationController {
            if nav.presentingViewController != nil {
                nav.dismiss(animated: true)
            } else {
                nav.popViewController(animated: true)
            };return
        }
        vc.dismiss(animated: true)
    }

    private func normalizedRequestId(from arguments: Payload) -> String {
        let value = (arguments["requestId"] as? String)?.trimmingCharacters(in: .whitespacesAndNewlines)
        return value?.isEmpty == false ? value! : UUID().uuidString
    }
}
private final class JobsManagedFlutterViewController: FlutterViewController {
    var onNativeClose: (() -> Void)?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || isMovingFromParent || navigationController?.isBeingDismissed == true
            || (presentingViewController == nil && parent == nil && presentedViewController == nil) {
            let callback = onNativeClose
            onNativeClose = nil
            callback?()
        }
    }
}

// MARK: - WeakBox
private final class WeakBox<T: AnyObject> {
    weak var value: T?
    init(_ value: T?) { self.value = value }
}
