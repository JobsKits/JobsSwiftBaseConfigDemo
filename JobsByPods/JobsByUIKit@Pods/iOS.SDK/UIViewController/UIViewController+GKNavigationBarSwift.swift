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

#if canImport(GKNavigationBarSwift)
import GKNavigationBarSwift

private let jobsGlobalDarkModeDefaultsKey = "RootList.darkModeEnabled"
private let jobsDemoThemeButtonTag = 0x4A54484D
private var jobsDemoThemeButtonAssociatedKey: UInt8 = 0
private var jobsDemoThemeBarButtonItemAssociatedKey: UInt8 = 0

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
        }
        view.subviews.forEach {
            jobsSyncGlobalThemeButtons(in: $0, isDarkMode: isDarkMode)
        }
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
            .onTap { sender in
                sender.bySelected(UIApplication.jobsToggleGlobalTheme())
            }
        objc_setAssociatedObject(
            self,
            &jobsDemoThemeButtonAssociatedKey,
            button,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
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
    /// 为导航栈和模态子页面补齐 Jobs/GK 导航栏、导航标题与 Jobs 返回按钮。
    @discardableResult
    public func jobsEnsureNavigationDefaults() -> Self {
        let isNavigationChild = navigationController?.viewControllers
            .dropFirst()
            .contains(where: { $0 === self }) ?? false
        let isPresentedPage = presentingViewController != nil ||
            (navigationController?.viewControllers.first === self && navigationController?.presentingViewController != nil)
        guard isNavigationChild || isPresentedPage else { return self }

        if jobsIsSystemNavigationBarDemo {
            navigationController?
                .byNavBarHidden(false)
                .navigationBar
                .byHidden(false)
            jobsEnsureDemoThemeButton()
            return self
        }

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
    ///   - rightButtons: 右侧按钮组（[UIButton]）。nil 或空 → 不创建
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
    /// 保留页面原有右侧按钮，并把全局主题入口固定在最右侧。
    private func jobsEnsureDemoThemeButton() {
        guard #available(iOS 13.0, tvOS 13.0, *),
              jobsIsStandaloneDemoPage else { return }
        let themeButton = jobsDemoThemeButton
        themeButton.bySelected(UIApplication.jobsGlobalDarkModeEnabled)
        jobs_prepareNavRightButtonSizeIfNeeded(themeButton)
        let themeItem = jobsDemoThemeBarButtonItem
        if jobsIsSystemNavigationBarDemo {
            let items = navigationItem.rightBarButtonItems ?? []
            guard !items.contains(where: { $0 === themeItem }) else { return }
            navigationItem.rightBarButtonItems = [themeItem] + items
            return
        }
        if let items = gk_navRightBarButtonItems {
            guard !items.contains(where: { $0 === themeItem }) else { return }
            gk_navRightBarButtonItems = [themeItem] + items
        } else if let item = gk_navRightBarButtonItem {
            gk_navRightBarButtonItem = nil
            gk_navRightBarButtonItems = [themeItem, item]
        } else {
            gk_navRightBarButtonItems = [themeItem]
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
