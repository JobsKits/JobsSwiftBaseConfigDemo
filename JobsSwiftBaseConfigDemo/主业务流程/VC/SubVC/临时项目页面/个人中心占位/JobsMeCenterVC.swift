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
    
    enum Row: Int, CaseIterable {
        case userInfo
        case crashLog
        case favorites
        case settings
        case about

        var title: String {
            switch self {
            case .userInfo:  return "用户信息".tr
            case .crashLog:  return "崩溃日志".tr
            case .favorites: return "收藏".tr
            case .settings:  return "设置".tr
            case .about:     return "关于".tr
            }
        }

        var symbolName: String {
            switch self {
            case .userInfo:  return "person.text.rectangle"
            case .crashLog:  return "exclamationmark.triangle"
            case .favorites: return "star"
            case .settings:  return "gearshape"
            case .about:     return "info.circle"
            }
        }
    }

    private lazy var headerView: UIView = {
        UIView().byBackgroundColor(JobsCor.systemBackground)
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
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
        view.byBackgroundColor(JobsCor.systemGray6)
        tableView.byVisible(YES)
    }
}

extension JobsMeCenterVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row(rawValue: indexPath.row)!
        let cell = tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText(row.title)
            .byImage(row.symbolName.sysImg.withRenderingMode(.alwaysTemplate))
            .byAccessoryType(.disclosureIndicator)
            .byBackgroundColor(JobsCor.clear)
        cell.contentView.byBackgroundColor(JobsCor.clear)
        if #available(iOS 14.0, *) {
            cell.byBackgroundConfiguration { backgroundConfiguration in
                backgroundConfiguration.backgroundColor = JobsCor.clear
                backgroundConfiguration.cornerRadius = 0
            }
        }
        cell.textLabel?
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .regular))
        cell.imageView?
            .byTintColor(JobsCor.secondaryLabel)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch Row(rawValue: indexPath.row)! {
        case .userInfo:
            JobsSwiftUserInfoVC().byPush(self)
        case .crashLog:
            CrashLogDemoVC().byPush(self)
        case .favorites:
            "收藏".tr.toast
            // FavoritesVC().byPush(self)
        case .settings:
            "设置".tr.toast
            // SettingsVC().byPush(self)
        case .about:
            "关于".tr.toast
            // AboutVC().byPush(self)
        }
        jobsSideDrawer?.closeDrawer(animated: true)
    }
}
