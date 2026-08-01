//
//  JobsMarkdownCatalog.swift
//  JobsSwiftMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

public enum JobsMarkdownCatalogError: LocalizedError {
    case bundleNotFound(String)
    case manifestNotFound(URL)
    case invalidManifest(URL, Error)

    public var errorDescription: String? {
        switch self {
        case .bundleNotFound(let name):
            return "未找到 \(name).bundle，请确认 Markdown 文档打包阶段已经执行。"
        case .manifestNotFound(let bundleURL):
            return "未找到 Markdown 清单：\(bundleURL.appendingPathComponent("manifest.json").path)"
        case .invalidManifest(let manifestURL, let error):
            return "Markdown 清单解析失败：\(manifestURL.path)\n\(error.localizedDescription)"
        }
    }
}

public final class JobsMarkdownCatalog {
    public let projectName: String
    public let generatedAt: String
    public let rootURL: URL
    public let documents: [JobsMarkdownDocument]
    public let missingResources: [String]

    public init(bundleURL: URL) throws {
        let manifestURL = bundleURL.appendingPathComponent("manifest.json")
        guard FileManager.default.fileExists(atPath: manifestURL.path) else {
            throw JobsMarkdownCatalogError.manifestNotFound(bundleURL)
        }
        do {
            let data = try Data(contentsOf: manifestURL)
            let manifest = try JSONDecoder().decode(JobsMarkdownManifest.self, from: data)
            let documentsRootURL = bundleURL.appendingPathComponent("Documents", isDirectory: true)
            projectName = manifest.projectName
            generatedAt = manifest.generatedAt
            rootURL = documentsRootURL
            missingResources = manifest.missingResources
            documents = manifest.documents.map {
                JobsMarkdownDocument(
                    id: $0.id,
                    title: $0.title,
                    relativePath: $0.relativePath,
                    fileURL: bundleURL.appendingPathComponent($0.resourcePath),
                    contentRootURL: documentsRootURL
                )
            }
        } catch let error as JobsMarkdownCatalogError {
            throw error
        } catch {
            throw JobsMarkdownCatalogError.invalidManifest(manifestURL, error)
        }
    }

    public static func bundled(
        in bundle: Bundle = .main,
        named name: String = "JobsMarkdownDocuments"
    ) throws -> JobsMarkdownCatalog {
        guard let bundleURL = bundle.url(forResource: name, withExtension: "bundle") else {
            throw JobsMarkdownCatalogError.bundleNotFound(name)
        };return try JobsMarkdownCatalog(bundleURL: bundleURL)
    }

    public func document(relativePath: String) -> JobsMarkdownDocument? {
        let decodedPath = relativePath.removingPercentEncoding ?? relativePath
        let normalizedPath = decodedPath.replacingOccurrences(of: "\\", with: "/")
        return documents.first { $0.relativePath == normalizedPath }
    }

    public func document(fileURL: URL) -> JobsMarkdownDocument? {
        let normalizedURL = fileURL.standardizedFileURL
        return documents.first { $0.fileURL.standardizedFileURL == normalizedURL }
    }
}

private struct JobsMarkdownManifest: Decodable {
    let projectName: String
    let generatedAt: String
    let documents: [JobsMarkdownManifestDocument]
    let missingResources: [String]
}

private struct JobsMarkdownManifestDocument: Decodable {
    let id: String
    let title: String
    let relativePath: String
    let resourcePath: String
}
