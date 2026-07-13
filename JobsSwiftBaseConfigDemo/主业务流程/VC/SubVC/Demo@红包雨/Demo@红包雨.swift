//
//  Demo@红包雨.swift
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
import JobsBy3rdTools
import JobsSwiftTimer
import JobsSwiftBaseDefines
import JobsTextTools
import JobsLuckyEnvelopeRain
import SnapKit
import GKNavigationBarSwift

final class RedPacketRainDemoVC: BaseVC {
    private var isRaining = false
    private var count = 0
    // MARK: - UI
    /// 红包雨视图
    private lazy var rainView: RedPacketRainView = {
        RedPacketRainView
            .dsl(
                config: RedPacketRainConfig(
                    // 可以改成 .default，或者继续用这套 Demo 配置
                    spawnInterval: 0.2,
                    minFallDuration: 5.5,
                    maxFallDuration: 8.0,
                    packetSize: CGSize(width: 44, height: 54),
                    maxConcurrentCount: 80,
                    spawnInsets: .init(top: 0, left: 10, bottom: 0, right: 10),
                    tapEnabled: true,
                    packetImage: nil
                ),
                timerKind: .gcd
            )
            .onPacketTap { [weak self] _, count in
                // ✅ Swift 6 / Sendable “同等待遇”：
                // 1) 先冻结 weak self -> strongSelf，避免 “captured var self” 警告
                // 2) 再显式切回 MainActor，安全触碰 UIKit
                guard let strongSelf = self else { return }
                onMainAsync(self) { vc in
                    strongSelf.countLabel.byText("已抢到：\(count) 个")
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.edges.equalToSuperview()
            }
    }()
    /// 显示累计点击次数
    private lazy var countLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byFont(JobsFont.systemFont(ofSize: 18, weight: .medium))
            .byTextColor(JobsCor.white)
            .byBgCor(JobsCor.black.withAlphaComponent(0.4))
            .byCornerRadius(8)
            .byText("已抢到".tr + ":" + String(count) + "个".tr)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
                make.centerX.equalToSuperview()
                make.height.equalTo(36)
                make.width.greaterThanOrEqualTo(180)
            }
    }()
    /// 开始 / 停止 红包雨
    private lazy var toggleButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            .byTitle("开始红包雨".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byCornerRadius(8)
            .onTap { [weak self] _ in
                guard let self else { return }
                isRaining.toggle()
                if isRaining {
                    // 开始下红包雨
                    rainView.byStart()
                    toggleButton
                        .byTitle("停止红包雨".tr, for: .normal)
                        .byBackgroundColor(JobsCor.systemRed, for: .normal)
                } else {
                    // 停止继续生成，但保留屏幕上已有红包慢慢落完
                    rainView.byStop(clear: false)
                    toggleButton
                        .byTitle("开始红包雨".tr, for: .normal)
                        .byBackgroundColor(JobsCor.systemGreen, for: .normal)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-32)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(160)
            }
    }()
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "JobsSwiftTimer@红包雨 Demo".tr)
        rainView.byVisible(YES)
        countLabel.byVisible(YES)
        toggleButton.byVisible(YES)
    }
}
