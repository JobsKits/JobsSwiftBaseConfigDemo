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

import SnapKit
import FSPopoverView
import GKNavigationBarSwift
import JobsToast
import JobsByUIKit
import JobsTextTools
import JobsBy3rdTools
import JobsInheritance
import JobsSwiftBaseDefines
/// FSPopoverView Demo（链式 by-DSL 写法 + 约束写在懒加载里的 byAddTo）
/// - 展示：
///   1) 列表弹窗（FSPopoverListView）
///   2) 自定义内容（FSPopoverViewDataSource）
///   3) 从 UIBarButtonItem 与 任意 view 的 rect 弹出
final class FSPopoverDemoVC: BaseVC {
    // MARK: - UI（by-DSL + 约束在 byAddTo 内）
    private lazy var exampleButton: UIButton = {
        UIButton.sys()
            .byBackgroundColor(.systemGreen, for: .normal)
            .byTitle("从按钮处弹出列表 ▶︎".tr, for: .normal)
            .byTitle("隐藏".tr, for: .selected)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleColor(.systemRed, for: .selected)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
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
            .byBackgroundColor(.systemIndigo, for: .normal)
            .byTitle("从右上角弹出【自定义内容】 ▶︎".tr, for: .normal)
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .semibold))
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
            .byTitleColor(.white, for: .normal)
            .byTitleFont(.PingFangSC.Regular(12))
            .byImage("globe".sysImg, for: .normal)
            .byTitleEdgeInsets(.init(top: 0, left: 8, bottom: 0, right: -8))
            .onTap { [weak self] sender in
                sender.byDialogBoxContent { dialogBoxView in
                    UITextView()
                        .byBackgroundColor(.clear)
                        .byText(
                            "1.电话、QQ、微信号、乱码、全数字皆、不雅字眼、辱骂 词汇带、负面情绪字眼、标点符号皆会审核失败"
                                .add("\n")
                                .add("2. 中文字母8个为限、全英文字母或全拼音、中文字母或拼 音加数字、字母数字最多2个、超过、一律拒绝")
                                .add("\n")
                                .add("3. 昵称30日内仅能更改一次")
                        )
                        .byTextColor(.white)
                        .byFont(.systemFont(ofSize: 16))
                        .byEditable(NO)
                        .byAddTo(dialogBoxView) { [unowned self] make in
                            make.edges.equalToSuperview()
                        }
                }
                .byDialogBoxSize(CGSize(width: 260, height: 140))
                .byShownDirection(.bottom)
                .byShowDialogBox(in: self!.view)
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
            .byImage("moon.circle.fill".sysImg, for: .selected)
            /// 事件触发@点按
            .onTap { [weak self] sender in
                guard let self else { return }
                sender.isSelected.toggle()
                let listView = FSPopoverListView()
                listView.items = makeDemoItems()
                listView.present(fromView: btn)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(.systemBackground)
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
        let listView = FSPopoverListView()
        listView.items = makeDemoItems()
        listView.present(fromRect: exampleButton.convert(exampleButton.bounds, to: view), in: view)
    }
    /// 从 BarItem 弹出 自定义内容
    private func showCustomFromBarItem() {
        let p = FSPopoverView()
        p.dataSource = self
        p.present(fromView: btn)
    }
    // MARK: - 列表项
    private func makeDemoItems() -> [FSPopoverListItem] {
        enum Feature: CaseIterable {
            case copy, message, database, qr, settings
            var title: String {
                switch self {
                case .copy: return "复制"
                case .message: return "消息"
                case .database: return "数据库"
                case .qr: return "二维码"
                case .settings: return "设置"
                }
            }
            var image: UIImage? {
                switch self {
                case .copy: return "doc.on.doc".sysImg
                case .message: return "bubble.left.and.bubble.right".sysImg
                case .database: return "externaldrive".sysImg
                case .qr: return "qrcode".sysImg
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
        UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
            .byCornerRadius(12)
            .byMasksToBounds(YES)
    }
    /// 内容
    func contentView(for popoverView: FSPopoverView) -> UIView? {
        let container = UIView().byBackgroundColor(.clear)
        let title = UILabel()
            .byText("这是自定义内容")
            .byFont(.boldSystemFont(ofSize: 16))
            .byTextAlignment(.center)
            .byAddTo(container) { make in
                make.top.equalToSuperview().offset(14)
                make.left.right.equalToSuperview().inset(16)
            }

        UIButton.sys()
            .byTitle("我知道了", for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                // 自定义：点按钮关闭（库会处理 dismiss）
                self?.dismiss(animated: true)
            }
            .byAddTo(container) { make in
                make.top.equalTo(title.snp.bottom).offset(12)
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(14)
            }.byVisible(YES)

        return container
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
