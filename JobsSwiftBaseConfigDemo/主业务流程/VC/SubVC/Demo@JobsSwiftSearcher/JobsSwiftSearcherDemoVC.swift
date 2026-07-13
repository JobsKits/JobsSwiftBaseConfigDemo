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
import JobsSwiftSearcher
import JobsSwiftDSL
import JobsScale
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class JobsSwiftSearcherDemoVC: BaseVC {

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
        view.byBackgroundColor(UIColor(hex: 0xF6F8FC))
        jobsSetupGKNav(title: "JobsSwiftSearcher")
        searchView.byVisible(true)
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
