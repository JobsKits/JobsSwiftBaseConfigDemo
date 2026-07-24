//
//  Demo@富文本.swift
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
import RxSwift
import RxCocoa
import SnapKit
import NSObject_Rx          // 自动提供 disposeBag
import GKNavigationBarSwift

// MARK: - 仅两个 cell：1) Delegate 方案  2) RAC 方案
//  - “专属客服”使用系统默认蓝色（.link）
//  - “400-123-4567” 可点击拨号，样式=红字+蓝色下划线（自定义）
//  - 在卡片里追加一个“图标附件”示例（回形针 + 文本）
//  - 新增第三行 rightAligned：演示富文本整体右对齐（文本与附件都右对齐）
final class RichTextDemoVC: BaseVC {
    private let customerText = "专属客服"
    private let customerURL  = "click://customer"
    private let phoneText    = "400-123-4567"
    private let phoneURL     = "tel://4001234567"
    private var customerAlertController: UIAlertController?
    private var simulatorAlertController: UIAlertController?

    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .plain)
            .byDataSource(self)
            .byDelegate(self)
            .bySeparatorStyle(.none)
            .byRowHeight(UITableView.automaticDimension)
            .byEstimatedRowHeight(120)
            .byScrollEnabled(false)
            .byRegisterCell(LinkCell.self)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10.h)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "富文本演示（Delegate & RAC & RightAligned）".tr)
        tableView.byAlpha(1)
    }
}
// MARK: - DataSource / Delegate
extension RichTextDemoVC: UITableViewDataSource, UITableViewDelegate {
    // 从 2 → 3：第三项是右对齐示例
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mode: LinkCell.Mode = {
            switch indexPath.row {
            /// 处理 数值 0 分支
            case 0: return .delegate
            /// 处理 数值 1 分支
            case 1: return .rac
            /// 未匹配已知分支时执行兜底处理
            default: return .rightAligned
            }
        }()
        let cell = tableView.byDequeueReusableCell(withType: LinkCell.self, for: indexPath)
        if mode == .rightAligned {
            // ====================== 右对齐示例 ======================
            let rightPS = jobsMakeParagraphStyle {
                $0.alignment = .right
                $0.lineSpacing = 4
            }
            let rightAttachmentPS = jobsMakeParagraphStyle {
                $0.alignment = .right
                $0.lineSpacing = 2
            }
            cell.configure(
                title: "右对齐示例（文本与附件均右对齐）".tr,
                runs: [
                    JobsRichRun(.text("右对齐：如需帮助请联系 "))
                        .font(JobsFont.systemFont(ofSize: 16))
                        .color(JobsCor.label),
                    // 保留「专属客服」可点击（系统 link 样式）
                    JobsRichRun(.text(customerText))
                        .font(JobsFont.systemFont(ofSize: 16))
                        .link(customerURL),
                    JobsRichRun(.text("  ")), // 间隔
                    // 保留“电话”的自定义样式（红字+蓝线）
                    JobsRichRun(.text(phoneText))
                        .font(JobsFont.systemFont(ofSize: 16))
                        .color(JobsCor.red)
                        .underline(.single, color: JobsCor.blue)
                ],
                paragraphStyle: rightPS,
                phoneText: phoneText,
                phoneURL: phoneURL,
                attachmentRuns: [
                    JobsRichRun(.attachment(
                        NSTextAttachment().byImage(
                            UIImage(systemName: "paperclip",
                                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .medium))!
                        ),
                        CGSize(width: 16, height: 16)
                    )),
                    JobsRichRun(.text("  右侧说明文本"))
                        .font(JobsFont.systemFont(ofSize: 15))
                        .color(JobsCor.secondaryLabel)
                ],
                attachmentParagraphStyle: rightAttachmentPS,
                mode: mode,
                vc: self
            )
        } else {
            // ====================== 原有两行：delegate / rac ======================
            cell.configure(
                title: (mode == .delegate)
                ? "Delegate 方案（专属客服默认样式 + 电话红字蓝线）"
                : "RAC 方案（专属客服默认样式 + 电话红字蓝线）",
                runs: [
                    JobsRichRun(.text("如需帮助，请联系 "))
                        .font(JobsFont.systemFont(ofSize: 16))
                        .color(JobsCor.label),
                    JobsRichRun(.text(customerText))        // 系统默认蓝色
                        .font(JobsFont.systemFont(ofSize: 16))
                        .link(customerURL),
                    JobsRichRun(.text(" ")),                // 空格分隔
                    JobsRichRun(.text(phoneText))           // 红字 + 蓝线（自定义动作，非系统 link）
                        .font(JobsFont.systemFont(ofSize: 16))
                        .color(JobsCor.red)
                        .underline(.single, color: JobsCor.blue)
                ],
                paragraphStyle: jobsMakeParagraphStyle { $0.alignment = .center; $0.lineSpacing = 4 },
                // “电话”的自定义点击与样式将在 cell 内补充（.jobsAction）
                phoneText: phoneText,
                phoneURL: phoneURL,
                // 附件示例
                attachmentRuns: [
                    JobsRichRun(.attachment(NSTextAttachment().byImage(UIImage(systemName: "paperclip", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .medium))!),
                                            CGSize(width: 16, height: 16))),
                    JobsRichRun(.text("  附件说明"))
                        .font(JobsFont.systemFont(ofSize: 15))
                        .color(JobsCor.secondaryLabel)
                ],
                attachmentParagraphStyle: jobsMakeParagraphStyle { $0.alignment = .center; $0.lineSpacing = 2 },
                mode: mode,
                vc: self
            )
        };return cell
    }
}
// MARK: - UITextViewDelegate（仅用于 Delegate 方案处理“专属客服”）
extension RichTextDemoVC: UITextViewDelegate {
    // iOS 17+
    @available(iOS 17.0, *)
    func textView(_ textView: UITextView,
                  primaryActionFor textItem: UITextItem) -> UIAction? {
        if case let .link(url) = textItem.content {
            handleURL(url, source: "Delegate")
            return nil
        };return nil
    }
    // iOS 16 及以下
    @available(iOS, introduced: 10.0, deprecated: 17.0,
               message: "Use textView(_:primaryActionFor:) on iOS17+ instead")
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        handleURL(URL, source: "Delegate")
        return false
    }

    private func handleURL(_ url: URL, source: String) {
        if url.scheme == "click", url.host == "customer" {
            customerAlertController = UIAlertController(title: "\(source) 点击",
                                                        message: "点了：专属客服".tr,
                                                        preferredStyle: .alert)
            customerAlertController?.addAction(UIAlertAction(title: "确定".tr, style: .default))
            if let customerAlertController {
                present(customerAlertController, animated: true)
            }
        } else if url.scheme == "tel" || url.scheme == "telprompt" {
            #if targetEnvironment(simulator)
            simulatorAlertController = UIAlertController(title: "提示".tr,
                                                         message: "模拟器不支持拨号：\(url.absoluteString)",
                                                         preferredStyle: .alert)
            simulatorAlertController?.addAction(UIAlertAction(title: "确定".tr, style: .default))
            if let simulatorAlertController {
                present(simulatorAlertController, animated: true)
            }
            #else
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            #endif
        }
    }
}
