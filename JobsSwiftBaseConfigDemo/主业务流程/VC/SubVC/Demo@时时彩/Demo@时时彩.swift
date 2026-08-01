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
        JobsSwiftTimerMgr.shared.stopAndRemove(scopeIdentifier: timerScopeIdentifier)
    }

    private let rowHeight: CGFloat = 56
    private let timerScopeIdentifier = "com.jobs.demo.countdown.\(UUID().uuidString)"
    private var data: [JobsCountdownItem] = []
    private var isWisdomListVisible = false
    private weak var wisdomTableViewIdentity: UITableView?
    private let wisdomItems: [(title: String, detail: String)] = [
        (
            "一对一的逻辑关系",
            "Cell 一次只绑定一个 Model；每个 Model 用稳定 identifier 对应一个逻辑 Timer。VC 不是只有一个 Timer。"
        ),
        (
            "TimerMgr 才是物理托管者",
            "Timer 统一登记到 TimerMgr；VC 只持有一个 scopeIdentifier，用它管理这一页的整组 Timer。"
        ),
        (
            "绝对时间才是真值",
            "Model 保存 endAt，剩余时间永远由 endAt - 当前时间计算；Timer 只负责触发刷新，因此暂停、卡顿和离屏都不会造成累计漂移。"
        ),
        (
            "复用必须先解绑旧关系",
            "Cell 绑定新 Model 前，旧绑定关系必须失效；回调按 identifier 定位当前 Model 与可见 Cell，旧回调不能污染复用后的新内容。"
        ),
        (
            "精准取消，而不是只看 ID",
            "清理时同时比对 identifier 与 expectedTimer 实例，旧清理请求不会误杀同 ID 的替换 Timer。"
        ),
        (
            "生命周期按 Scope 治理",
            "页面离场统一 pause，返回统一 resume，VC 释放统一 stopAndRemove；单个 Cell 不负责整页生命周期。"
        ),
        (
            "Model 先变，UI 后刷新",
            "倒计时先从 Model 的 endAt 计算，再只刷新当前可见 Cell；Cell 是展示层，不是业务时间的唯一保存者。"
        )
    ]

    private lazy var wisdomActionButton: UIButton = {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 44, height: 44))
            .byTitle("查看设计智慧".tr, for: .normal)
            .byTitleColor(JobsCor.label, for: .normal)
            .onTap { [weak self] _ in
                self?.showWisdomList()
            }
    }()

    private lazy var wisdomOverlayView: UIView = {
        UIView()
            .byBackgroundColor(UIColor(white: 0, alpha: 0.35))
            .byHidden(true)
            .byAddTo(view) { [unowned self] make in
                make.left.right.bottom.equalToSuperview()
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var wisdomTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        wisdomTableViewIdentity = tableView
        return tableView
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(92)
            .byDataSource(self)
            .byDelegate(self)
            .byCornerRadius(16)
            .byClipsToBounds()
            .byAddTo(wisdomOverlayView) { make in
                make.edges.equalToSuperview().inset(16)
            }
    }()

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
        bindWisdomTheme()
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

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        JobsSwiftTimerMgr.shared.resume(scopeIdentifier: timerScopeIdentifier)
        tableView.reloadData()
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideWisdomList()
        JobsSwiftTimerMgr.shared.pause(scopeIdentifier: timerScopeIdentifier)
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
        jobsSetupGKNav(
            title: fullTitle,
            rightButtons: [wisdomActionButton]
        )
        gk_navTitleView = navigationTitleView
    }

    private func showWisdomList() {
        isWisdomListVisible = true
        wisdomOverlayView
            .byBackgroundColor(UIColor(white: 0, alpha: 0.35))
            .byHidden(false)
        wisdomTableView
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .reloadData()
        view.bringSubviewToFront(wisdomOverlayView)
    }

    private func hideWisdomList() {
        guard isWisdomListVisible else { return }
        isWisdomListVisible = false
        wisdomOverlayView.byHidden(true)
    }

    private func bindWisdomTheme() {
        JobsThemeCenter.shared.bind(
            self,
            slot: "JobsMultiTimerTableDemoVC.wisdomList"
        ) { object, _ in
            guard let viewController = object as? JobsMultiTimerTableDemoVC,
                  viewController.isWisdomListVisible else { return }
            viewController.wisdomTableView
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .reloadData()
        }
    }
}
// MARK: - UITableViewDataSource / UITableViewDelegate
extension JobsMultiTimerTableDemoVC: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView === wisdomTableViewIdentity ? wisdomItems.count + 1 : data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === wisdomTableViewIdentity {
            let reuseIdentifier = "JobsMultiTimerWisdomCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ??
                UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
            let isCloseRow = indexPath.row == wisdomItems.count
            if isCloseRow {
                cell.textLabel?
                    .byText("关闭".tr)
                    .byTextColor(JobsCor.systemBlue)
                    .byTextAlignment(.center)
                    .byFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
                cell.detailTextLabel?.byText(nil)
                cell.selectionStyle = .default
            } else {
                let item = wisdomItems[indexPath.row]
                cell.textLabel?
                    .byText(item.title.tr)
                    .byTextColor(JobsCor.label)
                    .byTextAlignment(.left)
                    .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
                    .byNumberOfLines(1)
                cell.detailTextLabel?
                    .byText(item.detail.tr)
                    .byTextColor(JobsCor.secondaryLabel)
                    .byTextAlignment(.left)
                    .byFont(JobsFont.systemFont(ofSize: 12, weight: .regular))
                    .byNumberOfLines(0)
                cell.selectionStyle = .none
            }
            cell.byBackgroundColor(JobsCor.systemBackground)
            return cell
        };return tableView
            .byDequeueReusableCell(withType: JobsCountdownCell.self, for: indexPath)
            .byData(data[indexPath.row], scopeIdentifier: timerScopeIdentifier)
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView === wisdomTableViewIdentity ? "时时彩 Demo 的设计智慧".tr : nil
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableView === wisdomTableViewIdentity
            ? "记住：VC 只有一个 Scope，不是只有一个 Timer。".tr
            : nil
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView === wisdomTableViewIdentity,
              indexPath.row == wisdomItems.count else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        hideWisdomList()
    }

    public func tableView(_ tableView: UITableView,
                          didEndDisplaying cell: UITableViewCell,
                          forRowAt indexPath: IndexPath) {
        guard tableView === self.tableView else { return }
        // 离屏就停（省资源）；再次出现会按 endAt 计算，显示依然准确
        (cell as? JobsCountdownCell)?.stopTimerIfNeeded()
    }
}
