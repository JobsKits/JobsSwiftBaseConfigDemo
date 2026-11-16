//
//  RootRecentDemosVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月15日，星期日.
//

import UIKit
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

typealias RootRecentDemoItem = (title: String, group: String, vcType: UIViewController.Type)

/// 从同一首页注册表取真实页面，返回时保留列表位置并刷新最近顺序。
final class RootRecentDemosVC: BaseVC, UITableViewDataSource, UITableViewDelegate {
    private var items: [RootRecentDemoItem] = []
    private var languageToken: NSObjectProtocol?
    private var themeToken: NSObjectProtocol?
    private var catalogProvider: () -> [RootRecentDemoItem] = { [] }

    @discardableResult
    func byCatalogProvider(_ provider: @escaping () -> [RootRecentDemoItem]) -> Self {
        catalogProvider = provider
        return self
    }

    private lazy var tableView: UITableView = {
        UITableView.jobsMake { _ in }
            .byAccessibilityIdentifier("jobs.root.recent.list")
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byRowHeight(64)
            .byNoSectionHeaderTopPadding()
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .byEmptyButtonProvider { [weak self] in
                UIButton.sys()
                    .byTitle("尚无最近使用".tr)
                    .bySubTitle("打开一个 Demo 后会显示在这里，点击重新加载".tr)
                    .byImage("clock.arrow.circlepath".sysImg)
                    .byImagePlacement(.top)
                    .byTitleFont(JobsFont.systemFont(ofSize: 18, weight: .semibold))
                    .bySubTitleFont(JobsFont.systemFont(ofSize: 14))
                    .byTitleColor(RootListPreferences.primaryTextColor)
                    .bySubTitleColor(RootListPreferences.secondaryTextColor)
                    .onTap { [weak self] _ in
                        self?.reloadRecentDemos()
                    }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        tableView.byVisible(true)
        languageToken = NotificationCenter.default.addObserver(forName: .JobsLanguageDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.refreshAppearance()
        }
        themeToken = NotificationCenter.default.addObserver(forName: .JobsThemeDidChange, object: nil, queue: .main) { [weak self] _ in
            self?.refreshAppearance()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshAppearance()
    }

    deinit {
        if let languageToken {
            NotificationCenter.default.removeObserver(languageToken)
        }
        if let themeToken {
            NotificationCenter.default.removeObserver(themeToken)
        }
    }

    private func refreshAppearance() {
        configureNavigation()
        RootListPreferences.applyThemeChrome(to: self, backgroundColor: RootListPreferences.pageBackgroundColor)
        tableView
            .byBackgroundColor(RootListPreferences.pageBackgroundColor)
            .bySeparatorColor(RootListPreferences.separatorColor)
        // 语言切换时更新现有空态文案，避免重建列表和丢失滚动位置。
        if let button = tableView.jobs_emptyButton {
            button
                .byTitle("尚无最近使用".tr)
                .bySubTitle("打开一个 Demo 后会显示在这里，点击重新加载".tr)
                .byTitleColor(RootListPreferences.primaryTextColor)
                .bySubTitleColor(RootListPreferences.secondaryTextColor)
        }
        reloadRecentDemos()
    }

    private func configureNavigation() {
        jobsSetupGKNav(title: "最近使用".tr, rightButtons: [
            UIButton.sys()
                .byImage("arrow.clockwise".sysImg)
                .byAccessibilityLabel("刷新".tr)
                .byAccessibilityIdentifier("jobs.root.recent.reload")
                .onTap { [weak self] _ in
                    self?.reloadRecentDemos()
                }
        ])
    }

    private func reloadRecentDemos() {
        items = catalogProvider()
        guard tableView.window != nil else {
            return
        }
        tableView
            .byReloadData()
            .byReloadEmptyViewAuto(animated: false)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        return tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
            .byText(item.title.tr)
            .byTitleCor(RootListPreferences.primaryTextColor)
            .byBackgroundColor(RootListPreferences.cardBackgroundColor)
            .byAccessoryType(.disclosureIndicator)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        RootListVC.recordRecentDemo(item.vcType)
        item.vcType.init()
            .byTitle(item.title.tr)
            .byPush(self)
    }
}
