//
//  UITableViewCellCornerDemoVC.swift
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

import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

// MARK: - UITableViewCellCornerDemoVC
final class UITableViewCellCornerDemoVC: BaseVC {
    private let rowsPerSection: [Int] = [1, 3, 5, 2] // 用来演示 single/first/middle/last

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(DemoInsetRoundTableViewCell.self)
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)
            .byNoSectionHeaderTopPadding()
            .byBackgroundColor(JobsCor.systemGroupedBackground)
            .byContentInsetTop(12)
            .byExpandVerticalScrollDistance(200.h)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "UITableViewCell切圆角方案".tr)
        tableView.byVisible(YES)
    }

    private func sectionPosition(for indexPath: IndexPath,
                                 in tableView: UITableView) -> SectionCellPosition {
        let rows = tableView.numberOfRows(inSection: indexPath.section)
        if rows == 1 { return .single }
        if indexPath.row == 0 { return .first }
        if indexPath.row == rows - 1 { return .last };return .middle
    }
}
// MARK: - UITableViewDataSource
extension UITableViewCellCornerDemoVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowsPerSection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowsPerSection[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = sectionPosition(for: indexPath, in: tableView)
        return tableView
            .byDequeueReusableCell(withType: DemoInsetRoundTableViewCell.self, for: indexPath)
            .bySelectionStyle(.default)
            .byContentConfiguration({ cfg in
                cfg = cfg
                    .byText("Section \(indexPath.section) · Row \(indexPath.row)")
                    .bySecondaryText("左右边距 24 · 圆角 18")
            })
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 17))
            .byDetailTitleFont(JobsFont.systemFont(ofSize: 13))
            .byTitleCor(JobsCor.label)
            .byDetailTitleCor(JobsCor.secondaryLabel)
            .bySectionPosition(position)
    }
}
// MARK: - UITableViewDelegate
extension UITableViewCellCornerDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        76
    }

    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        20
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.byDeselectRow(indexPath)
        print("点选逻辑：\(indexPath)")
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section) (\(rowsPerSection[section]) rows)"
    }
}
