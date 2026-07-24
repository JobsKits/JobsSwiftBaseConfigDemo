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
import JobsSwiftDebugTools
import JobsSwiftSplash
import JobsSwiftBaseDefines
import JobsToast
import Jobsl10n
import SnapKit
import GKNavigationBarSwift
import JobsViewPush

enum RootListPreferences {
    private static let returnToTopAndRefreshKey = "RootList.returnToTopAndRefresh"
    private static let sideDrawerContentModeKey = "RootList.sideDrawerContentMode"
    private static let usesTabBarEntryKey = "RootList.usesTabBarEntry"
    private static let showsSuspendTimeButtonKey = "com.jobs.demoList.showsSuspendTimeButton"

    static var usesTabBarEntry: Bool {
        get { UserDefaults.standard.bool(forKey: usesTabBarEntryKey) }
        set {
            UserDefaults.standard.set(newValue, forKey: usesTabBarEntryKey)
            UserDefaults.standard.synchronize()
        }
    }

    static var sideDrawerContentMode: JobsSideDrawerContentMode {
        get { JobsSideDrawerContentMode(rawValue: UserDefaults.standard.integer(forKey: sideDrawerContentModeKey)) ?? .following }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: sideDrawerContentModeKey)
            UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap(\.windows)
                .compactMap { $0.rootViewController as? JobsSideDrawerVC }
                .forEach { $0.configuration.contentMode = newValue; $0.applyConfiguration() }
        }
    }

    static var returnToTopAndRefreshEnabled: Bool {
        get {
            guard UserDefaults.standard.object(forKey: returnToTopAndRefreshKey) != nil else { return true };return UserDefaults.standard.bool(forKey: returnToTopAndRefreshKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: returnToTopAndRefreshKey)
            UserDefaults.standard.synchronize()
        }
    }

    static var showsSuspendTimeButton: Bool {
        get {
            guard UserDefaults.standard.object(forKey: showsSuspendTimeButtonKey) != nil else { return true };return UserDefaults.standard.bool(forKey: showsSuspendTimeButtonKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: showsSuspendTimeButtonKey)
            UserDefaults.standard.synchronize()
        }
    }

    static func makeAppRootViewController(in initialBounds: CGRect = UIScreen.main.bounds) -> UIViewController {
        let demoListEntry = makeDemoListEntryViewController()
        demoListEntry.view.byFrame(initialBounds)
        guard usesTabBarEntry else { return demoListEntry }
        let tabBarController = UITabBarController()
        tabBarController.view.byFrame(initialBounds)
        demoListEntry.tabBarItem = UITabBarItem(
            title: "Demo".tr,
            image: "list.bullet".sysImg,
            selectedImage: "list.bullet.rectangle.fill".sysImg
        )
        let messageViewController = MessageListDemoVC().jobsNav.jobsNavContainer
        messageViewController.view.byFrame(initialBounds)
        messageViewController.tabBarItem = UITabBarItem(
            title: "消息".tr,
            image: "envelope".sysImg,
            selectedImage: "envelope.fill".sysImg
        )
        let profileViewController = JobsMeCenterVC().jobsNav.jobsNavContainer
        profileViewController.view.byFrame(initialBounds)
        profileViewController.tabBarItem = UITabBarItem(
            title: "我的".tr,
            image: "person".sysImg,
            selectedImage: "person.fill".sysImg
        )
        tabBarController.viewControllers = [demoListEntry, messageViewController, profileViewController]
        return tabBarController
    }

    static func applyAppRootViewController() {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState != .unattached }
            .flatMap(\.windows)
            .forEach {
                $0.byRootViewController(makeAppRootViewController(in: $0.bounds))
                    .byMakeKeyAndVisible()
            }
    }

    private static func makeDemoListEntryViewController() -> UIViewController {
        let rootListViewController = RootListVC()
        let mainNavigationController = rootListViewController.jobsNav.jobsNavContainer
        return JobsSideDrawerVC(
            drawerViewController: JobsMeCenterVC().jobsNav.jobsNavContainer,
            mainViewController: mainNavigationController,
            configuration: JobsSideDrawerConfiguration(
                direction: .left,
                contentMode: sideDrawerContentMode,
                presentedRatio: 0.5,
                shouldBeginOpeningGesture: { [weak rootListViewController, weak mainNavigationController] in
                    guard let rootListViewController,
                          let mainNavigationController else { return false };return isDemoListCurrentViewController(
                        rootListViewController,
                        in: mainNavigationController
                    )
                }
            )
        )
    }

    private static func isDemoListCurrentViewController(
        _ rootListViewController: RootListVC,
        in mainNavigationController: UINavigationController
    ) -> Bool {
        guard rootListViewController.viewIfLoaded?.window != nil,
              mainNavigationController.visibleViewController === rootListViewController else { return false }
        var currentViewController: UIViewController? = rootListViewController
        while let viewController = currentViewController {
            if viewController.presentedViewController != nil { return false }
            if let tabBarController = viewController.parent as? UITabBarController,
               tabBarController.selectedViewController !== viewController {
                return false
            }
            currentViewController = viewController.parent
        };return true
    }

    static var darkModeEnabled: Bool {
        get { UIApplication.jobsGlobalDarkModeEnabled }
        set {
            UIApplication.jobsGlobalDarkModeEnabled = newValue
        }
    }

    static var pageBackgroundColor: UIColor {
        darkModeEnabled ? color(0x0F1115) : JobsCor.white
    }

    static var settingsPageBackgroundColor: UIColor {
        darkModeEnabled ? color(0x0F1115) : color(0xF4F5F8)
    }

    static var navigationBackgroundColor: UIColor {
        darkModeEnabled ? color(0x15171C) : UIColor(r: 255, g: 238, b: 221)
    }

    static var primaryTextColor: UIColor {
        darkModeEnabled ? color(0xF4F5F8) : color(0x3D4A58)
    }

    static var secondaryTextColor: UIColor {
        darkModeEnabled ? color(0xA8AFBC) : color(0x8A93A1)
    }

    static var cardBackgroundColor: UIColor {
        darkModeEnabled ? color(0x191B20) : JobsCor.white
    }

    static var foldCardBackgroundColor: UIColor {
        if darkModeEnabled { return color(0x191B20) }
        if #available(iOS 13.0, tvOS 13.0, *) { return JobsCor.secondarySystemBackground };return color(0xF2F2F7)
    }

    static var foldPrimaryTextColor: UIColor {
        if #available(iOS 13.0, tvOS 13.0, *) { return JobsCor.label };return color(0x202733)
    }

    static var foldSecondaryTextColor: UIColor {
        if #available(iOS 13.0, tvOS 13.0, *) { return JobsCor.secondaryLabel };return color(0x8A93A1)
    }

    static var separatorColor: UIColor {
        darkModeEnabled ? color(0x30333A) : color(0xE5E7EB)
    }

    static var selectedTintColor: UIColor {
        color(0x1D7FF2)
    }

    @discardableResult
    static func toggleReturnToTopAndRefresh() -> Bool {
        returnToTopAndRefreshEnabled.toggle()
        return returnToTopAndRefreshEnabled
    }

    @discardableResult
    static func toggleDarkMode() -> Bool {
        UIApplication.jobsToggleGlobalTheme()
    }

    static func applyPreferredInterfaceStyle() {
        UIApplication.jobsApplyGlobalTheme()
        applyNavigationAndTabBarAppearance()
    }

    static func applyThemeChrome(to viewController: UIViewController,
                                 backgroundColor: UIColor? = nil) {
        applyPreferredInterfaceStyle()
        viewController.view.byBackgroundColor(backgroundColor ?? pageBackgroundColor)
        viewController.gk_navBackgroundColor = navigationBackgroundColor
        viewController.gk_navBackgroundImage = nil
        viewController.gk_navTitleColor = primaryTextColor
        viewController.gk_navShadowColor = separatorColor
        viewController.gk_navLineHidden = false
        viewController.gk_navigationBar.byTintColor(primaryTextColor)
        viewController.gk_navigationBar.byBackgroundColor(navigationBackgroundColor)
        applyTintColor(primaryTextColor, to: viewController.gk_navigationItem.leftBarButtonItem)
        applyTintColor(primaryTextColor, to: viewController.gk_navigationItem.rightBarButtonItem)
        applyTintColor(primaryTextColor, to: viewController.gk_navigationItem.leftBarButtonItems)
        applyTintColor(primaryTextColor, to: viewController.gk_navigationItem.rightBarButtonItems)
        #if os(iOS)
        applyTabBarTheme(viewController.tabBarController?.tabBar)
        #endif
    }

    private static func color(_ hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        UIColor(r: CGFloat((hex >> 16) & 0xFF),
                g: CGFloat((hex >> 8) & 0xFF),
                b: CGFloat(hex & 0xFF),
                a: alpha)
    }

    private static func applyNavigationAndTabBarAppearance() {
        #if os(iOS)
        UINavigationBar.appearance().barTintColor = navigationBackgroundColor
        UINavigationBar.appearance().byTintColor(primaryTextColor)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: primaryTextColor]
        UITabBar.appearance().barTintColor = navigationBackgroundColor
        UITabBar.appearance().byTintColor(selectedTintColor)
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = primaryTextColor
        }
        if #available(iOS 13.0, *) {
            let navigationAppearance = UINavigationBarAppearance()
            navigationAppearance.configureWithOpaqueBackground()
            navigationAppearance.byBackgroundColor(navigationBackgroundColor)
            navigationAppearance.shadowColor = separatorColor
            navigationAppearance.titleTextAttributes = [.foregroundColor: primaryTextColor]
            navigationAppearance.largeTitleTextAttributes = [.foregroundColor: primaryTextColor]
            UINavigationBar.appearance().standardAppearance = navigationAppearance
            UINavigationBar.appearance().compactAppearance = navigationAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
            let tabBarAppearance = makeTabBarAppearance()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
        #endif
    }

    #if os(iOS)
    @available(iOS 13.0, *)
    private static func makeTabBarAppearance() -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.byBackgroundColor(navigationBackgroundColor)
        appearance.shadowColor = separatorColor
        let normalAttrs: [NSAttributedString.Key: Any] = [.foregroundColor: primaryTextColor]
        let selectedAttrs: [NSAttributedString.Key: Any] = [.foregroundColor: selectedTintColor]
        [
            appearance.stackedLayoutAppearance,
            appearance.inlineLayoutAppearance,
            appearance.compactInlineLayoutAppearance
        ].forEach {
            $0.normal.titleTextAttributes = normalAttrs
            $0.selected.titleTextAttributes = selectedAttrs
            $0.normal.iconColor = primaryTextColor
            $0.selected.iconColor = selectedTintColor
        };return appearance
    }

    private static func applyTabBarTheme(_ tabBar: UITabBar?) {
        guard let tabBar else { return }
        tabBar.byBackgroundColor(navigationBackgroundColor)
        tabBar.barTintColor = navigationBackgroundColor
        tabBar.byTintColor(selectedTintColor)
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = primaryTextColor
        }
        if #available(iOS 13.0, *) {
            let appearance = makeTabBarAppearance()
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = appearance
            }
        }
    }
    #endif

    private static func applyTintColor(_ color: UIColor,
                                       to item: UIBarButtonItem?) {
        guard let item else { return }
        item.byTintColor(color)
        applyTintColor(color, to: item.customView)
    }

    private static func applyTintColor(_ color: UIColor,
                                       to items: [UIBarButtonItem]?) {
        items?.forEach { applyTintColor(color, to: $0) }
    }

    private static func applyTintColor(_ color: UIColor,
                                       to view: UIView?) {
        guard let view else { return }
        view.byTintColor(color)
        if let button = view as? UIButton {
            button
                .byTitleColor(color)
                .byTitleColor(color.withAlphaComponent(0.72), for: .highlighted)
        }
        view.subviews.forEach { applyTintColor(color, to: $0) }
    }
}

final class RootListSettingsVC: BaseVC {
    private enum SettingSection: Int, CaseIterable {
        case general
        case splashContent
        case language
    }

    private enum GeneralSettingItem: Int, CaseIterable {
        case splash
        case returnBehavior
        case suspendTimeButton
        case theme
        case sideDrawerContentMode
        case appEntry
        case deinitTips
    }

    private enum LanguageSettingItem: Int, CaseIterable {
        case chinese
        case english
        case tagalog
        var languageCode: String {
            switch self {
            /// 处理 .chinese 分支
            case .chinese:
                return "zh-Hans"
            /// 处理 .english 分支
            case .english:
                return "en"
            /// 处理 .tagalog 分支
            case .tagalog:
                return "tl"
            }
        }
        var title: String {
            switch self {
            /// 处理 .chinese 分支
            case .chinese:
                return "中文".tr
            /// 处理 .english 分支
            case .english:
                return "英文".tr
            /// 处理 .tagalog 分支
            case .tagalog:
                return "他加禄语".tr
            }
        }
    }

    private var langToken: NSObjectProtocol?
    private var shouldApplyAppEntryAfterReturning = false

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
            .byBackgroundColor(JobsCor.clear)
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
        RootListPreferences.applyPreferredInterfaceStyle()
        view.byBackgroundColor(RootListPreferences.settingsPageBackgroundColor)
        updateLocalizedContent()
        tableView.byVisible(YES)
        applySettingsTheme()
        langToken = NotificationCenter.default.addObserver(
            forName: .JobsLanguageDidChange,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else { return }
            self.updateLocalizedContent()
            self.applySettingsTheme()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard shouldApplyAppEntryAfterReturning, isMovingFromParent else { return }
        shouldApplyAppEntryAfterReturning = false
        RootListPreferences.applyAppRootViewController()
    }
}

private extension RootListSettingsVC {
    func updateLocalizedContent() {
        jobsSetupGKNav(title: "设置".tr)
    }

    func applySettingsTheme() {
        RootListPreferences.applyThemeChrome(to: self,
                                             backgroundColor: RootListPreferences.settingsPageBackgroundColor)
        tableView.byBackgroundColor(JobsCor.clear)
        tableView.separatorColor = RootListPreferences.separatorColor
        tableView.reloadData()
    }

    private func generalTitle(for item: GeneralSettingItem) -> String {
        switch item {
        /// 处理 .splash 分支
        case .splash:
            return JobsSplashPreferences.isEnabledForNextLaunch ? "下次开屏：开".tr : "下次开屏：关".tr
        /// 处理 .returnBehavior 分支
        case .returnBehavior:
            return RootListPreferences.returnToTopAndRefreshEnabled ? "返回：回顶部并刷新".tr : "返回：保持原样".tr
        /// 处理 .suspendTimeButton 分支
        case .suspendTimeButton:
            return RootListPreferences.showsSuspendTimeButton ? "悬浮时间：开".tr : "悬浮时间：关".tr
        /// 处理 .theme 分支
        case .theme:
            return RootListPreferences.darkModeEnabled ? "主题切换：黑夜".tr : "主题切换：白天".tr
        /// 处理 .sideDrawerContentMode 分支
        case .sideDrawerContentMode:
            return RootListPreferences.sideDrawerContentMode == .following ? "侧滑菜单：内容跟随".tr : "侧滑菜单：内容固定".tr
        /// 处理 .appEntry 分支
        case .appEntry:
            return RootListPreferences.usesTabBarEntry ? "启动入口：TabBar".tr : "启动入口：Demo 列表".tr
        /// 处理 .deinitTips 分支
        case .deinitTips:
            return VCDebugDeallocDebug.showsDeinitTips ? "销毁提示：开".tr : "销毁提示：关".tr
        }
    }

    private func splashContentTitle(for contentType: JobsSplashContentType) -> String {
        switch contentType {
        /// 本地静态图片
        case .localImage:
            return "本地图片".tr
        /// 本地 GIF 动图
        case .localGIF:
            return "本地 GIF".tr
        /// 远程图片
        case .remoteImage:
            return "远程图片".tr
        /// 本地视频
        case .localVideo:
            return "本地视频".tr
        /// 远程视频
        case .remoteVideo:
            return "远程视频".tr
        }
    }

    func currentLanguageCode() -> String {
        let code = LanguageManager.shared.currentLanguageCode
        if code == "fil" || code == "fil-PH" { return "tl" };return code
    }

    private func handleGeneralItem(_ item: GeneralSettingItem) {
        switch item {
        /// 处理 .splash 分支
        case .splash:
            let enabled = JobsSplashPreferences.toggleForNextLaunch()
            (enabled ? "下次启动展示开屏".tr : "下次启动不展示开屏".tr).toast
        /// 处理 .returnBehavior 分支
        case .returnBehavior:
            let enabled = RootListPreferences.toggleReturnToTopAndRefresh()
            (enabled ? "返回主列表：回顶部并刷新".tr : "返回主列表：保持原样".tr).toast
        /// 处理 .suspendTimeButton 分支
        case .suspendTimeButton:
            RootListPreferences.showsSuspendTimeButton.toggle()
            (RootListPreferences.showsSuspendTimeButton ? "悬浮时间按钮已显示".tr : "悬浮时间按钮已隐藏".tr).toast
        /// 处理 .theme 分支
        case .theme:
            let dark = RootListPreferences.toggleDarkMode()
            applySettingsTheme()
            (dark ? "主题已切换：黑夜".tr : "主题已切换：白天".tr).toast
        /// 处理 .sideDrawerContentMode 分支
        case .sideDrawerContentMode:
            RootListPreferences.sideDrawerContentMode = RootListPreferences.sideDrawerContentMode == .following ? .fixed : .following
            (RootListPreferences.sideDrawerContentMode == .following ? "侧滑内容已设为跟随".tr : "侧滑内容已设为固定".tr).toast
        /// 处理 .appEntry 分支
        case .appEntry:
            RootListPreferences.usesTabBarEntry.toggle()
            shouldApplyAppEntryAfterReturning = true
            (RootListPreferences.usesTabBarEntry ? "返回后从 TabBar 进入".tr : "返回后直接进入 Demo 列表".tr).toast
        /// 处理 .deinitTips 分支
        case .deinitTips:
            VCDebugDeallocDebug.showsDeinitTips.toggle()
            (VCDebugDeallocDebug.showsDeinitTips ? "控制器销毁提示已开启".tr : "控制器销毁提示已关闭".tr).toast
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
        /// 处理 .general 分支
        case .general:
            return GeneralSettingItem.allCases.count
        /// 处理 .splashContent 分支
        case .splashContent:
            return JobsSplashContentType.allCases.count
        /// 处理 .language 分支
        case .language:
            return LanguageSettingItem.allCases.count
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let settingSection = SettingSection(rawValue: section) else { return nil }
        switch settingSection {
        /// 通用设置不显示分组标题
        case .general:
            return nil
        /// 显示开屏内容类型标题
        case .splashContent:
            return "开屏内容".tr
        /// 显示应用语言标题
        case .language:
            return "应用语言".tr
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        56
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        guard let settingSection = SettingSection(rawValue: indexPath.section) else { return cell }
        cell.textLabel?.byFont(JobsFont.systemFont(ofSize: 16, weight: .regular))
        cell.textLabel?.byTextColor(RootListPreferences.primaryTextColor)
        cell.byBackgroundColor(RootListPreferences.cardBackgroundColor)
        cell.contentView.byBackgroundColor(RootListPreferences.cardBackgroundColor)
        cell.byTintColor(RootListPreferences.selectedTintColor)
        cell.selectionStyle = .default
        switch settingSection {
        /// 处理 .general 分支
        case .general:
            let item = GeneralSettingItem.allCases[indexPath.row]
            cell.textLabel?.byText(generalTitle(for: item))
            cell.accessoryType = .disclosureIndicator
        /// 处理 .splashContent 分支
        case .splashContent:
            let contentType = JobsSplashContentType.allCases[indexPath.row]
            cell.textLabel?.byText(splashContentTitle(for: contentType))
            cell.accessoryType = contentType == JobsSplashPreferences.contentTypeForNextLaunch ? .checkmark : .none
        /// 处理 .language 分支
        case .language:
            let item = LanguageSettingItem.allCases[indexPath.row]
            cell.textLabel?.byText(item.title)
            cell.accessoryType = item.languageCode == currentLanguageCode() ? .checkmark : .none
        };return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let settingSection = SettingSection(rawValue: indexPath.section) else { return }
        switch settingSection {
        /// 处理 .general 分支
        case .general:
            handleGeneralItem(GeneralSettingItem.allCases[indexPath.row])
        /// 处理 .splashContent 分支
        case .splashContent:
            let contentType = JobsSplashContentType.allCases[indexPath.row]
            JobsSplashPreferences.contentTypeForNextLaunch = contentType
            String(format: "下次开屏内容已设为：%@".tr, splashContentTitle(for: contentType)).toast
            tableView.reloadData()
        /// 处理 .language 分支
        case .language:
            let item = LanguageSettingItem.allCases[indexPath.row]
            LanguageManager.shared.switchTo(item.languageCode)
            tableView.reloadData()
        }
    }
}
