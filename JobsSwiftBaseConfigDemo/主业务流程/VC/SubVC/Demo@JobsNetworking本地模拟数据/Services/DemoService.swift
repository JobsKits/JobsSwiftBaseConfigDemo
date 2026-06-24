//
//  DemoService.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import JobsNetworking

final class DemoService {

    static let shared = DemoService()

    let agent: DefaultJobsAgent = .init(
        config: .init(
            baseURL: URL(string: "http://127.0.0.1:18080")!,
            timeout: 10,
            version: "dio-demo-swift",
            userScope: "local"
        )
    )

    private init() {}

    func loadCatalog() async throws -> [MethodDemoItem] {
        let req = JobsRequest(
            path: "/api/methods",
            method: .get,
            headers: ["Content-Type": "application/json"],
            timeout: 10,
            encoding: .urlQuery,
            cachePolicy: .disabled
        )

        let response = try await agent.send(req, as: DioCatalogResponse.self)
        return response.data?.items ?? []
    }

    func requestData(
        method: HTTPMethod,
        path: String,
        query: [String: AnySendable]? = nil,
        body: [String: AnySendable]? = nil,
        encoding: JobsParameterEncoding
    ) async throws -> Data {
        try await agent.send(
            JobsRequest(
                path: path,
                method: method,
                query: query,
                body: body,
                headers: ["Content-Type": "application/json"],
                timeout: 10,
                encoding: encoding,
                cachePolicy: .disabled
            ),
            as: Data.self
        )
    }

    func uploadDemo(triggerError: Bool) async throws -> Data {
        try await agent.upload(
            JobsUploadRequest(
                path: "/api/upload/file",
                method: .post,
                files: triggerError ? [] : [
                    .data(
                        data: Data("This is a demo upload from Swift.".utf8),
                        name: "file",
                        fileName: "swift_upload_demo.txt",
                        mimeType: "text/plain"
                    )
                ],
                form: [
                    "description": .init(triggerError ? "触发错误" : "Swift 上传示例文件"),
                    "category": .init("demo")
                ],
                headers: ["Accept": "application/json"],
                timeout: 10
            ),
            as: Data.self
        )
    }

    func downloadDemo(fileName: String) async throws -> DioDownloadRenderData {
        let safeName = fileName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? fileName
        let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)

        let request = JobsDownloadRequest(
            absoluteURL: URL(string: "http://127.0.0.1:18080/api/download/file?fileName=\(safeName)")!,
            destinationURL: destinationURL,
            timeout: 10
        )

        let fileURL = try await agent.download(request)
        let data = try Data(contentsOf: fileURL)
        let content = String(data: data, encoding: .utf8) ?? "<binary>"
        let mimeType = mimeTypeByFileName(fileName)
        let disposition = "attachment; filename=\"\(fileName)\""

        return .init(
            fileURL: fileURL,
            content: content,
            fileSize: data.count,
            mimeType: mimeType,
            contentDisposition: disposition
        )
    }

    func prettyJSONString(from data: Data) -> String {
        guard let object = try? JSONSerialization.jsonObject(with: data),
              let prettyData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]),
              let text = String(data: prettyData, encoding: .utf8) else {
            return String(data: data, encoding: .utf8) ?? "<empty>"
        };return text
    }

    func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        try? JSONDecoder().decode(type, from: data)
    }

    private func mimeTypeByFileName(_ fileName: String) -> String {
        switch (fileName as NSString).pathExtension.lowercased() {
        case "txt": return "text/plain"
        case "json": return "application/json"
        case "png": return "image/png"
        case "jpg", "jpeg": return "image/jpeg"
        default: return "application/octet-stream"
        }
    }
}
