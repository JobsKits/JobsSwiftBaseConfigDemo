//
//  Demo@钱包卡片效果.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsScale
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsWalletCard
import SnapKit

final class JobsWalletDemoVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case individual
        case all

        var title: String {
            switch self {
            case .individual: return "只开合点击的卡片".tr
            case .all: return "开合全部卡片".tr
            }
        }

        var subtitle: String {
            switch self {
            case .individual: return "点击哪一张，只展开或收起该卡片。".tr
            case .all: return "点击任意卡片，统一展开或收起全部卡片。".tr
            }
        }

        var expansionMode: JobsWalletCardExpansionMode {
            switch self {
            case .individual: return .individual
            case .all: return .all
            }
        }
    }

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(86.h)
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(
            title: "钱包卡片效果".tr
        )
        tableView.byVisible(YES)
    }
}
// MARK: - UITableViewDataSource, UITableViewDelegate
extension JobsWalletDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.allCases[indexPath.row]
        return tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byAccessoryType(.disclosureIndicator)
            .byListConfig {
                $0.byText(row.title)
                    .bySecondaryText(row.subtitle)
                    .byTextFont(JobsFont.systemFont(ofSize: 17, weight: .semibold))
                    .bySecondaryFont(JobsFont.systemFont(ofSize: 13, weight: .regular))
                    .bySecondaryLines(0)
            }
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = Row.allCases[indexPath.row]
        JobsWalletCardEffectDemoVC(
            expansionMode: row.expansionMode,
            navigationTitle: row.title
        ).byPush(self)
    }
}
