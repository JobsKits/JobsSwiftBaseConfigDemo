//
//  JobsWalletCardEffectDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年8月6日，星期四.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsTextTools
import JobsToast
import JobsWalletCard
import SnapKit

final class JobsWalletCardEffectDemoVC: BaseVC {
    private let expansionMode: JobsWalletCardExpansionMode
    private let navigationTitle: String
    private lazy var walletCardView: JobsWalletCardView = { [unowned self] in
        JobsWalletCardView()
            .byExpansionMode(expansionMode)
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
                make.top.equalTo(self.gk_navigationBar.snp.bottom)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    init(expansionMode: JobsWalletCardExpansionMode,
         navigationTitle: String) {
        self.expansionMode = expansionMode
        self.navigationTitle = navigationTitle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) 未实现")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemGroupedBackground)
        jobsSetupGKNav(title: navigationTitle)
        walletCardView.byVisible(YES)
    }
}
