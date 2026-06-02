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

import SnapKit
import JobsByUIKit
import JobsSwiftDSL
import JobsInheritance
import JobsTextTools

final class JobsOpenDemoVC: BaseVC {
    // ================================== UI ==================================
    private lazy var btnOpenWeb: UIButton = {
        UIButton(type: .system)
            .byTitle("🌐 打开百度".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemBlue)
            .byCornerRadius(8)
            .onTap { _ in
                "www.baidu.com".open()
            }
    }()

    private lazy var btnOpenChineseURL: UIButton = {
        UIButton(type: .system)
            .byTitle("🔍 打开含中文参数URL".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemGreen)
            .byCornerRadius(8)
            .onTap { _ in
                "https://example.com/search?q=中文 关键词".open()
            }
    }()

    private lazy var btnOpenScheme: UIButton = {
        UIButton(type: .system)
            .byTitle("💬 打开微信 Scheme".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemTeal)
            .byCornerRadius(8)
            .onTap { _ in
                "weixin://".open()
            }
    }()

    private lazy var btnCall: UIButton = {
        UIButton(type: .system)
            .byTitle("📞 拨打电话（tel://）".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemOrange)
            .byCornerRadius(8)
            .onTap { _ in
                "13434343434".call()
            }
    }()

    private lazy var btnCallPrompt: UIButton = {
        UIButton(type: .system)
            .byTitle("☎️ 拨打电话（telprompt://）".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemRed)
            .byCornerRadius(8)
            .onTap { _ in
                "13434343434".call(usePrompt: true)
            }
    }()
    // ========================== ✉️ 邮件相关 demo ==========================
    private lazy var btnMailSimple: UIButton = {
        UIButton(type: .system)
            .byTitle("✉️ 发邮件（最简单）".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemIndigo)
            .byCornerRadius(8)
            .onTap { _ in
                "test@qq.com".mail()
            }
    }()

    private lazy var btnMailText: UIButton = {
        UIButton(type: .system)
            .byTitle("✉️ 发邮件（主题+正文）".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemPurple)
            .byCornerRadius(8)
            .onTap { _ in
                "ops@company.com".mail(
                    subject: "反馈",
                    body: "好，遇到一个问题..."
                )
            }
    }()

    private lazy var btnMailHTML: UIButton = {
        UIButton(type: .system)
            .byTitle("✉️ 群发/抄送（HTML）".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemBrown)
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
        view.backgroundColor = .systemBackground
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
