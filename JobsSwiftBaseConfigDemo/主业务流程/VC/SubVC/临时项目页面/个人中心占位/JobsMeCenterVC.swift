//
//  JobsMeCenterVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
import JobsViewPush
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class JobsMeCenterVC: BaseVC {

    enum Row: Int,
              CaseIterable {

        case userInfo
        case crashLog
        case recent
        case settings
        case about
        var title: String {
            switch self {
            /// 处理 .userInfo 分支
            case .userInfo:
                return "用户信息".tr
            /// 处理 .crashLog 分支
            case .crashLog:
                return "崩溃日志".tr
            /// 最近使用复用首页真实注册表。
            case .recent:
                return "最近使用".tr
            /// 处理 .settings 分支
            case .settings:
                return "设置".tr
            /// 处理 .about 分支
            case .about:
                return "关于".tr
            }
        }
        var symbolName: String {
            switch self {
            /// 处理 .userInfo 分支
            case .userInfo:
                return "person.text.rectangle"
            /// 处理 .crashLog 分支
            case .crashLog:
                return "exclamationmark.triangle"
            /// 最近使用。
            case .recent:
                return "clock.arrow.circlepath"
            /// 处理 .settings 分支
            case .settings:
                return "gearshape"
            /// 处理 .about 分支
            case .about:
                return "info.circle"
            }
        }
    }

    private lazy var headerView: UIView = {
        UIView
            .jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBackground)
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero,
                    style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .bySeparatorStyle(.none)
            .byRowHeight(64)
            .byEstimatedRowHeight(0)
            .byEstimatedSectionHeaderHeight(0)
            .byEstimatedSectionFooterHeight(0)
            .bySectionHeaderTopPadding(0)
            .byShowsVerticalScrollIndicator(false)
            .byShowsHorizontalScrollIndicator(false)
            .byContentInsetAdjustmentBehavior(.never)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        tableView.byVisible(YES)
    }
}

extension JobsMeCenterVC: UITableViewDataSource,
                          UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row(rawValue: indexPath.row)!
        return tableView
            .byDequeueReusableCell(withType: UITableViewCell.self,
                                   for: indexPath)
            .byText(row.title)
            .byAccessibilityIdentifier("JobsMeCenter.\(row)")
            .byImage(row.symbolName.sysImg.withRenderingMode(.alwaysTemplate))
            .byAccessoryType(.disclosureIndicator)
            .byBackgroundColor(JobsCor.clear)
            .byContentView {
                $0.byBackgroundColor(JobsCor.clear)
            }
            .byTitleCor(JobsCor.label)
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .regular))
            .byImageView {
                $0.byTintColor(JobsCor.secondaryLabel)
            }
            .byBackgroundConfiguration { backgroundConfiguration in
                backgroundConfiguration.backgroundColor = JobsCor.clear
                backgroundConfiguration.cornerRadius = 0
            }
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
        switch Row(rawValue: indexPath.row)! {
        /// 处理 .userInfo 分支
        case .userInfo:
            JobsSwiftUserInfoVC()
                .byPush(self)
        /// 处理 .crashLog 分支
        case .crashLog:
            CrashLogDemoVC()
                .byPush(self)
        /// 最近使用真实页面。
        case .recent:
            let registry = findDemoRegistry(in: view.window?.rootViewController)
            RootRecentDemosVC()
                .byCatalogProvider { [weak registry] in
                    registry?.recentDemoItems() ?? []
                }
                .byPush(self)
        case .settings:
            "设置".tr.toast
        /// SettingsVC().byPush(self)
        case .about:
            "关于".tr.toast
        // AboutVC().byPush(self)
        }
        jobsSideDrawer?.closeDrawer(animated: true)
    }

    private func findDemoRegistry(in controller: UIViewController?) -> RootListVC? {
        guard let controller else {
            return nil
        }
        if let root = controller as? RootListVC {
            return root
        }
        for child in controller.children {
            if let root = findDemoRegistry(in: child) {
                return root
            }
        }
        return nil
    }
}
