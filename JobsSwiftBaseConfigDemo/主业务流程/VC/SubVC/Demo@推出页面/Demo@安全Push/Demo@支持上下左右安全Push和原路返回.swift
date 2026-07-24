//
//  Demo@支持上下左右安全Push和原路返回.swift
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
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsSwiftBaseDefines
import SnapKit

final class SafetyPushDemoVC: BaseVC {
    // MARK: - Buttons（逐个老老实实创建，链式 + 就地约束）
    private lazy var topButton: UIButton = {
        let mainTitle = "从上进入"
        return UIButton.sys()
            .byTitle(mainTitle.tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("Push from Top".tr, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .bySubTitleFont(JobsFont.systemFont(ofSize: 13))
            .byImage("arrow.down.to.line".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 10, left: 12, bottom: 10, right: 12))
            .byTitleEdgeInsets(.init(top: 0, left: 6, bottom: 0, right: -6))
            .byTapSound("Sound.wav")
            .onTap { [unowned self] _ in
                DemoDetailVC()
                    .byData("https://www.baidu.com")
                    .byNavigationTitle(mainTitle)
                    .byDirection(.fromTop)      // 👈 上
                    .byPush(self)
                    .byCompletion { print("❤️结束❤️ fromTop") }
            }
            .byCornerDot(diameter: 8, offset: .init(horizontal: -4, vertical: 4))
            .byCornerBadgeText("TOP") { cfg in
                cfg.byOffset(.init(horizontal: -6, vertical: 6))
                    .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                    .byBackgroundColor(JobsCor.systemRed)
                    .byFont(JobsFont.systemFont(ofSize: 11, weight: .bold))
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
            .byAlpha(0) // 进来先 0，viewDidLoad 再统一置 1
    }()

    private lazy var bottomButton: UIButton = {
        let mainTitle = "从下进入"
        return UIButton.sys()
            .byTitle(mainTitle.tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("Push from Bottom".tr, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .bySubTitleFont(JobsFont.systemFont(ofSize: 13))
            .byImage("arrow.up.to.line".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 10, left: 12, bottom: 10, right: 12))
            .byTitleEdgeInsets(.init(top: 0, left: 6, bottom: 0, right: -6))
            .byTapSound("Sound.wav")
            .onTap { [unowned self] _ in
                DemoDetailVC()
                    .byData("https://www.baidu.com")
                    .byNavigationTitle(mainTitle)
                    .byDirection(.fromBottom)   // 👈 下
                    .byPush(self)
                    .byCompletion { print("❤️结束❤️ fromBottom") }
            }
            .byCornerDot(diameter: 8, offset: .init(horizontal: -4, vertical: 4))
            .byCornerBadgeText("BOTTOM") { cfg in
                cfg.byOffset(.init(horizontal: -6, vertical: 6))
                    .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                    .byBackgroundColor(JobsCor.systemRed)
                    .byFont(JobsFont.systemFont(ofSize: 11, weight: .bold))
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.topButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
            .byAlpha(0)
    }()

    private lazy var leftButton: UIButton = {
        let mainTitle = "从左进入"
        return UIButton.sys()
            .byTitle(mainTitle.tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("Push from Left".tr, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .bySubTitleFont(JobsFont.systemFont(ofSize: 13))
            .byImage("arrow.right.to.line".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 10, left: 12, bottom: 10, right: 12))
            .byTitleEdgeInsets(.init(top: 0, left: 6, bottom: 0, right: -6))
            .byTapSound("Sound.wav")
            .onTap { [unowned self] _ in
                DemoDetailVC()
                    .byData("https://www.baidu.com")
                    .byNavigationTitle(mainTitle)
                    .byDirection(.fromLeft)     // 👈 左
                    .byPush(self)
                    .byCompletion { print("❤️结束❤️ fromLeft") }
            }
            .byCornerDot(diameter: 8, offset: .init(horizontal: -4, vertical: 4))
            .byCornerBadgeText("LEFT") { cfg in
                cfg.byOffset(.init(horizontal: -6, vertical: 6))
                    .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                    .byBackgroundColor(JobsCor.systemRed)
                    .byFont(JobsFont.systemFont(ofSize: 11, weight: .bold))
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.bottomButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
            .byAlpha(0)
    }()

    private lazy var rightButton: UIButton = {
        let mainTitle = "从右进入（系统默认）"
        return UIButton.sys()
            .byTitle(mainTitle.tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .bySubTitle("Push from Right".tr, for: .normal)
            .bySubTitleColor(JobsCor.secondaryLabel, for: .normal)
            .bySubTitleFont(JobsFont.systemFont(ofSize: 13))
            .byImage("arrow.left.to.line".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 10, left: 12, bottom: 10, right: 12))
            .byTitleEdgeInsets(.init(top: 0, left: 6, bottom: 0, right: -6))
            .byTapSound("Sound.wav")
            .onTap { [unowned self] _ in
                DemoDetailVC()
                    .byData("https://www.baidu.com")
                    .byNavigationTitle(mainTitle)
                    .byDirection(.fromRight)    // 👈 右（等同系统默认）
                    .byPush(self)
                    .byCompletion { print("❤️结束❤️ fromRight") }
            }
            .byCornerDot(diameter: 8, offset: .init(horizontal: -4, vertical: 4))
            .byCornerBadgeText("RIGHT") { cfg in
                cfg.byOffset(.init(horizontal: -6, vertical: 6))
                    .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                    .byBackgroundColor(JobsCor.systemRed)
                    .byFont(JobsFont.systemFont(ofSize: 11, weight: .bold))
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.leftButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
            .byAlpha(0)
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "🚦 Safety Push Demo")
        view.byBackgroundColor(JobsCor.systemBackground)
        // 用的时候直接置可见
        topButton.byVisible(YES)
        bottomButton.byVisible(YES)
        leftButton.byVisible(YES)
        rightButton.byVisible(YES)
    }
}
