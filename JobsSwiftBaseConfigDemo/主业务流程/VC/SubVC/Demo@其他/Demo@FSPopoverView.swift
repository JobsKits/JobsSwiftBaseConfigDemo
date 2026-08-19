//
//  Demo@FSPopoverView.swift
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

import JobsToast
import JobsByUIKit
import JobsSwiftDSL
import JobsTextTools
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import FSPopoverView
import GKNavigationBarSwift
/// FSPopoverView Demo（链式 by-DSL 写法 + 约束写在懒加载里的 byAddTo）
/// - 展示：
///   1) 列表弹窗（FSPopoverListView）
///   2) 自定义内容（FSPopoverViewDataSource）
///   3) 从 UIBarButtonItem 与 任意 view 的 rect 弹出

final class FSPopoverDemoVC: BaseVC {
    // MARK: - UI（by-DSL + 约束在 byAddTo 内）
    private lazy var dialogTextView: UITextView = {
        UITextView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.clear)
            .byText(
                "1.电话、QQ、微信号、乱码、全数字皆、不雅字眼、辱骂 词汇带、负面情绪字眼、标点符号皆会审核失败"
                    .add("\n")
                    .add("2. 中文字母8个为限、全英文字母或全拼音、中文字母或拼 音加数字、字母数字最多2个、超过、一律拒绝")
                    .add("\n")
                    .add("3. 昵称30日内仅能更改一次")
            )
            .byTextColor(JobsCor.white)
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byEditable(NO)
    }()
    private lazy var barListPopoverView = FSPopoverListView()
    private lazy var rectListPopoverView = FSPopoverListView()
    private lazy var customPopoverView = FSPopoverView()
    private lazy var popoverBackgroundView: UIVisualEffectView = {
        UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
            .byCornerRadius(12)
            .byMasksToBounds(YES)
    }()
    private lazy var popoverContentContainerView: UIView = {
        let containerView = UIView.jobsMake { _ in }.byBackgroundColor(JobsCor.clear)
        popoverContentTitleLabel.byAddTo(containerView) { make in
            make.top.equalToSuperview().offset(14)
            make.left.right.equalToSuperview().inset(16)
        }
        popoverContentCloseButton.byAddTo(containerView) { [unowned self] make in
            make.top.equalTo(popoverContentTitleLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(14)
        }
        return containerView
    }()
    private lazy var popoverContentTitleLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("这是自定义内容".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 16))
            .byTextAlignment(.center)
    }()
    private lazy var popoverContentCloseButton: UIButton = {
        UIButton.sys()
            .byTitle("我知道了".tr, for: .normal)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.dismiss(animated: true)
            }
    }()
    private lazy var exampleButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemGreen, for: .normal)
            .byTitle("从按钮处弹出列表 ▶︎".tr, for: .normal)
            .byTitle("隐藏".tr, for: .selected)
            .byTitleColor(JobsCor.systemBlue, for: .normal)
            .byTitleColor(JobsCor.systemRed, for: .selected)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byImage("list.bullet".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 10, left: 14, bottom: 10, right: 14))
            .byTitleEdgeInsets(.init(top: 0, left: 6, bottom: 0, right: -6))
            .onTap { [weak self] _ in
                self?.showListFromRect()
            }
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(40)
                } else {
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
                }
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var customButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(JobsCor.systemIndigo, for: .normal)
            .byTitle("从右上角弹出【自定义内容】 ▶︎".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byImage("sparkles".sysImg, for: .normal)
            .byTitleEdgeInsets(.init(top: 0, left: 8, bottom: 0, right: -8))
            .onTap { [weak self] _ in
                self?.showCustomFromBarItem()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.exampleButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var jobsDialogBoxBtn: UIButton = {
        UIButton.sys()
            .byBackgroundColor("#4c4d4e".cor, for: .normal)
            .byTitle("测试 JobsDialogBox ▶︎".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(.PingFangSC.Regular(12))
            .byImage("globe".sysImg, for: .normal)
            .byTitleEdgeInsets(.init(top: 0, left: 8, bottom: 0, right: -8))
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.byDialogBoxContent { dialogBoxView in
                    self.dialogTextView
                        .byAddTo(dialogBoxView) { make in
                            make.edges.equalToSuperview()
                        }
                }
                .byDialogBoxSize(CGSize(width: 260, height: 140))
                .byShownDirection(.bottom)
                .byShowDialogBox(in: view)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.customButton.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(44)
            }
    }()

    private lazy var btn: UIButton = {
        UIButton.sys()
            /// 按钮图片@图文关系
            .byImage("ellipsis.circle".sysImg, for: .normal)
            .byImage("ellipsis.circle.fill".sysImg, for: .selected)
            /// 事件触发@点按
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.byToggleSelected()
                barListPopoverView.items = makeDemoItems()
                barListPopoverView.present(fromView: btn)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "Demo@FSPopoverView",
            rightButtons: [btn]
        )
        exampleButton.byVisible(YES)
        customButton.byVisible(YES)
        jobsDialogBoxBtn.byVisible(YES)
        // 全局外观（如不需要，可移除）
        let ap = FSPopoverView.fs_appearance()
        ap.showsArrow = true
        ap.showsDimBackground = true
    }
}

extension FSPopoverDemoVC{
    /// 从按钮的 rect 弹出 列表
    private func showListFromRect() {
        rectListPopoverView.items = makeDemoItems()
        rectListPopoverView.present(fromRect: exampleButton.convert(exampleButton.bounds, to: view), in: view)
    }
    /// 从 BarItem 弹出 自定义内容
    private func showCustomFromBarItem() {
        customPopoverView.dataSource = self
        customPopoverView.present(fromView: btn)
    }
    // MARK: - 列表项
    private func makeDemoItems() -> [FSPopoverListItem] {
        enum Feature: CaseIterable {
            case copy, message, database, qr, settings
            var title: String {
                switch self {
                /// 处理 .copy 分支
                case .copy: return "复制"
                /// 处理 .message 分支
                case .message: return "消息"
                /// 处理 .database 分支
                case .database: return "数据库"
                /// 处理 .qr 分支
                case .qr: return "二维码"
                /// 处理 .settings 分支
                case .settings: return "设置"
                }
            }
            var image: UIImage? {
                switch self {
                /// 处理 .copy 分支
                case .copy: return "doc.on.doc".sysImg
                /// 处理 .message 分支
                case .message: return "bubble.left.and.bubble.right".sysImg
                /// 处理 .database 分支
                case .database: return "externaldrive".sysImg
                /// 处理 .qr 分支
                case .qr: return "qrcode".sysImg
                /// 处理 .settings 分支
                case .settings: return "gearshape".sysImg
                }
            }
        }
        let items: [FSPopoverListItem] = Feature.allCases.map { f in
            let it = FSPopoverListTextItem()
            it.image = f.image
            it.title = f.title
            it.isSeparatorHidden = false
            it.selectedHandler = { item in
                guard let i = item as? FSPopoverListTextItem else { return }
                ("点击：\(i.title ?? "")").toast
            }
            it.updateLayout()
            return it
        }
        items.last?.isSeparatorHidden = true
        return items
    }
}
// MARK: - FSPopoverViewDataSource（自定义内容）
extension FSPopoverDemoVC: FSPopoverViewDataSource {
    /// 背景（毛玻璃 + 圆角）
    func backgroundView(for popoverView: FSPopoverView) -> UIView? {
        popoverBackgroundView
    }
    /// 内容
    func contentView(for popoverView: FSPopoverView) -> UIView? {
        popoverContentCloseButton.byVisible(YES)
        return popoverContentContainerView
    }
    /// 固定内容尺寸
    func contentSize(for popoverView: FSPopoverView) -> CGSize {
        .init(width: 240, height: 110)
    }
    /// 容器安全区
    func containerSafeAreaInsets(for popoverView: FSPopoverView) -> UIEdgeInsets {
        view.safeAreaInsets
    }
    /// 点击外部关闭
    func popoverViewShouldDismissOnTapOutside(_ popoverView: FSPopoverView) -> Bool {
        true
    }
}
