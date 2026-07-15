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
    // 用本地集合记录“已 run / 已注册”
    private var startedEngines = Set<ObjectIdentifier>()
    private var registeredEngines = Set<ObjectIdentifier>()
    // MARK: - Setup（推荐在 App 启动时调用一次；但忘了也没关系，内部会兜底）
    public func setup(engine: FlutterEngine) {
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
        callbacks[requestId] = completion
        guard let flutterVC = makeFlutterVC(
            requestId: requestId,
            route: route,
            arguments: arguments,
            configure: configure
        ) else {
            callbacks.removeValue(forKey: requestId)
            assertionFailure("❌ FlutterBridge: makeFlutterVC failed")
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
        callbacks[requestId] = completion
        guard let flutterVC = makeFlutterVC(
            requestId: requestId,
            route: route,
            arguments: arguments,
            configure: configure
        ) else {
            callbacks.removeValue(forKey: requestId)
            assertionFailure("❌ FlutterBridge: makeFlutterVC failed")
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
        installChannelIfNeeded(engine)
        guard let channel else { return nil }
        let vc = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
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
        startedEngines.insert(key)
        return engine.run()
    }

    private func registerPluginsIfNeeded(_ engine: FlutterEngine) {
        let key = ObjectIdentifier(engine)
        if registeredEngines.contains(key) { return }
        registeredEngines.insert(key)
        GeneratedPluginRegistrant.register(with: engine)
    }

    private func installChannelIfNeeded(_ engine: FlutterEngine) {
        if channel != nil { return }
        let ch = FlutterMethodChannel(name: channelName, binaryMessenger: engine.binaryMessenger)
        channel = ch
        ch.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            switch call.method {
            case "result":
                let payload = (call.arguments as? Payload) ?? [:]
                let requestId = (payload["requestId"] as? String) ?? ""
                if let cb = self.callbacks.removeValue(forKey: requestId) {
                    cb(payload)
                }
                self.closeFlutterPage(requestId: requestId)
                result(true)
            case "close":
                let payload = (call.arguments as? Payload) ?? [:]
                let requestId = (payload["requestId"] as? String) ?? ""
                self.closeFlutterPage(requestId: requestId)
                result(true)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private func closeFlutterPage(requestId: String) {
        pendingOpenArgs.removeValue(forKey: requestId)
        let vc = vcBoxes[requestId]?.value
        // 注意：这里再清理，别提前清掉
        vcBoxes.removeValue(forKey: requestId)
        callbacks.removeValue(forKey: requestId)
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
        (arguments["requestId"] as? String) ?? UUID().uuidString
    }
}
// MARK: - WeakBox
private final class WeakBox<T: AnyObject> {
    weak var value: T?
    init(_ value: T?) { self.value = value }
}
