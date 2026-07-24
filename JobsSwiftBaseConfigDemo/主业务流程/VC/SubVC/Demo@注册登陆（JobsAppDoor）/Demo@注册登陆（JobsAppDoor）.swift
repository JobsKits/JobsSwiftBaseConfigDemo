//
//  Demo@注册登陆（JobsAppDoor）.swift
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

import GKNavigationBarSwift
import JobsAppDoor
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

final class JobsAppDoorDemoVC: BaseVC {
    private lazy var titleLabel: UILabel = {
        UILabel()
            .byText("JobsAppDoor")
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byFont(JobsFont.boldSystemFont(ofSize: 28))
    }()

    private lazy var detailLabel: UILabel = {
        UILabel()
            .byText("同一套登录 / 注册 / 找回密码能力\n分别演示单面板换轨与独立卡片横滑")
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byNumberOfLines(0)
    }()

    private lazy var style1Button: UIButton = {
        UIButton.sys()
            .byJobsAppDoorAppearance(
                title: "Style1 · 单面板左右换轨",
                titleColor: JobsCor.white,
                font: JobsFont.systemFont(ofSize: 16, weight: .semibold),
                backgroundColor: JobsCor.systemPink,
                cornerRadius: 26
            )
            .onTap { [weak self] _ in
                guard let self else { return }
                openAppDoor(JobsAppDoorVC(configuration: .fullConfig))
            }
    }()

    private lazy var style2Button: UIButton = {
        UIButton.sys()
            .byJobsAppDoorAppearance(
                title: "Style2 · 独立卡片弹簧横滑",
                titleColor: JobsCor.white,
                font: JobsFont.systemFont(ofSize: 16, weight: .semibold),
                backgroundColor: JobsCor.systemIndigo,
                cornerRadius: 26
            )
            .onTap { [weak self] _ in
                guard let self else { return }
                openAppDoor(JobsAppDoorStyle2VC(configuration: .fullConfig))
            }
    }()

    private lazy var contentStack: UIStackView = {
        UIStackView(arrangedSubviews: [titleLabel, detailLabel, style1Button, style2Button])
            .byAxis(.vertical)
            .byAlignment(.fill)
            .byDistribution(.fill)
            .bySpacing(18)
            .byAddTo(view) { make in
                make.center.equalToSuperview()
                make.left.equalToSuperview().offset(28)
                make.right.equalToSuperview().inset(28)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsAppDoor")
        view.byBackgroundColor(JobsCor.systemBackground)
        contentStack.byVisible(true)
        style1Button.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
        style2Button.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }
}

private extension JobsAppDoorDemoVC {
    func openAppDoor(_ controller: JobsAppDoorBaseVC) {
        controller.submitHandler = { [weak controller, weak self] mode, values in
            let alertController = UIAlertController(
                title: self?.modeTitle(mode),
                message: "username: \(values.username)\nphone: \(values.countryCode) \(values.phone)",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            controller?.present(alertController, animated: true)
        }
        controller.customerServiceHandler = { [weak controller] in
            let alertController = UIAlertController(
                title: "在线客服".tr,
                message: "7×24小时".tr,
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            controller?.present(alertController, animated: true)
        }
        controller.verificationCodeHandler = { values in
            print("📨 JobsAppDoor verification request:", values.countryCode, values.phone)
        }
        controller.byPush(self)
    }

    func modeTitle(_ mode: JobsAppDoorMode) -> String {
        switch mode {
        /// 登录提交结果
        case .login:
            return "登录".tr
        /// 注册提交结果
        case .register:
            return "注册".tr
        /// 找回密码提交结果
        case .forgotPassword:
            return "重置密码".tr
        }
    }
}
