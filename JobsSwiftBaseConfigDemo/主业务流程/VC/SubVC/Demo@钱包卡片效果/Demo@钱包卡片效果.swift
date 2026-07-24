//
//  Demo@钱包卡片效果.swift
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

import JobsScale
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines
import JobsWalletCard
import SnapKit
import GKNavigationBarSwift

final class JobsWalletDemoVC: BaseVC {
    private lazy var walletCardView: JobsWalletCardView = {
        JobsWalletCardView()
            .byCards([
                JobsWalletCardModel(
                    bankName: "上海银行".tr,
                    lastDigits: "7895",
                    holder: "Jobs",
                    brand: "VISA",
                    gradientColors: [JobsCor.systemPurple, JobsCor.systemBlue]
                ),
                JobsWalletCardModel(
                    bankName: "国泰世华".tr,
                    lastDigits: "2345",
                    holder: "Jobs",
                    brand: "Mastercard",
                    gradientColors: [JobsCor.systemPink, JobsCor.systemOrange]
                ),
                JobsWalletCardModel(
                    bankName: "台湾银行".tr,
                    lastDigits: "7654",
                    holder: "Jobs",
                    brand: "VISA",
                    gradientColors: [JobsCor.systemTeal, JobsCor.systemBlue]
                ),
                JobsWalletCardModel(
                    bankName: "嘉华银行".tr,
                    lastDigits: "2345",
                    holder: "Jobs",
                    brand: "UnionPay",
                    gradientColors: [JobsCor.systemIndigo, JobsCor.systemTeal]
                ),
                JobsWalletCardModel(
                    bankName: "包头银行".tr,
                    lastDigits: "7654",
                    holder: "Jobs",
                    brand: "Debit",
                    gradientColors: [JobsCor.systemGreen, JobsCor.systemTeal]
                ),
                JobsWalletCardModel(
                    bankName: "成都银行".tr,
                    lastDigits: "2345",
                    holder: "Jobs",
                    brand: "Credit",
                    gradientColors: [JobsCor.systemRed, JobsCor.systemOrange]
                ),
                JobsWalletCardModel(
                    bankName: "南充商业银行".tr,
                    lastDigits: "7654",
                    holder: "Jobs",
                    brand: "VISA",
                    gradientColors: [JobsCor.systemBlue, JobsCor.systemGreen]
                )
            ])
            .bySectionTitle("我的银行卡".tr)
            .bySectionSubtitle("点击银行卡，可展开查看".tr)
            .byAddSectionTitle("更多操作".tr)
            .byAddCardTitle("添加新的银行卡".tr)
            .onAddCard {
                "📇 点击添加新的银行卡".tr.toast
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(
            title: "钱包卡片效果".tr
        )
        walletCardView.byVisible(YES)
    }
}
