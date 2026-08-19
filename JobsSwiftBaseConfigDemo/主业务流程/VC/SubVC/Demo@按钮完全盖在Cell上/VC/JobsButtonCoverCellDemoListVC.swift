//
//  JobsButtonCoverCellDemoListVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
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
import SnapKit

final class JobsButtonCoverCellDemoListVC: BaseVC {
    private enum Row: Int, CaseIterable {
        case tableView
        case collectionView

        var title: String {
            switch self {
            /// 处理 UITableViewCell 表现形式
            case .tableView: return "UITableViewCell 形式".tr
            /// 处理 UICollectionViewCell 表现形式
            case .collectionView: return "UICollectionViewCell 形式".tr
            }
        }

        var subtitle: String {
            switch self {
            /// 说明 UITableViewCell 的整面按钮覆盖效果
            case .tableView: return "按钮完整覆盖 UITableViewCell，Cell 负责列表排布".tr
            /// 说明 UICollectionViewCell 的整面按钮覆盖效果
            case .collectionView: return "按钮完整覆盖 UICollectionViewCell，Cell 负责网格排布".tr
            }
        }

        var vcType: UIViewController.Type {
            switch self {
            /// 跳转 UITableViewCell 具体 Demo
            case .tableView: return BtnFullOnTBVCellDemoVC.self
            /// 跳转 UICollectionViewCell 具体 Demo
            case .collectionView: return BtnFullOnCVCellDemoVC.self
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
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "按钮完全覆盖在 Cell 上".tr)
        tableView.byVisible(YES)
    }
}
// MARK: —— UITableViewDataSource, UITableViewDelegate
extension JobsButtonCoverCellDemoListVC: UITableViewDataSource, UITableViewDelegate {
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
        Row.allCases[indexPath.row].vcType.init().byPush(self)
    }
}
