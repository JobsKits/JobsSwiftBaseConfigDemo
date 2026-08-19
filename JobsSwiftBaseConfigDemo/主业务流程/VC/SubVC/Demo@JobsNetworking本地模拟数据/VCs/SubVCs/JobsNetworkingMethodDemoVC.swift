//
//  JobsNetworkingMethodDemoVC.swift
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

import JobsByUIKit
import JobsSwiftDSL
import JobsNetworking
import JobsInheritance
import JobsSwiftBaseDefines
import SnapKit
import GKNavigationBarSwift

class JobsNetworkingMethodDemoVC: BaseVC {
    let item: MethodDemoItem
    let service = DemoService.shared

    var requestPreviewText = "还没有请求内容" {
        didSet { requestPreviewTextView.byText(requestPreviewText) }
    }

    var statusText = "点击按钮发起请求" {
        didSet { statusLabel.byText("状态：\(statusText)") }
    }

    var renderResultText = "还没有结果" {
        didSet { renderTextView.byText(renderResultText) }
    }

    var rawResponseText = "还没有响应" {
        didSet { rawTextView.byText(rawResponseText) }
    }

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byShowsVerticalScrollIndicator(NO)
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    private lazy var contentView: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(self.scrollView.contentLayoutGuide)
                make.width.equalTo(self.scrollView.frameLayoutGuide)
            }
    }()

    private lazy var introLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText(item.subTitle)
            .byFont(JobsFont.boldSystemFont(ofSize: 22))
            .byNumberOfLines(0)
            .byAddTo(contentView) { make in
                make.top.equalToSuperview().offset(16)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var pathLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("接口：\(item.path)")
            .byFont(JobsFont.systemFont(ofSize: 15, weight: .medium))
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(introLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var statusLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("状态：\(statusText)")
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(pathLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    private lazy var requestButton: UIButton = {
        UIButton.sys()
            .byTitle("发起请求".tr, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue.withAlphaComponent(0.12))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.sendRequest(triggerError: false)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
                make.height.equalTo(44)
            }
    }()

    private lazy var errorButton: UIButton = {
        UIButton.sys()
            .byTitle("触发错误".tr, for: .normal)
            .byBackgroundColor(JobsCor.systemRed.withAlphaComponent(0.12))
            .byCornerRadius(10)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.sendRequest(triggerError: true)
            }
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(statusLabel.snp.bottom).offset(16)
                make.left.equalTo(requestButton.snp.right).offset(12)
                make.right.equalToSuperview().inset(16)
                make.width.equalTo(requestButton)
                make.height.equalTo(44)
            }
    }()

    private lazy var requestTitleLabel: UILabel = {
        sectionTitleLabel("请求预览")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(requestButton.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    lazy var requestPreviewTextView: UITextView = {
        sectionTextView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(requestTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(100)
            }
    }()

    private lazy var renderTitleLabel: UILabel = {
        sectionTitleLabel("渲染结果")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(requestPreviewTextView.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    lazy var renderTextView: UITextView = {
        sectionTextView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(renderTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(140)
            }
    }()

    private lazy var rawTitleLabel: UILabel = {
        sectionTitleLabel("原始响应")
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(renderTextView.snp.bottom).offset(20)
                make.left.right.equalToSuperview().inset(16)
            }
    }()

    lazy var rawTextView: UITextView = {
        sectionTextView()
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(rawTitleLabel.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(16)
                make.height.greaterThanOrEqualTo(180)
                make.bottom.equalToSuperview().inset(24)
            }
    }()

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    init(item: MethodDemoItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "%@ Demo".tr(item.methodType.title))
        view.byBackgroundColor(JobsCor.systemBackground)
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        requestPreviewTextView.byText(requestPreviewText)
        renderTextView.byText(renderResultText)
        rawTextView.byText(rawResponseText)
    }

    func performRequest(triggerError: Bool) async throws {
        fatalError("Subclasses must override performRequest(triggerError:)")
    }

    func buildRequestPreview(triggerError: Bool) -> String {
        item.path
    }
}

extension JobsNetworkingMethodDemoVC {
    func debugRequestByURLSession() {
        let url = URL(string: "http://127.0.0.1:18080/api/get/dashboard?tab=overview&client=swift-demo")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("===== URLSession Debug =====")
            print("error =", error as Any)
            print("response =", response as Any)
            if let data, let text = String(data: data, encoding: .utf8) {
                print("body =", text)
            }
        }
        task.resume()
    }

    func sendRequest(triggerError: Bool) {
        requestButton.byEnabled(false)
        errorButton.byEnabled(false)
        statusText = "\(item.methodType.title) 请求中..."
        requestPreviewText = buildRequestPreview(triggerError: triggerError)
        Task {
            do {
                try await performRequest(triggerError: triggerError)
            } catch let error as JobsError {
                let message: String
                switch error {
                /// 处理 .transport 分支
                case let .transport(underlying):
                    message = """
                    JobsError.transport
                    underlying = \(underlying)
                    """
                /// 处理 .http 分支
                case let .http(statusCode, data):
                    let raw = data.flatMap { String(data: $0, encoding: .utf8) } ?? "<empty>"
                    message = """
                    JobsError.http
                    statusCode = \(statusCode)
                    raw =
                    \(raw)
                    """
                /// 处理 .server 分支
                case let .server(statusCode, data):
                    let raw = data.flatMap { String(data: $0, encoding: .utf8) } ?? "<empty>"
                    message = """
                    JobsError.server
                    statusCode = \(statusCode)
                    raw =
                    \(raw)
                    """
                /// 处理 .decode 分支
                case let .decode(underlying, data):
                    let raw = data.flatMap { String(data: $0, encoding: .utf8) } ?? "<empty>"
                    message = """
                    JobsError.decode
                    underlying = \(underlying)
                    raw =
                    \(raw)
                    """
                /// 处理 .business 分支
                case let .business(code, msg, data):
                    let raw = data.flatMap { String(data: $0, encoding: .utf8) } ?? "<empty>"
                    message = """
                    JobsError.business
                    code = \(code)
                    message = \(msg)
                    raw =
                    \(raw)
                    """
                /// 处理 .cacheMiss 分支
                case .cacheMiss:
                    message = "JobsError.cacheMiss"
                /// 处理 .cancelled 分支
                case .cancelled:
                    message = "JobsError.cancelled"
                /// 处理 .invalidRequest 分支
                case let .invalidRequest(reason):
                    message = """
                    JobsError.invalidRequest
                    reason = \(reason)
                    """
                /// 处理 .emptyResponse 分支
                case .emptyResponse:
                    message = "JobsError.emptyResponse"
                /// 处理 .unknown 分支
                case let .unknown(underlying):
                    message = """
                    JobsError.unknown
                    underlying = \(underlying)
                    """
                }
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.statusText = "\(self.item.methodType.title) 请求异常"
                    self.renderResultText = message
                    self.rawResponseText = message
                    self.finishRequest()
                }
            } catch {
                let message = """
                Unknown Error
                \(error)
                localized = \(error.localizedDescription)
                """
                onMainSync { [weak self] in
                    guard let self else { return }
                    self.statusText = "\(self.item.methodType.title) 请求异常"
                    self.renderResultText = message
                    self.rawResponseText = message
                    self.finishRequest()
                }
            }
        }
    }

    func handleSuccess(render: String, raw: String) {
        statusText = "\(item.methodType.title) 请求成功"
        renderResultText = render
        rawResponseText = raw
        finishRequest()
    }

    func handleFailure(_ raw: String) {
        statusText = "\(item.methodType.title) 请求失败"
        renderResultText = raw
        rawResponseText = raw
        finishRequest()
    }

    func finishRequest() {
        requestButton.byEnabled(true)
        errorButton.byEnabled(true)
    }

    func prettyPrint(_ lines: [String]) -> String {
        lines.joined(separator: "\n")
    }

    private func sectionTitleLabel(_ text: String) -> UILabel {
        UILabel.jobsMake { _ in }
            .byText(text)
            .byFont(JobsFont.boldSystemFont(ofSize: 18))
            .byNumberOfLines(1)
    }

    private func sectionTextView() -> UITextView {
        UITextView.jobsMake { _ in }
            .byTextColor(JobsCor.label)
            .byFont(JobsFont.monospacedSystemFont(ofSize: 13, weight: .regular))
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byBorderColor(JobsCor.separator)
            .byBorderWidth(0.5)
            .byEditable(NO)
            .byScrollEnabled(NO)
            .onResult { view in
                /// TODO
            }
    }
}
