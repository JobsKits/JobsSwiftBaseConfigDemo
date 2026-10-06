//
//  JobsMarkdownWebKitRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import AppKit
import WebKit

@MainActor
private final class MarkdownProbe: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
    var done = false
    var failure: String?
    let allowsRemote: Bool
    let base: String
    init(allowsRemote: Bool, base: String) {
        self.allowsRemote = allowsRemote
        self.base = base
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let markdown = """
            # Section
            <img id="local-srcset" srcset="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw== 1x">
            <img src="\(base)/image.png">
            <img src="//127.0.0.1:\(URL(string: base)!.port!)/relative.png">
            <img srcset="\(base)/srcset.png 1x">
            <iframe src="\(base)/frame"></iframe>
            <style>@import url('\(base)/import.css'); .probe { background-image: url('\(base)/css.png'); }</style>
            <div class="probe">resource probe</div>
            """
        let payload: [String: Any] = [
            "renderID": "probe", "markdown": markdown, "title": "probe", "baseURL": base,
            "appearance": "light", "fontScale": 1, "showsTableOfContents": true,
            "showsCodeCopyButton": true, "rendersMermaid": false, "rendersMath": false,
            "sanitizesHTML": true, "allowsRemoteContent": allowsRemote,
            "customCSS": ".markdown-body { background-image: url('\(base)/custom.png'); }",
        ]
        do {
            let data = try JSONSerialization.data(withJSONObject: payload)
            webView.evaluateJavaScript("window.JobsMarkdownRuntime.renderBase64('\(data.base64EncodedString())');") {
                _, error in
                if let error {
                    self.failure = error.localizedDescription
                    self.done = true
                }
            }
        } catch {
            failure = error.localizedDescription
            done = true
        }
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        failure = error.localizedDescription
        done = true
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String: Any] else { return }
        if body["type"] as? String == "error" {
            failure = body["message"] as? String
            done = true
        }
        if body["type"] as? String == "rendered" { done = true }
    }
}

@main
struct JobsMarkdownWebKitRegression {
    @MainActor static func main() throws {
        precondition(
            CommandLine.arguments.count == 4, "usage: executable template-file-url base-http-url blocked|allowed")
        _ = NSApplication.shared
        let template = URL(fileURLWithPath: CommandLine.arguments[1])
        let blocked = CommandLine.arguments[3] == "blocked"
        let delegate = MarkdownProbe(allowsRemote: !blocked, base: CommandLine.arguments[2])
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(delegate, name: "jobsMarkdown")
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 800, height: 600), configuration: configuration)
        webView.navigationDelegate = delegate
        let window = NSWindow(contentRect: webView.frame, styleMask: [.borderless], backing: .buffered, defer: false)
        window.contentView = webView
        let rules =
            #"[{"trigger":{"url-filter":"^https?://","url-filter-is-case-sensitive":false},"action":{"type":"block"}}]"#
        WKContentRuleListStore.default().compileContentRuleList(
            forIdentifier: "JobsMarkdown.Regression", encodedContentRuleList: rules
        ) { rule, error in
            if let error {
                delegate.failure = error.localizedDescription
                delegate.done = true
                return
            }
            if blocked, let rule { configuration.userContentController.add(rule) }
            webView.loadFileURL(template, allowingReadAccessTo: template.deletingLastPathComponent())
        }
        let deadline = Date().addingTimeInterval(12)
        while !delegate.done && Date() < deadline { RunLoop.main.run(until: Date().addingTimeInterval(0.02)) }
        precondition(delegate.done && delegate.failure == nil, delegate.failure ?? "render timeout")
        var localCandidatePreserved = false
        webView.evaluateJavaScript(
            "(document.getElementById('local-srcset')?.getAttribute('srcset') || '').startsWith('data:image/gif')"
        ) { value, error in
            precondition(error == nil, error?.localizedDescription ?? "unexpected JavaScript evaluation error")
            localCandidatePreserved = value as? Bool == true
        }
        let localDeadline = Date().addingTimeInterval(2)
        while !localCandidatePreserved && Date() < localDeadline {
            RunLoop.main.run(until: Date().addingTimeInterval(0.02))
        }
        precondition(localCandidatePreserved, "local srcset candidate must survive offline filtering")
        for anchor in ["section", "中文", "quote\"slash\\newline\n", "", "%invalid"] {
            let data = try JSONEncoder().encode(anchor)
            let literal = String(decoding: data, as: UTF8.self)
            var completed = false
            webView.evaluateJavaScript("window.JobsMarkdownRuntime.scrollToAnchor(\(literal), false);") { _, error in
                precondition(error == nil, error?.localizedDescription ?? "anchor failed")
                completed = true
            }
            while !completed && Date() < deadline { RunLoop.main.run(until: Date().addingTimeInterval(0.02)) }
            precondition(completed)
        }
        RunLoop.main.run(until: Date().addingTimeInterval(0.6))
        webView.stopLoading()
        configuration.userContentController.removeScriptMessageHandler(forName: "jobsMarkdown")
        print("Jobs Markdown actual runtime/CSP/content-rule/anchor checks passed (\(blocked ? "blocked" : "allowed"))")
    }
}
