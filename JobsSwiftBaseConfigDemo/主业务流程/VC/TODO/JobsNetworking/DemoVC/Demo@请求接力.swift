//
//  RelayRequestVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsInheritance
/// 请求接力（上一个结果作为下一个参数）
/// 思路：先 GET post，解析 JSON 里的 userId，再 GET user。
final class RelayRequestVC: BaseVC {

    private let net = JobsNetworking()

    private lazy var textView: UITextView = {
        UITextView()
            .byAddTo(view) { [unowned self] make in
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                    make.left.right.bottom.equalToSuperview()
                } else {
                    make.edges.equalToSuperview()
                }
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(
            title: "请求接力"
        )
        textView.byVisible(YES)

        net.onCallback = { [weak self] cb in
            guard let self else { return }
            self.append("""
            ✅ Callback
            id: \(cb.id ?? "nil")
            method: \(cb.method.rawValue)
            url: \(cb.fullURL)
            requestTime: \(cb.requestTime)
            receivedTime: \(cb.receivedTime)

            """)
            if let data = cb.data, let s = String(data: data, encoding: .utf8) {
                self.append("response:\n\(s)\n\n")
            }
        }

        let first = net.request("https://jsonplaceholder.typicode.com/posts/2")
            .byID("relay_step_1")
            .byMethod(.GET)
            .byHeader("Accept", "application/json")

        net.relay(first) { [weak self] data in
            let userId = Self.extractUserId(from: data) ?? 1
            self?.append("➡️ relay: parsed userId = \(userId)\n\n")

            return self?.net.request("https://jsonplaceholder.typicode.com/users/\(userId)")
                .byID("relay_step_2")
                .byMethod(.GET)
                .byHeader("Accept", "application/json")
                ?? JobsNetworking().request("https://jsonplaceholder.typicode.com/users/1")
        }
    }

    private static func extractUserId(from data: Data?) -> Int? {
        guard let data else { return nil }
        guard let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return nil }
        return obj["userId"] as? Int
    }

    private func append(_ s: String) {
        textView.text = (textView.text ?? "") + s
        let range = NSRange(location: max(0, textView.text.count - 1), length: 1)
        textView.scrollRangeToVisible(range)
    }
}
