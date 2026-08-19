//
//  Demo@安全Present.swift
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
import JobsSwiftBaseDefines
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsScale
import GKNavigationBarSwift
import SnapKit

// MARK: - Demo@安全Present
final class SafetyPresentDemoVC: BaseVC {
    /// 半屏高度（可按需改）
    private let halfHeight: CGFloat = 320

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(false)
            .byBackgroundColor(JobsCor.clear)
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()

    private lazy var heroCard: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.12))
            .byCornerRadius(22)
            .byClipsToBounds(true)
    }()

    private lazy var heroBadgeLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("SAFE PRESENT")
            .byTextColor(JobsCor.systemBlue)
            .byFont(JobsFont.systemFont(ofSize: 12, weight: .semibold))
    }()

    private lazy var heroTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("🛡️ 安全 Present")
            .byNumberOfLines(0)
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.boldSystemFont(ofSize: 24))
    }()

    private lazy var heroDetailLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("防重入 · UIView 触发 · 320pt Half Sheet")
            .byNumberOfLines(0)
            .byTextColor(JobsCor.secondaryLabel)
            .byFont(JobsFont.systemFont(ofSize: 14))
    }()

    private lazy var heroContentStack: UIStackView = {
        UIStackView(arrangedSubviews: [
            heroBadgeLabel,
            heroTitleLabel,
            heroDetailLabel
        ])
            .byAxis(.vertical)
            .bySpacing(6)
            .byAlignment(.fill)
            .byAddTo(heroCard) { make in
                make.edges.equalToSuperview().inset(20)
            }
    }()

    private lazy var systemPresentButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration
                    .filled()
                    .byTitle("系统 present (连点不会重复)".tr)
                    .byBaseBackgroundColor(JobsCor.systemBlue)
                    .byBaseForegroundColor(JobsCor.white)
                    .byCornerStyle(.large)
                    .byButtonSize(.large)
                    .byContentInsets(
                        NSDirectionalEdgeInsets(
                            top: 17,
                            leading: 18,
                            bottom: 17,
                            trailing: 18
                        )
                    )
                    .byTitleAlignment(.leading)
            )
            .byContentHorizontalAlignment(.fill)
            .byNumberOfLines(0)
            .byTitleAlignment(.left)
            .onTap { [weak self] _ in
                guard let self else { return }
                DemoDetailVC()
                    .byNavigationTitle("连续点击不重复创建（系统）".tr)
                    .byData(3.14)// 基本数据类型
                    .onResult { name in
                        print("回来了 \(String(describing: name))")
                    }
                    .byPresent(self)
                    .byCompletion {
                        print("结束")
                    }
            }
    }()

    private lazy var innerPresentView: DemoInnerPresentView = {
        DemoInnerPresentView()
            .byBackgroundColor(JobsCor.systemGreen.withAlphaComponent(0.14))
            .byCornerRadius(18)
            .byClipsToBounds(true)
    }()

    private lazy var halfSheetButton: UIButton = {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration
                    .tinted()
                    .byTitle("自定义高度 present (320)".tr)
                    .byBaseForegroundColor(JobsCor.systemIndigo)
                    .byCornerStyle(.large)
                    .byButtonSize(.large)
                    .byContentInsets(
                        NSDirectionalEdgeInsets(
                            top: 17,
                            leading: 18,
                            bottom: 17,
                            trailing: 18
                        )
                    )
                    .byTitleAlignment(.leading)
            )
            .byContentHorizontalAlignment(.fill)
            .byNumberOfLines(0)
            .byTitleAlignment(.left)
            .onTap { [weak self] _ in
                guard let self else { return }
                /// 自定义高度 present：.custom + UIPresentationController
                /// .custom 之后，系统不会给装手势，需要自行提供交互式转场。
                HalfSheetDemoVC()
                    .byNavigationTitle(
                        "\("自定义高度 Present".tr)（\(Int(halfHeight))pt）"
                    )
                    .byModalPresentationStyle(.custom)
                    .byTransitioningDelegate(self)
                    .byData(["大树".tr, "小草".tr, "太阳".tr])
                    .onResult { id in
                        print("回来了 \(String(describing: id))")
                    }
                    .byPresent(self)// 自带防重入，连点不重复
                    .byCompletion {
                        print("结束")
                    }
            }
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView(arrangedSubviews: [
            heroCard,
            systemPresentButton,
            innerPresentView,
            halfSheetButton
        ])
            .byAxis(.vertical)
            .bySpacing(16)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .byAddTo(scrollView) { [unowned self] make in
                make.top.equalTo(scrollView.contentLayoutGuide.snp.top).offset(24)
                make.left.equalTo(scrollView.frameLayoutGuide.snp.left).offset(20)
                make.right.equalTo(scrollView.frameLayoutGuide.snp.right).offset(-20)
                make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom).offset(-24)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "🛡️ 安全 Present"
        )
        contentStack.byVisible(YES)
        heroContentStack.byVisible(YES)
    }
}
// MARK: - UIViewControllerTransitioningDelegate
extension SafetyPresentDemoVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return HalfSheetPresentationController(
            presentedViewController: presented,
            presenting: presenting,
            height: halfHeight
        )
    }
}
