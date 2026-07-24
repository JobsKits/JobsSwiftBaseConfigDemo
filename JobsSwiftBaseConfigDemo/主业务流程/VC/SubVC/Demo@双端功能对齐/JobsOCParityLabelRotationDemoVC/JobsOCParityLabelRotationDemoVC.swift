//
//  JobsOCParityLabelRotationDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import GKNavigationBarSwift
import SnapKit

final class JobsLabelRotationDemoVC: BaseVC {

    private lazy var previewCard: UIView = {
        UIView()
            .byBackgroundColor(JobsCor.systemBackground)
            .byCornerRadius(10)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(36)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(260)
            }
    }()

    private lazy var rotatingLabel: UILabel = {
        UILabel()
            .byText("输入的内容".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 22))
            .byTextColor(JobsCor.systemBlue)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.10))
            .byCornerRadius(12)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.systemBlue.withAlphaComponent(0.25))
            .byAddTo(previewCard) { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(160)
            }
    }()

    private lazy var directionLabel: UILabel = {
        UILabel()
            .byText("文字方向：朝左".tr)
            .byFont(JobsFont.systemFont(ofSize: 13))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(previewCard.snp.bottom).offset(14)
                make.centerX.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(UIColor(hex: 0xFFEEDD))
        jobsSetupGKNav(title: "UILabel 文字旋转".tr)
        previewCard.byVisible(YES)
        rotatingLabel.byVisible(YES)
        directionLabel.byVisible(YES)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rotatingLabel.transformLayer(.left)
    }
}
