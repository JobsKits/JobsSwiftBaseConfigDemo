//
//  CrashLogDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/30/25.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit

final class CrashLogDemoVC: BaseVC {
    private let horizontalInset: CGFloat = 14
    /// 使用 tail 读取，防止日志过大卡 UI（单位 KB）
    private let tailKB: Int = 256
    /// 后台读取队列（避免 Data(contentsOf:) 卡 UI）
    private let readQueue = DispatchQueue(label: "com.jobs.crashlog.viewer.read", qos: .userInitiated)
    // ================================== UI: 关键词过滤输入框 ==================================
    private lazy var textField: UITextField = { [unowned self] in
        UITextField()
            .byPlaceholder("输入关键词过滤（可选）")
            .byFont(.systemFont(ofSize: 15))
            .byTextColor(.label)
            .onChange { [weak self] _, _, _, _ in
                self?.refresh()
            }
            .byAddTo(self.view) { [unowned self] make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
            }
    }()
    // ================================== UI: 日志展示 ==================================
    private lazy var tv: UITextView = { [unowned self] in
        UITextView()
            .byFont(.systemFont(ofSize: 14))
            .byTextColor(.label)
            .byEditable(false)
            .bySelectable(true)
            .byTextContainerInset(UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10))
            .byRoundedBorder(
                color: .systemGray4,
                width: 1,
                radius: 8,
                background: .secondarySystemBackground
            )
            .byAddTo(self.view) { [unowned self] make in
                make.top.equalTo(self.textField.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(12)
            }
    }()

    // ================================== UI: 刷新按钮 ==================================
    private lazy var refreshButton: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("刷新", for: .normal)
            .byTitleColor(.systemBlue, for: .normal)
            .byTitleFont(.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.refresh()
            }
            .byAddTo(self.view) { [unowned self] make in
                make.centerY.equalTo(self.textField.snp.centerY)
                make.right.equalToSuperview().inset(horizontalInset + 6)
                make.height.equalTo(30)
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
                    }
            ]
        )
        textField.byVisible(YES)
        refreshButton.byVisible(YES)
        tv.byVisible(YES)
        refresh()// 进入页面立即读一次（真正去读 Documents/jobs_crash.log）
    }
    // ================================== Logic ==================================
    /// 刷新 UI：后台读取文件 -> 主线程更新文本
    private func refresh() {
        let keyword = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        readQueue.async { [weak self] in
            guard let self else { return }
            // 1) 读取文件最后 tailKB（真的去读 jobs_crash.log）
            let raw = CrashLogCenter.shared.readTail(kilobytes: self.tailKB)
            // 2) 过滤（可选）
            let body: String
            if keyword.isEmpty {
                body = raw
            } else {
                body = raw
                    .components(separatedBy: "\n")
                    .filter { $0.localizedCaseInsensitiveContains(keyword) }
                    .joined(separator: "\n")
            }
            // 3) Header：路径 + exists/size/mtime + filter
            let header = self.headerText(keyword: keyword)
            // 4) 空文件提示：别让你误以为“没读”
            let finalText: String
            if body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                finalText = header + "（日志为空）\n"
            } else {
                finalText = header + body
            }

            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.tv.byText(finalText)
                self.tv.scrollRangeToVisible(NSRange(location: 0, length: 0))
            }
        }
    }
    /// 组装 header：把你关心的 “log: /var/mobile/.../Documents/jobs_crash.log” 放在最顶上
    private func headerText(keyword: String) -> String {
        let info = CrashLogCenter.shared.fileInfo()

        var header = "log: \(info.path)\n"
        header += "exists: \(info.exists ? "YES" : "NO")\n"
        header += "size: \(info.sizeBytes) bytes\n"

        if let m = info.mtime {
            header += "mtime: \(m)\n"
        }

        if !keyword.isEmpty {
            header += "filter: \(keyword)\n"
        }
        header += "\n"
        return header
    }
}
