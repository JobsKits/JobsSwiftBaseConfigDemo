//
//  JobsIconfontTextFontDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

import GKNavigationBarSwift
import JobsByUIKit
import JobsIconfont
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import UIKit

final class JobsIconfontTextFontDemoVC: BaseVC {
    private lazy var sampleLabel: UILabel = {
        UILabel()
            .byText("阿里妈妈·智造字\nAI 让设计更有温度\n012345678".tr)
            .byJobsIconfontText(size: 34)
            .byTextColor(JobsCor.label)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
    }()

    private lazy var sizeLabel: UILabel = {
        UILabel()
            .byText("字号：34".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byTextAlignment(.center)
    }()

    private lazy var slider: UISlider = {
        UISlider()
            .byMinimumValue(18)
            .byMaximumValue(52)
            .byValue(34)
            .byAddTarget(self, action: #selector(sizeChanged(_:)), for: .valueChanged)
    }()

    private lazy var fallbackLabel: UILabel = {
        UILabel()
            .byText("字体缺失时，JobsIconfont 自动回退系统字体".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .regular))
            .byTextColor(JobsCor.tertiaryLabel)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "阿里妈妈文字字体".tr)
        layoutUI()
    }

    private func layoutUI() {
        sampleLabel.byAddTo(view) { [unowned self] make in
            if view.jobs_hasVisibleTopBar() {
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(48)
            } else {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(48)
            }
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        sizeLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(sampleLabel.snp.bottom).offset(36)
            make.left.right.equalTo(sampleLabel)
        }
        slider.byAddTo(view) { [unowned self] make in
            make.top.equalTo(sizeLabel.snp.bottom).offset(18)
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().inset(36)
        }
        fallbackLabel.byAddTo(view) { [unowned self] make in
            make.top.equalTo(slider.snp.bottom).offset(32)
            make.left.right.equalTo(sampleLabel)
        }
    }

    @objc private func sizeChanged(_ sender: UISlider) {
        let size = CGFloat(sender.value.rounded())
        sampleLabel.byJobsIconfontText(size: size)
        sizeLabel.byText("字号：\(Int(size))")
    }
}
