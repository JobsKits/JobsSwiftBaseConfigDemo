//
//  Demo@直播间滚动留言模块.swift
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
import IQKeyboardManagerSwift
import GKNavigationBarSwift

final class LiveCommentDemoVC: BaseVC {
    private static let inputBarBottomSpacing: CGFloat = 8

    // Data
    private var data: [LiveMsg] = [
        .init(text: "欢迎来到直播间～"),
        .init(text: "礼貌发言，气氛更好 😄")
    ]
    // 底部输入条：只跟随键盘顶部，不带动页面其它内容
    private lazy var accessory: LiveInputBar = {
        LiveInputBar()
            .onSend { [weak self] text in
                guard let self else { return }
                self.appendMessage(text)
            }
            .byAutoClearAfterSend(true)
            .byAutoResignAfterSend(false)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.keyboardLayoutGuide.snp.top)
                    .offset(-Self.inputBarBottomSpacing)
            }
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(LiveMsgCell.self)
            .bySeparatorStyle(.none)
            .byKeyboardDismissMode(.interactive)
            .byNoContentInsetAdjustment()
            .byContentInsetBottom(LiveInputBar.preferredHeight + Self.inputBarBottomSpacing)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview()
                }
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        disableIQKeyboardDistanceHandling()
        jobsSetupGKNav(
            title: "直播间留言".tr
        )
        accessory.byVisible(YES)
        tableView.byVisible(YES)
        view.byBringToFront(accessory)
        DispatchQueue.main.async { [weak self] in
            self?.scrollToBottom(false)
        }
    }

    /// 该页由 keyboardLayoutGuide 管理输入条，避免 IQKeyboardManager 整体平移根视图。
    private func disableIQKeyboardDistanceHandling() {
        let manager = IQKeyboardManager.shared
        let currentType = ObjectIdentifier(LiveCommentDemoVC.self)
        guard !manager.disabledDistanceHandlingClasses.contains(where: {
            ObjectIdentifier($0) == currentType
        }) else { return }
        manager.disabledDistanceHandlingClasses.append(LiveCommentDemoVC.self)
    }

    private func appendMessage(_ text: String) {
        let new = LiveMsg(text: text)
        let newRow = data.count
        data.append(new)
        tableView.performBatchUpdates({
            tableView.insertRows(at: [IndexPath(row: newRow, section: 0)], with: .none)
        }, completion: { [weak self] _ in
            guard let self else { return }
            self.tableView.layoutIfNeeded()
            self.scrollToBottom(false)
            let ip = IndexPath(row: newRow, section: 0)
            if let cell = self.tableView.cellForRow(at: ip) as? LiveMsgCell {
                cell.playAppearAnimation()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
                    guard let self,
                          let c = self.tableView.cellForRow(at: ip) as? LiveMsgCell else { return }
                    c.playAppearAnimation()
                }
            }
        })
    }

    private func scrollToBottom(_ animated: Bool) {
        guard !data.isEmpty else { return }
        tableView.layoutIfNeeded()
        let ip = IndexPath(row: data.count - 1, section: 0)
        tableView.scrollToRow(at: ip, at: .bottom, animated: animated)
    }
}
// MARK: —— UITableViewDataSource & UITableViewDelegate
extension LiveCommentDemoVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        (tableView.dequeueReusableCell(
            withIdentifier: LiveMsgCell.className,
            for: indexPath
        ) as! LiveMsgCell).configure(data[indexPath.row])
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
}
