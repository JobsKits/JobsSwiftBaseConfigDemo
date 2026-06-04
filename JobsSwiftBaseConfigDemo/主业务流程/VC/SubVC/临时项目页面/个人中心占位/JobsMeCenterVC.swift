//
//  JobsMeCenterVC.swift
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
import JobsSwiftBaseDefines
import JobsToast
import SnapKit
import GKNavigationBarSwift

final class JobsMeCenterVC: BaseVC {
    
    enum Row: Int, CaseIterable {
        case profile
        case favorites
        case settings
        case about

        var title: String {
            switch self {
            case .profile:   return "崩溃日志".tr
            case .favorites: return "收藏".tr
            case .settings:  return "设置".tr
            case .about:     return "关于".tr
            }
        }
    }

    private lazy var headerView: UIView = {
        UIView().byBackgroundColor(.systemBackground)
    }()

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { make in
                make.edges.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.byVisible(YES)
    }
}

extension JobsMeCenterVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Row.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView
            .byDequeueReusableCell(withType: UITableViewCell.self, for: indexPath)
            .byText(Row(rawValue: indexPath.row)?.title)
            .byAccessoryType(.disclosureIndicator)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 64 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch Row(rawValue: indexPath.row)! {
        case .profile:
            CrashLogDemoVC().byPush(self)
        case .favorites:
            "收藏".toast
            // FavoritesVC().byPush(self)
        case .settings:
            "设置".toast
            // SettingsVC().byPush(self)
        case .about:
            "关于".toast
            // AboutVC().byPush(self)
        }
        jobsSideDrawer?.closeDrawer(animated: true)
    }
}
