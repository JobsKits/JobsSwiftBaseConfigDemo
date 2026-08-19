//
//  JobsOCParityClipboardDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsToast
import GKNavigationBarSwift
import SnapKit

final class JobsClipboardCueDemoVC: BaseVC {

    private let copiedText = "财神到，四季发财！！！！"

    private lazy var copyLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("请点击复制：\(copiedText)".tr)
            .byFont(JobsFont.systemFont(ofSize: 20))
            .byTextColor(JobsCor.systemRed)
            .byTextAlignment(.center)
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.systemGray5)
            .addTapAction { [weak self] (_: UILabel) in
                self?.copyContent()
            }
            .addLongPressAction(
                minimumPressDuration: 0.6,
                allowableMovement: 12,
                numberOfTouchesRequired: 1
            ) { [weak self] gesture in
                guard gesture.state == .began else { return }
                self?.copyContent()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(10)
                make.height.equalTo(80)
            }
    }()

    private lazy var pasteTextView: UITextView = {
        UITextView.jobsMake { _ in }
            .byText("请粘贴！！！".tr)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.systemGray6)
            .byCornerRadius(8)
            .byTextContainerInset(UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10))
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(copyLabel.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(10)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "系统剪贴板及粘贴提示".tr)
        copyLabel.byVisible(YES)
        pasteTextView.byVisible(YES)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        "".paste()
    }

    private func copyContent() {
        copiedText.paste()
        "已复制，请在下方文本框长按粘贴".toast
    }
}
