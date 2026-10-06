//
//  NetworkHTTPRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

@main
struct NetworkHTTPRegression {
    static func main() async throws {
        let base = URL(string: CommandLine.arguments[1])!
        let agent = JobsDefaultAgent(config: JobsRequestConfig(baseURL: base, logger: JobsLogger(isEnabled: false)),
            memoryCache: JobsMemoryCache(), diskCache: JobsMemoryCache())
        struct Echo: Decodable { let target: String; let body: String }
        let json: Echo = try await agent.send(JobsRequest(path: "echo?existing=1", method: .post,
            query: ["tenant": JobsValue("中文&=")], body: ["a": JobsValue(7)]), as: Echo.self)
        let items = URLComponents(string: json.target)!.queryItems!
        precondition(items.filter { $0.name == "tenant" }.count == 1)
        precondition(items.first { $0.name == "tenant" }?.value == "中文&=")
        let object = try JSONSerialization.jsonObject(with: Data(json.body.utf8)) as! [String: Int]
        precondition(object["a"] == 7)
        let form: Echo = try await agent.send(JobsRequest(path: "echo?existing=1", method: .post,
            query: ["q": JobsValue("x&=y")], body: ["body": JobsValue("中文")], encoding: .formURLEncoded), as: Echo.self)
        precondition(URLComponents(string: form.target)!.queryItems!.first { $0.name == "q" }?.value == "x&=y")
        precondition(form.body.contains("body="))
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("JobsHTTPRegression-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let destination = directory.appendingPathComponent("result")
        let original = Data("original".utf8)
        for path in ["404", "500", "cut"] {
            try original.write(to: destination)
            do {
                _ = try await agent.download(JobsDownloadRequest(absoluteURL: base.appendingPathComponent(path), destinationURL: destination))
                preconditionFailure("Invalid HTTP download must fail")
            } catch { }
            let saved = try Data(contentsOf: destination)
            precondition(saved == original)
        }
        let content = Data("download-ok".utf8)
        let downloaded = try await agent.download(JobsDownloadRequest(absoluteURL: base.appendingPathComponent("200"),
            destinationURL: destination, expectedByteCount: Int64(content.count), expectedSHA256: JobsCacheKey.digest(content)))
        precondition(downloaded == destination)
        let saved = try Data(contentsOf: destination)
        precondition(saved == content)
        do {
            _ = try await agent.download(JobsDownloadRequest(absoluteURL: base.appendingPathComponent("200"),
                destinationURL: destination, expectedSHA256: String(repeating: "0", count: 64)))
            preconditionFailure("Incorrect checksum must fail")
        } catch { }
        let retained = try Data(contentsOf: destination)
        precondition(retained == content)
        let uploadFile = directory.appendingPathComponent("attachment")
        try Data(repeating: 0x61, count: 12 * 1_024 * 1_024).write(to: uploadFile)
        struct UploadEcho: Decodable { let bytes: Int; let hasFile: Bool; let hasJSONForm: Bool }
        let upload: UploadEcho = try await agent.upload(JobsUploadRequest(path: "upload", files: [
            .file(url: uploadFile, name: "file", fileName: "attachment.txt", mimeType: "text/plain")
        ], form: ["metadata": JobsValue(["sequence": 7])]), as: UploadEcho.self)
        precondition(upload.bytes > 12 * 1_024 * 1_024 && upload.hasFile && upload.hasJSONForm)
        let leftovers = try FileManager.default.contentsOfDirectory(atPath: directory.path).filter { $0.hasPrefix(".jobs-download-") }
        precondition(leftovers.isEmpty)
        print("NetworkHTTPRegression: real Alamofire URL query/body, 404/500/short download preservation, 200 SHA256 install, mismatch preservation, 12MB multipart file passed")
    }
}
