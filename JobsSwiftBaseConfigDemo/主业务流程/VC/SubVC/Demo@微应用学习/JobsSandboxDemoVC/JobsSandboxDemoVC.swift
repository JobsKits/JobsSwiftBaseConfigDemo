//
//  JobsSandboxDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit
import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// iOS 安装时为每个 App 分配容器；Documents 保存用户内容，Library 保存应用数据，Caches 可被系统清理。
/// 微应用需要在宿主容器内进一步按 appId/account 划分目录。本页是真实文件读写与越界拒绝，是逻辑隔离，
/// 不是新增 OS 沙箱。接入时只向业务暴露 Store 接口，备份策略/配额/加密/退出清理应在这一层统一实现。
/// 后台执行仍受 iOS 生命周期限制，不能用目录隔离绕过权限；关键状态要及时落盘，再由服务器或备份恢复。
/// 来源：https://developer.apple.com/documentation/foundation/filemanager
final class JobsSandboxDemoVC: JobsMicroAppLabBaseVC {
    override var lessonTitle: String {
        return "沙箱运行环境"
    }
    override var lessonSummary: String {
        "同一 App 容器中的 module-a / module-b 各有一份草稿。写入后切换读取，测试 ../ 越界与清空当前模块。"
    }
    override var lessonActions: [UIButton] {
        return [switchButton, writeButton, readButton, escapeButton, resetButton]
    }
    private var namespace = "module-a"
    private var sequence = 0

    private lazy var directoryLabel: UILabel = {
        UILabel.jobsMake { label in
            label.byFont(JobsFont.systemFont(ofSize: 14))
                .byTextColor(JobsCor.label)
                .byNumberOfLines(0)
                .byAddTo(stageView) { make in
                    make.edges.equalToSuperview().inset(14)
                }
        }
    }()
    private lazy var switchButton: UIButton = lessonButton("切换到 module-b", identifier: "lab.sandboxSwitch") { [weak self] in
        guard let self else {
            return
        }
        self.namespace = self.namespace == "module-a" ? "module-b" : "module-a"
        self.switchButton.byTitle("切换到 \(self.namespace == "module-a" ? "module-b" : "module-a")")
        self.readDraft()
    }
    private lazy var writeButton: UIButton = lessonButton("写入当前模块草稿", identifier: "lab.sandboxWrite") { [weak self] in
        guard let self else {
            return
        }
        self.perform { store in
            self.sequence += 1
            try store.write("\(self.namespace) 的草稿 #\(self.sequence)，保存于 \(Date())")
            self.record("写入成功：\(self.namespace) / draft.txt")
        }
    }
    private lazy var readButton: UIButton = lessonButton("重新读取当前模块", identifier: "lab.sandboxRead") { [weak self] in
        self?.readDraft()
    }
    private lazy var escapeButton: UIButton = lessonButton("测试拒绝：../module-b/draft.txt", identifier: "lab.sandboxEscape") { [weak self] in
        guard let self else {
            return
        }
        self.perform { store in
            _ = try store.read(filename: "../module-b/draft.txt")
            self.record("异常：越界请求未被拒绝。")
        }
    }
    private lazy var resetButton: UIButton = lessonButton("清空当前模块草稿", identifier: "lab.sandboxReset") { [weak self] in
        guard let self else {
            return
        }
        self.perform { store in
            try store.reset()
            self.record("已清空 \(self.namespace)，其它模块不受影响。")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readDraft()
    }

    private func readDraft() {
        perform { store in
            self.directoryLabel.byText("当前命名空间：\(self.namespace)\n\n\(store.directoryPath)\n\nApplication Support / 原子写入 / 文件保护")
            self.record("\(self.namespace)：\(try store.read())")
        }
    }

    private func perform(_ action: (JobsLabSandboxStore) throws -> Void) {
        do {
            try action(JobsLabSandboxStore(namespace: namespace))
        } catch {
            record(error.localizedDescription)
        }
    }
}
