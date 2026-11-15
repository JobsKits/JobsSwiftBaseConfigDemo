//
//  JobsSwiftSearcherDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftSearcher
import JobsSwiftDSL
import JobsInheritance
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftSearcherDemoVC: BaseVC {

    private typealias SearchResult = (title: String, summary: String)
    private var results: [SearchResult] = []
    private var scopeIndex = 0
    private var languageToken: NSObjectProtocol?

    private lazy var scopeButtons: [UIButton] = {
        Self.scopeTitles.enumerated().map { index, title in
            UIButton.sys()
                .byTitle(title.tr)
                .byTitleFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
                .byNumberOfLines(0)
                .byTitleColor(JobsCor.label, for: .normal)
                .byTitleColor(JobsCor.white, for: .selected)
                .byConfiguration { [weak self] configuration in
                    let selected = self?.scopeIndex == index
                    return configuration
                        .byCornerStyle(.fixed)
                        .byBackground(configuration.background
                            .byBackgroundColor(selected
                                ? UIColor(r: 25, g: 94, b: 131, a: 1)
                                : JobsCor.secondarySystemBackground)
                            .byCornerRadius(10))
                }
                .byAccessibilityIdentifier("jobs.searcher.demo.scope.\(index)")
                .onTap { [weak self] _ in
                    self?.selectScope(index)
                }
        }
    }()

    private lazy var scopeControls: UIStackView = {
        UIStackView.jobsMake { _ in }
            .byAxis(.horizontal)
            .byDistribution(.fillEqually)
            .bySpacing(8)
            .byAddArrangedSubviews(scopeButtons)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(48)
            }
    }()

    private lazy var scopeHint: UILabel = {
        UILabel.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAccessibilityIdentifier("jobs.searcher.demo.scope.hint")
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(scopeControls.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var resultsTable: UITableView = {
        UITableView.jobsMake { _ in }
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(100)
            .byBackgroundColor(JobsCor.clear)
            .byTableFooterView(UIView.jobsMake { _ in })
            .byKeyboardDismissMode(.onDrag)
            .byAccessibilityIdentifier("jobs.searcher.demo.results")
    }()

    private lazy var searchView: JobsSwiftSearcherView = {
        JobsSwiftSearcherView(config: demoSearchConfig())
            .byRecommendSearches(Self.catalog.map(\.title))
            .byResultContentView(resultsTable)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(scopeHint.snp.bottom).offset(6)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsSwiftSearcher")
        _ = scopeControls
        _ = scopeHint
        searchView.byVisible(true)
        refreshScopePresentation()
        languageToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange,
                                                              object: nil,
                                                              queue: .main) { [weak self] _ in
            guard let self else {
                return
            }
            self.refreshScopePresentation()
            self.updateResults(self.searchView.normalizedQuery)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideDemoAppearanceButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        hideDemoAppearanceButton()
    }

    deinit {
        if let languageToken {
            NotificationCenter.default.removeObserver(languageToken)
        }
    }
}

private extension JobsSwiftSearcherDemoVC {

    static let scopeTitles = ["账号 A", "账号 B", "仅内存"]
    private static let catalog: [SearchResult] = [
        ("Java", "Java 是运行在 Java 虚拟机上的编程语言。"),
        ("Python", "Python 是常用于脚本、自动化和数据处理的编程语言。"),
        ("Objective-C", "Objective-C 是支持消息发送和运行时机制的编程语言。"),
        ("Swift", "Swift 是 Apple 平台应用开发使用的编程语言。"),
        ("iOS", "iOS 是 iPhone 使用的操作系统。"),
        ("UIKit", "UIKit 提供窗口、视图、控件和页面导航等原生界面能力。"),
        ("SnapKit", "SnapKit 是基于 Auto Layout 的 Swift 布局库。"),
        ("JobsSwiftSearcher", "JobsSwiftSearcher 统一管理输入、推荐词、搜索历史和结果区域。")
    ]

    func hideDemoAppearanceButton() {
        // BaseVC 在两个 appearance 回调中补默认入口，本页均在 super 后清理。
        gk_navRightBarButtonItem = nil
        gk_navRightBarButtonItems = nil
    }

    func demoSearchConfig() -> JobsSwiftSearcherConfig {
        JobsSwiftSearcherConfig.defaultConfig
            .byShowsCancelButton(true)
            .byHistoryStorageKey("JobsSwiftSearcherDemoSearchConfirmHistoryData")
            .byAccessibilityIdentifierPrefix("jobs.searcher.demo")
            .bySearchTextChangedBlock { [weak self] keyword in
                self?.updateResults(keyword)
            }
            .byCancelBlock { [weak self] in
                self?.searchView.byQuery("", recordHistory: false)
            }
    }

    func selectScope(_ index: Int) {
        guard Self.scopeTitles.indices.contains(index) else {
            return
        }
        scopeIndex = index
        let config = searchView.config
            .byHistoryScope(index == 1 ? "account-B" : nil)
            .byPersistsHistory(index != 2)
        searchView.reloadWithConfig(config)
        refreshScopePresentation()
    }

    func refreshScopePresentation() {
        for (index, button) in scopeButtons.enumerated() {
            button
                .byTitle(Self.scopeTitles[index].tr)
                .bySelected(index == scopeIndex)
        }
        scopeHint.byText(scopeIndex == 2
                         ? "临时搜索仅保留在当前页面内，不写入本地存储。".tr
                         : "历史记录按账号独立保存。".tr)
    }

    func updateResults(_ keyword: String) {
        results = Self.catalog.filter {
            $0.title.localizedCaseInsensitiveContains(keyword) || $0.summary.tr.localizedCaseInsensitiveContains(keyword)
        }
        if resultsTable.window != nil {
            resultsTable.byReloadData()
        }
        searchView.byResultCount(results.count)
    }
}

extension JobsSwiftSearcherDemoVC: UITableViewDataSource,
                                    UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        results.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "JobsSwiftSearcherDemoResult"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ??
            UITableViewCell.make(style: .subtitle, reuseIdentifier: identifier)
        let result = results[indexPath.row]
        return cell
            .byText(result.title)
            .byDetailText(result.summary.tr)
            .byTitleFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 14))
            .byTitleCor(JobsCor.label)
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .byDetailTextLabel {
                $0.byNumberOfLines(0)
            }
            .byBackgroundColor(JobsCor.clear)
            .byAccessibilityIdentifier("jobs.searcher.demo.result." + result.title)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = results[indexPath.row]
        searchView
            .dismissKeyboard()
            .saveHistory(by: searchView.normalizedQuery)
        UIAlertController.makeAlert(result.title, result.summary.tr)
            .byAddOK("确定".tr)
            .byPresent(self)
    }
}
