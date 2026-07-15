//
//  Demo@打开模块.swift
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
import JobsTextTools
import SnapKit

final class JobsOpenDemoVC: BaseVC {
    // ================================== UI ==================================
    private lazy var btnOpenWeb: UIButton = {
        UIButton.sys()
            .byTitle("🌐 打开百度".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(8)
            .onTap { _ in
                "www.baidu.com".open()
            }
    }()

    private lazy var btnOpenChineseURL: UIButton = {
        UIButton.sys()
            .byTitle("🔍 打开含中文参数URL".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemGreen)
            .byCornerRadius(8)
            .onTap { _ in
                "https://example.com/search?q=中文 关键词".open()
            }
    }()

    private lazy var btnOpenScheme: UIButton = {
        UIButton.sys()
            .byTitle("💬 打开微信 Scheme".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemTeal)
            .byCornerRadius(8)
            .onTap { _ in
                "weixin://".open()
            }
    }()

    private lazy var btnCall: UIButton = {
        UIButton.sys()
            .byTitle("📞 拨打电话（tel://）".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemOrange)
            .byCornerRadius(8)
            .onTap { _ in
                "13434343434".call()
            }
    }()

    private lazy var btnCallPrompt: UIButton = {
        UIButton.sys()
            .byTitle("☎️ 拨打电话（telprompt://）".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemRed)
            .byCornerRadius(8)
            .onTap { _ in
                "13434343434".call(usePrompt: true)
            }
    }()
    // ========================== ✉️ 邮件相关 demo ==========================
    private lazy var btnMailSimple: UIButton = {
        UIButton.sys()
            .byTitle("✉️ 发邮件（最简单）".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemIndigo)
            .byCornerRadius(8)
            .onTap { _ in
                "test@qq.com".mail()
            }
    }()

    private lazy var btnMailText: UIButton = {
        UIButton.sys()
            .byTitle("✉️ 发邮件（主题+正文）".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemPurple)
            .byCornerRadius(8)
            .onTap { _ in
                "ops@company.com".mail(
                    subject: "反馈",
                    body: "好，遇到一个问题..."
                )
            }
    }()

    private lazy var btnMailHTML: UIButton = {
        UIButton.sys()
            .byTitle("✉️ 群发/抄送（HTML）".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBrown)
            .byCornerRadius(8)
            .onTap { _ in
                "a@b.com,c@d.com".mail(
                    subject: "日报",
                    body: "<b>今天完成：</b><br/>1. xxx<br/>2. yyy",
                    isHTML: true,
                    cc: ["pm@company.com"],
                    bcc: ["boss@company.com"]
                ) { result in
                    print("mail result = \(result)")
                }
            }
    }()
    // ================================== 生命周期 ==================================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "🌐 Jobs Open/Call/Mail Demo")
        UIStackView(arrangedSubviews: [
            btnOpenWeb,
            btnOpenChineseURL,
            btnOpenScheme,
            btnCall,
            btnCallPrompt,
            btnMailSimple,
            btnMailText,
            btnMailHTML
        ])
        .byAxis(.vertical)
        .bySpacing(16)
        .byAlignment(.fill)
        .byDistribution(.fillEqually)
        .byAddTo(view) { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview().inset(32)
        }
        // 统一按钮高度
        [btnOpenWeb, btnOpenChineseURL, btnOpenScheme,
         btnCall, btnCallPrompt, btnMailSimple, btnMailText, btnMailHTML].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
}
