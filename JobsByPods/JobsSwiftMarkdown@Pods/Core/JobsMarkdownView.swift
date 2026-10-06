//
//  JobsMarkdownView.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import UIKit
import WebKit

import JobsSwiftDSL
import JobsSwiftBaseDefines
import SnapKit

@MainActor
public protocol JobsMarkdownViewDelegate: AnyObject {
    func markdownViewDidFinishRendering(_ markdownView: JobsMarkdownView)
    func markdownView(_ markdownView: JobsMarkdownView, didRequestOpen url: URL)
    func markdownView(_ markdownView: JobsMarkdownView, didFail error: Error)
}

public extension JobsMarkdownViewDelegate {
    func markdownViewDidFinishRendering(_ markdownView: JobsMarkdownView) {}
    func markdownView(_ markdownView: JobsMarkdownView, didRequestOpen url: URL) {}
    func markdownView(_ markdownView: JobsMarkdownView, didFail error: Error) {}
}

public enum JobsMarkdownViewError: LocalizedError {
    case runtimeResourcesNotFound
    case invalidMessage
    case renderFailed(String)

    public var errorDescription: String? {
        switch self {
        case .runtimeResourcesNotFound:
            return "未找到 JobsSwiftMarkdownResources.bundle。"
        case .invalidMessage:
            return "Markdown 渲染器返回了无法识别的消息。"
        case .renderFailed(let message):
            return "Markdown 渲染失败：\(message)"
        }
    }
}

@MainActor
public final class JobsMarkdownView: UIView {
    public weak var delegate: JobsMarkdownViewDelegate?
    public private(set) var document: JobsMarkdownDocument?
    public private(set) var configuration = JobsMarkdownConfiguration()
    public private(set) lazy var webView: WKWebView = jobsMakeWebView()

    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
            .byHidesWhenStopped(true)
        addSubview(view)
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
        };return view
    }()
    private var pendingPayload: JobsMarkdownRenderPayload?
    private var isRuntimeReady = false
    private var renderID = UUID().uuidString
    private var activeNavigation: WKNavigation?
    private var remoteBlockingRule: WKContentRuleList?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        jobsCommonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        jobsCommonInit()
    }

    @discardableResult
    public func byConfiguration(_ configuration: JobsMarkdownConfiguration) -> Self {
        self.configuration = configuration
        return self
    }

    @discardableResult
    public func byLoad(_ document: JobsMarkdownDocument) -> Self {
        load(document)
        return self
    }

    public func load(
        _ document: JobsMarkdownDocument,
        configuration: JobsMarkdownConfiguration? = nil
    ) {
        self.document = document
        if let configuration {
            self.configuration = configuration
        }
        let requestID = UUID().uuidString
        renderID = requestID
        loadingView.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let result = Result { try Data(contentsOf: document.fileURL) }
            DispatchQueue.main.async { [weak self] in
                guard let self, self.renderID == requestID else {
                    return
                }
                switch result {
                /// 文件读取成功后在 UI 执行域启动对应渲染。
                case .success(let data):
                    self.render(
                        markdown: String(decoding: data, as: UTF8.self),
                        title: document.title,
                        baseURL: document.fileURL.deletingLastPathComponent(),
                        readAccessURL: document.contentRootURL
                    )
                /// 旧请求已在上方按身份排除，只上报当前读取失败。
                case .failure(let error):
                    self.jobsFail(error)
                }
            }
        }
    }

    public func render(
        markdown: String,
        title: String = "",
        baseURL: URL? = nil,
        readAccessURL: URL? = nil,
        configuration: JobsMarkdownConfiguration? = nil
    ) {
        if let configuration {
            self.configuration = configuration
        }
        guard let templateURL = JobsMarkdownResourceLocator.templateURL() else {
            jobsFail(JobsMarkdownViewError.runtimeResourcesNotFound)
            return
        }
        renderID = UUID().uuidString
        let expectedID = renderID
        webView.stopLoading()
        activeNavigation = nil
        pendingPayload = JobsMarkdownRenderPayload(
            renderID: renderID,
            markdown: markdown,
            title: title,
            baseURL: baseURL?.absoluteString ?? "",
            appearance: self.configuration.appearance.rawValue,
            fontScale: self.configuration.fontScale.isFinite ? min(max(self.configuration.fontScale, 0.75), 2) : 1,
            showsTableOfContents: self.configuration.showsTableOfContents,
            showsCodeCopyButton: self.configuration.showsCodeCopyButton,
            rendersMermaid: self.configuration.rendersMermaid,
            rendersMath: self.configuration.rendersMath,
            sanitizesHTML: self.configuration.sanitizesHTML,
            allowsRemoteContent: self.configuration.allowsRemoteContent,
            customCSS: self.configuration.customCSS
        )
        isRuntimeReady = false
        loadingView.startAnimating()
        let preferredReadAccessURL = readAccessURL ?? templateURL.deletingLastPathComponent()
        let readAccessRootURL = jobsCommonAncestorURL(
            templateURL.deletingLastPathComponent(),
            preferredReadAccessURL
        )
        jobsPrepareResourcePolicy(allowsRemote: self.configuration.allowsRemoteContent) { [weak self] error in
            guard let self, self.renderID == expectedID else {
                return
            }
            if let error {
                self.jobsFail(error)
                return
            }
            self.activeNavigation = self.webView.loadFileURL(templateURL, allowingReadAccessTo: readAccessRootURL)
        }
    }

    public func reloadDocument() {
        guard let document else { return }
        load(document)
    }

    public func scrollToAnchor(_ anchor: String, animated: Bool = true) {
        let data = try? JSONEncoder.make { _ in }.encode(anchor)
        guard let data, let value = String(data: data, encoding: .utf8) else { return }
        webView.jobsEval("window.JobsMarkdownRuntime.scrollToAnchor(\(value), \(animated));")
    }

    public func find(
        _ text: String,
        backwards: Bool = false,
        completion: ((WKFindResult) -> Void)? = nil
    ) {
        guard #available(iOS 14.5, *) else { return }
        let findConfiguration = WKFindConfiguration()
        findConfiguration.backwards = backwards
        findConfiguration.wraps = true
        webView.find(
            text,
            configuration: findConfiguration,
            completionHandler: completion ?? { _ in }
        )
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard configuration.appearance == .automatic,
              traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        webView.jobsEval("window.JobsMarkdownRuntime.refreshAppearance('automatic');")
    }
}

@MainActor
private extension JobsMarkdownView {
    func jobsCommonInit() {
        byBackgroundColor(JobsCor.systemBackground)
        webView.byVisible(YES)
        loadingView.byVisible(YES)
    }

    func jobsMakeWebView() -> WKWebView {
        let userContentController = WKUserContentController()
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.byUserContentController(userContentController)
        webConfiguration.defaultWebpagePreferences.allowsContentJavaScript = true
        webConfiguration.byAllowsInlineMediaPlayback(true)
        let view = WKWebView(frame: .zero, configuration: webConfiguration)
            .byNavigationDelegate(self)
            .byUIDelegate(self)
            .byAllowsBackForwardNavigationGestures(true)
            .byScrollView {
                $0.byBackgroundColor(JobsCor.systemBackground)
                    .byContentInsetAdjustmentBehavior(.never)
            }
        addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        userContentController.add(
            JobsMarkdownWeakScriptMessageHandler(target: self),
            name: "jobsMarkdown"
        );return view
    }

    /// 内容规则在首个 DOM/样式被加载前安装，覆盖 srcset、CSS 与 iframe 等网络资源。
    func jobsPrepareResourcePolicy(allowsRemote: Bool, completion: @escaping (Error?) -> Void) {
        if allowsRemote {
            if let remoteBlockingRule {
                webView.configuration.userContentController.remove(remoteBlockingRule)
            }
            completion(nil)
            return
        }
        if let remoteBlockingRule {
            webView.configuration.userContentController.add(remoteBlockingRule)
            completion(nil)
            return
        }
        let policyID = renderID
        let rules = #"[{"trigger":{"url-filter":"^https?://","url-filter-is-case-sensitive":false},"action":{"type":"block"}}]"#
        WKContentRuleListStore.default().compileContentRuleList(
            forIdentifier: "JobsMarkdown.BlockRemote.v1",
            encodedContentRuleList: rules
        ) { [weak self] rule, error in
            DispatchQueue.main.async { [weak self] in
                guard let self else {
                    return
                }
                guard let rule else {
                    completion(error ?? JobsMarkdownViewError.renderFailed("远程资源阻断规则不可用"))
                    return
                }
                self.remoteBlockingRule = rule
                guard self.renderID == policyID else {
                    return
                }
                self.webView.configuration.userContentController.add(rule)
                completion(nil)
            }
        }
    }

    func jobsRenderPendingPayload() {
        guard isRuntimeReady, let pendingPayload else { return }
        let expectedID = pendingPayload.renderID
        do {
            let data = try JSONEncoder.make { _ in }.encode(pendingPayload)
            let base64 = data.base64EncodedString()
            webView.evaluateJavaScript(
                "window.JobsMarkdownRuntime.renderBase64('\(base64)');"
            ) { [weak self] _, error in
                guard let self, self.renderID == expectedID, let error else { return }
                self.jobsFail(error)
            }
        } catch {
            jobsFail(error)
        }
    }

    func jobsHandleMessage(_ body: Any) {
        guard let message = body as? [String: Any],
              let type = message["type"] as? String else {
            jobsFail(JobsMarkdownViewError.invalidMessage)
            return
        }
        guard type == "ready" || message["renderID"] as? String == renderID else {
            return
        }
        switch type {
        case "ready":
            break
        case "rendered":
            loadingView.stopAnimating()
            delegate?.markdownViewDidFinishRendering(self)
        case "copy":
            UIPasteboard.general.string = message["text"] as? String
        case "link":
            guard let value = message["url"] as? String,
                  let url = URL(string: value) else {
                jobsFail(JobsMarkdownViewError.invalidMessage)
                return
            }
            delegate?.markdownView(self, didRequestOpen: url)
        case "error":
            jobsFail(
                JobsMarkdownViewError.renderFailed(
                    message["message"] as? String ?? "Unknown JavaScript error"
                )
            )
        default:
            break
        }
    }

    func jobsFail(_ error: Error) {
        loadingView.stopAnimating()
        delegate?.markdownView(self, didFail: error)
    }

    func jobsCommonAncestorURL(_ firstURL: URL, _ secondURL: URL) -> URL {
        let firstComponents = firstURL.standardizedFileURL.pathComponents
        let secondComponents = secondURL.standardizedFileURL.pathComponents
        var commonComponents: [String] = []
        for pair in zip(firstComponents, secondComponents) {
            guard pair.0 == pair.1 else { break }
            commonComponents.append(pair.0)
        }
        guard commonComponents.count > 1 else { return firstURL.deletingLastPathComponent() };return URL(
            fileURLWithPath: NSString.path(withComponents: commonComponents),
            isDirectory: true
        )
    }
}

extension JobsMarkdownView: WKNavigationDelegate, WKUIDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard navigation === activeNavigation else {
            return
        }
        isRuntimeReady = true
        jobsRenderPendingPayload()
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        guard navigation === activeNavigation else {
            return
        }
        isRuntimeReady = false
        jobsFail(error)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        guard navigation === activeNavigation else {
            return
        }
        isRuntimeReady = false
        jobsFail(error)
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        isRuntimeReady = false
        jobsFail(JobsMarkdownViewError.renderFailed("网页渲染进程已终止，可重新加载"))
    }

    public func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        guard navigationAction.navigationType == .linkActivated,
              let url = navigationAction.request.url else {
            decisionHandler(.allow)
            return
        }
        delegate?.markdownView(self, didRequestOpen: url)
        decisionHandler(.cancel)
    }
}

extension JobsMarkdownView: WKScriptMessageHandler {
    public func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        guard message.frameInfo.isMainFrame, message.frameInfo.request.url?.isFileURL == true else {
            return
        }
        jobsHandleMessage(message.body)
    }
}

private final class JobsMarkdownWeakScriptMessageHandler: NSObject, WKScriptMessageHandler {
    weak var target: WKScriptMessageHandler?

    init(target: WKScriptMessageHandler) {
        self.target = target
    }

    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        target?.userContentController(userContentController, didReceive: message)
    }
}

private struct JobsMarkdownRenderPayload: Encodable {
    let renderID: String
    let markdown: String
    let title: String
    let baseURL: String
    let appearance: String
    let fontScale: Double
    let showsTableOfContents: Bool
    let showsCodeCopyButton: Bool
    let rendersMermaid: Bool
    let rendersMath: Bool
    let sanitizesHTML: Bool
    let allowsRemoteContent: Bool
    let customCSS: String
}
