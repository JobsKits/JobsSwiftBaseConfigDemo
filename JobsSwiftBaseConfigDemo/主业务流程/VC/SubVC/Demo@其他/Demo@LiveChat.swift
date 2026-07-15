//
//  Demo@LiveChat.swift
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
import LiveChat

final class LiveChatDemoVC: BaseVC, LiveChatDelegate {
    private lazy var btnDefault: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("默认展示（presentChat）".tr, for: .normal)
            .byTitleColor(JobsCor.white, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .semibold))
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byBackgroundColor(JobsCor.systemBlue) // ≈ Configuration.filled 的视觉
            .onTap { [weak self] _ in
                self?.onDefault()    // ✅ 保留原有触发逻辑
            }
            .byAddTo(self.view) { [unowned self] make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-20)
                make.width.greaterThanOrEqualTo(260)
            }
    }()

    private lazy var btnCustom: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("自定义展示（半屏）".tr, for: .normal)
            .byTitleColor(JobsCor.label, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byBackgroundColor(JobsCor.secondarySystemBackground) // ≈ Configuration.gray 的视觉
            .onTap { [weak self] _ in
                self?.onCustom()     // ✅ 保留原有触发逻辑
            }
            .byAddTo(self.view) {[unowned self] make in
                make.centerX.equalToSuperview()
                make.top.equalTo(btnDefault.snp.bottom).offset(16)
                make.width.equalTo(btnDefault)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "LiveChat Demo")
        btnDefault.byVisible(YES)
        btnCustom.byVisible(YES)
    }
    // MARK: - 默认方式（SDK 自带展示）
    @objc private func onDefault() {
        LiveChat.presentChat() // 一句到位
        // 如果要监听打开/关闭等事件，可同时设置 delegate = self
        LiveChat.delegate = self
    }
    // MARK: - 自定义方式（来决定怎么展示）
    @objc private func onCustom() {
        LiveChat.delegate = self
        LiveChat.customPresentationStyleEnabled = true
        guard let chatVC = LiveChat.chatViewController else {
            assertionFailure("chatViewController == nil，确认已设置 customPresentationStyleEnabled = true")
            return
        }
        // 例：以半屏 Sheet 展示（iOS 15+）
        chatVC.modalPresentationStyle = .pageSheet
        if let sheet = chatVC.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            } else {
                sheet.detents = [.medium(), .large()]
            }
        }
        present(chatVC, animated: true, completion: nil)
    }
    // MARK: - LiveChatDelegate（可选）
    func chatPresented() {
        print("✅ LiveChat 打开")
    }

    func chatDismissed() {
        print("🌓 LiveChat 关闭")
        // 如果是自定义展示，可以主动收起（默认展示不需要）
        if LiveChat.customPresentationStyleEnabled {
            LiveChat.chatViewController?.dismiss(animated: true, completion: nil)
        }
    }
    // 收到新消息（可用于角标/本地通知等）
    func received(message: LiveChatMessage) {
        print("📩 收到消息：\(message.text)")
    }
    // 统一接管聊天里的 URL（默认会走 Safari）
    func handle(URL: URL) {
        print("🔗 用户点击了链接：\(URL.absoluteString)")
        // 可以在这里自行处理，比如用 SFSafariViewController 打开
    }
    // 加载失败（排障抓日志）
    func loadingDidFail(with errror: Error) {
        print("❌ LiveChat 加载失败：\(errror)")
    }
}
