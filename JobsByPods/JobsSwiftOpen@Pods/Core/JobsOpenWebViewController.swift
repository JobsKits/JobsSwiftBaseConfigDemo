//
//  JobsOpenWebViewController.swift
//  JobsSwiftOpen
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import WebKit
import JobsInheritance
import JobsByUIKit
import GKNavigationBarSwift
import SnapKit

@MainActor
public final class JobsOpenWebViewController: BaseVC {
    private let url: URL
    private let pageTitle: String?
    private let pageLoadCompletion: ((Result<URL, Error>) -> Void)?
    private var activeNavigation: WKNavigation?
    private lazy var retryButton: UIButton = {
        JobsEmptyAuto.Config.defaultProvider()
            .byTitle("网页加载失败", for: .normal)
            .bySubTitle("点击重新加载", for: .normal)
            .byVisible(false)
            .onTap { [weak self] _ in
                self?.reloadPage()
            }
    }()

    private lazy var backButton: UIButton = {
        UIButton.sys()
            .byFrame(CGRect(x: 0, y: 0, width: 64, height: 44))
            .byTitle("‹ 返回", for: .normal)
            .byContentHorizontalAlignment(.left)
            .onTap { [weak self] _ in
                self?.handleBack()
            }
    }()

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        webView
            .byNavigationDelegate(self)
            .byAllowsBackForwardNavigationGestures(true)
        return webView
    }()

    public init(
        url: URL,
        pageTitle: String? = nil,
        pageLoadCompletion: ((Result<URL, Error>) -> Void)? = nil
    ) {
        self.url = url
        self.pageTitle = pageTitle
        self.pageLoadCompletion = pageLoadCompletion
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = pageTitle ?? url.host
        jobsSetupGKNav(title: title ?? "网页", leftButton: backButton)
        webView.byAddTo(view)
        webView.snp.makeConstraints { make in
            make.top.equalTo(gk_navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        retryButton.byAddTo(view) { make in
            make.center.equalTo(self.webView)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.9)
        }
        reloadPage()
    }

    public func reloadPage() {
        retryButton.byVisible(false)
        webView.stopLoading()
        activeNavigation = webView.load(URLRequest(url: url))
    }

    private func didFail(_ error: Error) {
        retryButton.byVisible(true)
        pageLoadCompletion?(.failure(error))
    }

    private func handleBack() {
        if webView.canGoBack {
            webView.goBack()
        } else if let navigationController,
                  navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else if let navigationController,
                  navigationController.presentingViewController != nil {
            navigationController.dismiss(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}

extension JobsOpenWebViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard navigation === activeNavigation else {
            return
        }
        retryButton.byVisible(false)
        pageLoadCompletion?(.success(webView.url ?? url))
        if pageTitle == nil {
            title = webView.title ?? url.host
            gk_navTitle = title ?? "网页"
        }
    }
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activeNavigation = navigation
        retryButton.byVisible(false)
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        guard navigation === activeNavigation else {
            return
        }
        didFail(error)
    }

    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        guard navigation === activeNavigation else {
            return
        }
        didFail(error)
    }

    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        didFail(NSError(domain: "JobsSwiftOpen", code: 1, userInfo: [NSLocalizedDescriptionKey: "网页进程已终止"]))
    }

}
