//
//  SubVC.swift
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

import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

// MARK: - 示例子页（简化）
final class HomeVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "首页".tr)
    }
}

final class DiscountVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemMint)
        jobsSetupGKNav(title: "优惠".tr)
    }
}

final class WalletVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemYellow)
        jobsSetupGKNav(title: "钱包".tr)
    }
}

final class FriendsVC: BaseVC {
    private lazy var exampleButton: UIButton = {
        UIButton.sys()
            .byTitle("显示".tr, for: .normal)
            .byTitle("隐藏".tr, for: .selected)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleColor(JobsCor.systemRed, for: .selected)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] sender in
                guard let self else { return }
                DemoDetailVC()
                    .byData(DemoModel(id: 7, title: "详情".tr))
                    .onResult { id in
                        print("回来了 id=\(String(describing: id))")
                    }
                    .byPush(self)
                    .byCompletion{
                        print("❤️结束❤️")
                    }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
                make.center.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(44)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemTeal)
        jobsSetupGKNav(title: "好友".tr)
        exampleButton.byAlpha(1)
    }
}

final class ActivityVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemPurple)
        jobsSetupGKNav(title: "活动".tr)
    }
}

final class ServiceVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemOrange)
        jobsSetupGKNav(title: "客服".tr)
    }
}
