//
//  JobsIconfontGlyphDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import GKNavigationBarSwift
import JobsByUIKit
import JobsIconfont
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsIconfontGlyphDemoVC: BaseVC {
    private let glyphs = JobsIconfontGlyph.allCases

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(64)
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
        jobsSetupGKNav(title: "Icon Font / Unicode / UIImage".tr)
        tableView.byVisible(true)
    }
}

extension JobsIconfontGlyphDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        glyphs.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let glyph = glyphs[indexPath.row]
        let cell = tableView.byDequeueReusableCell(
            withType: UITableViewCell.self,
            for: indexPath
        )
        var config = cell.defaultContentConfiguration()
        config.image = JobsIconfont.shared.iconImage(
            glyph,
            size: CGSize(width: 38, height: 38),
            color: JobsCor.systemIndigo
        )
        config.text = glyph.title
        config.secondaryText = "语义枚举 → UILabel / UIButton / UIImage"
        config.textProperties.font = JobsFont.systemFont(ofSize: 16, weight: .semibold)
        config.secondaryTextProperties.font = JobsFont.systemFont(ofSize: 12, weight: .regular)
        cell.contentConfiguration = config
        return cell
    }
}
