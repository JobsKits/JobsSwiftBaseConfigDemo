//
//  GeneralRequestDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 31/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsNetworking
import JobsByUIKit
import JobsSwiftBaseDefines
// MARK: - 一般数据请求
final class GeneralRequestDemoVC: JobsNetworkingDemoBaseVC {
    private var token: JobsRequestToken?
    private lazy var agent: DefaultJobsAgent = {
        let config = JobsRequestConfig(
            baseURL: URL(string: "https://httpbin.org")!,
            timeout: 20,
            version: "v1",
            userScope: "guest",
            defaultRetryPolicy: .default
        )
        return DefaultJobsAgent(config: config, headerHook: DemoAuthHook())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "一般数据请求".tr)
        runButton
            .byTitle("Run: cacheThenNetwork + cancel", for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.append("Start closure request...\n")
                let agent = self.agent // ✅ 避免后续 completion 里再去碰 self.agent
                let req = JobsRequest(
                    path: "/delay/3",
                    method: .get,
                    cachePolicy: .cacheThenNetwork(ttl: 10)
                )
                self.token = agent.send(req, as: Data.self) { [weak self] result in
                    guard let self else { return }
                    Task { @MainActor in
                        switch result {
                        case .success(let data):
                            self.append("Success. bytes=\(data.count)\n\n")
                        case .failure(let err):
                            self.append("Failure: \(err)\n\n")
                        }
                    }
                }
                self.append("Tip: 返回上一页会 cancel。\n\n")
            }
        textView.byVisible(YES)
        append("说明：演示 cacheThenNetwork(ttl) + closure token cancel。\n\n")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        token?.cancel()
        token = nil
    }
}
