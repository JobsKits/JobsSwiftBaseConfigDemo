//
//  JobsDeviceGuardDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import UIKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftDeviceGuard
import SnapKit

final class JobsDeviceGuardDemoVC: BaseVC {

    private var isInspecting = false

    private lazy var explanationLabel: UILabel = {
        UILabel.jobsMake { label in
            label
                .byText("运行时检测设备风险，不能禁止 iOS 安装。路径、已加载镜像、可选沙盒写入分别计算证据；两类命中才标记越狱，单类为可疑。未命中不代表设备安全，未知及不支持环境不自动放行。")
                .byNumberOfLines(0)
                .byFont(JobsFont.systemFont(ofSize: 14))
                .byTextColor(JobsCor.label)
                .byAddTo(view) { [unowned self] make in
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(16)
                    make.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
                }
        }
    }()

    private lazy var inspectButton: UIButton = {
        UIButton.sys()
            .byTitle("重新检测（只读）")
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .semibold))
            .byTitleColor(JobsCor.label)
            .byAccessibilityIdentifier("deviceGuard.inspect")
            .onTap { [weak self] _ in
                self?.inspect(writes: false,
                              gate: false)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(explanationLabel.snp.bottom).offset(12)
                make.left.right.equalTo(explanationLabel)
                make.height.greaterThanOrEqualTo(44)
            }
    }()

    private lazy var writeProbeButton: UIButton = {
        UIButton.sys()
            .byTitle("检测并探测沙盒写入")
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .semibold))
            .byTitleColor(JobsCor.label)
            .byAccessibilityIdentifier("deviceGuard.writeProbe")
            .onTap { [weak self] _ in
                self?.inspect(writes: true,
                              gate: false)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(inspectButton.snp.bottom).offset(4)
                make.left.right.equalTo(explanationLabel)
                make.height.greaterThanOrEqualTo(44)
            }
    }()

    private lazy var gateButton: UIButton = {
        UIButton.sys()
            .byTitle("演示敏感业务门禁（先复检）")
            .byTitleFont(JobsFont.systemFont(ofSize: 15,
                                             weight: .semibold))
            .byTitleColor(JobsCor.label)
            .byAccessibilityIdentifier("deviceGuard.gate")
            .onTap { [weak self] _ in
                self?.inspect(writes: false,
                              gate: true)
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(writeProbeButton.snp.bottom).offset(4)
                make.left.right.equalTo(explanationLabel)
                make.height.greaterThanOrEqualTo(44)
            }
    }()

    private lazy var reportView: UITextView = {
        UITextView.jobsMake { text in
            text
                .byEditable(false)
                .bySelectable(true)
                .byFont(JobsFont.monospacedSystemFont(ofSize: 13,
                                                      weight: .regular))
                .byTextColor(JobsCor.label)
                .byBackgroundColor(JobsCor.secondarySystemBackground)
                .byAccessibilityIdentifier("deviceGuard.report")
                .byText("尚未检测，点击重新检测。")
                .byAddTo(view) { [unowned self] make in
                    make.top.equalTo(gateButton.snp.bottom).offset(12)
                    make.left.right.equalTo(explanationLabel)
                    make.bottom.equalTo(view.safeAreaLayoutGuide).inset(12)
                }
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "设备越狱风险检测")
        assembleViews()
        inspect(writes: false,
                gate: false)
    }

    private func assembleViews() {
        explanationLabel.byVisible(true)
        inspectButton.byVisible(true)
        writeProbeButton.byVisible(true)
        gateButton.byVisible(true)
        reportView.byVisible(true)
    }

    private func inspect(writes: Bool,
                         gate: Bool) {
        guard !isInspecting else {
            return
        }
        isInspecting = true
        reportView.byText("正在检测…沙盒写入\(writes ? "已启用：仅创建独占随机空文件并清理" : "已关闭")。")
        let configuration = JobsDeviceGuardConfiguration()
            .bySandboxWriteProbe(writes)
        JobsDeviceGuard.inspectAsync(configuration: configuration) { [weak self] report in
            guard let self else {
                return
            }
            self.isInspecting = false
            self.reportView.byText(self.reportText(report,
                                                   gate: gate))
        }
    }

    private func reportText(_ report: JobsDeviceGuardReport,
                            gate: Bool) -> String {
        var lines = ["结论：\(report.verdict.rawValue)",
            "环境：\(report.platform)",
            "独立命中：\(report.detectedCategories.count) / 阈值 \(report.minimumDetectedCategories)",
            "检测时间：\(report.evaluatedAt)"]
        if gate {
            lines.append(report.shouldRestrict
                ? "门禁演示：限制本次敏感操作（未知及不支持环境也不放行）。"
                : "门禁演示：本次本地策略允许继续；正式业务仍需服务端授权。")
        }
        for check in report.checks {
            lines.append("\n\(check.category.rawValue)：\(check.state.rawValue)")
            lines.append(contentsOf: check.evidence.map {
                "命中：\($0)"
            })
            lines.append(contentsOf: check.diagnostics.map {
                "诊断：\($0)"
            })
        }
        lines.append("\n权限拒绝、探测失败不等同越狱；本地检测可能被隐藏或篡改。没有上传、强退或安装拦截。")
        return lines.joined(separator: "\n")
    }
}
