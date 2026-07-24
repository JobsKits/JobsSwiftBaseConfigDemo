//
//  Demo@时时彩.swift
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
import JobsSwiftTimer
import JobsSwiftTimerMgr
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

final class JobsMultiTimerTableDemoVC: BaseVC {
    deinit {
        // VC 释放时兜底清理（避免离场后 timer 还在跑）
        let ids = data.map { $0.timerIdentifier }
        Task {
            for id in ids {
                await JobsSwiftTimerMgr.shared.stopAndRemove(identifier: id)
            }
        }
    }

    private let rowHeight: CGFloat = 56
    private var data: [JobsCountdownItem] = []

    private lazy var navigationMainTitleLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.8)
            .byLineBreakMode(.byClipping)
    }()

    private lazy var navigationSubTitleLabel: UILabel = {
        UILabel()
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 11, weight: .regular))
            .byTextAlignment(.center)
            .byNumberOfLines(1)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.75)
            .byLineBreakMode(.byClipping)
    }()

    private lazy var navigationTitleView: UIStackView = {
        UIStackView()
            .byAxis(.vertical)
            .byAlignment(.center)
            .byDistribution(.fill)
            .bySpacing(1)
            .byAddArrangedSubviews([
                navigationMainTitleLabel,
                navigationSubTitleLabel
            ])
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .bySeparatorStyle(.singleLine)
            .byRowHeight(rowHeight)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(JobsCountdownCell.self) // ✅ 修正：注册真正使用的 cell
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    // ============================== Life Cycle ==============================
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.byVisible(YES)
        data = (0..<60).map { i in
            let remain = Int.random(in: 8...300)                 // 每行剩余时间不同
            let tick = [0.5, 1.0, 1.0, 2.0].randomElement()!     // tick 间隔不同
            return JobsCountdownItem(
                id: UUID().uuidString,
                title: "Row #\(i)  (tick:\(tick)s, remain:\(remain)s)",
                endAt: Date().addingTimeInterval(TimeInterval(remain)),
                tickInterval: tick
            )
        }
        tableView.reloadData()
    }

    private func setupNavigationBar() {
        let inheritedTitle = title?.trimmingCharacters(in: .whitespacesAndNewlines)
        let fullTitle = inheritedTitle?.isEmpty == false
            ? inheritedTitle ?? "时时彩".tr
            : "时时彩".tr
        let titleParts = fullTitle.split(separator: "@",
                                         maxSplits: 1,
                                         omittingEmptySubsequences: false)
        let mainTitle = String(titleParts[0]).trimmingCharacters(in: .whitespacesAndNewlines)
        let subTitle = titleParts.count > 1
            ? String(titleParts[1]).trimmingCharacters(in: .whitespacesAndNewlines)
            : ""
        navigationMainTitleLabel.byText(mainTitle)
        navigationSubTitleLabel
            .byText(subTitle)
            .byVisible(!subTitle.isEmpty)
        jobsSetupGKNav(title: fullTitle)
        gk_navTitleView = navigationTitleView
    }
}
// MARK: - UITableViewDataSource / UITableViewDelegate
extension JobsMultiTimerTableDemoVC: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView
            .byDequeueReusableCell(withType: JobsCountdownCell.self, for: indexPath)
            .byData(data[indexPath.row])
    }

    public func tableView(_ tableView: UITableView,
                          didEndDisplaying cell: UITableViewCell,
                          forRowAt indexPath: IndexPath) {
        // 离屏就停（省资源）；再次出现会按 endAt 计算，显示依然准确
        (cell as? JobsCountdownCell)?.stopTimerIfNeeded()
    }
}
