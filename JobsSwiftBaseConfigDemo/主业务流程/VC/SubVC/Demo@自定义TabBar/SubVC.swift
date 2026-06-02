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

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
// MARK: - 示例子页（简化）
final class HomeVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "首页")
    }
}

final class DiscountVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        jobsSetupGKNav(title: "优惠")
    }
}

final class WalletVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        jobsSetupGKNav(title: "钱包")
    }
}

final class FriendsVC: BaseVC {
    private lazy var exampleButton: UIButton = {
        UIButton(type: .system)
            .byTitle("显示", for: .normal)
            .byTitle("隐藏", for: .selected)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleColor(.systemRed, for: .selected)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .onTap { [weak self] sender in
                guard let self else { return }
                DemoDetailVC()
                    .byData(DemoModel(id: 7, title: "详情"))
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
        view.backgroundColor = .systemTeal
        jobsSetupGKNav(title: "好友")
        exampleButton.byAlpha(1)
    }
}

final class ActivityVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        jobsSetupGKNav(title: "活动")
    }
}

final class ServiceVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        jobsSetupGKNav(title: "客服")
    }
}
