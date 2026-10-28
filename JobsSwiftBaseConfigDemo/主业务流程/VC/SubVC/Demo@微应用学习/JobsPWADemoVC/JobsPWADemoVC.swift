//
//  JobsPWADemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import WebKit
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// PWA 从普通网页演进而来：manifest 描述安装外观，Service Worker 拦截网络，Cache Storage 保存离线资源。
/// Native bundled HTML 是原生离线包，不等于 SW。本页默认 file://，无需服务器即可演示离线页面与 native 包恢复。
/// 真 PWA：把 bundle 内 index.html/manifest.webmanifest/sw.js 同目录部署到自己的 HTTPS origin，先联网注册，
/// 等 controller 生效，再断网普通刷新；SW 的 install/activate 管版本、fetch 用 network-first + cache fallback。
/// WKWebView 真 SW 还受 WebKit/App-Bound Domains 配置影响；生产接入自有固定域时在 Info.plist 配置
/// WKAppBoundDomains 并使用 limitsNavigationsToAppBoundDomains，域名不能靠输入框动态加入白名单。
/// 本页 HTTPS 入口是检测工具，未预置受信任服务器；检测不到 SW 时会如实显示，不宣称已有离线能力。
/// 来源：https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register
/// 来源：https://webkit.org/blog/10882/app-bound-domains/
final class JobsPWADemoVC: JobsMicroAppLabBaseVC,
                           WKNavigationDelegate {

    override var lessonTitle: String {
        return "PWA / 离线资源"
    }
    override var lessonSummary: String {
        "默认加载随 App 打包的网页（Native 离线包，不是 SW）。也可输入自己的 HTTPS PWA，加载后检测该来源的 Service Worker / Cache。"
    }
    override var lessonActions: [UIButton] {
        return [offlineButton, inspectButton, refreshButton, resetButton]
    }
    private var showingBundled = true
    private var navigationGeneration = 0

    private lazy var addressField: UITextField = {
        let field = UITextField.jobsMake { field in
            field
                .byPlaceholder("https://你的域名/pwa/index.html")
                .byPlaceholderColor(JobsCor.label)
                .byBorderStyle(.roundedRect)
                .byKeyboardType(.URL)
                .byAutocorrectionType(.no)
                .byAutocapitalizationType(.none)
                .byTextColor(JobsCor.label)
                .byBackgroundColor(JobsCor.systemBackground)
                .byFont(JobsFont.systemFont(ofSize: 13))
                .byAccessibilityIdentifier("lab.pwaAddress")
                .byAddTo(stageView) { make in
                    make.top.left.equalToSuperview().offset(8)
                    make.height.equalTo(38)
                    make.right.equalToSuperview().inset(76)
                }
        }
        // 占位富文本可能持有已解析颜色，跟随有效主题重设，不依赖私有 placeholder label 是否已创建。
        JobsThemeCenter.shared.bind(field,
                                    slot: "microAppLab.pwaFieldAppearance") { object, center in
            guard let field = object as? UITextField else {
                return
            }
            field
                .byTextColor(center.resolvedColor(.textPrimary))
                .byBackgroundColor(center.resolvedColor(.backgroundPrimary))
                .byPlaceholderColor(center.resolvedColor(.textPrimary))
        }
        return field
    }()
    private lazy var openButton: UIButton = lessonButton("打开",
                                                         identifier: "lab.pwaOpen") { [weak self] in
        self?.openRemotePWA()
    }
    private lazy var webView: WKWebView = {
        WKWebView.make(configuration: WKWebViewConfiguration.make { configuration in
            configuration.byWebsiteDataStore(.nonPersistent())
        }) { web in
            web
                .byNavigationDelegate(self)
                .byInspectable(true)
                .byAddTo(stageView) { [unowned self] make in
                    make.top.equalTo(addressField.snp.bottom).offset(6)
                    make.left.right.bottom.equalToSuperview()
                }
        }
    }()
    private lazy var offlineButton: UIButton = lessonButton("加载 App 内置离线包",
                                                            identifier: "lab.pwaOffline") { [weak self] in
        self?.loadOfflinePackage()
    }
    private lazy var inspectButton: UIButton = lessonButton("检测当前 SW / Cache 状态",
                                                            identifier: "lab.pwaInspect") { [weak self] in
        self?.inspectPWA()
    }
    private lazy var refreshButton: UIButton = lessonButton("普通刷新当前页面",
                                                            identifier: "lab.pwaReload") { [weak self] in
        self?.webView.byReload()
    }
    private lazy var resetButton: UIButton = lessonButton("清空此练习容器缓存并恢复内置包",
                                                          identifier: "lab.pwaReset") { [weak self] in
        self?.resetContainer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addressField.byVisible(true)
        openButton.byAddTo(stageView) { [unowned self] make in
            make.centerY.equalTo(addressField)
            make.right.equalToSuperview().inset(8)
            make.width.equalTo(60)
            make.height.equalTo(38)
        }
        loadOfflinePackage()
    }

    private func loadOfflinePackage() {
        navigationGeneration += 1
        showingBundled = true
        displayBundledPage("index.html",
                           in: webView,
                           fittingContent: true)
        record("Native 离线包：从 App Bundle 加载，不依赖网络，不注册 Service Worker。")
    }

    private func openRemotePWA() {
        let text = addressField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        guard let url = URL(string: text), url.scheme?.lowercased() == "https",
              url.host != nil, url.user == nil, url.password == nil else {
            record("请输入有效 HTTPS PWA 地址；不接受账号密码、file 或自定义 scheme。")
            return
        }
        // URL 键盘没有完成键；开始加载时退出输入，避免遮住回退后的网页按钮。
        addressField.jobsDismissKeyboard()
        navigationGeneration += 1
        showingBundled = false
        useScrollableWebViewport(webView)
        webView.loadURL(text)
        record("请求 HTTPS PWA：\(url.host ?? "")；加载失败将恢复内置离线包。")
        let generation = navigationGeneration
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { [weak self] in
            guard let self, self.navigationGeneration == generation, self.webView.isLoading else {
                return
            }
            self.webView.byStopLoading()
            self.record("远程加载超时，恢复 Native 离线包。")
            self.loadOfflinePackage()
        }
    }

    private func inspectPWA() {
        let script = """
        return await (async()=>{
          const result={origin:location.origin,scheme:location.protocol,secureContext:isSecureContext,
            serviceWorkerAPI:('serviceWorker' in navigator),cacheAPI:('caches' in window)};
          try {
            result.controller=navigator.serviceWorker?.controller?.scriptURL||'未受 SW 控制';
            result.registrations=('serviceWorker' in navigator)?(await navigator.serviceWorker.getRegistrations()).map(r=>({scope:r.scope,active:r.active?.state||'无'})):[];
            result.caches=('caches' in window)?await caches.keys():[];
          } catch(e) {result.reason=String(e);}
          return JSON.stringify(result,null,2);
        })()
        """
        webView.callAsyncJavaScript(script,
                                    arguments: [:],
                                    in: nil,
                                    in: WKContentWorld.page) { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            /// 显示实际检测结果，空数组也如实保留
            case .success(let value):
                self.record("\(self.showingBundled ? "Native 离线包（非 SW）" : "HTTPS PWA 检测")\n\(value as? String ?? "无返回值")")
            /// 某些来源不开放 API，给出实际错误
            case .failure(let error):
                self.record("PWA 检测失败：\(error.localizedDescription)")
            }
        }
    }

    private func resetContainer() {
        navigationGeneration += 1
        let generation = navigationGeneration
        webView.byStopLoading()
        webView.configuration.websiteDataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                                                          modifiedSince: .distantPast) { [weak self] in
            guard let self, self.navigationGeneration == generation else {
                return
            }
            self.loadOfflinePackage()
            self.record("练习容器缓存已清空；App 内置资源仍保留。")
        }
    }

    override func themeDidChange(isDark: Bool) {
        guard isViewLoaded, showingBundled else {
            return
        }
        applyWebTheme(webView,
                      isDark: isDark)
    }

    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        navigationGeneration += 1
        if showingBundled {
            applyWebTheme(webView,
                          isDark: JobsThemeCenter.shared.isDarkMode)
            record("内置离线包加载完成：index.html + manifest.webmanifest + sw.js。file:// 不注册 SW。")
        } else {
            record("HTTPS 页面加载完成；点击检测查看实际 SW / Cache 状态。")
        }
    }

    func webView(_ webView: WKWebView,
                 didFailProvisionalNavigation navigation: WKNavigation!,
                 withError error: Error) {
        guard (error as NSError).code != NSURLErrorCancelled else {
            return
        }
        guard !showingBundled else {
            record("内置资源加载失败：\(error.localizedDescription)")
            return
        }
        record("HTTPS 加载失败：\(error.localizedDescription)，恢复内置离线包。")
        loadOfflinePackage()
    }

    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        let allowed = showingBundled
            ? url.standardizedFileURL == Self.resourceURL("index.html")?.standardizedFileURL
            : url.scheme?.lowercased() == "https"
        decisionHandler(allowed ? .allow : .cancel)
    }
}
