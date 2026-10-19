//
//  JobsMultiSessionDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import WebKit
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// “应用多开”在合规 iOS 宿主里通常指多个账号/业务 profile，并不是克隆其它 App 或突破签名限制。
/// 接入关键是账号化的网络凭据、文件空间与 WebsiteDataStore；仅换 WKProcessPool 不能证明 Cookie 隔离。
/// 本页 A/B 各用独立 nonPersistent Store，Web localStorage 随页面/进程结束丢失；本地草稿按账号落盘可恢复。
/// iOS 17+ 可用 WKWebsiteDataStore(forIdentifier:) 持久 profile，UUID 需要稳定保存；生产凭据统一进 Keychain。
/// 来源：https://webkit.org/blog/14423/building-profiles-with-new-webkit-api/
final class JobsMultiSessionDemoVC: JobsMicroAppLabBaseVC, WKNavigationDelegate {
    override var lessonTitle: String {
        return "应用多开 / 多会话"
    }
    override var lessonSummary: String {
        "A/B 是同一宿主内的独立账号。写入 A → 切 B 读取 → 写入 B → 切 A，观察文件草稿与 Web localStorage 各自保留。"
    }
    override var lessonActions: [UIButton] {
        return [accountAButton, accountBButton, writeButton, readButton, resetButton]
    }
    private var activeAccount = "A"
    private var sequence = 0
    private lazy var webA = makeSessionWebView()
    private lazy var webB = makeSessionWebView()

    private lazy var accountAButton: UIButton = lessonButton("切换到账号 A", identifier: "lab.sessionA") { [weak self] in
        self?.selectAccount("A")
    }
    private lazy var accountBButton: UIButton = lessonButton("切换到账号 B", identifier: "lab.sessionB") { [weak self] in
        self?.selectAccount("B")
    }
    private lazy var writeButton: UIButton = lessonButton("写入当前账号草稿", identifier: "lab.sessionWrite") { [weak self] in
        self?.writeDraft()
    }
    private lazy var readButton: UIButton = lessonButton("重新读取当前账号", identifier: "lab.sessionRead") { [weak self] in
        self?.readDraft()
    }
    private lazy var resetButton: UIButton = lessonButton("退出当前账号并清空其数据", identifier: "lab.sessionReset") { [weak self] in
        self?.resetAccount()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayBundledPage("session.html", in: webA)
        displayBundledPage("session.html", in: webB)
        selectAccount("A")
    }

    private func makeSessionWebView() -> WKWebView {
        return WKWebView.make(configuration: WKWebViewConfiguration.make { configuration in
            configuration.byWebsiteDataStore(.nonPersistent())
        }) { web in
            web.byNavigationDelegate(self)
                .byAddTo(stageView) { make in
                    make.edges.equalToSuperview()
                }
        }
    }

    private var activeWebView: WKWebView {
        return activeAccount == "A" ? webA : webB
    }

    private func selectAccount(_ account: String) {
        activeAccount = account
        webA.byHidden(account != "A")
        webB.byHidden(account != "B")
        readDraft()
    }

    private func accountStore(_ account: String) throws -> JobsLabSandboxStore {
        return try JobsLabSandboxStore(namespace: "account-\(account.lowercased())")
    }

    private func writeDraft() {
        do {
            sequence += 1
            try accountStore(activeAccount).write("账号 \(activeAccount) 的独立草稿 #\(sequence)")
            let account = activeAccount
            activeWebView.jobsEval("window.writeSession('\(account)')") { [weak self] result, error in
                guard let self else {
                    return
                }
                self.record("账号 \(account) Web 写入：\(result as? String ?? error?.localizedDescription ?? "无返回值")")
            }
            record("账号 \(account) 文件写入成功；Web 写入结果另行回显。")
        } catch {
            record(error.localizedDescription)
        }
    }

    private func readDraft() {
        let account = activeAccount
        do {
            record("账号 \(account) 读取：\(try accountStore(account).read())")
        } catch {
            record(error.localizedDescription)
        }
        activeWebView.jobsEval("window.inspectSession()") { [weak self] result, error in
            guard let self else {
                return
            }
            if let result = result as? String {
                self.record("账号 \(account) Web Store：\(result)")
            } else if let error {
                self.record("Web Store 尚未就绪，页面加载后重读：\(error.localizedDescription)")
            }
        }
    }

    /// 只清当前账号的数据；不会调用默认 Store 的全局清除，也不会清另一个账号的缓存。
    private func resetAccount() {
        let account = activeAccount
        let web = activeWebView
        do {
            try accountStore(account).reset()
        } catch {
            record(error.localizedDescription)
            return
        }
        web.configuration.websiteDataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                                                       modifiedSince: .distantPast) { [weak self, weak web] in
            guard let self, let web else {
                return
            }
            self.displayBundledPage("session.html", in: web)
            self.record("账号 \(account) 已退出并清空；另一账号数据保留。")
        }
    }

    override func themeDidChange(isDark: Bool) {
        guard isViewLoaded else {
            return
        }
        applyWebTheme(webA, isDark: isDark)
        applyWebTheme(webB, isDark: isDark)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let account = webView === webA ? "A" : "B"
        webView.jobsEval("window.setAccount('\(account)')")
        applyWebTheme(webView, isDark: JobsThemeCenter.shared.isDarkMode)
        if account == activeAccount {
            readDraft()
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let allowed = navigationAction.request.url?.standardizedFileURL
            == Self.resourceURL("session.html")?.standardizedFileURL
        decisionHandler(allowed ? .allow : .cancel)
    }
}
