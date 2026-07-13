//
//  Demo@按钮.swift
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
import JobsScale
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsInheritance
import SnapKit
import GKNavigationBarSwift

final class UIButtonDemoVC: BaseVC {
    // 滚动容器
    private lazy var scroll: UIScrollView = {
        UIScrollView()
            .byAlwaysBounceVertical(true)
            .byShowsVerticalScrollIndicator(true)
            .byContentInsetAdjustmentBehavior(.automatic)   // iOS 11+
            .byKeyboardDismissMode(.onDrag)
    }()
    // 用垂直栈统一承载所有演示按钮，便于扩展/复制
    private lazy var stack: UIStackView = {
        return UIStackView()
            .byAxis(.vertical)
            .byAlignment(.fill)
            .bySpacing(12)
            .byDistribution(.equalSpacing)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "UIButton 语法糖 Demo".tr
        )
        setupLayout()
        buildDemos()
    }
}

extension UIButtonDemoVC {
    
    private func setupLayout() {
        // 1) 加入 ScrollView
        scroll.byAddTo(view)
        scroll.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom).offset(10.h)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        // 2) 将 stack 放入 ScrollView，并用 contentLayoutGuide/ frameLayoutGuide 约束
        stack.byAddTo(scroll)
        stack.snp.makeConstraints { make in
            // 内容四边贴 contentLayoutGuide
            make.top.equalTo(scroll.contentLayoutGuide.snp.top).offset(16)
            make.left.equalTo(scroll.contentLayoutGuide.snp.left).offset(16)
            make.right.equalTo(scroll.contentLayoutGuide.snp.right).inset(16)
            make.bottom.equalTo(scroll.contentLayoutGuide.snp.bottom).inset(16)
            // 宽度跟随可视区域，确保只垂直滚动
            make.width.equalTo(scroll.frameLayoutGuide.snp.width).offset(-32)
        }
    }
    // MARK: - 构建所有示例（每个按钮都是局部变量，注释写清用途）
    private func buildDemos() {
        // 1) 基础链式：标题 / 颜色 / 字体 / 图片 / 背景图
        do {
            let btnBasic = UIButton.sys()
                .byTitle("1) 基础链式：Title / Color / Font / Image / BG".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemBlue)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { _ in print("基础链式 tapped") }

            if #available(iOS 13.0, *) {
                _ = btnBasic.byImage("bolt.fill".sysImg, for: .normal)
                    .byTintColor(JobsCor.white)
                    .for(.normal)
                    .preferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold))
            }

            stack.addArrangedSubview(btnBasic)
        }
        // 2) 按 state 的链式代理：for(.highlighted).title(...) / 背景色
        do {
            let btnState = UIButton.sys()
                .byTitle("2) StateProxy：Normal / Highlighted", for: .normal)
                .byTitleColor(JobsCor.white, for: .normal)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemIndigo, for: .normal)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { _ in print("StateProxy tapped") }

            btnState
                .for(.highlighted).title("2) Highlighted 标题")
                .for(.highlighted).titleColor(JobsCor.yellow)
                .for(.highlighted).backgroundColor(JobsCor.systemPurple)

            stack.addArrangedSubview(btnState)
        }
        // 3) 背景色兜底：iOS15+ 走 configuration；其它/非 normal state 用 1×1 背景图
        do {
            let btnBG = UIButton.sys()
                .byTitle("3) 背景色兜底（Normal / Disabled）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemTeal, for: .normal)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { btn in
                    btn.byEnabled(btn.jobs_effectiveState == .disabled)
                }

            btnBG.for(.disabled).backgroundColor(JobsCor.systemGray)

            stack.addArrangedSubview(btnBG)
        }
        // 4) 内容内边距：byContentInsets / byContentEdgeInsets（兼容 iOS15-）
        do {
            let btnInsets = UIButton.sys()
                .byTitle("4) ContentInsets / EdgeInsets（左右 24）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemGreen)

            _ = btnInsets.byContentInsets(NSDirectionalEdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
            stack.addArrangedSubview(btnInsets)
        }
        // 5) 图片与标题的相对位置：byImagePlacement(.leading/.trailing/.top/.bottom) + padding
        do {
            let btnPlacement = UIButton.sys()
                .byTitle("5) imagePlacement = .trailing, padding=8")
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemOrange)
                .byContentEdgeInsets(UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))

            if #available(iOS 13.0, *) {
                _ = btnPlacement.byImage("arrow.right.circle.fill".sysImg, for: .normal)
                    .byTintColor(JobsCor.white)
            }
            _ = btnPlacement.byImagePlacement(.trailing, padding: 8)
            stack.addArrangedSubview(btnPlacement)
        }
        // 6) 副标题（iOS15+）：bySubtitle；低版本退化为主标题换行
        do {
            let btnSubtitle = UIButton.sys()
                .byTitle("6) 主标题".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
                .byBackgroundColor(JobsCor.systemPink)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .bySubTitle("副标题：iOS15+ 走 configuration.subtitle".tr)
                .bySubTitleColor(JobsCor.white)
                .bySubTitleFont(JobsFont.systemFont(ofSize: 12))
            stack.addArrangedSubview(btnSubtitle)
        }
        // 7) 菜单（iOS14+）：byMenu + byShowsMenuAsPrimaryAction
        do {
            let btnMenu = UIButton.sys()
                .byTitle("7) 菜单作为主动作（点我弹出）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemBrown)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))

            if #available(iOS 14.0, *) {
                let items: [UIAction] = [
                    UIAction.make(title: "复制".tr, image: "doc.on.doc".sysImg) { _ in print("复制") },
                    UIAction.make(title: "分享".tr, image: "square.and.arrow.up".sysImg) { _ in print("分享") },
                    UIAction.make(title: "删除".tr, image: "trash".sysImg, attributes: .destructive) { _ in print("删除") }
                ]
                _ = btnMenu.byMenu(UIMenu.make(title: "操作".tr, children: items))
                    .byShowsMenuAsPrimaryAction(true)
            }
            stack.addArrangedSubview(btnMenu)
        }
        // 8) 指针交互（iOS13.4+）：byPointerInteractionEnabled
        do {
            let btnPointer = UIButton.sys()
                .byTitle("8) Pointer Interaction（iPad/悬停设备）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemCyan)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { _ in print("Pointer tapped") }

            if #available(iOS 13.4, *) {
                _ = btnPointer.byPointerInteractionEnabled(true)
            }
            stack.addArrangedSubview(btnPointer)
        }
        // 9) Role（iOS14+）
        do {
            let btnRole = UIButton.sys()
                .byTitle("9) Role = .destructive（删除）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
                .byBackgroundColor(JobsCor.systemRed)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { _ in print("Destructive tapped") }

            if #available(iOS 14.0, *) { _ = btnRole.byRole(.destructive) }
            stack.addArrangedSubview(btnRole)
        }
        // 10) 主动作切换 selected（iOS15+）
        do {
            let btnToggle = UIButton.sys()
                .byTitle("10) 点击切换 selected".tr, for: .normal)
                .byTitleColor(JobsCor.white, for: .normal)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemMint, for: .normal)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .for(.selected).title("10) ✅ 已选择")
                .for(.selected).backgroundColor(JobsCor.systemGreen)

            if #available(iOS 15.0, *) {
                _ = btnToggle.byChangesSelectionAsPrimaryAction(true)
            } else {
                _ = btnToggle.onTap { b in b.byToggleSelected() }
            }
            stack.addArrangedSubview(btnToggle)
        }
        // 11) Configuration Update（iOS15+）
        do {
            let btnUpdate = UIButton.sys()
                .byTitle("11) configurationUpdateHandler：高亮时降透明".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemBlue)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))

            if #available(iOS 15.0, *) {
                _ = btnUpdate
                    .byAutomaticallyUpdatesConfiguration(true)
                    .byConfigurationUpdateHandler { btn in
                        btn.byAlpha(btn.jobs_effectiveState == .highlighted ? 0.6 : 1.0)
                    }
            }
            stack.addArrangedSubview(btnUpdate)
        }
        // 12) 旋转动画：startRotating / stopRotating + 防连点
        do {
            let btnRotate = UIButton.sys()
                .byTitle("12) 旋转动画（点击切换）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemPurple)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { [weak self] b in
                    guard self != nil else { return }
                    b.disableAfterClick(interval: 0.25)
                    if b.isRotating() {
                        _ = b.stopRotating(resetTransformOnStop: true); print("停止旋转")
                    } else {
                        _ = b.startRotating(duration: 0.9, scope: .imageView, clockwise: true); print("开始旋转")
                    }
                }

            if #available(iOS 13.0, *) {
                _ = btnRotate.byImage("arrow.2.circlepath.circle.fill".sysImg, for: .normal)
                    .byTintColor(JobsCor.white)
            }
            stack.addArrangedSubview(btnRotate)
        }
        // 13) 长按事件
        do {
            let btnLong = UIButton.sys()
                .byTitle("13) 长按 0.8s 触发（含手势对象回调）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemGray)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                    if gr.state == .began { btn.byAlpha(0.7); print("长按开始 on \(btn)") }
                    else if gr.state == .ended || gr.state == .cancelled { btn.byAlpha(1.0); print("长按结束") }
                }
            stack.addArrangedSubview(btnLong)
        }
        // 14) onTap 统一封装（UIAction / addTarget 兜底）
        do {
            let btnAction = UIButton.sys()
                .byTitle("14) onTap：iOS14+走UIAction，低版本走 addAction 兜底".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemBlue)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))
                .onTap { _ in print("onTap 统一入口（内部已区分 iOS14+ / 低版本）") }
            stack.addArrangedSubview(btnAction)
        }
        // 15) per-state Symbol 配置
        do {
            let btnSymbol = UIButton.sys()
                .byTitle("15) per-state Symbol 配置（Normal/Highlighted）".tr)
                .byTitleColor(JobsCor.white)
                .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
                .byBackgroundColor(JobsCor.systemOrange)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12))

            if #available(iOS 13.0, *) {
                _ = btnSymbol.byImage("star.fill".sysImg, for: .normal)
                    .byTintColor(JobsCor.white)
                    .for(.normal).preferredSymbolConfiguration(.init(pointSize: 16, weight: .regular))
                    .for(.highlighted).preferredSymbolConfiguration(.init(pointSize: 20, weight: .bold))
            }
            stack.addArrangedSubview(btnSymbol)
        }
        // 16) 富文本主/副标题（一个入参 = NSAttributedString）
        do {
            let btnRich = UIButton.sys()
                .byBackgroundColor(JobsCor.systemBlue)
                .byContentEdgeInsets(UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14))
                .byRichTitle(JobsRichText.make([
                    JobsRichRun(.text("¥99")).font(JobsFont.systemFont(ofSize: 18, weight: .semibold)).color(JobsCor.systemRed),
                    JobsRichRun(.text(" /月")).font(JobsFont.systemFont(ofSize: 16)).color(JobsCor.white)
                ]))         // ✅ 主标题富文本：一个入参
                .byRichSubTitle(JobsRichText.make([
                    JobsRichRun(.text("原价 ")).font(JobsFont.systemFont(ofSize: 12)).color(JobsCor.white.withAlphaComponent(0.8)),
                    JobsRichRun(.text("¥199")).font(JobsFont.systemFont(ofSize: 12, weight: .medium)).color(JobsCor.systemYellow)
                ]))        // ✅ 副标题富文本：一个入参
                .onTap { _ in print("富文本主/副 tapped") }

            stack.addArrangedSubview(btnRich)
        }
    }
}
