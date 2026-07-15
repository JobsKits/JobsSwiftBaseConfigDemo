//
//  Demo@自定义TabBar.swift
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

import ObjectiveC
import JobsSwiftDSL
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsSwiftTimer
import JobsInheritance
import JobsCountdownButton
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

// MARK: - Demo：多按钮（>5）以便直观看 ScrollView 横向滑动
final class TabBarDemoVC: BaseVC {
    // MARK: JobsTabBarCtrl（链式点语法 + 中间按钮凸起 + 横竖屏自适应）
    private lazy var tabCtrl: JobsTabBarCtrl = {
        JobsTabBarCtrl()
            .bySwipeEnabled(true)
            .byHorizontalOnly(true)                // ✅ 只允许横向
            .bySuppressChildVerticalScrolls(true)  // ✅（可选）禁子 VC 内纵向滚动
            .byBarBackgroundColor(JobsCor.secondarySystemBackground)
            .byCustomBarHeight(nil)              // 默认：49 + 安全区
            .byBarBottomOffset(0)                // 贴底
            .byBarBackgroundImage(nil)
            // 布局策略（1 居中；2~5 等分；>5 继续按“5 等分”的单元宽/间距去排，超出横滑）
            .byContentInset(.init(top: 6, left: 12, bottom: 6, right: 12))
            .byEqualSpacing(10)
            .byEqualVisibleRange(2...5)
            .byLockUnitToMaxEqualCount(true)
            .byAutoRelayoutForBoundsChange(true)
            // 首次构建回调（此处无需处理）
            .onButtonsBuilt { _ in }
            // 每次布局后：做“中间按钮凸起”（横竖屏都会回调）
            .onButtonsLayoutedWeakOwner { owner, btns in
                guard !btns.isEmpty else { return }
                btns[2].byHeightOffset(0)
                    .byOriginYOffset(-24)
                    .byCornerRadius(14)
            }.byDataSource(
                buttons: [
                    /// 普通按钮@（无副标题、不配置事件、无富文本）
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byTitle("首页".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .semibold))
                        .byImage("house".sysImg, for: .normal)
                        .byImage("house.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byTapSound("Sound.wav")
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .byCornerBadgeText("NEW".tr) { cfg in
                            cfg.byOffset(.init(horizontal: -6, vertical: 6))
                                .byInset(.init(top: 2, left: 6, bottom: 2, right: 6))
                                .byBackgroundColor(JobsCor.systemRed)
                                .byFont(JobsFont.systemFont(ofSize: 11, weight: .bold))
                                .byShadow(color: JobsCor.black.withAlphaComponent(0.25),
                                          radius: 2,
                                          opacity: 0.6,
                                          offset: .init(width: 0, height: 1))
                        },
                    /// 普通按钮@（配置事件）
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byTitle("优惠".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
                        .byImage("tag".sysImg, for: .normal)
                        .byImage("tag.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byTapSound("Sound.wav")
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .byCornerDot(diameter: 10, offset: .init(horizontal: -4, vertical: 4))// 红点
                        /// 事件触发@点按
                        .onTap { [weak self] sender in
                            guard let self else { return }
                            sender.byToggleSelected()
                            if sender.isSelected {
                                sender.byCornerDot(diameter: 10, offset: .init(horizontal: -4, vertical: 4))
                            } else {
                                sender.removeCornerBadge()
                            }
                            "优惠@点按事件".tr.toast
                        }
                        /// 事件触发@长按
                        .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                             if gr.state == .began {
                                 btn.byAlpha(0.6)
                                 print("长按开始 on \(btn)")
                                 "优惠@长按事件".tr.toast
                             } else if gr.state == .ended || gr.state == .cancelled {
                                 btn.byAlpha(1.0)
                                 print("长按结束")
                             }
                         },
                    /// 普通按钮@（富文本）
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byRichTitle(JobsRichText.make([
                            JobsRichRun(.text("¥99")).font(JobsFont.systemFont(ofSize: 10, weight: .semibold)).color(JobsCor.systemRed),
                            JobsRichRun(.text(" /月")).font(JobsFont.systemFont(ofSize: 12)).color(JobsCor.green)
                        ]))
                        .byRichSubTitle(JobsRichText.make([
                            JobsRichRun(.text("原价 ")).font(JobsFont.systemFont(ofSize: 10)).color(JobsCor.blue.withAlphaComponent(0.8)),
                            JobsRichRun(.text("¥199")).font(JobsFont.systemFont(ofSize: 12, weight: .medium)).color(JobsCor.systemYellow)
                        ]))
                        .byImage("creditcard".sysImg, for: .normal)
                        .byImage("creditcard.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byTitle("好友".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
                        .byImage("person.2".sysImg, for: .normal)
                        .byImage("person.2.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),
                    /// ✅ 倒计时按钮@（点击触发）—— 适配新版 JobsSwiftTimer（替代旧 startTimer/onCountdownTick/onCountdownFinish）
                    UIButton.sys()
                        .byTitle("活动".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
                        .bySubTitle("倒计时".tr, for: .normal)
                        .bySubTitleColor(JobsCor.label, for: .normal)
                        .bySubTitleColor(JobsCor.systemRed, for: .selected)
                        .bySubTitleFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
                        .byImage("sparkles".sysImg, for: .normal)
                        .byImage("sparkles".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                        .onTap { [weak self] btn in
                            guard let self else { return }
                            // 点击以后倒计时：300s
                            // 你原来写死 kind:.gcd，这里保持一致
                            onMainAsync(self) { vc in
                                btn.jobs_countdownBinder.start(
                                    on: btn,
                                    total: 300,
                                    interval: 1.0,
                                    kind: .gcd
                                )
                            }
                        },
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byTitle("客服".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .medium))
                        .byImage("message".sysImg, for: .normal)
                        .byImage("message.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10)),
                    /// 普通按钮@（展示副标题）
                    UIButton.sys()
                        .byNormalBgColor(JobsCor.clear)
                        .byTitle("我的".tr, for: .normal)
                        .byTitleColor(JobsCor.label, for: .normal)
                        .byTitleColor(JobsCor.systemRed, for: .selected)
                        .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .semibold))
                        .bySubTitle("未登录".tr, for: .normal)
                        .bySubTitleColor(JobsCor.label, for: .normal)
                        .bySubTitleColor(JobsCor.systemRed, for: .selected)
                        .bySubTitleFont(JobsFont.systemFont(ofSize: 10, weight: .semibold))
                        .byImage("person.crop.circle".sysImg, for: .normal)
                        .byImage("person.crop.circle.fill".sysImg, for: .selected)
                        .byImagePlacement(.top)
                        .byContentEdgeInsets(.init(top: 6, left: 10, bottom: 6, right: 10))
                ],
                controllers: [
                    HomeVC(),
                    DiscountVC(),
                    WalletVC(),
                    FriendsVC(),
                    ActivityVC(),
                    ServiceVC()
                ]
            )
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsTabBarCtrl@横滑 Demo（>5 个按钮）".tr)
        addChild(tabCtrl)
        tabCtrl.view.byAddTo(view)
        tabCtrl.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        tabCtrl.didMove(toParent: self)
    }
}
