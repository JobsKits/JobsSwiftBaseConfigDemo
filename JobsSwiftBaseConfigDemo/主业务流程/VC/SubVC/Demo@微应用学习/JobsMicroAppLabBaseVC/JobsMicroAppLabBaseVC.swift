//
//  JobsMicroAppLabBaseVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import WebKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

/// 五个练习页共用可滚动的操作区、运行容器和日志；知识点保留在各自 VC 的注释里。
class JobsMicroAppLabBaseVC: BaseVC {
    var lessonTitle: String {
        return "微应用学习"
    }
    var lessonSummary: String {
        return ""
    }
    var lessonActions: [UIButton] {
        return []
    }
    private var history: [String] = []

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { scroll in
            scroll.byAlwaysBounceVertical(true)
                .byAddTo(view) { [unowned self] make in
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                    make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
                }
        }
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView.jobsMake { stack in
            stack.byAxis(.vertical)
                .bySpacing(10)
                .byAddTo(scrollView) { [unowned self] make in
                    make.edges.equalTo(scrollView.contentLayoutGuide).inset(16)
                    make.width.equalTo(scrollView.frameLayoutGuide).offset(-32)
                }
        }
    }()

    private lazy var summaryLabel: UILabel = {
        UILabel.jobsMake { label in
            label.byText(lessonSummary)
                .byFont(JobsFont.systemFont(ofSize: 15))
                .byTextColor(JobsCor.label)
                .byNumberOfLines(0)
        }
    }()

    lazy var stageView: UIView = {
        UIView.jobsMake { stage in
            stage.byBackgroundColor(JobsCor.secondarySystemBackground)
                .byCornerRadius(12)
                .byClipsToBounds(true)
        }
    }()

    private lazy var statusView: UITextView = {
        UITextView.jobsMake { text in
            text.byEditable(false)
                .bySelectable(true)
                .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
                .byTextColor(JobsCor.label)
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .byTextContainerInset(UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10))
                .byCornerRadius(12)
                .byAccessibilityIdentifier("lab.status")
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: lessonTitle)
        bindTheme()
        assembleLesson()
    }

    private func bindTheme() {
        JobsThemeCenter.shared.bind(self, slot: "microAppLab.appearance") { object, center in
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
        contentStack.byAddArrangedSubview(stageView)
            .byAddArrangedSubview(statusView)
        stageView.snp.makeConstraints { make in
            make.height.equalTo(220)
        }
        statusView.snp.makeConstraints { make in
            make.height.equalTo(180)
        }
    }

    func record(_ message: String) {
        history.insert(message, at: 0)
        history = Array(history.prefix(24))
        statusView.byText(history.joined(separator: "\n\n"))
    }

    /// 返回按钮交给所属 VC 的 lazy 属性持有；创建、外观和事件保持同一条 DSL。
    func lessonButton(_ title: String, identifier: String,
                      action: @escaping () -> Void) -> UIButton {
        let button = UIButton.sys()
            .byConfiguration(UIButton.Configuration.gray())
            .byTitle(title)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byAccessibilityIdentifier(identifier)
            .onTap { _ in
                action()
            }
        // Configuration 是值类型；每次有效主题变化重建配色，保留按钮当前标题、字体、状态和事件。
        JobsThemeCenter.shared.bind(button, slot: "microAppLab.buttonAppearance") { object, center in
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
            button.byConfiguration(configuration)
                .byTitleColor(foreground)
        }
        return button
    }

    static func resourceURL(_ name: String) -> URL? {
        return Bundle.main.url(forResource: "JobsMicroAppLab", withExtension: "bundle")?
            .appendingPathComponent(name)
    }

    func displayBundledPage(_ name: String, in webView: WKWebView) {
        guard let url = Self.resourceURL(name),
              FileManager.default.fileExists(atPath: url.path) else {
            record("资源缺失：\(name)。请重新构建主 App 资源。")
            return
        }
        webView.byLoadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
    }

    func applyWebTheme(_ webView: WKWebView, isDark: Bool) {
        webView.jobsEval("document.documentElement.dataset.theme='\(isDark ? "dark" : "light")'")
    }
}
