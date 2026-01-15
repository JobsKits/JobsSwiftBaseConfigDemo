//
//  FoldTableDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/16/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsByUIKit

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
            .byBgColor(.clear)
            .bySeparatorStyle(.none)
            .byContentInset(UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0))
            .registerCell(FoldCell.self)
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

extension FoldTableDemoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoldCell = tableView.py_dequeueReusableCell(withType: FoldCell.self,for: indexPath) // 自动注册&复用 :contentReference[oaicite:1]{index=1}
        let r = rows[indexPath.row]
        let isExpanded = expanded.contains(indexPath)
        return cell.configure(title: r.title, subtitle: r.subtitle, detail: r.detail, expanded: isExpanded)
    }
}

extension FoldTableDemoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        expanded.contains(indexPath) ? expandedHeight : collapsedHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let willExpand = !expanded.contains(indexPath)
        if willExpand { expanded.insert(indexPath) } else { expanded.remove(indexPath) }

        if let cell = tableView.cellForRow(at: indexPath) as? FoldCell {
            cell.setExpanded(willExpand, animated: true)
        }

        tableView.performBatchUpdates(nil, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
