//
//  Demo@CrashLogVC.swift
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
import JobsSwiftBaseDefines
import JobsTextTools
import JobsToast
import JobsSwiftTools
import SnapKit
import GKNavigationBarSwift

final class CrashLogDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 12
    private lazy var tv: UITextView = { [unowned self] in
        UITextView()
            .byFont(.systemFont(ofSize: 14))
            .byTextColor(.label)
            .byEditable(false)
            .bySelectable(true)
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
            .byAddTo(self.view) { [unowned self] make in
                make.left.equalToSuperview().offset(self.horizontalInset)
                make.right.equalToSuperview().inset(self.horizontalInset)
                make.bottom.equalToSuperview().inset(12)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                }
            }
    }()
    // ================================== Life Cycle ==================================
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "Crash Log Viewer",
            rightButtons: [
                // 复制：复制当前展示的文本（含 header）
                UIButton.sys()
                    .byImage("doc.on.doc.fill".sysImg, for: .normal)
                    .onTap { [unowned self] _ in
                        UIPasteboard.general.string = self.tv.text
                        "复制日志成功✅".tr.toast
                    },
                // 清理：删除并重建空文件
                UIButton.sys()
                    .byImage("trash.fill".sysImg, for: .normal)
                    .onTap { [unowned self] _ in
                        let (ok, msg) = CrashLogCenter.shared.clear()
                        tv.text = msg
                        (ok ? "日志清理成功✅" : "日志清理失败❌").tr.toast
                    },
                // 刷新
                UIButton.sys()
                    .byImage("trash.fill".sysImg, for: .normal)
                    .onTap { [unowned self] _ in
                        reloadLog()
                    }

            ]
        )
        tv.byVisible(YES)
        reloadLog()
    }
}

extension CrashLogDemoVC {
    // ================================== Actions ==================================
    private func reloadLog(keyword: String = "") {
        // 尽量读 tail，避免特别大时卡 UI
        let content = CrashLogCenter.shared.readTail(kilobytes: 512)

        if keyword.isEmpty {
            tv.text = headerText(keyword: "") + content
        } else {
            let filtered = content
                .components(separatedBy: "\n")
                .filter { $0.localizedCaseInsensitiveContains(keyword) }
                .joined(separator: "\n")
            tv.text = headerText(keyword: keyword) + filtered
        }

        tv.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }
    // ================================== Header Builder ==================================
    /// 组装 header：把你关心的 “log: /var/mobile/.../Documents/jobs_crash.log” 放最顶上
    private func headerText(keyword: String) -> String {
        let info = CrashLogCenter.shared.fileInfo()

        var header = ""
        header += "log: \(info.path)\n"
        header += "exists: \(info.exists ? "YES" : "NO")\n"
        header += "size: \(info.sizeBytes) bytes\n"
        if let m = info.mtime {
            header += "mtime: \(m)\n"
        }
        header += "didCrashLastRun: \(CrashLogCenter.shared.didCrashLastRun() ? "YES" : "NO")\n"

        if !keyword.isEmpty {
            header += "filter: \(keyword)\n"
        }
        header += "\n"
        return header
    }
}
