//
//  HomeLinkageDemoListVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class HomeLinkageDemoListVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case cashback
        case linkageMenu
        var title: String {
            switch self {
            /// 处理 .cashback 分支
            case .cashback: return "🏠 首页联动"
            /// 处理 .linkageMenu 分支
            case .linkageMenu: return "🧭 首页联动切换子页面@Pod"
            }
        }
        var subtitle: String {
            switch self {
            /// 处理 .cashback 分支
            case .cashback: return "JXSegmentedView 页签联动示例"
            /// 处理 .linkageMenu 分支
            case .linkageMenu: return "JobsSwiftLinkageMenuView 子页面切换示例"
            }
        }
        var vcType: UIViewController.Type {
            switch self {
            /// 处理 .cashback 分支
            case .cashback: return CashbackRootVC.self
            /// 处理 .linkageMenu 分支
            case .linkageMenu: return JobsSwiftLinkageMenuViewDemoVC.self
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(78)
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "首页联动".tr)
        tableView.byVisible(YES)
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension HomeLinkageDemoListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.allCases[indexPath.row]
        let cell = tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byAccessoryType(.disclosureIndicator)
        var config = cell.defaultContentConfiguration()
        config.text = row.title
        config.secondaryText = row.subtitle
        config.textProperties.font = JobsFont.systemFont(ofSize: 17, weight: .semibold)
        config.secondaryTextProperties.font = JobsFont.systemFont(ofSize: 13, weight: .regular)
        config.secondaryTextProperties.numberOfLines = 0
        cell.contentConfiguration = config
        return cell
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Row.allCases[indexPath.row].vcType.init().byPush(self)
    }
}
