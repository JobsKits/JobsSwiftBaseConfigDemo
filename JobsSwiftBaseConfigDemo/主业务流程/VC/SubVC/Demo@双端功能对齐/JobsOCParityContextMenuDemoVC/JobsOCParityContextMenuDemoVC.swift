//
//  JobsOCParityContextMenuDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsToast
import GKNavigationBarSwift
import SnapKit

final class JobsContextMenuDemoVC: BaseVC {

    private let venues = [
        "DG體育",
        "DG真人",
        "DG電子",
        "DG彩票",
        "DG棋牌",
        "DA電子"
    ]

    private var selectedIndex = 0

    private lazy var headerLabel: UILabel = {
        UILabel()
            .byText("選擇場館".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.clear)
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(58)
            .byScrollEnabled(false)
            .byBackgroundColor(JobsCor.systemBackground)
            .byTableFooterView(UIView())
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "3D Touch / Context Menu".tr)
        tableView.byVisible(YES)
    }
}

extension JobsContextMenuDemoVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        venues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "JobsContextMenuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        cell.textLabel?
            .byText(venues[indexPath.row])
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
        cell.accessoryType = indexPath.row == selectedIndex ? .checkmark : .disclosureIndicator
        cell.tintColor = JobsCor.systemRed
        cell.selectionStyle = .none
        return cell.byBackgroundColor(JobsCor.secondarySystemGroupedBackground)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.byReloadData()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerLabel
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        54
    }

    func tableView(
        _ tableView: UITableView,
        contextMenuConfigurationForRowAt indexPath: IndexPath,
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(
            identifier: indexPath as NSIndexPath,
            previewProvider: {
                JobsContextMenuPreviewVC(row: indexPath.row)
            },
            actionProvider: { _ in
                let action1 = UIAction(title: "Action 1", image: "1.circle".sysImg) { _ in
                    "Action 1 · \(self.venues[indexPath.row])".toast
                }
                let action2 = UIAction(title: "Action 2", image: "2.circle".sysImg) { _ in
                    "Action 2 · \(self.venues[indexPath.row])".toast
                };return UIMenu(title: self.venues[indexPath.row], children: [action1, action2])
            }
        )
    }
}

private final class JobsContextMenuPreviewVC: BaseVC {

    private let row: Int

    private lazy var previewLabel: UILabel = {
        UILabel()
            .byText("Preview for row \(row)")
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byAddTo(view) { make in
                make.center.equalToSuperview()
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    init(row: Int) {
        self.row = row
        super.init(nibName: nil, bundle: nil)
        preferredContentSize = CGSize(width: 220, height: 160)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view
            .byBackgroundColor(JobsCor.systemBackground)
            .byCornerRadius(14)
        previewLabel.byVisible(YES)
    }
}
