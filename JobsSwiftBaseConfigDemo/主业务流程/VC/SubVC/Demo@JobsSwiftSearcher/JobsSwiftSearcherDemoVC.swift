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
import JobsScale
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftSearcherDemoVC: BaseVC {
    private lazy var themeButton: UIButton = {
        UIButton.sys()
            .byTintColor(JobsCor.label)
            .byImage("moon.circle.fill".sysImg.withRenderingMode(.alwaysTemplate), for: .normal)
            .byImage("sun.max.circle.fill".sysImg.withRenderingMode(.alwaysTemplate), for: .selected)
            .onTap { [weak self] sender in
                guard let self else { return }
                toggleTheme(using: sender)
            }
    }()

    private lazy var searchView: JobsSwiftSearcherView = {
        JobsSwiftSearcherView(config: demoSearchConfig())
            .byRecommendSearches(Self.recommendTexts)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(12.h)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12.h)
                }
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "JobsSwiftSearcher",
            rightButtons: [themeButton]
        )
        syncThemeButton()
        searchView.byVisible(true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard #available(iOS 13.0, *),
              previousTraitCollection?.hasDifferentColorAppearance(comparedTo: traitCollection) == true else { return }
        syncThemeButton()
    }
}

private extension JobsSwiftSearcherDemoVC {
    static let recommendTexts = [
        "Java",
        "Python",
        "Objective-C",
        "Swift",
        "iOS",
        "UIKit",
        "SnapKit",
        "JobsSwiftSearcher"
    ]

    func toggleTheme(using sender: UIButton) {
        guard #available(iOS 13.0, *) else { return }
        let enablesDarkMode = traitCollection.userInterfaceStyle != .dark
        byOverrideUserInterfaceStyle(enablesDarkMode ? .dark : .light)
        sender.bySelected(enablesDarkMode)
    }

    func syncThemeButton() {
        guard #available(iOS 13.0, *) else { return }
        themeButton.bySelected(traitCollection.userInterfaceStyle == .dark)
    }

    func demoSearchConfig() -> JobsSwiftSearcherConfig {
        let config = JobsSwiftSearcherConfig.defaultConfig
        config.placeholder = "请输入搜索关键词".tr
        config.recommendTitle = "搜索推荐"
        config.historyTitle = "搜索历史"
        config.historyStorageKey = "JobsSwiftSearcherDemoSearchConfirmHistoryData"
        config.searchSubmittedBlock = { text in
            print("搜索确认：\(text)")
        }
        config.recommendSelectedBlock = { text in
            print("点击推荐词：\(text)")
        }
        config.historyDeleteBlock = { text in
            print("删除历史：\(text)")
        }
        config.clearHistoryBlock = {
            print("清空搜索历史")
        };return config
    }
}
