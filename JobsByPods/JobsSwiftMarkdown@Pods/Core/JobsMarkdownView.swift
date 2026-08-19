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
        let markdownData: Data
        do {
            markdownData = try Data(contentsOf: document.fileURL)
        } catch {
            jobsFail(error)
            return
        }
        let markdown = String(decoding: markdownData, as: UTF8.self)
        render(
            markdown: markdown,
            title: document.title,
            baseURL: document.fileURL.deletingLastPathComponent(),
            readAccessURL: document.contentRootURL
        )
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
        pendingPayload = JobsMarkdownRenderPayload(
            markdown: markdown,
            title: title,
            baseURL: baseURL?.absoluteString ?? "",
            appearance: self.configuration.appearance.rawValue,
            fontScale: self.configuration.fontScale,
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
        webView.loadFileURL(templateURL, allowingReadAccessTo: readAccessRootURL)
    }

    public func reloadDocument() {
        guard let document else { return }
        load(document)
    }

    public func scrollToAnchor(_ anchor: String, animated: Bool = true) {
        let data = try? JSONSerialization.data(withJSONObject: anchor)
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

    func jobsRenderPendingPayload() {
        guard isRuntimeReady, let pendingPayload else { return }
        do {
            let data = try JSONEncoder.make { _ in }.encode(pendingPayload)
            let base64 = data.base64EncodedString()
            webView.evaluateJavaScript(
                "window.JobsMarkdownRuntime.renderBase64('\(base64)');"
            ) { [weak self] _, error in
                guard let self, let error else { return }
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
        switch type {
        case "ready":
            isRuntimeReady = true
            jobsRenderPendingPayload()
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
