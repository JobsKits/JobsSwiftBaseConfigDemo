//
//  JobsBluetoothFeatureDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import GKNavigationBarSwift
import JobsBluetooth
import JobsByUIKit
import JobsInheritance
import JobsScale
import JobsSwiftBaseDefines
import JobsSwiftDSL
import SnapKit

/// 单项蓝牙能力的独立演示页，页面内直接展示执行状态和数据，不再依赖控制台。
final class JobsBluetoothFeatureDemoVC: BaseVC {
    private let featureIndex: Int
    private let featureTitle: String
    private var logLines = [String]()
    private lazy var profile = JobsBluetoothProfile()
        .byIdentifier("jobs.bluetooth.demo.\(featureIndex)")
        .byServiceUUIDStrings(["FFF0"])
        .byWriteUUIDString("FFF1")
        .byNotifyUUIDString("FFF2")
        .byReadUUIDString("FFF3")
        .byScanTimeout(10)
        .byConnectTimeout(12)
        .byMaximumReconnectCount(3)
        .byAllowDuplicates(false)
        .byEncoder { payload in
            if let text = payload as? String { return Data(text.utf8) }
            if let data = payload as? Data { return data }
            throw JobsBluetoothError.invalidPacket
        }
        .byDecoder { data in String(decoding: data, as: UTF8.self) }
    private lazy var manager = JobsBluetoothManager(profile: profile)
        .byMockTransport(JobsBluetoothMockTransport().byEnabled(true).byLatency(0.2))
        .onStateChanged { [weak self] state in self?.appendLog("状态变化：\(state)") }
        .onPeripheralDiscovered { [weak self] peripheral in
            self?.appendLog("发现设备：\(peripheral.name)｜RSSI \(peripheral.RSSI)｜\(peripheral.identifier.uuidString)")
        }
        .onDataReceived { [weak self] data, decoded in
            self?.appendLog("收到 \(data.count) 字节｜解析值：\(String(describing: decoded))")
        }
        .onLog { [weak self] message in self?.appendLog(message) }
    private lazy var descriptionLabel: UILabel = {
        UILabel()
            .byText("当前演示：\(featureTitle)\n默认启用 Mock Transport，可在模拟器直接验证点击链路和数据回调。")
            .byFont(JobsFont.systemFont(ofSize: 15))
            .byNumberOfLines(0)
            .byTextColor(JobsCor.label)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom).offset(16.h)
                make.left.right.equalToSuperview().inset(20.w)
            }
    }()
    private lazy var executeButton: UIButton = {
        UIButton.sys()
            .byTitle("执行 \(featureTitle)")
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 16))
            .byTitleColor(JobsCor.white)
            .byBackgroundColor(JobsCor.systemBlue)
            .byCornerRadius(10)
            .onTap { [weak self] _ in self?.runFeature() }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(16.h)
                make.left.right.equalToSuperview().inset(20.w)
                make.height.equalTo(48.h)
            }
    }()
    private lazy var logTextView: UITextView = {
        UITextView()
            .byEditable(false)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(executeButton.snp.bottom).offset(16.h)
                make.left.right.equalToSuperview().inset(20.w)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16.h)
            }
    }()

    init(featureIndex: Int, featureTitle: String) {
        self.featureIndex = featureIndex
        self.featureTitle = featureTitle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) 未实现") }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: featureTitle.tr)
        descriptionLabel.byVisible(true)
        executeButton.byVisible(true)
        logTextView.byVisible(true)
        appendLog("详情页已进入，点击蓝色按钮开始演示。")
    }

    private func appendLog(_ message: String) {
        logLines.append("[\(Date().formatted(date: .omitted, time: .standard))] \(message)")
        logTextView.byText(logLines.joined(separator: "\n"))
        if !logLines.isEmpty {
            logTextView.scrollRangeToVisible(NSRange(location: max(0, logTextView.text.count - 1), length: 1))
        }
    }

    private func runFeature() {
        appendLog("执行：\(featureTitle)")
        switch featureIndex {
        /// 合并处理 0...3 范围、数值 21 分支
        case 0...3, 21: manager.startScan()
        /// 处理 4...6 范围 分支
        case 4...6:
            manager.startScan()
            if let peripheral = manager.discoveredPeripherals.first { manager.connect(identifier: peripheral.identifier) }
        /// 处理 数值 7 分支
        case 7: manager.read();appendLog("已提交 Read 请求；真实设备需要配置 FFF3 特征。")
        /// 处理 数值 10 分支
        case 10: manager.setNotifyEnabled(true);appendLog("已提交 Notify 开启请求。")
        /// 处理 数值 11 分支
        case 11: appendLog("MTU 与分包由 maximumWriteValueLength 决定，协议层不写死长度。")
        /// 处理 数值 15 分支
        case 15: manager.disconnect()
        /// 处理 数值 16 分支
        case 16: appendLog("状态恢复由 Manager 收口；宿主显式声明 bluetooth-central。")
        /// 合并处理 数值 17、数值 24 分支
        case 17, 24: appendLog("Profile、Manager、Command 已全部通过 byXxx / onXxx DSL 配置。")
        /// 未匹配已知分支时执行兜底处理
        default:
            let command = JobsBluetoothCommand()
                .byIdentifier("demo.\(featureIndex)")
                .byPayload(Data("JobsBluetooth-\(featureIndex)".utf8))
                .byTimeout(3)
                .byRetryCount(2)
                .byPriority(featureIndex)
                .byResponseMatcher { !$0.isEmpty }
            manager.send(command) { [weak self] result in self?.appendLog("命令完成：\(result)") }
        }
    }
}
