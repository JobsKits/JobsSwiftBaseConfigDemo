//
//  JobsMicroAppLabBaseVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import Jobsl10n
import WebKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

/// 五个练习页共用可滚动的操作区、运行容器和日志；知识点保留在各自 VC 的注释里。
class JobsMicroAppLabBaseVC: BaseVC {

    var lessonTitle: String {
        return "微应用工程学习".tr
    }
    var lessonSummary: String {
        return ""
    }
    var lessonActions: [UIButton] {
        return []
    }
    private var history: [String] = []
    private let localizedWebViews = NSHashTable<WKWebView>.weakObjects()
    private var stageHeightConstraint: Constraint?
    private var stageHeight: CGFloat = 220
    private weak var sizingWebView: WKWebView?
    private var contentSizeObservation: NSKeyValueObservation?
    private var localPageURL: URL?
    private var measuredWidth: CGFloat = 0
    private var measurementGeneration = 0
    private var isMeasuringContent = false
    private var needsContentMeasurement = false

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { scroll in
            scroll
                .byAlwaysBounceVertical(true)
                .byKeyboardDismissMode(.interactive)
                .byAddTo(view) { [unowned self] make in
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                    make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
                }
        }
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView.jobsMake { stack in
            stack
                .byAxis(.vertical)
                .bySpacing(10)
                .byAddTo(scrollView) { [unowned self] make in
                    make.edges.equalTo(scrollView.contentLayoutGuide).inset(16)
                    make.width.equalTo(scrollView.frameLayoutGuide).offset(-32)
                }
        }
    }()

    private lazy var summaryLabel: UILabel = {
        UILabel.jobsMake { label in
            label
                .tr_setText(lessonSummary.tr)
                .byFont(JobsFont.systemFont(ofSize: 15))
                .byTextColor(JobsCor.label)
                .byNumberOfLines(0)
        }
    }()

    lazy var stageView: UIView = {
        UIView.jobsMake { stage in
            stage
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .byCornerRadius(12)
                .byClipsToBounds(true)
        }
    }()

    private lazy var statusView: UITextView = {
        UITextView.jobsMake { text in
            text
                .byEditable(false)
                .bySelectable(true)
                .byFont(JobsFont.monospacedSystemFont(ofSize: 13,
                                                      weight: .regular))
                .byTextColor(JobsCor.label)
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .byTextContainerInset(UIEdgeInsets(top: 12,
                                                   left: 10,
                                                   bottom: 12,
                                                   right: 10))
                .byCornerRadius(12)
                .byAccessibilityIdentifier("lab.status")
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: lessonTitle.tr)
        bindTheme()
        assembleLesson()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(lessonLanguageDidChange),
                                               name: .JobsLanguageDidChange,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(contentSizeCategoryDidChange),
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard view.window != nil, let webView = sizingWebView,
              abs(webView.bounds.width - measuredWidth) > 0.5 else {
            return
        }
        measuredWidth = webView.bounds.width
        refreshLocalWebHeight()
    }

    private func bindTheme() {
        JobsThemeCenter.shared.bind(self,
                                    slot: "microAppLab.appearance") { object, center in
            guard let controller = object as? JobsMicroAppLabBaseVC else {
                return
            }
            controller.byOverrideUserInterfaceStyle(center.isDarkMode ? .dark : .light)
                .themeDidChange(isDark: center.isDarkMode)
        }
    }

    func themeDidChange(isDark: Bool) {
    }

    private func assembleLesson() {
        contentStack.byAddArrangedSubview(summaryLabel)
        for button in lessonActions {
            contentStack.byAddArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.height.greaterThanOrEqualTo(44)
            }
        }
        contentStack
            .byAddArrangedSubview(stageView)
            .byAddArrangedSubview(statusView)
        stageView.snp.makeConstraints { make in
            stageHeightConstraint = make.height.equalTo(stageHeight).constraint
        }
        statusView.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
    }

    func record(_ message: String) {
        history.insert(message.tr,
                       at: 0)
        history = Array(history.prefix(24))
        statusView.byText(history.joined(separator: "\n\n"))
        refreshLocalWebHeight()
    }

    /// 返回按钮交给所属 VC 的 lazy 属性持有；创建、外观和事件保持同一条 DSL。
    func lessonButton(_ title: String,
                      identifier: String,
                      action: @escaping () -> Void) -> UIButton {
        let button = UIButton.sys()
            .byConfiguration(UIButton.Configuration.gray())
            .tr_setTitle(title.tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .semibold))
            .byNumberOfLines(0)
            .byAccessibilityIdentifier(identifier)
            .onTap { _ in
                action()
            }
        // Configuration 是值类型；每次有效主题变化重建配色，保留按钮当前标题、字体、状态和事件。
        JobsThemeCenter.shared.bind(button,
                                    slot: "microAppLab.buttonAppearance") { object, center in
            guard let button = object as? UIButton else {
                return
            }
            let foreground = center.resolvedColor(.textPrimary)
            let current = button.configuration ?? UIButton.Configuration.gray()
            let configuration = current
                .byBackground(
                current.background
                    .byBackgroundColor(center.resolvedColor(.backgroundSecondary))
                    .byCornerRadius(10)
            )
                .byBaseForegroundColor(foreground)
            button
                .byConfiguration(configuration)
                .byTitleColor(foreground)
        }
        return button
    }

    static func resourceURL(_ name: String) -> URL? {
        return Bundle.main.url(forResource: "JobsMicroAppLab",
                               withExtension: "bundle")?
            .appendingPathComponent(name)
    }

    func displayBundledPage(_ name: String,
                            in webView: WKWebView,
                            fittingContent: Bool = false) {
        guard let url = Self.resourceURL(name),
              FileManager.default.fileExists(atPath: url.path) else {
            record(String(format: "资源缺失：%@。请重新构建主 App 资源。".tr, name))
            return
        }
        if fittingContent {
            configureLocalWebSizing(webView,
                                    entry: url)
        }
        prepareLocalWebLanguage(webView)
        webView.byLoadFileURL(url,
                              allowingReadAccessTo: url.deletingLastPathComponent())
    }

    private static let localWebTextKeys = [
        "Jobs 教学微应用",
        "教学微应用 · v2",
        "网页渲染 UI，Swift 提供白名单能力。",
        "微应用草稿",
        "保存草稿",
        "等待宿主调用",
        "需要 Jobs iOS 宿主",
        "独立会话",
        "独立账号容器",
        "每个账号使用自己的 WKWebsiteDataStore。请通过原生按钮写入/读取。",
        "当前 Web Store 暂无草稿",
        "当前账号 %@",
        "账号 %@ 的 Web 草稿 @ %@",
        "Web 草稿写入失败：%@",
        "暂无 Web 草稿",
        "此来源不允许 localStorage：%@",
        "Jobs 离线学习包",
        "Jobs 离线学习包 · v2",
        "这段文字与按钮来自本地 HTML。Native bundle 模式断网可用；部署到 HTTPS/localhost 后才尝试注册真正的 Service Worker。",
        "离线交互 +1",
        "正在检查运行来源…",
        "Native bundled 离线包\nfile:// 不注册 Service Worker",
        "当前浏览器/容器未开放 Service Worker API",
        "SW 已注册：%@",
        "已受 SW 控制，可断网刷新",
        "首次安装完成，等待 controllerchange 或再次刷新",
        "SW controller 已生效，可断网普通刷新验证缓存",
        "SW 注册失败：%@",
        "来自微应用的草稿",
    ]

    private var localWebPayload: String {
        let bundle = LanguageManager.shared.localizedBundle
        let strings = Dictionary(uniqueKeysWithValues: Self.localWebTextKeys.map { key in
            (key, bundle.localizedString(forKey: key, value: key, table: nil))
        })
        let payload: [String: Any] = ["language": LanguageManager.shared.currentLanguageCode,
                                     "strings": strings]
        guard let data = try? JSONSerialization.data(withJSONObject: payload),
              let json = String(data: data, encoding: .utf8) else {
            return "{}"
        }
        return json
    }

    private func prepareLocalWebLanguage(_ webView: WKWebView) {
        localizedWebViews.add(webView)
        let marker = "/* JobsLocalLessonLanguage */"
        let controller = webView.configuration.userContentController
        let otherScripts = controller.userScripts.filter { !$0.source.hasPrefix(marker) }
        controller.removeAllUserScripts()
        otherScripts.forEach { controller.addUserScript($0) }
        let script = marker + "if(location.protocol==='file:' && /\\/JobsMicroAppLab\\.bundle\\/(microapp|session|index)\\.html$/.test(location.pathname)){window.jobsWebLocalization=\(localWebPayload);}"
        controller.byAddUserScript(source: script,
                                   injectionTime: .atDocumentStart,
                                   forMainFrameOnly: true)
    }

    private func applyLocalWebLanguage(_ webView: WKWebView) {
        guard let current = webView.url?.standardizedFileURL,
              ["microapp.html", "session.html", "index.html"].contains(where: {
                  Self.resourceURL($0)?.standardizedFileURL == current
              }) else {
            return
        }
        webView.jobsEval("window.jobsSetLocalization?.(\(localWebPayload))") { [weak self] _, _ in
            self?.refreshLocalWebHeight()
        }
    }

    @objc private func lessonLanguageDidChange() {
        jobsSetupGKNav(title: lessonTitle.tr)
        summaryLabel.tr_setText(lessonSummary.tr)
        localizedWebViews.allObjects.forEach { applyLocalWebLanguage($0) }
    }

    @objc private func contentSizeCategoryDidChange() {
        // 字号调小可能不改变 WK 的 contentSize，也要重新测量正文以收回留白。
        DispatchQueue.main.async { [weak self] in
            self?.refreshLocalWebHeight()
        }
    }

    func applyWebTheme(_ webView: WKWebView,
                       isDark: Bool) {
        applyLocalWebLanguage(webView)
        webView.jobsEval("document.documentElement.dataset.theme='\(isDark ? "dark" : "light")'") { [weak self] _, _ in
            self?.refreshLocalWebHeight()
        }
    }

    /// 本地文档按正文撑高，只保留外层滚动；远程网页使用独立、可滚动的视口。
    func useScrollableWebViewport(_ webView: WKWebView) {
        localPageURL = nil
        measurementGeneration += 1
        webView.byScrollView { scroll in
            scroll
                .byScrollEnabled(true)
                .byBounces(true)
        }
        updateStageHeight(220)
    }

    private func configureLocalWebSizing(_ webView: WKWebView,
                                         entry: URL) {
        measurementGeneration += 1
        localPageURL = entry.standardizedFileURL
        if sizingWebView !== webView {
            sizingWebView = webView
            contentSizeObservation = webView.scrollView.observe(\.contentSize,
                                                                options: [.new]) { [weak self] _, _ in
                DispatchQueue.main.async { [weak self] in
                    self?.refreshLocalWebHeight()
                }
            }
        }
        webView.byScrollView { scroll in
            scroll
                .byScrollEnabled(false)
                .byBounces(false)
                .byContentInsetAdjustmentBehavior(.never)
        }
    }

    private func updateStageHeight(_ height: CGFloat) {
        let height = max(220,
                         ceil(height))
        guard height.isFinite, abs(height - stageHeight) > 0.5 else {
            return
        }
        stageHeight = height
        stageHeightConstraint?.update(offset: height)
    }

    private func refreshLocalWebHeight() {
        guard let webView = sizingWebView, let entry = localPageURL,
              webView.url?.standardizedFileURL == entry, !webView.isLoading,
              webView.bounds.width > 0 else {
            return
        }
        guard !isMeasuringContent else {
            needsContentMeasurement = true
            return
        }
        isMeasuringContent = true
        let generation = measurementGeneration
        // contentSize 至少等于视口高；测 body 的自然高度，缩短正文或旋转后也能收回留白。
        let script = """
        (() => {
            const body = document.body;
            if (!body) return 0;
            const style = getComputedStyle(body);
            return Math.ceil(body.getBoundingClientRect().height
                + (parseFloat(style.marginTop) || 0) + (parseFloat(style.marginBottom) || 0)) + 1;
        })()
        """
        webView.jobsEval(script) { [weak self, weak webView] value, error in
            guard let self else {
                return
            }
            self.isMeasuringContent = false
            if error == nil, generation == self.measurementGeneration,
               let webView, self.sizingWebView === webView, self.localPageURL == entry,
               webView.url?.standardizedFileURL == entry,
               let height = value as? NSNumber, height.doubleValue.isFinite, height.doubleValue > 0 {
                self.updateStageHeight(CGFloat(height.doubleValue) + max(0,webView.frame.minY))
            }
            if self.needsContentMeasurement {
                self.needsContentMeasurement = false
                self.refreshLocalWebHeight()
            }
        }
    }
}
