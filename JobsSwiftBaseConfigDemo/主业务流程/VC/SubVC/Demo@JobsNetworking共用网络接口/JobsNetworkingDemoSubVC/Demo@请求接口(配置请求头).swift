//
//  Demo@请求接口(配置请求头).swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import JobsNetworking
import JobsByUIKit
import JobsSwiftDSL
import JobsSwiftBaseDefines
// MARK: - 请求接口(配置请求头)
final class RequestAPIDemoVC: JobsNetworkingDemoBaseVC {
    
    private lazy var agent: DefaultJobsAgent = {
        DefaultJobsAgent(config: JobsRequestConfig(
            baseURL: "https://httpbin.org".url!,
            timeout: 20,
            version: "v1",
            userScope: "guest",
            defaultRetryPolicy: .default
        ), headerHook: DemoAuthHook())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "请求接口".tr)
        runButton
            .byTitle("Run: /uuid + /get", for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.append("Start closure request...\n")
                append("Running...\n")
                Task {
                    do {
                        struct UUIDResp: Decodable { let uuid: String }
                        let uuid = try await self.agent.send(JobsRequest(path: "/uuid", method: .get), as: UUIDResp.self)
                        self.append("1) /uuid -> \(uuid.uuid)\n")
                        let data = try await self.agent.send(JobsRequest(path: "/get", method: .get, query: ["k": AnySendable("v")]),
                                                       as: Data.self)
                        self.append("2) /get bytes -> \(data.count)\n\n")
                    } catch {
                        self.append("Error: \(error)\n\n")
                    }
                }
            }
        textView.byVisible(YES)
        append("说明：演示基础 API 请求 + Decodable 解码\n\n")
    }
}
