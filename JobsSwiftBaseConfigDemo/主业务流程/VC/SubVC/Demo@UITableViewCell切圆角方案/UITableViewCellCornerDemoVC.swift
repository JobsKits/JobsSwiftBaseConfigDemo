//
//  UITableViewCellCornerDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/2/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsScale
import JobsByUIKit
import JobsSwiftBaseDefines
// MARK: - UITableViewCellCornerDemoVC
final class UITableViewCellCornerDemoVC: UIViewController {

    private var rowsPerSection: [Int] = [1, 3, 5, 2] // 用来演示 single/first/middle/last

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(DemoInsetRoundTableViewCell.self) // ✅ 注册我们自己的 cell
            .byNoContentInsetAdjustment()
            .bySeparatorStyle(.none)               // ✅ 卡片风格建议关掉系统分割线
            .byNoSectionHeaderTopPadding()
            .byContentInsetTop(8)
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
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "UITableViewCell切圆角方案")
        tableView.byVisible(YES)
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
        tableView
            .byDequeueReusableCell(withType: DemoInsetRoundTableViewCell.self, for: indexPath)
            .bySelectionStyle(.default)
            .byContentConfiguration({ cfg in
                cfg = cfg
                    .byText("Section \(indexPath.section) · Row \(indexPath.row)")
                    .bySecondaryText("inset: 16, corner: 8")
            })
    }
}
// MARK: - UITableViewDelegate
extension UITableViewCellCornerDemoVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("点选逻辑：\(indexPath)")
    }
    /// ✅ 关键：cell 不知道自己在 section 的位置，所以在 willDisplay 里“告诉它”
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        // 只处理我们 demo 的 cell
        guard let c = cell as? DemoInsetRoundTableViewCell else { return }

        let rows = tableView.numberOfRows(inSection: indexPath.section)

        let position: SectionCellPosition
        if rows == 1 {
            position = .single
        } else if indexPath.row == 0 {
            position = .first
        } else if indexPath.row == rows - 1 {
            position = .last
        } else {
            position = .middle
        }
        // ✅ 每次展示都应用一次，解决复用残留问题
        c.applySectionCorners(position)
    }
    // 可选：section header（演示用）
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section) (\(rowsPerSection[section]) rows)"
    }
}
