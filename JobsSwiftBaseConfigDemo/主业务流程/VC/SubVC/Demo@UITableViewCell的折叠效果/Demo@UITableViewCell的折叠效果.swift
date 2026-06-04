//
//  Demo@UITableViewCell的折叠效果.swift
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

import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class FoldTableDemoVC: BaseVC {
    private struct Row {
        let title: String
        let subtitle: String
        let detail: String
    }
    // 高度：collapsed = header + 上下 inset
    private let collapsedHeight: CGFloat = FoldCell.headerHeight + FoldCell.verticalInset * 2
    private let expandedHeight: CGFloat  = 260
    private var expanded = Set<IndexPath>()
    private let rows: [Row] = (0..<20).map {
        Row(
            title: "Row \($0)",
            subtitle: "Tap to fold / unfold",
            detail: "展开区域内容（可换成任意自定义 UI）\n\nIndex = \($0)"
        )
    }
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byBackgroundColor(.clear)
            .bySeparatorStyle(.none)
            .byContentInset(UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0))
            .byRegisterCell(FoldCell.self)
            .byDataSource(self)
            .byDelegate(self)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalTo(self.view.safeAreaLayoutGuide)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "UITableViewCell的折叠效果")
        tableView.byVisible(YES)
    }
}

extension FoldTableDemoVC {
    /// 统一的展开/收起切换逻辑（cell 点击、按钮点击都走这里）
    private func toggle(at indexPath: IndexPath) {
        let willExpand = !expanded.contains(indexPath)
        if willExpand { expanded.insert(indexPath) } else { expanded.remove(indexPath) }

        if let cell = tableView.cellForRow(at: indexPath) as? FoldCell {
            cell.setExpanded(willExpand, animated: true)
        }
        /// 让 tableView 重新计算该行高度
        tableView.performBatchUpdates(nil, completion: nil)
    }
    /// 全部展开
    func expandAll(animated: Bool = true) {
        // 1) 生成所有行的 indexPath（按你的数据源来）
        var all = Set<IndexPath>()
        let sections = tableView.numberOfSections
        for section in 0..<sections {
            let rows = tableView.numberOfRows(inSection: section)
            for row in 0..<rows {
                all.insert(IndexPath(row: row, section: section))
            }
        }
        // 2) 写入状态
        expanded = all
        // 3) 同步可见 cell 的 UI（避免等复用才更新）
        for cell in tableView.visibleCells {
            guard let foldCell = cell as? FoldCell,
                  let _ = tableView.indexPath(for: foldCell) else { continue }
            foldCell.setExpanded(true, animated: animated)
        }
        // 4) 触发高度重算
        tableView.performBatchUpdates(nil, completion: nil)
    }
    /// 全部收起
    func collapseAll(animated: Bool = true) {
        // 1) 清空状态
        expanded.removeAll()
        // 2) 同步可见 cell 的 UI
        for cell in tableView.visibleCells {
            guard let foldCell = cell as? FoldCell else { continue }
            foldCell.setExpanded(false, animated: animated)
        }
        // 3) 触发高度重算
        tableView.performBatchUpdates(nil, completion: nil)
    }
}

extension FoldTableDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoldCell = tableView.byDequeueReusableCell(withType: FoldCell.self,for: indexPath) // 自动注册&复用 :contentReference[oaicite:1]{index=1}
        let r = rows[indexPath.row]
        let isExpanded = expanded.contains(indexPath)
        return cell.byData(title: r.title,
                           subtitle: r.subtitle,
                           detail: r.detail,
                           expanded: isExpanded)
    }
}

extension FoldTableDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        expanded.contains(indexPath) ? expandedHeight : collapsedHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.toggle(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
