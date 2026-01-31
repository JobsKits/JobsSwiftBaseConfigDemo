//
//  ConcurrentRequestsDemoVC.swift
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
// MARK: - 同步并发请求
final class ConcurrentRequestsDemoVC: JobsNetworkingDemoBaseVC {

    private lazy var agent: DefaultJobsAgent = {
        let config = JobsRequestConfig(
            baseURL: URL(string: "https://httpbin.org")!,
            timeout: 20,
            version: "v1",
            userScope: "guest",
            defaultRetryPolicy: .default
        );return DefaultJobsAgent(config: config, headerHook: DemoAuthHook() as JobsHeaderHook)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "同步并发请求".tr)
        runButton
            .byTitle("Run: TaskGroup x 5", for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                append("Running concurrent requests...\n")
                let agent = self.agent   // ✅ 关键：提前取出来，变成局部常量
                Task {
                    do {
                        let start = Date()

                        let results: [String] = try await withThrowingTaskGroup(of: String.self) { group in
                            for _ in 0..<5 {
                                group.addTask {
                                    struct UUIDResp: Decodable { let uuid: String }
                                    let resp = try await agent.send(
                                        JobsRequest(path: "/uuid", method: .get),
                                        as: UUIDResp.self
                                    );return resp.uuid
                                }
                            }

                            var list: [String] = []
                            for try await r in group { list.append(r) }
                            return list
                        }

                        let cost = Date().timeIntervalSince(start)
                        self.append("Done. count=\(results.count), cost=\(String(format: "%.2f", cost))s\n")
                        results.enumerated().forEach { idx, v in
                            self.append(" - [\(idx)] \(v)\n")
                        }
                        self.append("\n")
                    } catch {
                        self.append("Error: \(error)\n\n")
                    }
                }
            }
        append("说明：演示并发请求（TaskGroup），并收敛结果。\n\n")
    }
}
