//
//  一般数据请求.swift
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
/// 一般数据请求（GET + POST）
/// 公共接口用 JSONPlaceholder
final class NormalRequestVC: BaseVC {

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
            title: "一般请求"
        )
        textView.byVisible(YES)

        net.onCallback = { [weak self] cb in
            guard let self else { return }
            self.append("""
            ✅ Callback
            id: \(cb.id ?? "nil")
            method: \(cb.method.rawValue)
            url: \(cb.fullURL)
            headers: \(cb.headers)
            body: \(cb.body ?? "nil")
            requestTime: \(cb.requestTime)
            receivedTime: \(cb.receivedTime)
            dataSize: \(cb.data?.count ?? 0)

            """)
            if let data = cb.data, let s = String(data: data, encoding: .utf8) {
                self.append("response:\n\(s)\n\n")
            }
        }

        // GET
        net.request("https://jsonplaceholder.typicode.com/posts/1")
            .byID("get_post_1")
            .byMethod(.GET)
            .byHeader("Accept", "application/json")
            .start()

        // POST（JSONPlaceholder 会回一个模拟结果）
        net.request("https://jsonplaceholder.typicode.com/posts")
            .byID("create_post")
            .byMethod(.POST)
            .byHeader("Content-Type", "application/json")
            .byParams(["title": "JobsNetworking",
                       "body": "Hello from Swift",
                       "userId": 1])
            .start()
    }

    private func append(_ s: String) {
        textView.text = (textView.text ?? "") + s
        let range = NSRange(location: max(0, textView.text.count - 1), length: 1)
        textView.scrollRangeToVisible(range)
    }
}
