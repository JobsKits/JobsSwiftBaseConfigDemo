//
//  ConcurrentRequestVC.swift
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
/// 同步并发请求（并发发，等全部结束再通知）
/// 这里用 DispatchGroup 做“同步并发”的完成通知（每个请求仍会单独回调一次）。
final class ConcurrentRequestVC: BaseVC {

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
            title: "同步并发"
        )
        textView.byVisible(YES)

        net.onCallback = { [weak self] cb in
            guard let self else { return }
            self.append("✅ done: \(cb.id ?? "nil") size=\(cb.data?.count ?? 0) url=\(cb.fullURL)\n")
        }

        let builders: [JobsNetworking.Builder] = (1...5).map { i in
            net.request("https://jsonplaceholder.typicode.com/posts/\(i)")
                .byID("post_\(i)")
                .byMethod(.GET)
                .byThreadEnabled(true) // 显式开线程（你要的）
        }

        // 注意：我在 JobsNetworking.concurrent 里做的是简化版 group 汇总。
        // 如果你要“每个 request 独立计数不互相覆盖 callback”，我可以把 builder 增加 perRequestCallback，做成更严谨的实现。
        net.concurrent(builders, notifyOn: .main) { [weak self] in
            self?.append("\n🎉 All concurrent requests finished.\n")
        }
    }

    private func append(_ s: String) {
        textView.text = (textView.text ?? "") + s
        let range = NSRange(location: max(0, textView.text.count - 1), length: 1)
        textView.scrollRangeToVisible(range)
    }
}
