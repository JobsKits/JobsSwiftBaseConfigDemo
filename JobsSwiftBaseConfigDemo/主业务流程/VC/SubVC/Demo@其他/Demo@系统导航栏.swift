//
//  Demo@系统导航栏.swift
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

import JobsSwiftDSL
import Jobsl10n
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsInheritance
import JobsSwiftBaseDefines
import RxSwift
import RxCocoa
import SnapKit

final class JobsNavigationDemoVC: BaseVC {
    // MARK: - 左侧：自定义返回按钮
    private lazy var backButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.clear, for: .normal)
            .byTitle("返回".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .bold))
            .byImage("chevron.backward".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 0, left: 10, bottom: 0, right: 10))
            .byTitleEdgeInsets(.init(top: 0, left: 4, bottom: 0, right: -4))
            .onTap { [weak self] _ in
                guard let self else { return }
                print("👉 点击了左侧『返回』按钮")
                goBack(nil)
            }
            .onLongPress(minimumPressDuration: 0.6) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("返回按钮长按开始")
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
                    print("返回按钮长按结束")
                }
            }
    }()
    // MARK: - 右侧：铃铛按钮（带红点 + NEW 角标）
    private lazy var bellButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.clear, for: .normal)
            .byTitle("铃".tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 12, weight: .bold))
            .byImage("bell".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 0, left: 10, bottom: 0, right: 10))
            .byTitleEdgeInsets(.init(top: 0, left: 4, bottom: 0, right: -4))
            .byTapSound("Sound.wav")
            .onTap { [weak self] _ in
                guard let self else { return }
                print("👉 点击了右侧『铃铛』按钮")
                "点击了右侧『铃铛』按钮".tr.toast
            }
            .onLongPress(minimumPressDuration: 0.8) { btn, gr in
                if gr.state == .began {
                    btn.byAlpha(0.6)
                    print("铃铛长按开始")
                    "铃铛长按开始".tr.toast
                } else if gr.state == .ended || gr.state == .cancelled {
                    btn.byAlpha(1.0)
                    print("铃铛长按结束")
                    "铃铛长按结束".tr.toast
                }
            }
    }()
    // MARK: - 导航栏标题视图
    private lazy var singleLineTitleLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.clear)
            .byNumberOfLines(1)
    }()

    private lazy var mainTitleLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.clear)
            .byNumberOfLines(1)
    }()

    private lazy var subTitleLabel: UILabel = {
        UILabel()
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.clear)
            .byNumberOfLines(1)
    }()

    private lazy var titleStackView: UIStackView = {
        UIStackView(arrangedSubviews: [
            mainTitleLabel,
            subTitleLabel
        ])
        .byAxis(.vertical)
        .byAlignment(.center)
        .byDistribution(.fill)
        .bySpacing(0)
    }()
    // MARK: - 内容区标题切换按钮
    private lazy var singleLinePlainTitleButton: UIButton = {
        Self.makeTitleModeButton("单行标题 · 普通文本".tr)
            .onTap { [weak self] _ in
                self?.showSingleLinePlainTitle()
            }
    }()

    private lazy var singleLineRichTitleButton: UIButton = {
        Self.makeTitleModeButton("单行标题 · 富文本".tr)
            .onTap { [weak self] _ in
                self?.showSingleLineRichTitle()
            }
    }()

    private lazy var mainSubPlainTitleButton: UIButton = {
        Self.makeTitleModeButton("主副标题 · 普通文本".tr)
            .onTap { [weak self] _ in
                self?.showMainSubPlainTitle()
            }
    }()

    private lazy var mainSubRichTitleButton: UIButton = {
        Self.makeTitleModeButton("主副标题 · 富文本".tr)
            .onTap { [weak self] _ in
                self?.showMainSubRichTitle()
            }
    }()

    private lazy var titleModeStackView: UIStackView = {
        UIStackView(arrangedSubviews: [
            singleLinePlainTitleButton,
            singleLineRichTitleButton,
            mainSubPlainTitleButton,
            mainSubRichTitleButton
        ])
        .byAxis(.vertical)
        .byAlignment(.fill)
        .byDistribution(.fillEqually)
        .bySpacing(14)
        .byAddTo(view) { [unowned self] make in
            make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.centerY)
            make.left.right.equalToSuperview().inset(32)
            make.height.equalTo(234)
        }
    }()
    // MARK: - 状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        // MARK: - 外观：背景图、底色、tintColor 等
        configureNavigationBarAppearance()
        self.title = "系统导航栏 Demo".tr // 普通文本的优先级低于富文本。title的优先级低于navigationItem.titleView
        // MARK: - 多语言国际化
//        navigationItem.tr_setTitle("KEY".tr)          /// 主标题（中间大字）
//        navigationItem.tr_setPrompt("KEY".tr)         /// 主标题上方的一行小字
//        navigationItem.tr_setBackButtonTitle("KEY".tr)/// 返回按钮文字
//        navigationItem.rightBarButtonItem = UIBarButtonItem.make(title: nil)
//        navigationItem.rightBarButtonItem?.tr_setTitle("KEY".tr)
        // MARK: - 默认展示：单行富文本标题
        showSingleLineRichTitle()
        navigationItem.hidesBackButton = true
        // MARK: - 左边：按钮 DSL 嵌进导航栏
        navigationItem.leftBarButtonItem = UIBarButtonItem.make(customView: backButton)
        // 如果有需求，也可以：
        // navigationController?.interactivePopGestureRecognizer?.delegate = self
        // MARK: - 右边：一个系统 hi + 一个按钮 DSL 铃铛
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem
                .make(title: "hi")
                .onTap { [weak self] (item:UIBarButtonItem) in
                    guard let self else { return }
                    print("👉 点击了右侧『hi』按钮")
                    "点击了右侧\(item.title!)按钮".toast
                },
            UIBarButtonItem.make(customView: bellButton)]
        titleModeStackView.byVisible(YES)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.byHidden(false)
        UINavigationBar.appearance().byHidden(false)
    }

    deinit {
        print("JobsNavigationDemoVC deinit")
    }
}

extension JobsNavigationDemoVC {
    private static func makeTitleModeButton(_ title: String) -> UIButton {
        UIButton.sys()
            .byConfiguration(
                UIButton.Configuration.filled()
                    .byTitle(title)
                    .byCornerStyle(.medium)
                    .byBaseForegroundColor(JobsCor.white)
                    .byBaseBackgroundColor(JobsCor.systemBlue)
                    .byContentInsets(
                        NSDirectionalEdgeInsets(
                            top: 12,
                            leading: 18,
                            bottom: 12,
                            trailing: 18
                        )
                    )
            )
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
    }
    // MARK: - 单行标题
    private func showSingleLinePlainTitle() {
        navigationItem.titleView = singleLineTitleLabel
            .byAttributedString(nil)
            .byText("系统导航栏 Demo".tr)
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .semibold))
            .byTextColor(JobsCor.systemBlue)
            .bySizeToFit()
    }

    private func showSingleLineRichTitle() {
        navigationItem.titleView = singleLineTitleLabel
            .richTextBy([
                JobsRichRun(.text("合理".tr))
                    .font(JobsFont.systemFont(ofSize: 12, weight: .regular))
                    .color(JobsCor.systemBlue),
                JobsRichRun(.text("的".tr))
                    .font(JobsFont.systemFont(ofSize: 13, weight: .semibold))
                    .color(JobsCor.white),
                JobsRichRun(.text("语法糖".tr))
                    .font(JobsFont.systemFont(ofSize: 14, weight: .ultraLight))
                    .color(JobsCor.red)
            ], paragraphStyle: jobsMakeParagraphStyle {
                $0.alignment = .center
                $0.lineSpacing = 0
            })
            .bySizeToFit()
    }
    // MARK: - 主副标题上下结构
    private func showMainSubPlainTitle() {
        mainTitleLabel
            .byAttributedString(nil)
            .byText("系统导航栏".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .semibold))
            .byTextColor(JobsCor.systemBlue)
            .bySizeToFit()
        subTitleLabel
            .byAttributedString(nil)
            .byText("主标题 / 副标题".tr)
            .byFont(JobsFont.systemFont(ofSize: 10, weight: .medium))
            .byTextColor(JobsCor.red)
            .bySizeToFit()
        navigationItem.titleView = titleStackView.bySizeToFit()
    }

    private func showMainSubRichTitle() {
        mainTitleLabel
            .richTextBy([
                JobsRichRun(.text("系统".tr))
                    .font(JobsFont.systemFont(ofSize: 14, weight: .bold))
                    .color(JobsCor.systemBlue),
                JobsRichRun(.text("导航栏".tr))
                    .font(JobsFont.systemFont(ofSize: 14, weight: .semibold))
                    .color(JobsCor.red)
            ], paragraphStyle: jobsMakeParagraphStyle {
                $0.alignment = .center
                $0.lineSpacing = 0
            })
            .bySizeToFit()
        subTitleLabel
            .richTextBy([
                JobsRichRun(.text("主标题".tr))
                    .font(JobsFont.systemFont(ofSize: 10, weight: .medium))
                    .color(JobsCor.white),
                JobsRichRun(.text(" · ".tr))
                    .font(JobsFont.systemFont(ofSize: 9, weight: .regular))
                    .color(JobsCor.systemBlue),
                JobsRichRun(.text("副标题".tr))
                    .font(JobsFont.systemFont(ofSize: 10, weight: .medium))
                    .color(JobsCor.red)
            ], paragraphStyle: jobsMakeParagraphStyle {
                $0.alignment = .center
                $0.lineSpacing = 0
            })
            .bySizeToFit()
        navigationItem.titleView = titleStackView.bySizeToFit()
    }
    // MARK: - 导航栏外观
    private func configureNavigationBarAppearance() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.byTintColor(JobsCor.black)
        let bgImage = "导航栏背景图".img
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
                .byLargeTitleAttributes([
                    .foregroundColor: JobsCor.cyan,
                    .font: JobsFont.boldSystemFont(ofSize: 30)
                ])
                .byTitleAttributes([
                    .foregroundColor: JobsCor.red,
                    .font: JobsFont.boldSystemFont(ofSize: 18)
                ])
                .byOpaqueBackground()
                .byBackgroundImage(bgImage)
                .byBackgroundColor(JobsCor.yellow)
                .byShadowColor(JobsCor.clear)
            navBar
                .byStandardAppearance(appearance)
                .byScrollEdgeAppearance(appearance)
                .byCompactAppearance(appearance)
            if #available(iOS 15.0, *) {
                navBar.byCompactScrollEdgeAppearance(appearance)
            }
        } else {
            navBar
                .byBackgroundImage(bgImage, for: .default)
                .byBarTintColor(JobsCor.yellow)
                .byTranslucent(NO)
                .byShadowImage(.make())
                .byTitleTextAttributes([
                    .foregroundColor: JobsCor.red,
                    .font: JobsFont.boldSystemFont(ofSize: 18)
                ])
        }
    }
}
