//
//  UIViewController+GKNavigationBarSwift.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Jobsl10n
import JobsScale
import JobsTextTools
import JobsSwiftDSL
import JobsSwiftBaseDefines

#if canImport(SnapKit)
import SnapKit
#endif

#if canImport(GKNavigationBarSwift)
import GKNavigationBarSwift

private let jobsGlobalDarkModeDefaultsKey = "RootList.darkModeEnabled"
private let jobsDemoThemeButtonTag = 0x4A54484D
private var jobsDemoThemeButtonAssociatedKey: UInt8 = 0
private var jobsDemoThemeBarButtonItemAssociatedKey: UInt8 = 0
private var jobsDemoBusinessButtonsAssociatedKey: UInt8 = 0
private var jobsDemoActionMenuOverlayAssociatedKey: UInt8 = 0
private var jobsDemoThemeButtonOpensMenuAssociatedKey: UInt8 = 0

public extension Notification.Name {
    static let JobsGlobalThemeDidChange = Notification.Name("JobsGlobalThemeDidChange")
}

public extension UIApplication {
    static var jobsGlobalDarkModeEnabled: Bool {
        get {
            if UserDefaults.standard.object(forKey: jobsGlobalDarkModeDefaultsKey) != nil {
                return UserDefaults.standard.bool(forKey: jobsGlobalDarkModeDefaultsKey)
            }
            if #available(iOS 13.0, tvOS 13.0, *) {
                return UITraitCollection.current.userInterfaceStyle == .dark
            };return false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: jobsGlobalDarkModeDefaultsKey)
            UserDefaults.standard.synchronize()
            jobsApplyGlobalTheme()
            NotificationCenter.default.post(
                name: .JobsGlobalThemeDidChange,
                object: nil,
                userInfo: ["darkModeEnabled": newValue]
            )
        }
    }

    static func jobsApplyGlobalTheme() {
        guard #available(iOS 13.0, tvOS 13.0, *) else { return }
        let isDarkMode = jobsGlobalDarkModeEnabled
        let style: UIUserInterfaceStyle = isDarkMode ? .dark : .light
        shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .forEach { window in
                window.overrideUserInterfaceStyle = style
                jobsNormalizeViewControllerRoots(in: window.rootViewController)
                jobsSyncGlobalThemeButtons(in: window, isDarkMode: isDarkMode)
            }
    }

    @discardableResult
    static func jobsToggleGlobalTheme() -> Bool {
        jobsGlobalDarkModeEnabled.toggle()
        return jobsGlobalDarkModeEnabled
    }

    private static func jobsSyncGlobalThemeButtons(in view: UIView,
                                                   isDarkMode: Bool) {
        if let button = view as? UIButton, button.tag == jobsDemoThemeButtonTag {
            button.bySelected(isDarkMode)
            let opensMenu = objc_getAssociatedObject(
                button,
                &jobsDemoThemeButtonOpensMenuAssociatedKey
            ) as? Bool ?? false
            if !opensMenu {
                button.accessibilityLabel = isDarkMode
                    ? "切换为白天".tr
                    : "切换为黑夜".tr
            }
        }
        view.subviews.forEach {
            jobsSyncGlobalThemeButtons(in: $0, isDarkMode: isDarkMode)
        }
    }

    private static func jobsNormalizeViewControllerRoots(in viewController: UIViewController?) {
        guard let viewController else { return }
        if !(viewController is UIAlertController) {
            viewController.viewIfLoaded?.byBackgroundColor(JobsCor.systemBackground)
            viewController.gk_navBackgroundColor = JobsCor.systemBackground
            viewController.gk_navBackgroundImage = nil
            viewController.gk_navTitleColor = JobsCor.label
        }
        viewController.children.forEach {
            jobsNormalizeViewControllerRoots(in: $0)
        }
        jobsNormalizeViewControllerRoots(in: viewController.presentedViewController)
    }
}

extension UIViewController {
    /// “系统导航栏@富文本标题”仅用于独立演示系统导航栏，其余 Demo 子页面统一使用 Jobs/GK 导航栏。
    private var jobsIsSystemNavigationBarDemo: Bool {
        let className = NSStringFromClass(type(of: self))
        return className == "JobsNavigationDemoVC" || className.hasSuffix(".JobsNavigationDemoVC")
    }
    /// DemoVC 与 Demo 根列表推进的导航子页面，统一展示全局主题切换入口。
    private var jobsIsStandaloneDemoPage: Bool {
        let className = NSStringFromClass(type(of: self))
            .split(separator: ".")
            .last
            .map(String.init) ?? ""
        if className.hasSuffix("DemoVC") { return true }
        func isDemoRoot(_ viewController: UIViewController?) -> Bool {
            guard let viewController else { return false };return NSStringFromClass(type(of: viewController))
                .split(separator: ".")
                .last
                .map(String.init) == "RootListVC"
        }
        if let rootViewController = navigationController?.viewControllers.first,
           rootViewController !== self,
           isDemoRoot(rootViewController) {
            return true
        }
        var presenter = presentingViewController ?? navigationController?.presentingViewController
        while let currentPresenter = presenter {
            if isDemoRoot(currentPresenter) ||
                isDemoRoot(currentPresenter.navigationController?.viewControllers.first) {
                return true
            }
            let nextPresenter = currentPresenter.presentingViewController ??
                currentPresenter.navigationController?.presentingViewController
            if nextPresenter === currentPresenter { break }
            presenter = nextPresenter
        };return false
    }
    /// 每个 Demo 子页面只创建并持有一个全局主题按钮。
    private var jobsDemoThemeButton: UIButton {
        if let button = objc_getAssociatedObject(
            self,
            &jobsDemoThemeButtonAssociatedKey
        ) as? UIButton {
            return button.bySelected(UIApplication.jobsGlobalDarkModeEnabled)
        }
        let button = UIButton.sys()
            .byTag(jobsDemoThemeButtonTag)
            .byTintColor(JobsCor.label)
            .byImage(
                "moon.circle.fill".sysImg.withRenderingMode(.alwaysTemplate),
                for: .normal
            )
            .byImage(
                "sun.max.circle.fill".sysImg.withRenderingMode(.alwaysTemplate),
                for: .selected
            )
            .bySelected(UIApplication.jobsGlobalDarkModeEnabled)
            .onTap { [weak self] _ in
                guard let self else { return }
                if jobsDemoBusinessButtons.isEmpty {
                    _ = UIApplication.jobsToggleGlobalTheme()
                    jobsUpdateDemoTriggerPresentation()
                } else {
                    jobsShowDemoActionMenu(jobsDemoActionMenuOverlay == nil)
                }
            }
        objc_setAssociatedObject(
            self,
            &jobsDemoThemeButtonAssociatedKey,
            button,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        jobsUpdateDemoTriggerPresentation()
        return button
    }
    /// 主题按钮对应的 BarButtonItem 与控制器同生命周期，避免重复插入。
    private var jobsDemoThemeBarButtonItem: UIBarButtonItem {
        if let item = objc_getAssociatedObject(
            self,
            &jobsDemoThemeBarButtonItemAssociatedKey
        ) as? UIBarButtonItem {
            return item
        }
        let item = UIBarButtonItem.make(customView: jobsDemoThemeButton)
        objc_setAssociatedObject(
            self,
            &jobsDemoThemeBarButtonItemAssociatedKey,
            item,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return item
    }
    /// 页面业务按钮不再并排占用导航栏，统一由主题入口下拉列表承载。
    private var jobsDemoBusinessButtons: [UIButton] {
        get {
            objc_getAssociatedObject(
                self,
                &jobsDemoBusinessButtonsAssociatedKey
            ) as? [UIButton] ?? []
        }
        set {
            objc_setAssociatedObject(
                self,
                &jobsDemoBusinessButtonsAssociatedKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            jobsUpdateDemoTriggerPresentation()
        }
    }
    /// 下拉列表遮罩与控制器同生命周期；移除后释放，避免遮挡页面交互。
    private var jobsDemoActionMenuOverlay: UIView? {
        get {
            objc_getAssociatedObject(
                self,
                &jobsDemoActionMenuOverlayAssociatedKey
            ) as? UIView
        }
        set {
            objc_setAssociatedObject(
                self,
                &jobsDemoActionMenuOverlayAssociatedKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            jobsUpdateDemoTriggerPresentation()
        }
    }
    /// 按钮前景图和无障碍文案始终描述下一次点击会执行的真实动作。
    private func jobsUpdateDemoTriggerPresentation() {
        guard let button = objc_getAssociatedObject(
            self,
            &jobsDemoThemeButtonAssociatedKey
        ) as? UIButton else { return }
        let opensMenu = !jobsDemoBusinessButtons.isEmpty
        objc_setAssociatedObject(
            button,
            &jobsDemoThemeButtonOpensMenuAssociatedKey,
            opensMenu,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        if opensMenu {
            let expanded = jobsDemoActionMenuOverlay != nil
            let image = (
                expanded ? "ellipsis.circle.fill" : "ellipsis.circle"
            ).sysImg.withRenderingMode(.alwaysTemplate)
            button
                .byImage(image, for: .normal)
                .byImage(image, for: .selected)
                .bySelected(NO)
            button.accessibilityLabel = expanded
                ? "收起主题与页面操作".tr
                : "展开主题与页面操作".tr
            return
        }
        button
            .byImage(
                "moon.circle.fill".sysImg.withRenderingMode(.alwaysTemplate),
                for: .normal
            )
            .byImage(
                "sun.max.circle.fill".sysImg.withRenderingMode(.alwaysTemplate),
                for: .selected
            )
            .bySelected(UIApplication.jobsGlobalDarkModeEnabled)
        button.accessibilityLabel = UIApplication.jobsGlobalDarkModeEnabled
            ? "切换为白天".tr
            : "切换为黑夜".tr
    }
    /// 为导航栈和模态子页面补齐 Jobs/GK 导航栏、导航标题与 Jobs 返回按钮。
    @discardableResult
    public func jobsEnsureNavigationDefaults() -> Self {
        let isNavigationChild = navigationController?.viewControllers
            .dropFirst()
            .contains(where: { $0 === self }) ?? false
        let isPresentedPage = presentingViewController != nil ||
            (navigationController?.viewControllers.first === self && navigationController?.presentingViewController != nil)
        guard isNavigationChild || isPresentedPage else { return self }
        view.byBackgroundColor(JobsCor.systemBackground)

        if jobsIsSystemNavigationBarDemo {
            navigationController?
                .byNavBarHidden(false)
                .navigationBar
                .byHidden(false)
            jobsEnsureDemoThemeButton()
            return self
        }

        gk_navBackgroundColor = JobsCor.systemBackground
        gk_navBackgroundImage = nil
        gk_navTitleColor = JobsCor.label
        if gk_navTitle?.isEmpty != false,gk_navTitleView == nil {
            if let titleView = navigationItem.titleView {
                gk_navTitleView = titleView
            } else {
                let defaultTitle = [title,navigationItem.title]
                    .compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .first(where: { !$0.isEmpty }) ?? String(describing: type(of: self))
                tr_setGKNavTitle(defaultTitle)
            }
        }
        if gk_navRightBarButtonItem == nil,gk_navRightBarButtonItems?.isEmpty != false {
            if let rightItems = navigationItem.rightBarButtonItems,!rightItems.isEmpty {
                gk_navRightBarButtonItems = rightItems
            } else if let rightItem = navigationItem.rightBarButtonItem {
                gk_navRightBarButtonItem = rightItem
            }
        }
        jobsEnsureDemoThemeButton()
        jobsEnsureNavigationBackButton()
        byGKNavBarHidden(false)
        return self
    }
    /// 为导航栈子页面或模态子页面补齐默认返回按钮；已有自定义左按钮时不覆盖。
    @discardableResult
    public func jobsEnsureNavigationBackButton() -> Self {
        let isNavigationChild = navigationController?.viewControllers
            .dropFirst()
            .contains(where: { $0 === self }) ?? false
        let isPresentedPage = presentingViewController != nil ||
            (navigationController?.viewControllers.first === self && navigationController?.presentingViewController != nil)
        guard isNavigationChild || isPresentedPage,
              gk_navLeftBarButtonItem == nil,
              gk_navLeftBarButtonItems?.isEmpty != false else { return self }
        gk_navLeftBarButtonItem = UIBarButtonItem.make(customView: makeDefaultBackButton())
        return self
    }
    /// 统一配置 GKNav
    /// - Parameters:
    ///   - title: JobsText（支持纯文本/富文本，这里取 rawString 写到 gk_navTitle）
    ///   - leftButton: 左侧按钮（UIButton）。nil → 使用默认“< 返回”
    ///   - rightButtons: 页面业务动作组；Demo 页会收进主题入口下拉列表。nil 或空 → 不创建
    public func jobsSetupGKNav(
        title: JobsText,
        leftButton: UIButton? = nil,
        rightButtons: [UIButton]? = nil) {
            gk_navTitle = title.asString
            // 避免上游用 JobsText("xxx".tr) 这种写法时 marker 串台
            TRBind.consumeMarkerIfNeeded()
            let btn = leftButton ?? makeDefaultBackButton()
            gk_navLeftBarButtonItem = UIBarButtonItem.make(customView: btn)
            if let items = rightButtons, !items.isEmpty {
                items.forEach { jobs_prepareNavRightButtonSizeIfNeeded($0) }
                /// 用UIStackView来解决各个子控件的相距问题，以及数据源倒序问题
                gk_navRightBarButtonItems = [UIBarButtonItem.make(customView: UIStackView(arrangedSubviews: items)
                    .byAxis(.horizontal)
                    .byAlignment(.center)
                    .byDistribution(.fill)
                    .bySpacing(0)
                    .byTranslatesAutoresizingMaskIntoConstraints(NO)
                    .byHeight(44.h))]
            } else {
                gk_navRightBarButtonItems = nil
            }
            jobsEnsureDemoThemeButton()
            _ = byGKNavBarHidden(false)
    }
    /// 统一配置 GKNav（支持直接传入 String，如 "标题".tr）
    /// - Note: 如果传入的是 ".tr" 的结果，会自动注册语言切换刷新
    public func jobsSetupGKNav(
        title: String,
        leftButton: UIButton? = nil,
        rightButtons: [UIButton]? = nil) {
            // 让 GK 标题也具备自动刷新能力
            tr_setGKNavTitle(title)
            let btn = leftButton ?? makeDefaultBackButton()
            gk_navLeftBarButtonItem = UIBarButtonItem.make(customView: btn)
            if let items = rightButtons, !items.isEmpty {
                items.forEach { jobs_prepareNavRightButtonSizeIfNeeded($0) }
                /// 用UIStackView来解决各个子控件的相距问题，以及数据源倒序问题
                gk_navRightBarButtonItems = [UIBarButtonItem.make(customView: UIStackView(arrangedSubviews: items)
                    .byAxis(.horizontal)
                    .byAlignment(.center)
                    .byDistribution(.fill)
                    .bySpacing(0)
                    .byTranslatesAutoresizingMaskIntoConstraints(NO)
                    .byHeight(44.h))]
            } else {
                gk_navRightBarButtonItems = nil
            }
            jobsEnsureDemoThemeButton()
            _ = byGKNavBarHidden(false)
    }
    /// GKNav 标题绑定：支持 ".tr" 自动刷新
    @discardableResult
    public func tr_setGKNavTitle(_ string: String) -> Self {
        TRBind.bind(self, translated: string) { vc, text in
            vc.gk_navTitle = text
        };return self
    }
    // MARK: - rightButtons 默认 size 策略
    private func jobs_prepareNavRightButtonSizeIfNeeded(_ v: UIView) {
        #if canImport(SnapKit)
        if let closure = v.jobsAddConstraintsClosure {
            // 有自定义 closure：按它来（避免重复约束，用 remake）
            v.snp.remakeConstraints { make in
                closure(make)
            }
        } else {
            // 没有：给默认 44×44
            v.snp.remakeConstraints { make in
                make.size.equalTo(CGSize(width: 44, height: 44))
            }
        }
        #else
        // 没 SnapKit 就退化成 frame
        v.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        #endif
    }
    /// 导航栏右侧只保留主题入口；页面业务动作合并进同入口下拉列表。
    private func jobsEnsureDemoThemeButton() {
        guard #available(iOS 13.0, tvOS 13.0, *),
              jobsIsStandaloneDemoPage else { return }
        let themeButton = jobsDemoThemeButton
        themeButton.bySelected(UIApplication.jobsGlobalDarkModeEnabled)
        jobs_prepareNavRightButtonSizeIfNeeded(themeButton)
        let themeItem = jobsDemoThemeBarButtonItem
        if jobsIsSystemNavigationBarDemo {
            let items = navigationItem.rightBarButtonItems ??
                navigationItem.rightBarButtonItem.map { [$0] } ?? []
            jobsUpdateDemoBusinessButtons(from: items, themeItem: themeItem)
            navigationItem.rightBarButtonItem = nil
            navigationItem.rightBarButtonItems = [themeItem]
            return
        }
        let items = gk_navRightBarButtonItems ??
            gk_navRightBarButtonItem.map { [$0] } ?? []
        jobsUpdateDemoBusinessButtons(from: items, themeItem: themeItem)
        gk_navRightBarButtonItem = nil
        gk_navRightBarButtonItems = [themeItem]
    }
    /// 重新配置导航栏时更新业务动作；仅重复注入主题按钮时保留已收集动作。
    private func jobsUpdateDemoBusinessButtons(
        from items: [UIBarButtonItem],
        themeItem: UIBarButtonItem
    ) {
        let containsThemeItem = items.contains { $0 === themeItem }
        let businessItems = items.filter { $0 !== themeItem }
        guard !containsThemeItem || !businessItems.isEmpty else { return }
        jobsDemoBusinessButtons = businessItems.flatMap {
            jobsDemoBusinessButtons(from: $0)
        }
        jobsShowDemoActionMenu(false)
    }
    /// 将 Jobs 导航按钮、系统 BarButtonItem 和 StackView 按钮统一转成可触发源。
    private func jobsDemoBusinessButtons(from item: UIBarButtonItem) -> [UIButton] {
        if let customView = item.customView {
            return jobsDemoBusinessButtons(in: customView)
        }
        let sourceButton = UIButton.sys()
            .byTitle(item.title, for: .normal)
            .byImage(item.image, for: .normal)
        if #available(iOS 14.0, *), let primaryAction = item.primaryAction {
            sourceButton.addAction(primaryAction, for: .touchUpInside)
        } else if let action = item.action {
            sourceButton.onTap { [item] _ in
                UIApplication.shared.sendAction(
                    action,
                    to: item.target,
                    from: item,
                    for: nil
                )
            }
        };return [sourceButton]
    }
    /// StackView 只负责导航栏排版，菜单动作需要递归提取其中的真实按钮。
    private func jobsDemoBusinessButtons(in view: UIView) -> [UIButton] {
        if let button = view as? UIButton {
            return button.tag == jobsDemoThemeButtonTag ? [] : [button]
        }
        let subviews = (view as? UIStackView)?.arrangedSubviews ?? view.subviews
        return subviews.flatMap { jobsDemoBusinessButtons(in: $0) }
    }
    /// 使用与 Demo 总入口一致的 44pt 行高、210pt 宽度和导航栏下方定位。
    private func jobsShowDemoActionMenu(_ visible: Bool) {
        jobsDemoActionMenuOverlay?.byRemoveFromSuperview()
        jobsDemoActionMenuOverlay = nil
        guard visible, !jobsDemoBusinessButtons.isEmpty else { return }
        let overlay = UIView()
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { make in
                make.edges.equalToSuperview()
            }
        let rowHeight: CGFloat = 44
        let rowCount = jobsDemoBusinessButtons.count + 1
        let menuContainer = UIView()
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(8)
            .byClipsToBounds()
            .byAddTo(overlay) { [unowned self] make in
                if jobsIsSystemNavigationBarDemo {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
                } else {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(6)
                }
                make.right.equalToSuperview().inset(12)
                make.width.equalTo(210)
                make.height.equalTo(CGFloat(rowCount) * rowHeight)
            }
        overlay.addTapAction(cancelsTouchesInView: false) { [weak self, weak overlay, weak menuContainer] gesture in
            guard let self,
                  let overlay,
                  let menuContainer else { return }
            let point = gesture.location(in: overlay)
            guard !menuContainer.frame.contains(point) else { return }
            jobsShowDemoActionMenu(false)
        }
        jobsDemoActionMenuOverlay = overlay
        let darkModeEnabled = UIApplication.jobsGlobalDarkModeEnabled
        jobsAddDemoActionMenuRow(
            to: menuContainer,
            title: darkModeEnabled ? "切换为白天".tr : "切换为黑夜".tr,
            image: (
                darkModeEnabled ? "sun.max.circle.fill" : "moon.circle.fill"
            ).sysImg.withRenderingMode(.alwaysTemplate),
            index: 0,
            rowCount: rowCount
        ) { [weak self] in
            guard let self else { return }
            _ = UIApplication.jobsToggleGlobalTheme()
            jobsShowDemoActionMenu(false)
        }
        jobsDemoBusinessButtons.enumerated().forEach { index, sourceButton in
            jobsAddDemoActionMenuRow(
                to: menuContainer,
                title: jobsDemoActionTitle(for: sourceButton, index: index),
                image: sourceButton.jobs_foregroundImage(
                    for: sourceButton.jobs_effectiveState
                ),
                index: index + 1,
                rowCount: rowCount
            ) { [weak self, weak sourceButton] in
                self?.jobsShowDemoActionMenu(false)
                sourceButton?.performTap()
            }
        }
        view.bringSubviewToFront(overlay)
    }
    /// 优先展示页面显式声明的语义标题，纯图标按钮则给出稳定的操作序号。
    private func jobsDemoActionTitle(
        for sourceButton: UIButton,
        index: Int
    ) -> String {
        let candidates = [
            sourceButton.accessibilityLabel,
            sourceButton.jobs_title(for: sourceButton.jobs_effectiveState),
            sourceButton.jobs_title(for: .normal)
        ]
        if let title = candidates
            .compactMap({ $0?.trimmingCharacters(in: .whitespacesAndNewlines) })
            .first(where: { !$0.isEmpty }) {
            return title
        };return "\("页面操作".tr) \(index + 1)"
    }
    /// 菜单行复用原按钮图标，点按后先收起列表再执行对应动作。
    private func jobsAddDemoActionMenuRow(
        to menuContainer: UIView,
        title: String,
        image: UIImage?,
        index: Int,
        rowCount: Int,
        action: @escaping () -> Void
    ) {
        let rowButton = UIButton.sys()
            .byTitle(title, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byTitleColor(JobsCor.label, for: .normal)
            .byImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            .byImagePlacement(.leading, padding: 8)
            .byTintColor(JobsCor.label)
            .byContentHorizontalAlignment(.leading)
            .byContentEdgeInsets(
                UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
            )
            .byBackgroundColor(JobsCor.secondarySystemBackground, for: .normal)
            .byBackgroundColor(JobsCor.tertiarySystemBackground, for: .highlighted)
            .onTap { _ in
                action()
            }
            .byAddTo(menuContainer) { make in
                make.top.equalToSuperview().offset(CGFloat(index) * 44)
                make.left.right.equalToSuperview()
                make.height.equalTo(44)
            }
        guard index < rowCount - 1 else { return }
        UIView()
            .byBackgroundColor(JobsCor.separator)
            .byAddTo(rowButton) { make in
                make.left.equalToSuperview().inset(12)
                make.right.bottom.equalToSuperview()
                make.height.equalTo(1 / UIScreen.main.scale)
            }
    }
    // MARK: - 内置：默认“< 返回”按钮（SF Symbol: chevron.left）
    private func makeDefaultBackButton() -> UIButton {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
            .byTintColor(JobsCor.label)
            .byImage("chevron.left".sysImg.withRenderingMode(.alwaysTemplate), for: .normal)
            .byContentEdgeInsets(.zero)
            .byTitleEdgeInsets(.zero)
            .onTap { [weak self] _ in
                guard let self else { return }
                goBack("") // 系统通用返回
            }
    }
    /// 立即隐藏/显示 GK 的导航栏（并把系统栏同步隐藏，避免双栏）
    @discardableResult
    public func byGKNavBarHidden(_ hidden: Bool) -> Self {
        let navigationBar = gk_navigationBar
        navigationBar.isHidden = hidden
        navigationController?.setNavigationBarHidden(true, animated: false)
        guard !hidden else { return self }
        navigationBar.alpha = 1
        gk_navBarAlpha = 1
        view.bringSubviewToFront(navigationBar)
        return self
    }
    /// 透明导航/恢复（不移除视图，适合沉浸式）
    @discardableResult
    public func byGKNavTransparent(_ enable: Bool) -> Self {
        _ = gk_navigationBar
        if enable {
            gk_navBarAlpha = 0
            gk_navLineHidden = true
        } else {
            gk_navBarAlpha = 1
            gk_navLineHidden = false
        };return self
    }
}
#endif
/**
 jobsSetupGKNav(
     title: "图片加载",
     rightButtons: [
         UIButton.sys()
             .byTitle("🧹", for: .normal)
             .byAdd({ make in
                 make.size.equalTo(CGSize(width: 44, height: 44))
             })
             .onTap { _ in
                /// TODO
             },
         UIButton.sys()
             .byTitle("⬇️", for: .normal)
             .byAdd({ make in
                 make.size.equalTo(CGSize(width: 44, height: 44))
             })
             .onTap { [weak self] _ in
                 guard let self else { return }
                 /// TODO
             },
         UIButton.sys()
             .byTitle(JobsDemoImageURLSwitch.useBadURL ? "🌐❌" : "🌐✅", for: .normal)
             .byAdd({ make in
                 make.size.equalTo(CGSize(width: 60, height: 44))
             })
             .onTap { [weak self] sender in
                 guard let self else { return }
                 /// TODO
             }
     ]
 )
 */
