//
//  UIViewController+GKNavigationBarSwift.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/2/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsTextTools
import JobsSwiftBaseDefines
import JobsScale
import Jobsl10n
#if canImport(GKNavigationBarSwift)
import GKNavigationBarSwift
extension UIViewController {
    /// 统一配置 GKNav
    /// - Parameters:
    ///   - title: JobsText（支持纯文本/富文本，这里取 rawString 写到 gk_navTitle）
    ///   - leftButton: 左侧按钮（UIButton）。nil → 使用默认“< 返回”
    ///   - rightButtons: 右侧按钮组（[UIButton]）。nil 或空 → 不创建
    public func jobsSetupGKNav(
        title: JobsText,
        leftButton: UIButton? = nil,
        rightButtons: [UIButton]? = nil
    ) {
        gk_navTitle = title.asString
        // 避免上游用 JobsText("xxx".tr) 这种写法时 marker 串台
        TRBind.consumeMarkerIfNeeded()
        let btn = leftButton ?? makeDefaultBackButton()
        gk_navLeftBarButtonItem = UIBarButtonItem(customView: btn)
        if let items = rightButtons, !items.isEmpty {
            items.forEach { jobs_prepareNavRightButtonSizeIfNeeded($0) }
            /// 用UIStackView来解决各个子控件的相距问题，以及数据源倒序问题
            gk_navRightBarButtonItems = [UIBarButtonItem(customView: UIStackView(arrangedSubviews: items)
                .byAxis(.horizontal)
                .byAlignment(.center)
                .byDistribution(.fill)
                .bySpacing(0)
                .byTranslatesAutoresizingMaskIntoConstraints(NO)
                .byHeight(44.h))]
        } else {
            gk_navRightBarButtonItems = nil
        }
    }
    /// 统一配置 GKNav（支持直接传入 String，如 "标题".tr）
    /// - Note: 如果传入的是 ".tr" 的结果，会自动注册语言切换刷新
    public func jobsSetupGKNav(
        title: String,
        leftButton: UIButton? = nil,
        rightButtons: [UIButton]? = nil
    ) {
        // 让 GK 标题也具备自动刷新能力
        _ = tr_setGKNavTitle(title)
        let btn = leftButton ?? makeDefaultBackButton()
        gk_navLeftBarButtonItem = UIBarButtonItem(customView: btn)
        if let items = rightButtons, !items.isEmpty {
            items.forEach { jobs_prepareNavRightButtonSizeIfNeeded($0) }
            /// 用UIStackView来解决各个子控件的相距问题，以及数据源倒序问题
            gk_navRightBarButtonItems = [UIBarButtonItem(customView: UIStackView(arrangedSubviews: items)
                .byAxis(.horizontal)
                .byAlignment(.center)
                .byDistribution(.fill)
                .bySpacing(0)
                .byTranslatesAutoresizingMaskIntoConstraints(NO)
                .byHeight(44.h))]
        } else {
            gk_navRightBarButtonItems = nil
        }
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
    // MARK: - 内置：默认“< 返回”按钮（SF Symbol: chevron.left）
    private func makeDefaultBackButton() -> UIButton {
        UIButton(type: .system)
            .byFrame(CGRect(x: 0, y: 0, width: 32.w, height: 32.h))
            .byTintColor(.white)
            .byImage("chevron.left".sysImg, for: .normal)
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
        gk_navigationBar.isHidden = hidden   // 真实隐藏 GK 的 bar
        navigationController?.setNavigationBarHidden(hidden, animated: false) // 避免系统栏干扰
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
