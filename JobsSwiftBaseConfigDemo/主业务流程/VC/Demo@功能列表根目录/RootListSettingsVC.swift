//
//  RootListSettingsVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsScale
import JobsSwiftDSL
import JobsSwiftSplash
import JobsSwiftBaseDefines
import JobsToast
import Jobsl10n
import SnapKit
import GKNavigationBarSwift

enum RootListPreferences {
    private static let returnToTopAndRefreshKey = "RootList.returnToTopAndRefresh"
    private static let darkModeKey = "RootList.darkModeEnabled"

    static var returnToTopAndRefreshEnabled: Bool {
        get {
            guard UserDefaults.standard.object(forKey: returnToTopAndRefreshKey) != nil else { return true };return UserDefaults.standard.bool(forKey: returnToTopAndRefreshKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: returnToTopAndRefreshKey)
            UserDefaults.standard.synchronize()
        }
    }

    static var darkModeEnabled: Bool {
        get {
            if UserDefaults.standard.object(forKey: darkModeKey) != nil {
                return UserDefaults.standard.bool(forKey: darkModeKey)
            }
            if #available(iOS 13.0, tvOS 13.0, *) {
                return UITraitCollection.current.userInterfaceStyle == .dark
            };return false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: darkModeKey)
            UserDefaults.standard.synchronize()
            applyPreferredInterfaceStyle()
        }
    }

    @discardableResult
    static func toggleReturnToTopAndRefresh() -> Bool {
        returnToTopAndRefreshEnabled.toggle()
        return returnToTopAndRefreshEnabled
    }

    @discardableResult
    static func toggleDarkMode() -> Bool {
        darkModeEnabled.toggle()
        return darkModeEnabled
    }

    static func applyPreferredInterfaceStyle() {
        guard #available(iOS 13.0, tvOS 13.0, *) else { return }
        let style: UIUserInterfaceStyle = darkModeEnabled ? .dark : .light
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .forEach { $0.overrideUserInterfaceStyle = style }
    }
}

final class RootListSettingsVC: BaseVC {
    private enum SettingSection: Int, CaseIterable {
        case general
        case language
    }

    private enum GeneralSettingItem: Int, CaseIterable {
        case splash
        case returnBehavior
        case theme
    }

    private enum LanguageSettingItem: Int, CaseIterable {
        case chinese
        case english
        case tagalog

        var languageCode: String {
            switch self {
            case .chinese:
                return "zh-Hans"
            case .english:
                return "en"
            case .tagalog:
                return "tl"
            }
        }

        var title: String {
            switch self {
            case .chinese:
                return "中文".tr
            case .english:
                return "英文".tr
            case .tagalog:
                return "他加禄语".tr
            }
        }
    }

    private var langToken: NSObjectProtocol?

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(56)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .bySectionHeaderTopPadding(0)
            .byBackgroundColor(.clear)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
            }
    }()

    deinit {
        if let langToken {
            NotificationCenter.default.removeObserver(langToken)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(.systemGroupedBackground)
        updateLocalizedContent()
        tableView.byVisible(YES)
        langToken = NotificationCenter.default.addObserver(
            forName: .JobsLanguageDidChange,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            self.updateLocalizedContent()
            self.tableView.reloadData()
        }
    }
}

private extension RootListSettingsVC {
    func updateLocalizedContent() {
        jobsSetupGKNav(title: "设置".tr)
    }

    private func generalTitle(for item: GeneralSettingItem) -> String {
        switch item {
        case .splash:
            return JobsSplashPreferences.isEnabledForNextLaunch ? "下次开屏：开".tr : "下次开屏：关".tr
        case .returnBehavior:
            return RootListPreferences.returnToTopAndRefreshEnabled ? "返回：回顶部并刷新".tr : "返回：保持原样".tr
        case .theme:
            return RootListPreferences.darkModeEnabled ? "主题切换：黑夜".tr : "主题切换：白天".tr
        }
    }

    func currentLanguageCode() -> String {
        let code = LanguageManager.shared.currentLanguageCode
        if code == "fil" || code == "fil-PH" { return "tl" };return code
    }

    private func handleGeneralItem(_ item: GeneralSettingItem) {
        switch item {
        case .splash:
            let enabled = JobsSplashPreferences.toggleForNextLaunch()
            (enabled ? "下次启动展示开屏".tr : "下次启动不展示开屏".tr).toast
        case .returnBehavior:
            let enabled = RootListPreferences.toggleReturnToTopAndRefresh()
            (enabled ? "返回主列表：回顶部并刷新".tr : "返回主列表：保持原样".tr).toast
        case .theme:
            let dark = RootListPreferences.toggleDarkMode()
            (dark ? "主题已切换：黑夜".tr : "主题已切换：白天".tr).toast
        }
        tableView.reloadData()
    }
}

extension RootListSettingsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        SettingSection.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let settingSection = SettingSection(rawValue: section) else { return 0 }
        switch settingSection {
        case .general:
            return GeneralSettingItem.allCases.count
        case .language:
            return LanguageSettingItem.allCases.count
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard SettingSection(rawValue: section) == .language else { return nil };return "应用语言".tr
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        guard let settingSection = SettingSection(rawValue: indexPath.section) else { return cell }
        cell.textLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        cell.textLabel?.textColor = .label
        cell.selectionStyle = .default
        switch settingSection {
        case .general:
            let item = GeneralSettingItem.allCases[indexPath.row]
            cell.textLabel?.text = generalTitle(for: item)
            cell.accessoryType = .disclosureIndicator
        case .language:
            let item = LanguageSettingItem.allCases[indexPath.row]
            cell.textLabel?.text = item.title
            cell.accessoryType = item.languageCode == currentLanguageCode() ? .checkmark : .none
        };return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let settingSection = SettingSection(rawValue: indexPath.section) else { return }
        switch settingSection {
        case .general:
            handleGeneralItem(GeneralSettingItem.allCases[indexPath.row])
        case .language:
            let item = LanguageSettingItem.allCases[indexPath.row]
            LanguageManager.shared.switchTo(item.languageCode)
            tableView.reloadData()
        }
    }
}
