//
//  JobsBluetoothDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsBluetooth
import JobsByUIKit
import JobsInheritance
import JobsScale
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit
import GKNavigationBarSwift

/// JobsBluetooth 全能力目录。真实设备和 Mock 设备共用同一套上层调用。
final class JobsBluetoothDemoVC: BaseVC {
    private let features = [
        "蓝牙状态与权限", "扫描配置", "扫描过滤与去重", "实时 RSSI", "单设备连接", "多设备并发连接",
        "Service / Characteristic / Descriptor 浏览", "Read", "Write With Response", "Write Without Response",
        "Notify 开启与关闭", "MTU 与自动分包", "命令队列", "超时与重试", "自动重连", "主动断开与异常断开",
        "前后台与状态恢复", "Device Profile", "协议 Encoder / Decoder", "CRC 校验策略", "初始化握手",
        "Mock 蓝牙设备", "数据录制与回放", "错误与诊断日志", "Swift DSL", "Objective-C Facade 设计",
        "OTA 扩展接口", "未知协议占位接入"
    ]
    private lazy var tableView: UITableView = {
        UITableView(frame: .zero, style: .insetGrouped)
            .byDataSource(self)
            .byDelegate(self)
            .byRowHeight(64.h)
            .byRegisterCell(UITableViewCell.self)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() { make.top.equalTo(gk_navigationBar.snp.bottom) }
                else { make.top.equalTo(view.safeAreaLayoutGuide.snp.top) }
                make.left.right.bottom.equalToSuperview()
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "JobsBluetooth 全能力 Demo".tr)
        tableView.byVisible(true)
    }
}

extension JobsBluetoothDemoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { features.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row + 1). \(features[indexPath.row])"
        content.secondaryText = indexPath.row == 21 ? "进入详情页，模拟器可直接运行" : "进入独立功能详情页"
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(
            JobsBluetoothFeatureDemoVC(featureIndex: indexPath.row,
                                       featureTitle: features[indexPath.row]),
            animated: true
        )
    }
}
