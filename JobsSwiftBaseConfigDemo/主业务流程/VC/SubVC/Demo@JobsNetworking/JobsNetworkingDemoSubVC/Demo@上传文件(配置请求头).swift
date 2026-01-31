//
//  UploadFileDemoVC.swift
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
// MARK: - 上传文件
final class UploadFileDemoVC: JobsNetworkingDemoBaseVC {

    private lazy var agent: DefaultJobsAgent = {
        let config = JobsRequestConfig(
            baseURL: URL(string: "https://httpbin.org")!,
            timeout: 60,
            version: "v1",
            userScope: "guest",
            defaultRetryPolicy: .default
        )
        return DefaultJobsAgent(config: config, headerHook: DemoAuthHook())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        jobsSetupGKNav(title: "上传文件".tr)
        runButton
            .byTitle("Run: multipart upload", for: .normal)
            .onTap { [weak self] sender in
                guard let self else { return }
                self.append("Start closure request...\n")
                append("Preparing temp file...\n")
                Task {
                    do {
                        let tempURL = FileManager.default.temporaryDirectory
                            .appendingPathComponent("demo_upload.txt")
                        try "Hello JobsNetworking Upload".data(using: .utf8)!.write(to: tempURL)
                        struct UploadResp: Decodable { let files: [String: String]? }
                        let request = JobsUploadRequest(
                            path: "/post",
                            method: .post,
                            files: [
                                .file(url: tempURL, name: "file", fileName: "demo_upload.txt", mimeType: "text/plain")
                            ],
                            form: [
                                "note": AnySendable("upload from demo")
                            ]
                        )
                        let resp: UploadResp = try await self.agent.upload(request, as: UploadResp.self)
                        self.append("Upload done. resp.files keys = \(resp.files?.keys.joined(separator: ",") ?? "nil")\n\n")
                    } catch {
                        self.append("Error: \(error)\n\n")
                    }
                }
            }
        append("说明：演示 multipart/form-data 上传（用临时文件模拟）。\n\n")
    }
}
