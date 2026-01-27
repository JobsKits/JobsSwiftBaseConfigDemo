//
//  BaseWebView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Mac on 10/20/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

#if canImport(UniformTypeIdentifiers)
import UniformTypeIdentifiers // iOS 14+
#endif

import WebKit
import SafariServices
import SnapKit
import JobsNavBar
import JobsSwiftBlock
import JobsSwiftBaseDefines
/**
 在 Info.plist 添加👇（更通用的 ATS 配置，避免为某域名单独开洞）
     <key>NSAppTransportSecurity</key>
     <dict>
       <!-- 仅放开 Web 内容，其他网络请求仍受 ATS 约束 -->
       <key>NSAllowsArbitraryLoadsInWebContent</key><true/>
     </dict>
 */
/// 任意 JSON 解码容器（备用）
public struct AnyDecodable: Decodable {
    public let value: Any
    public init(from decoder: Decoder) throws {
        let c = try decoder.singleValueContainer()
        if c.decodeNil() { value = NSNull() }
        else if let v = try? c.decode(Bool.self)   { value = v }
        else if let v = try? c.decode(Int.self)    { value = v }
        else if let v = try? c.decode(Double.self) { value = v }
        else if let v = try? c.decode(String.self) { value = v }
        else if let v = try? c.decode([AnyDecodable].self) { value = v.map { $0.value } }
        else if let v = try? c.decode([String: AnyDecodable].self) { value = v.mapValues { $0.value } }
        else { throw DecodingError.dataCorruptedError(in: c, debugDescription: "Unsupported JSON") }
    }
}
/// iOS < 14 的弱代理封装
final class WeakScriptMessageHandler: NSObject, WKScriptMessageHandler {
    weak var target: WKScriptMessageHandler?
    init(target: WKScriptMessageHandler) { self.target = target }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        target?.userContentController(userContentController, didReceive: message)
    }
}
/// iOS 14+：同时支持无回调与 withReply 的弱转发器，打断 UCC→handler 闭环
@available(iOS 14.0, *)
private final class WeakScriptMessageHandlerWithReply: NSObject, WKScriptMessageHandler, WKScriptMessageHandlerWithReply {
    weak var target: (WKScriptMessageHandler & WKScriptMessageHandlerWithReply)?
    init(target: (WKScriptMessageHandler & WKScriptMessageHandlerWithReply)) { self.target = target }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        target?.userContentController(userContentController, didReceive: message)
    }
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage,
                               replyHandler: @escaping jobsByAnyStringBlock) {
        target?.userContentController(userContentController, didReceive: message, replyHandler: replyHandler)
    }
}
/// 用 keyPath 显式取系统的 name，规避工程里可能的同名扩展
private typealias WKSM = WebKit.WKScriptMessage
private extension WKSM { var jobsChannel: String { self[keyPath: \WKSM.name] } }
public class BaseWebView: UIView {
    // ===== 基础配置项（完全通用，无业务常量） =====
    public var allowedHosts: Set<String> = []                         // 空 = 不限制
    public var externalSchemes: Set<String> = [
        "tel",
        "mailto",
        "sms",
        "facetime",
        "itms-apps",
        "maps",
        "weixin",
        "alipays",
        "alipay",
        "mqqapi",
        "line"
    ]
    public var openBlankInPlace: Bool = true
    public var disableSelectionAndCallout: Bool = false
    public var injectDarkStylePatch: Bool = false
    public var isInspectableEnabled: Bool = true
    private var uaSuffixProvider: JobsRetStringByURLRequestBlock?
    private var lastAppliedUASuffix: String?
    private func normalizeSuffix(_ s: String?) -> String? {
        guard let t = s?.trimmingCharacters(in: .whitespacesAndNewlines), !t.isEmpty else { return nil }
        return t
    }
    /// URL 重写器：返回新的 URL 表示重写；返回 nil 表示不重写（默认 nil）
    public var urlRewriter: ((URL) -> URL?)?
    /// Safari 兜底规则：返回 true 时交给 Safari 打开（默认 nil）
    public var safariFallbackRule: ((URL) -> Bool)?
    /// 循环重写保护
    public var rewriteBurstWindow: TimeInterval = 3
    public var rewriteBurstLimit: Int = 3
    private var rewriteCount = 0
    private var lastRewriteAt = Date.distantPast
    // ===== 固定无缓存策略开关（写死：始终开启）=====
    private static let noCacheHeader = "X-Jobs-NoCache"
    private let alwaysFreshMainDocument = true
    // ===== 通用 MobileBridge（H5 的 iOSBridge 约定）=====
    public struct MobileBridgeConfig {
        public var injectShim: Bool = true                             // 无前端桥时的兜底
        public var tokenProvider: (@Sendable () async -> String?)?     // 异步 token
        public var onNavigateHome:    (jobsByVoidBlock)? = nil
        public var onNavigateLogin:   (jobsByVoidBlock)? = nil
        public var onNavigateDeposit: (jobsByVoidBlock)? = nil
        public var onCloseWebView:    (jobsByVoidBlock)? = nil
        public var onShowToast:       ((String) -> Void)? = nil
        public var onUnknownAction: ((String, [String: Any]) -> Void)? = nil
        public init() {}
        public static func defaults() -> Self { .init() }
    }
    private let mobileBridgeName = "iOSBridge"
    private var mobileActionHandlers: [String: MobileActionBlock] = [:]
    private var mobileConfig: MobileBridgeConfig = .defaults()
    /// 宿主 VC（弱引用）+ 统一取用口，避免 VC↔view 闭环
    public weak var presenter: UIViewController?
    private var presentingVC: UIViewController? {
        presenter ?? nearestViewController() ?? UIApplication.jobsTopMostVC()
    }
    /// UI / 状态
    private lazy var webView: WKWebView = {
        // ✅ 关键：强制使用非持久数据仓库（每个 BaseWebView 实例都是全新 session，零共享 Cookie/缓存）
        let cfg = WKWebViewConfiguration()
        cfg.websiteDataStore = .nonPersistent()
        cfg.allowsInlineMediaPlayback = true

        let ucc = WKUserContentController()
        ucc.addUserScript(Self.makeBridgeUserScript())
        if #available(iOS 14.0, *) {
            // contentWorld 由 addScriptMessageHandler 时再设置
        }
        cfg.userContentController = ucc

        let w = WKWebView(frame: .zero, configuration: cfg)
        return w
    }()
    public private(set) var progressView = UIProgressView(progressViewStyle: .default)
    private var handlers: [String: NativeBlock] = [:]
    private let bridgeName = "bridge"
    private let consoleName = "console"
    private var kvoEstimatedProgress: NSKeyValueObservation?
    private var kvoTitle: NSKeyValueObservation?
    private var progressTopConstraint: Constraint?

    private lazy var refresher: UIRefreshControl = {
        let r = UIRefreshControl()
        r.onJobsChange { [weak self] (_: UIRefreshControl) in
            guard let self = self else { return }
            self.handlePullToRefresh()
        }
        return r
    }()
    /// 强引用 DocumentPicker 代理，避免立刻释放
    private var docPickerDelegate: DocumentPickerDelegateProxy?
    // ===== 初始化 =====
    @MainActor
    public override init(frame: CGRect) {
        super.init(frame: frame)
        webView.byVisible(true)
        registerMessageHandlers()
        setupUI()
        setupKVO()
        applyRuntimeToggles()
        // 默认启用通用 MobileBridge（零配置可用）
        _ = useMobileBridge()
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    // —— 学院派：deinit 非隔离；同步跳主线程做清理（无 Task、无 weak self）——
    deinit {
        if Thread.isMainThread {
            _cleanupNow()
        } else {
            DispatchQueue.main.sync { _cleanupNow() }
        }
    }
    // 非隔离私有清理；但我们**只在主线程**调用它（上面已确保）
    private func _cleanupNow() {
        webView.navigationDelegate = nil
        webView.uiDelegate = nil

        let ucc = webView.configuration.userContentController
        ucc.removeAllUserScripts()
        ucc.removeScriptMessageHandler(forName: bridgeName)
        ucc.removeScriptMessageHandler(forName: consoleName)
        ucc.removeScriptMessageHandler(forName: mobileBridgeName)

        kvoEstimatedProgress?.invalidate()
        kvoTitle?.invalidate()
    }
    // MARK: - 内部装配
    @MainActor
    private func registerMessageHandlers() {
        let ucc = webView.configuration.userContentController
        if #available(iOS 14.0, *) {
            let weakH = WeakScriptMessageHandlerWithReply(target: self)
            ucc.addScriptMessageHandler(weakH, contentWorld: .page, name: bridgeName)
            ucc.addScriptMessageHandler(weakH, contentWorld: .page, name: consoleName)
            ucc.addScriptMessageHandler(weakH, contentWorld: .page, name: mobileBridgeName)
        } else {
            ucc.add(WeakScriptMessageHandler(target: self), name: bridgeName)
            ucc.add(WeakScriptMessageHandler(target: self), name: consoleName)
            ucc.add(WeakScriptMessageHandler(target: self), name: mobileBridgeName)
        }
    }
    @MainActor
    private func setupUI() {
        backgroundColor = .clear

        addSubview(progressView)
        addSubview(webView)

        progressView.snp.makeConstraints { make in
            progressTopConstraint = make.top.equalToSuperview().constraint
            make.leading.trailing.equalToSuperview()
        }
        webView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        webView.navigationDelegate = self
        webView.uiDelegate = self

        webView.scrollView.alwaysBounceVertical = true
        webView.scrollView.refreshControl = refresher

        if #available(iOS 16.4, *), isInspectableEnabled { webView.isInspectable = true }
        webView.customUserAgent = nil
        webView.configuration.applicationNameForUserAgent = nil
        lastAppliedUASuffix = nil
    }
    @MainActor
    private func setupKVO() {
        kvoEstimatedProgress = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] _, change in
            guard let p = change.newValue else { return }
            guard let self = self else { return }
            jobsRunOnMain(self) { s in
                s.progressView.isHidden = p >= 1.0
                s.progressView.setProgress(Float(p), animated: true)
                if p >= 1.0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak s] in
                        s?.progressView.progress = 0
                    }
                }
            }
        };kvoTitle = webView.observe(\.title, options: [.new]) { _, _ in }
    }
    @MainActor
    private func applyRuntimeToggles() {
        if injectDarkStylePatch { injectDarkCSS() }
        setSelectionDisabled(disableSelectionAndCallout)
    }

    private func nearestViewController() -> UIViewController? {
        var r: UIResponder? = self
        while let n = r?.next {
            if let vc = n as? UIViewController { return vc }
            r = n
        };return nil
    }
    // ===== Public API =====
    @discardableResult @MainActor
    public func loadBy(_ url: URL) -> Self {
        if url.isFileURL {
            let readAccess = url.deletingLastPathComponent()
            webView.loadFileURL(url, allowingReadAccessTo: readAccess)
        } else {
            let req = URLRequest(url: url)
            webView.load(makeNoCache(req))
        };return self
    }
    @discardableResult @MainActor
    public func loadBy(_ urlString: String) -> Self {
        if let url = URL(string: urlString) {
            let req = URLRequest(url: url)
            webView.load(makeNoCache(req))
        };return self
    }
    @discardableResult @MainActor
    public func loadBy(_ url: URL,
                       cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
                       timeout: TimeInterval = 60) -> Self {
        // ⚠️ 对外签名保留，但内部一律走无缓存策略（忽略传入的 cachePolicy）
        var req = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        req = makeNoCache(req)
        webView.load(req)
        return self
    }
    @discardableResult @MainActor
    public func loadBy(_ request: URLRequest) -> Self {
        webView.load(makeNoCache(request))
        return self
    }
    @discardableResult @MainActor
    public func loadHTMLBy(_ html: String, baseURL: URL? = nil) -> Self {
        webView.loadHTMLString(html, baseURL: baseURL)
        return self
    }
    /// 加载 App Bundle 内的本地 HTML 文件（链式）
    @discardableResult @MainActor
    public func loadBundleHTMLBy(named name: String,
                                 in subdirectory: String? = nil,
                                 bundle: Bundle = .main) -> Self {
        if let url = bundle.url(forResource: name, withExtension: "html", subdirectory: subdirectory) {
            return loadBy(url)
        }
        if let urls = bundle.urls(forResourcesWithExtension: "html", subdirectory: nil),
           let url = urls.first(where: { $0.lastPathComponent == "\(name).html" }) {
            return loadBy(url)
        }
        assertionFailure("HTML '\(name).html' not found in bundle")
        return self
    }

    public func on(_ name: String, handler: @escaping NativeBlock) { handlers[name] = handler }
    public func off(_ name: String) { handlers.removeValue(forKey: name) }
    @MainActor
    public func emitEvent(_ name: String, payload: Any?) {
        let js = "window.Native && window.Native.emit(\(Self.quote(name)), \(Self.toJSONLiteral(payload)));"
        webView.jobsEval(js)
    }
    @MainActor
    public func callJS(function: String,
                       args: [Any] = [],
                       completion: JobsByAnyErrMASendableBlock? = nil) {
        let jsArgs = args.map(Self.toJSONLiteral).joined(separator: ",")
        webView.jobsEval("\(function)(\(jsArgs));", completion: completion)
    }
    // MARK: - JS eval（Raw + Decodable）
    @available(iOS 13.0, *)
    public func evalAsyncRaw(_ js: String, timeout: TimeInterval = 8) async throws -> Any? {
        try await withThrowingTaskGroup(of: Any?.self) { group in
            group.addTask { [weak webView] in
                guard let webView else {
                    throw NSError(domain: "BaseWebView", code: -10,
                                  userInfo: [NSLocalizedDescriptionKey: "deallocated"])
                }
                if #available(iOS 15.0, *) {
                    return try await webView.evaluateJavaScript(js)
                } else {
                    return try await withCheckedThrowingContinuation { cont in
                        Task { @MainActor [weak webView] in
                            guard let webView else {
                                cont.resume(throwing: NSError(domain: "BaseWebView", code: -10,
                                                              userInfo: [NSLocalizedDescriptionKey: "deallocated"]))
                                return
                            }
                            webView.jobsEval(js) { res, err in
                                if let err { cont.resume(throwing: err) }
                                else { cont.resume(returning: res) }
                            }
                        }
                    }
                }
            }
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(timeout * 1e9))
                throw NSError(domain: "BaseWebView", code: -1,
                              userInfo: [NSLocalizedDescriptionKey: "JS eval timeout"])
            }
            let v = try await group.next()!!
            group.cancelAll()
            return v
        }
    }

    @available(iOS 13.0, *)
    public func evalAsync<T: Decodable>(_ js: String,
                                        as type: T.Type = T.self,
                                        timeout: TimeInterval = 8,
                                        decoder: JSONDecoder = JSONDecoder()) async throws -> T {
        let raw = try await evalAsyncRaw(js, timeout: timeout)
        return try Self.decodeJSResult(raw, as: T.self, decoder: decoder)
    }
    @MainActor
    public func setCookies(_ cookies: [HTTPCookie], completion: (jobsByVoidBlock)? = nil) {
        let store = webView.configuration.websiteDataStore.httpCookieStore
        let group = DispatchGroup()
        cookies.forEach { c in group.enter(); store.setCookie(c) { group.leave() } }
        group.notify(queue: .main) { completion?() }
    }
    @MainActor
    public func setSelectionDisabled(_ disabled: Bool) {
        disableSelectionAndCallout = disabled
        let js = """
        (function(){
          var el = document.documentElement;
          el.style.webkitUserSelect=\(disabled ? "'none'" : "''");
          el.style.webkitTouchCallout=\(disabled ? "'none'" : "''");
        })();
        """
        webView.jobsEval(js)
    }
    // ===== MobileBridge：对外 API =====
    @discardableResult @MainActor
    public func useMobileBridge(_ cfg: MobileBridgeConfig = .defaults()) -> Self {
        self.mobileConfig = cfg
        if cfg.injectShim { injectMinimalMobileShim() }
        return self
    }
    @discardableResult
    public func registerMobileAction(_ name: String, _ handler: @escaping MobileActionBlock) -> Self {
        mobileActionHandlers[name] = handler
        return self
    }
    @discardableResult
    public func unregisterMobileAction(_ name: String) -> Self {
        mobileActionHandlers.removeValue(forKey: name)
        return self
    }
}
// MARK: - MobileBridgeConfig · 链式 DSL
public extension BaseWebView.MobileBridgeConfig {
    @discardableResult
    func byInjectShim(_ on: Bool = true) -> Self {
        var c = self; c.injectShim = on; return c
    }
    @discardableResult
    func byTokenProvider(_ f: (@Sendable () async -> String?)?) -> Self {
        var c = self; c.tokenProvider = f; return c
    }
    @discardableResult
    func byShowToast(_ f: @escaping (String) -> Void) -> Self {
        var c = self; c.onShowToast = f; return c
    }
    @discardableResult
    func byNavigateHome(_ f: @escaping jobsByVoidBlock) -> Self {
        var c = self; c.onNavigateHome = f; return c
    }
    @discardableResult
    func byNavigateLogin(_ f: @escaping jobsByVoidBlock) -> Self {
        var c = self; c.onNavigateLogin = f; return c
    }
    @discardableResult
    func byNavigateDeposit(_ f: @escaping jobsByVoidBlock) -> Self {
        var c = self; c.onNavigateDeposit = f; return c
    }
    @discardableResult
    func byCloseWebView(_ f: @escaping jobsByVoidBlock) -> Self {
        var c = self; c.onCloseWebView = f; return c
    }
    @discardableResult
    func byUnknownAction(_ f: @escaping (String, [String: Any]) -> Void) -> Self {
        var c = self; c.onUnknownAction = f; return c
    }
}
// MARK: - useMobileBridge · 闭包构造重载（纯 DSL）
public extension BaseWebView {
    /// 允许：web.useMobileBridge { $0.byTokenProvider{...}.byShowToast{...} }
    @discardableResult @MainActor
    func useMobileBridgeBy(_ build: (MobileBridgeConfig) -> MobileBridgeConfig) -> Self {
        let cfg = build(.defaults())
        return useMobileBridge(cfg)
    }
}
// ===== WK Script Bridge =====
public extension BaseWebView {
    private static func makeBridgeUserScript() -> WKUserScript {
        let js = """
        (function() {
          if (window.Native) return;
          const _callbacks = {};
          let _seq = 0;

          window.__nativeReturn = function(id, value) {
            const cb = _callbacks[id];
            if (cb) { delete _callbacks[id]; try { cb(value); } catch(e) { console.error(e); } }
          };

          function _post(name, payload) {
            try { window.webkit.messageHandlers.bridge.postMessage({ name:name, payload:payload ?? null }); }
            catch(e){ console.error('bridge.post failed', e); }
          }
          function _call(name, payload) {
            const id = ++_seq;
            try {
              return new Promise(function(resolve){
                _callbacks[id] = resolve;
                window.webkit.messageHandlers.bridge.postMessage({ name:name, payload:payload ?? null, id:id });
              });
            } catch(e){ console.error('bridge.call failed', e); return Promise.reject(e); }
          }
          function _emit(name, detail) {
            try { document.dispatchEvent(new CustomEvent(name, { detail: detail })); }
            catch(e){ console.error('emit failed', e); }
          }
          function _on(name, fn) {
            document.addEventListener(name, function(e){ try { fn && fn(e.detail); } catch(e){ console.error(e); } });
          }

          ['log','warn','error'].forEach(function(level){
            const old = console[level];
            console[level] = function(){
              try { window.webkit.messageHandlers.console.postMessage({ level:level, args:[].slice.call(arguments) }); } catch(_){}
              old && old.apply(console, arguments);
            };
          });
          window.onerror = function(msg, src, line, col, err){
            try { window.webkit.messageHandlers.console.postMessage({ level:'error', args:[String(msg||''), String(src||''), line||0, col||0, String((err&&err.stack)||'')] }); } catch(_){}
          };
          window.onunhandledrejection = function(e){
            try { window.webkit.messageHandlers.console.postMessage({ level:'error', args:['unhandledrejection', String((e&&e.reason)||'')] }); } catch(_){}
          };

          window.Native = { post:_post, call:_call, emit:_emit, on:_on };
        })();
        """
        if #available(iOS 14.0, *) {
            return WKUserScript(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false, in: .page)
        } else {
            return WKUserScript(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        }
    }
    /// 通用重定向修补脚本：仅升级 http→https，不做任何域名改写
    static func makeSanitizeUserScript() -> WKUserScript {
        let js = """
        (function(){
          function sanitize(u){
            try{
              var x = new URL(u, location.href);
              if (x.protocol === 'http:') x.protocol = 'https:';
              return x.href;
            }catch(e){ return u; }
          }
          var _assign = Location.prototype.assign;
          var _replace = Location.prototype.replace;
          Object.defineProperty(Location.prototype, 'assign', { value: function(u){ return _assign.call(this, sanitize(u)); }});
          Object.defineProperty(Location.prototype, 'replace', { value: function(u){ return _replace.call(this, sanitize(u)); }});
          var hrefDesc = Object.getOwnPropertyDescriptor(Location.prototype, 'href');
          Object.defineProperty(Location.prototype, 'href', {
            get: function(){ return hrefDesc.get.call(this); },
            set: function(u){ return _replace.call(this, sanitize(u)); }
          });
          var _open = window.open;
          Object.defineProperty(window, 'open', { value: function(u, t, f){
            if (typeof u === 'string') u = sanitize(u);
            return _open.call(window, u, t, f);
          }});
          try { console.log('[SanitizeJS] installed'); } catch(_){}
        })();
        """
        if #available(iOS 14.0, *) {
            return WKUserScript(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false, in: .page)
        } else {
            return WKUserScript(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        }
    }
}
// ===== 工具 =====
public extension BaseWebView {
    static func quote(_ s: String) -> String {
        let escaped = s
            .replacingOccurrences(of: "\\", with: "\\\\")
            .replacingOccurrences(of: "\"", with: "\\\"")
            .replacingOccurrences(of: "\n", with: "\\n")
        return "\"\(escaped)\""
    }

    static func toJSONLiteral(_ value: Any?) -> String {
        guard let value else { return "null" }
        switch value {
        case is NSNull: return "null"
        case let s as String: return quote(s)
        case let b as Bool:   return b ? "true" : "false"
        case let i as Int:    return "\(i)"
        case let i64 as Int64: return "\(i64)"
        case let u64 as UInt64: return "\(u64)"
        case let d as Double: return d.isFinite ? "\(d)" : "null"
        case let f as Float:  return f.isFinite ? "\(f)" : "null"
        case let dec as Decimal: return NSDecimalNumber(decimal: dec).stringValue
        case let date as Date:
            let iso = ISO8601DateFormatter()
            return quote(iso.string(from: date))
        case let arr as [Any]:
            return "[\(arr.map { toJSONLiteral($0) }.joined(separator: ","))]"
        case let dict as [String: Any]:
            let body = dict.map { key, val in "\(quote(key)):\(toJSONLiteral(val))" }.joined(separator: ",")
            return "{\(body)}"
        default:
            if JSONSerialization.isValidJSONObject(value),
               let data = try? JSONSerialization.data(withJSONObject: value, options: []),
               let s = String(data: data, encoding: .utf8) { return s }
            return quote("\(value)")
        }
    }

    static func decodeJSResult<T: Decodable>(_ value: Any?, as type: T.Type, decoder: JSONDecoder) throws -> T {
        if T.self == String.self, let v = value as? String { return v as! T }
        if T.self == Bool.self,   let v = value as? Bool   { return v as! T }
        if T.self == Int.self,    let v = value as? Int    { return v as! T }
        if T.self == Double.self, let v = value as? Double { return v as! T }
        if T.self == Float.self,  let v = value as? Float  { return v as! T }
        if value == nil || value is NSNull {
            throw NSError(domain: "BaseWebView", code: -2, userInfo: [NSLocalizedDescriptionKey: "JS returned null"])
        }
        if JSONSerialization.isValidJSONObject(value ?? NSNull()) {
            let data = try JSONSerialization.data(withJSONObject: value!, options: [])
            return try decoder.decode(T.self, from: data)
        }
        if let s = value as? String, let data = s.data(using: .utf8) {
            let first = s.trimmingCharacters(in: .whitespacesAndNewlines).first
            if let f = first, ["{","["].contains(f) {
                return try decoder.decode(T.self, from: data)
            }
        }
        let fallback = "\(value!)"
        if let data = fallback.data(using: .utf8) {
            let first = fallback.trimmingCharacters(in: .whitespacesAndNewlines).first
            if let f = first, ["{","[","\"","0","1","2","3","4","5","6","7","8","9","t","f","n"].contains(f),
               let decoded = try? decoder.decode(T.self, from: data) {
                return decoded
            }
        }
        throw NSError(domain: "BaseWebView", code: -3,
                      userInfo: [NSLocalizedDescriptionKey: "Cannot decode JS result to \(T.self) – raw: \(String(describing: value))"])
    }

    // MARK: - Dark CSS 注入（用于 injectDarkStylePatch）
    @MainActor
    private func injectDarkCSS() {
        let css = """
        @media (prefers-color-scheme: dark) {
          html, body { background:#000 !important; color:#eee !important; }
        }
        """
        let js = "var s=document.createElement('style');s.innerHTML=\(BaseWebView.quote(css));document.head&&document.head.appendChild(s);"
        let script: WKUserScript
        if #available(iOS 14.0, *) {
            script = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false, in: .page)
        } else {
            script = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        }
        webView.configuration.userContentController.addUserScript(script)
    }
}
// ===== ScriptMessageHandler（iOS < 14）=====
extension BaseWebView: WKScriptMessageHandler {
    @MainActor
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let channel = message.jobsChannel
        handleScriptMessage(channel: channel, body: message.body, reply: { _, _ in })
    }
}
// ===== WithReply（iOS 14+）=====
@available(iOS 14.0, *)
extension BaseWebView: WKScriptMessageHandlerWithReply {
    @MainActor
    public func userContentController(_ userContentController: WKUserContentController,
                                      didReceive message: WKScriptMessage,
                                      replyHandler: @escaping jobsByAnyStringBlock) {
        let channel = message.jobsChannel
        handleScriptMessage(channel: channel, body: message.body, reply: { value, err in
            replyHandler(value, err)
        })
    }
}
// ===== 统一消息处理 =====
public extension BaseWebView {
    @MainActor
    func handleScriptMessage(channel: String,
                             body: Any,
                             reply: @escaping jobsByAnyStringBlock) {
        // 1) 先拦截 H5 的 iOSBridge（{action,message?,callback?}）
        if channel == mobileBridgeName {
            handleIOSBridgeMessage(body)
            return
        }
        // 2) 前端 console 透传
        if channel == consoleName {
            if let dict = body as? [String: Any],
               let level = dict["level"] as? String,
               let args  = dict["args"] {
                print("[JS:\(level)] \(args)")
            };return
        }
        // 3) 原有的 bridge
        guard channel == bridgeName else { return }

        let dictBody: [String: Any]
        if let d = body as? [String: Any] { dictBody = d }
        else if let s = body as? String,
                let data = s.data(using: .utf8),
                let d = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] { dictBody = d }
        else { print("Invalid bridge message:", body); return }

        let api = dictBody["name"] as? String ?? ""
        let payload = dictBody["payload"]
        let reqId = dictBody["id"] as? Int

        guard let handler = handlers[api] else {
            if #available(iOS 14.0, *), reqId == nil {
                reply(["error":"unhandled:\(api)"], nil)
            } else if let reqId {
                jsReturn(id: reqId, value: ["error":"unhandled:\(api)"])
            };return
        }

        handler(payload) { [weak self] value in
            guard let self else { return }
            if #available(iOS 14.0, *), reqId == nil {
                reply(value, nil)
            } else if let reqId {
                self.jsReturn(id: reqId, value: value)
            }
        }
    }
    @MainActor
    func jsReturn(id: Int, value: Any?) {
        let js = "window.__nativeReturn && window.__nativeReturn(\(id), \(Self.toJSONLiteral(value)));"
        webView.jobsEval(js)
    }
    // === H5 MobileBridge 兼容处理（零配置默认行为）===
    @MainActor
    func handleIOSBridgeMessage(_ body: Any) {
        guard let dict = body as? [String: Any] else { return }

        let action   = (dict["action"] as? String ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let callback = (dict["callback"] as? String ?? "").trimmingCharacters(in: .whitespacesAndNewlines)

        guard !action.isEmpty else { return }
        // 查找注册的处理器
        if let handler = mobileActionHandlers[action] {
            handler(dict) { [weak self] value in
                guard let self, !callback.isEmpty else { return }
                let js = """
                try { (window[\(Self.quote(callback))] || function(){})(\(Self.toJSONLiteral(value)));
                } catch(e) { console && console.error(e); }
                """
                self.webView.jobsEval(js)
            };return
        }
        // 没有注册时，给默认行为（可选）：比如支持 config.tokenProvider
        if action == "getToken", let f = mobileConfig.tokenProvider {
            if #available(iOS 13.0, *) {
                jobsRunOnMain(self) { s in
                    let token = await f() ?? ""
                    guard !callback.isEmpty else { return }
                    let js = "(window[\(Self.quote(callback))]||function(){})('\(token)')"
                    s.webView.jobsEval(js)
                }
            } else {
                guard !callback.isEmpty else { return }
                let js = "(window[\(Self.quote(callback))]||function(){})('')"
                self.webView.jobsEval(js)
            };return
        };mobileConfig.onUnknownAction?(action, dict)
    }
    // === 极简 JS shim：前端没注入时兜底 ===
    @MainActor
    func injectMinimalMobileShim() {
        let js = """
        (function(){
          if (window.MobileBridge) return;
          function post(msg){
            try { window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.iOSBridge.postMessage(msg); }
            catch(e){ console && console.error('iOSBridge.post failed', e); }
          }
          window.MobileBridge = {
            showToast: function(message){ post({action:'showToast', message: String(message||'')}); },
            navigateToDeposit: function(){ post({action:'navigateToDeposit'}); },
            navigateToLogin: function(){ post({action:'navigateToLogin'}); },
            navigateToHome: function(){ post({action:'navigateToHome'}); },
            closeWebView: function(){ post({action:'closeWebView'}); },
            getToken: function(){
              return new Promise(function(resolve){
                var cb='__onToken_'+Date.now()+'_'+Math.random().toString(36).slice(2);
                window[cb]=function(t){ try{ resolve(t||null); } finally{ try{ delete window[cb]; }catch(_){}} };
                post({action:'getToken', callback: cb});
              });
            }
          };
          try { console.log('[iOS shim] MobileBridge installed'); } catch(_){}
        })();
        """
        let script: WKUserScript
        if #available(iOS 14.0, *) {
            script = WKUserScript(source: js,
                                  injectionTime: .atDocumentStart,
                                  forMainFrameOnly: false,
                                  in: .page)
        } else {
            script = WKUserScript(source: js,
                                  injectionTime: .atDocumentStart,
                                  forMainFrameOnly: false)
        }
        webView.configuration.userContentController.addUserScript(script)
    }
}
// ===== Navigation =====
extension BaseWebView: WKNavigationDelegate {
    @MainActor
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.isHidden = false
    }
    @MainActor
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 真实 UA 回传给前端
        webView.evaluateJavaScript("navigator.userAgent") { [weak self] v, _ in
            let ua = v as? String ?? ""
            self?.emitEvent("nativeReady", payload: [
                "ua": ua,
                "title": webView.title ?? ""
            ])
        }
        // 如果外部在当前视图上装了 NavBar 且未自定义标题，则默认绑定 webView.title
        if let nb = self.jobsNavBar, nb.titleProvider == nil {
            nb.bind(webView: webView)
            nb.refresh()
        }
    }
    @MainActor
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) { webView.reload() }
    @MainActor
    public func webView(_ webView: WKWebView,
                        decidePolicyFor action: WKNavigationAction,
                        decisionHandler: @escaping jobsByNavigationPolicyBlock) {

        guard let url = action.request.url else { decisionHandler(.cancel); return }
        let scheme = (url.scheme ?? "").lowercased()
        let isMain = (action.targetFrame?.isMainFrame == true)
        // 0) 外部 scheme（weixin:// 等）
        let standardSchemes: Set<String> = ["http","https","file","about","data","javascript"]
        if !standardSchemes.contains(scheme) || externalSchemes.contains(scheme) {
            if UIApplication.shared.canOpenURL(url) { UIApplication.shared.open(url, options: [:], completionHandler: nil) }
            decisionHandler(.cancel); return
        }
        // 0.5) 主文档一律强制无缓存（若未带标记头则重载为无缓存请求）
        if alwaysFreshMainDocument && isMain &&
            action.request.value(forHTTPHeaderField: Self.noCacheHeader) != "1" {
            decisionHandler(.cancel)
            webView.load(makeNoCache(action.request))
            return
        }
        // 1) Safari 兜底（通用规则）
        if isMain, let rule = safariFallbackRule, rule(url) {
            decisionHandler(.cancel)
            presentSafari(with: url); return
        }
        // 2) 主文档：可选 URL 重写
        if isMain, let newURL = urlRewriter?(url), newURL != url {
            let now = Date()
            if now.timeIntervalSince(lastRewriteAt) > rewriteBurstWindow { rewriteCount = 0 }
            rewriteCount += 1
            lastRewriteAt = now
            if rewriteCount <= rewriteBurstLimit {
                decisionHandler(.cancel)
                webView.load(makeNoCache(URLRequest(url: newURL)))
                return
            }
        }
        // 3) UA 动态切换（仅主文档）
        if isMain {
            let desired = normalizeSuffix(uaSuffixProvider?(action.request))
            if desired != lastAppliedUASuffix {
                lastAppliedUASuffix = desired
                webView.configuration.applicationNameForUserAgent = desired
                webView.customUserAgent = nil
                decisionHandler(.cancel)
                webView.load(makeNoCache(action.request))
                return
            }
        }
        // 4) target=_blank 的 in-place 处理
        if action.targetFrame == nil {
            if openBlankInPlace { webView.load(makeNoCache(action.request)) }
            else { UIApplication.shared.open(url, options: [:], completionHandler: nil) }
            decisionHandler(.cancel); return
        }
        // 5) Host 白名单
        if !allowedHosts.isEmpty {
            if let h = url.host?.lowercased(), !allowedHosts.contains(h) {
                decisionHandler(.cancel); return
            }
        }
        decisionHandler(.allow)
    }
    @available(iOS 14.5, *)
    @MainActor
    public func webView(_ webView: WKWebView,
                        navigationResponse: WKNavigationResponse,
                        didBecome download: WKDownload) {
        download.delegate = self
    }
    @MainActor
    public func webView(_ webView: WKWebView,
                        didFailProvisionalNavigation navigation: WKNavigation!,
                        withError error: Error) {
        let ns = error as NSError
        print("⛔️ Provisional fail: \(ns.domain) [\(ns.code)] \(ns.localizedDescription)")
    }
    @MainActor
    private func presentSafari(with url: URL) {
        SFSafariViewController(url: url)
            .byModalPresentationStyle(.pageSheet)
            .byData(3.14)
            .onResult { name in print("回来了 \(name)") }
            .byPresent(presentingVC)
            .byCompletion{ print("结束") }
    }
}
// ===== WKUIDelegate =====
extension BaseWebView: WKUIDelegate {
    @MainActor
    public func webView(_ webView: WKWebView,
                        runJavaScriptAlertPanelWithMessage message: String,
                        initiatedByFrame frame: WKFrameInfo,
                        completionHandler: @escaping jobsByVoidBlock) {
        UIAlertController
            .makeAlert("提示".tr, message)
            .byAddOK { _ in completionHandler() }
            .byData("Jobs")
            .onResult { name in print("回来了 \(name)") }
            .byPresent(presentingVC)
    }
    @MainActor
    public func webView(_ webView: WKWebView,
                        runJavaScriptConfirmPanelWithMessage message: String,
                        initiatedByFrame frame: WKFrameInfo,
                        completionHandler: @escaping jobsByBOOLBlock) {
        UIAlertController
            .makeAlert("确认".tr, message)
            .byAddCancel { _ in completionHandler(false) }
            .byAddOK     { _ in completionHandler(true)  }
            .byData("Jobs")
            .onResult { name in print("回来了 \(name)") }
            .byPresent(presentingVC)
    }
    @MainActor
    public func webView(_ webView: WKWebView,
                        runJavaScriptTextInputPanelWithPrompt prompt: String,
                        defaultText: String?,
                        initiatedByFrame frame: WKFrameInfo,
                        completionHandler: @escaping jobsByStringBlock) {
        UIAlertController
            .makeAlert("确认".tr, prompt).byAddTextField { tf in
                tf.text = defaultText
            }
            .byAddCancel { _ in completionHandler(nil) }
            .byAddOK     { _ in completionHandler(nil) }
            .byData("Jobs")
            .onResult { name in print("回来了 \(name)") }
            .byPresent(presentingVC)
    }
    /// iOS 18.4+ 自定义文件选择
    @available(iOS 18.4, *)
    @MainActor
    public func webView(_ webView: WKWebView,
                        runOpenPanelWith parameters: WKOpenPanelParameters,
                        initiatedByFrame frame: WKFrameInfo,
                        completionHandler: @escaping jobsByURLsBlock) {
        var types: [UTType] = [.item]
        if parameters.allowsDirectories { types = [.folder] }

        let picker = UIDocumentPickerViewController(forOpeningContentTypes: types)
        picker.allowsMultipleSelection = parameters.allowsMultipleSelection

        let proxy = DocumentPickerDelegateProxy { [weak self] urls in
            completionHandler(urls)
            self?.docPickerDelegate = nil
        }
        self.docPickerDelegate = proxy
        picker.delegate = proxy
        picker.modalPresentationStyle = .formSheet
        presentingVC?.present(picker, animated: true)
    }
}
// ===== 下载（iOS 14.5+）=====
@available(iOS 14.5, *)
extension BaseWebView: WKDownloadDelegate {
    @MainActor
    public func download(_ download: WKDownload,
                         decideDestinationUsing response: URLResponse,
                         suggestedFilename: String,
                         completionHandler: @escaping jobsByURLBlock) {
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(suggestedFilename)
        completionHandler(url)
    }
    @MainActor
    public func downloadDidFinish(_ download: WKDownload) {
        emitEvent("downloadFinish", payload: ["ok": true])
    }
    @MainActor
    public func download(_ download: WKDownload,
                         didFailWithError error: Error,
                         resumeData: Data?) {
        emitEvent("downloadError", payload: ["message": error.localizedDescription])
    }
}
// ===== 文档选择器代理（强引用由外层保持）=====
private final class DocumentPickerDelegateProxy: NSObject, UIDocumentPickerDelegate {
    private let onFinish: ([URL]?) -> Void
    init(_ onFinish: @escaping ([URL]?) -> Void) { self.onFinish = onFinish }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) { onFinish(urls) }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) { onFinish(nil) }
}
// ===== BaseWebView 专属：Web 配置 DSL（NavBar 相关已移到 UIView 扩展）=====
public extension BaseWebView {
    @discardableResult
    func byAllowedHosts(_ hosts: [String]) -> Self {
        self.allowedHosts = Set(hosts.map { $0.lowercased() }); return self
    }
    @discardableResult
    func byOpenBlankInPlace(_ inPlace: Bool = true) -> Self {
        self.openBlankInPlace = inPlace; return self
    }
    @discardableResult @MainActor
    func byDisableSelectionAndCallout(_ disabled: Bool) -> Self {
        self.setSelectionDisabled(disabled); return self
    }
    @discardableResult @MainActor
    func byInjectDarkStylePatch(_ enable: Bool) -> Self {
        self.injectDarkStylePatch = enable
        guard enable else { return self }
        let css = """
        @media (prefers-color-scheme: dark) {
          html, body { background:#000 !important; color:#eee !important; }
        }
        """
        let js = "var s=document.createElement('style');s.innerHTML=\(BaseWebView.quote(css));document.head&&document.head.appendChild(s);"
        self.webView.jobsEval(js)
        return self
    }
    /// ✅ 按请求动态提供 UA 后缀；返回 nil = 系统默认 UA；非空 = 通过 applicationNameForUserAgent 追加
    @discardableResult
    func byUserAgentSuffixProvider(_ provider: @escaping JobsRetStringByURLRequestBlock) -> Self {
        self.uaSuffixProvider = provider
        return self
    }
    /// 自定义 URL 重写规则（返回 nil 表示不改写）
    @discardableResult
    func byURLRewriter(_ rewriter: @escaping (URL) -> URL?) -> Self {
        self.urlRewriter = rewriter
        return self
    }
    /// 自定义 Safari 兜底规则
    @discardableResult
    func bySafariFallbackRule(_ rule: @escaping (URL) -> Bool) -> Self {
        self.safariFallbackRule = rule
        return self
    }
    @discardableResult
    func byApply(_ block: (BaseWebView) -> Void) -> Self { block(self); return self }
}
// ===== BaseWebView 作为 NavBar 宿主：根据显隐重排内部约束 =====
extension BaseWebView: JobsNavBarHost {
    @MainActor
    public func jobsNavBarDidToggle(enabled: Bool, navBar: JobsNavBar) {
        progressView.snp.remakeConstraints { make in
            if enabled {
                make.top.equalTo(navBar.snp.bottom)
            } else {
                make.top.equalToSuperview()
            }
            make.left.right.equalToSuperview()
        }
        webView.snp.remakeConstraints { make in
            make.top.equalTo(progressView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        layoutIfNeeded()
    }
}
// ===== 私有：下拉刷新处理（避免与外部 reload 命名冲突）=====
private extension BaseWebView {
    // 统一构造“无缓存”请求
    func makeNoCache(_ original: URLRequest) -> URLRequest {
        var req = original
        // 固定忽略本地缓存
        req.cachePolicy = .reloadIgnoringLocalCacheData
        // 打标，防止在 decidePolicyFor 被我们再次拦截造成死循环
        var headers = req.allHTTPHeaderFields ?? [:]
        headers[Self.noCacheHeader] = "1"
        // 明确指令：不缓存、不复用
        // （服务端若强行缓存，这是我们能做的最大化提示）
        if headers["Cache-Control"] == nil {
            headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        }
        if headers["Pragma"] == nil {
            headers["Pragma"] = "no-cache"
        }
        if headers["Expires"] == nil {
            headers["Expires"] = "0"
        }
        req.allHTTPHeaderFields = headers
        return req
    }
    @MainActor
    @objc func handlePullToRefresh() {
        // 用当前 URL 重新发起“无缓存”加载，避免 reload 走到内存缓存
        if let url = webView.url {
            webView.load(makeNoCache(URLRequest(url: url)))
        } else {
            webView.reload()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            jobsRunOnMain(self) { s in
                s.refresher.endRefreshing()
            }
        }
    }
}
