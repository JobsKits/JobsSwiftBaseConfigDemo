//
//  JobsMicroApplicationDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import WebKit
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// 微程序通常还包含专用渲染/路由/分包协议；本页用最小 Hybrid 微应用展示宿主与 JS 的契约，
/// 不冒充微信或商业微程序引擎。接入路径：注册本地包 → 创建 WKWebView → 注入白名单 Bridge → 校验消息。
/// WKWebView 的 Web 内容隔离不是可运行任意原生代码的“虚拟 iOS”；生产版本还需签名、权限与版本回滚。
/// 来源：https://developer.apple.com/documentation/webkit/wkscriptmessagehandler
final class JobsMicroApplicationDemoVC: JobsMicroAppLabBaseVC, WKNavigationDelegate {
    override var lessonTitle: String {
        return "微应用 / 微程序"
    }
    override var lessonSummary: String {
        "本地 HTML 微应用 ↔ Swift 宿主。先点击合法调用，再试越权与错误参数；网页里的草稿按钮也会真正写入文件。"
    }
    override var lessonActions: [UIButton] {
        return [allowedButton, deniedButton, invalidButton, reloadButton]
    }

    private lazy var bridge: JobsLabBridgeHandler = {
        let bridge = JobsLabBridgeHandler()
        bridge.onResult = { [weak self] message in
            self?.record(message)
        }
        return bridge
    }()

    private lazy var webView: WKWebView = {
        WKWebView.make(configuration: WKWebViewConfiguration.make { configuration in
            configuration.byWebsiteDataStore(.nonPersistent())
                .byUserContentController(
                    WKUserContentController.jobsMake { controller in
                        controller.byAddHandler(bridge, name: "jobsLab")
                    }
                )
        }) { web in
            web.byNavigationDelegate(self)
                .byInspectable(true)
                .byAddTo(stageView) { make in
                    make.edges.equalToSuperview()
                }
        }
    }()

    private lazy var allowedButton: UIButton = lessonButton("JS → Native：读取宿主信息", identifier: "lab.bridgeAllowed") { [weak self] in
        self?.webView.jobsEval("window.callHost('getHostInfo')")
    }
    private lazy var deniedButton: UIButton = lessonButton("测试拒绝：越权读取通讯录", identifier: "lab.bridgeDenied") { [weak self] in
        self?.webView.jobsEval("window.callHost('exportContacts')")
    }
    private lazy var invalidButton: UIButton = lessonButton("测试拒绝：草稿参数类型错误", identifier: "lab.bridgeInvalid") { [weak self] in
        self?.webView.jobsEval("window.callHost('saveDraft',{text:42})")
    }
    private lazy var reloadButton: UIButton = lessonButton("重新加载本地微应用", identifier: "lab.reload") { [weak self] in
        guard let self else {
            return
        }
        self.displayBundledPage("microapp.html", in: self.webView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bridge.webView = webView
        displayBundledPage("microapp.html", in: webView)
        record("等待本地微应用加载；允许 getHostInfo / saveDraft 两项能力。")
    }

    override func themeDidChange(isDark: Bool) {
        guard isViewLoaded else {
            return
        }
        applyWebTheme(webView, isDark: isDark)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        applyWebTheme(webView, isDark: JobsThemeCenter.shared.isDarkMode)
        record("微应用加载完成：file 本地包；Bridge 来源校验已开启。")
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let allowed = navigationAction.request.url?.standardizedFileURL
            == Self.resourceURL("microapp.html")?.standardizedFileURL
        if !allowed {
            record("已拒绝微应用导航：只允许已注册入口。")
        }
        decisionHandler(allowed ? .allow : .cancel)
    }
}
