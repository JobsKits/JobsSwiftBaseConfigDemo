//
//  JobsOpenWebViewController.swift
//  JobsSwiftOpen
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import WebKit
import JobsInheritance
import JobsByUIKit

public final class JobsOpenWebViewController: BaseVC {

    private let url: URL
    private let pageTitle: String?

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }()

    public init(url: URL, pageTitle: String? = nil) {
        self.url = url
        self.pageTitle = pageTitle
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = pageTitle ?? url.host
        webView.byAddTo(view) { [unowned self] make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        webView.load(URLRequest(url: url))
    }
}

extension JobsOpenWebViewController: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard pageTitle == nil else { return }
        title = webView.title ?? url.host
    }
}
