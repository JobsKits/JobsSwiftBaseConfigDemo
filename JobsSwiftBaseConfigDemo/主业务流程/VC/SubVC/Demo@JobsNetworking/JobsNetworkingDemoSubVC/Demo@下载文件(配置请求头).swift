//
//  DownloadToLocalDemoVC.swift
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
// MARK: - 下载文件到本地
final class DownloadToLocalDemoVC: JobsNetworkingDemoBaseVC {

    private var token: JobsRequestToken?

    private lazy var agent: DefaultJobsAgent = {
        let config = JobsRequestConfig(
            baseURL: URL(string: "https://httpbin.org")!,
            timeout: 120,
            version: "v1",
            userScope: "guest",
            defaultRetryPolicy: .default
        );return DefaultJobsAgent(config: config, headerHook: DemoAuthHook())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "下载文件到本地".tr)
        runButton
            .byTitle("Run: download 1MB", for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                append("Running concurrent requests...\n")
                let agent = self.agent   // ✅ 关键：提前取出来，变成局部常量
                Task {
                    do {
                        let url = "https://httpbin.org/bytes/1048576" // 1MB
                        let dest = FileManager.default.temporaryDirectory.appendingPathComponent("demo_1mb.bin")
                        // 对齐白皮书语义：download request -> destination url
                        let req = JobsDownloadRequest(absoluteURL: URL(string: url)!, destinationURL: dest)
                        // async/await 版本
                        let finalURL = try await agent.download(req)
                        self.append("Downloaded to: \(finalURL.path)\n\n")
                        // 或 closure + token（如果你实现了）
                        // token = agent.download(req) { ... }
                    } catch {
                        self.append("Error: \(error)\n\n")
                    }
                }
            }
        append("说明：演示下载到本地文件 + 取消。\n\n")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        token?.cancel()
        token = nil
    }
}
