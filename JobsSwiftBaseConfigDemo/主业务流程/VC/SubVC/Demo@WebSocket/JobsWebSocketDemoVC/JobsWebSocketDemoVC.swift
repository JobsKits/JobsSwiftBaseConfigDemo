//
//  JobsWebSocketDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit
import JobsSwiftBaseDefines
import JobsSwiftDSL
import JobsInheritance
import JobsSwiftWebSocket
import SnapKit
import GKNavigationBarSwift

final class JobsWebSocketDemoVC: BaseVC {
    private let defaultEndpoint = "wss://ws.postman-echo.com/raw"
    private let client = JobsSwiftWebSocketClient()
    private let horizontalInset: CGFloat = 16
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    // MARK: - UI
    private lazy var endpointTF: UITextField = {
        UITextField()
            .byText(defaultEndpoint)
            .byPlaceholder("请输入 ws:// 或 wss:// 地址".tr)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.label)
            .byBorderStyle(.roundedRect)
            .byKeyboardType(.URL)
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .byClearButtonMode(.whileEditing)
            .byAddTo(view) { [unowned self] make in
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(gk_navigationBar.snp.bottom).offset(12)
                } else {
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
                }
            }
    }()

    private lazy var connectBtn: UIButton = {
        UIButton.sys()
            .byTitle("连接".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.connect()
            }
    }()

    private lazy var disconnectBtn: UIButton = {
        UIButton.sys()
            .byTitle("断开".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                guard let self else { return }
                client.disconnect()
                appendLog("主动断开连接")
            }
    }()

    private lazy var sendBtn: UIButton = {
        UIButton.sys()
            .byTitle("发送".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .onTap { [weak self] _ in
                self?.sendMessage()
            }
    }()

    private lazy var buttonRow: UIStackView = {
        UIStackView(arrangedSubviews: [connectBtn, disconnectBtn, sendBtn])
            .byAxis(.horizontal)
            .bySpacing(12)
            .byDistribution(.fillEqually)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(endpointTF.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(42)
            }
    }()

    private lazy var messageTF: UITextField = {
        UITextField()
            .byText("Hello WebSocket")
            .byPlaceholder("输入要发送的文本消息".tr)
            .byFont(JobsFont.systemFont(ofSize: 14))
            .byTextColor(JobsCor.label)
            .byBorderStyle(.roundedRect)
            .byAutocapitalizationType(.none)
            .byAutocorrectionType(.no)
            .byClearButtonMode(.whileEditing)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(buttonRow.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.height.equalTo(44)
            }
    }()

    private lazy var statusLab: UILabel = {
        UILabel()
            .byText("状态：未连接".tr)
            .byFont(JobsFont.systemFont(ofSize: 14, weight: .medium))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(messageTF.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
            }
    }()

    private lazy var logTextView: UITextView = {
        UITextView()
            .byText("操作日志".tr)
            .byEditable(false)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byTextColor(JobsCor.label)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(10)
            .byMasksToBounds(true)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(statusLab.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(horizontalInset)
                make.right.equalToSuperview().inset(horizontalInset)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(12)
            }
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "WebSocket 双向通信".tr)
        endpointTF.byVisible(YES)
        buttonRow.byVisible(YES)
        messageTF.byVisible(YES)
        statusLab.byVisible(YES)
        logTextView.byVisible(YES)
        bindClient()
        updateUI(for: .idle)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        client.disconnect()
    }
    // MARK: - Actions
    private func connect() {
        let endpoint = (endpointTF.text ?? "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard
            let url = URL(string: endpoint),
            let scheme = url.scheme?.lowercased(),
            scheme == "ws" || scheme == "wss"
        else {
            appendLog("地址无效，请输入 ws:// 或 wss:// 地址")
            return
        }
        appendLog("开始连接：\(endpoint)")
        client.connect(to: url)
    }

    private func sendMessage() {
        let message = (messageTF.text ?? "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !message.isEmpty else {
            appendLog("发送内容不能为空")
            return
        }
        client.send(text: message) { [weak self] result in
            guard let self else { return }
            switch result {
            /// 发送成功
            case .success:
                appendLog("→ \(message)")
            /// 发送失败
            case .failure(let error):
                appendLog("发送失败：\(error.localizedDescription)")
            }
        }
    }
    // MARK: - Client
    private func bindClient() {
        client.onStateChange = { [weak self] state in
            guard let self else { return }
            updateUI(for: state)
            appendLog("状态：\(state.title)")
        }
        client.onTextMessage = { [weak self] text in
            self?.appendLog("← \(text)")
        }
        client.onDataMessage = { [weak self] data in
            self?.appendLog("← 二进制数据：\(data.count) bytes")
        }
    }

    private func updateUI(for state: JobsSwiftWebSocketClient.State) {
        statusLab.byText("状态：\(state.title)")
        let connected = state == .connected
        let connecting: Bool
        switch state {
        /// 正在首次连接
        case .connecting:
            connecting = true
        /// 正在等待自动重连
        case .reconnecting:
            connecting = true
        /// 其余状态
        default:
            connecting = false
        }
        sendBtn.byEnabled(connected)
        disconnectBtn.byEnabled(connected || connecting)
        connectBtn.byEnabled(!(connected || connecting))
    }

    private func appendLog(_ message: String) {
        let timestamp = timeFormatter.string(from: Date())
        let oldText = logTextView.text ?? ""
        let prefix = oldText.isEmpty ? "" : "\n"
        let text = "\(oldText)\(prefix)[\(timestamp)] \(message)"
        logTextView.byText(text)
            .byScrollToVisible(range: NSRange(location: text.utf16.count, length: 0))
    }
}

private extension JobsSwiftWebSocketClient.State {
    var title: String {
        switch self {
        /// 尚未发起连接
        case .idle:
            return "未连接"
        /// 正在握手
        case .connecting:
            return "连接中…"
        /// 已建立双向连接
        case .connected:
            return "已连接"
        /// 正在等待自动重连
        case .reconnecting(let attempt, let delay):
            return "第 \(attempt) 次重连将在 \(String(format: "%.1f", delay)) 秒后开始"
        /// 已主动断开
        case .disconnected:
            return "已断开"
        /// 连接失败或重连次数耗尽
        case .failed(let message):
            return "失败：\(message)"
        }
    }
}
