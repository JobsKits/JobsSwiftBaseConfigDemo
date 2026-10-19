//
//  JobsLabSandboxStore.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import Foundation

/// 系统沙箱隔离的是 App；这里按模块/账号划分目录，是宿主自己执行的逻辑访问策略。
/// 不可把子目录当成安全执行不受信任原生代码的容器。敏感凭据应进 Keychain，不能保存为 Demo 明文。
struct JobsLabSandboxStore {
    private let root: URL

    init(namespace: String, baseDirectory: URL? = nil) throws {
        guard namespace.range(of: "\\A[a-z0-9-]{1,40}\\z", options: .regularExpression) != nil else {
            throw StoreError.invalidPath
        }
        let applicationSupport = baseDirectory
            ?? FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let base = applicationSupport.resolvingSymlinksInPath().standardizedFileURL
        try FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
        let lab = base.appendingPathComponent("JobsMicroAppLab", isDirectory: true)
        root = lab.appendingPathComponent(namespace, isDirectory: true)
        // 先检查自有目录，避免 createDirectory 沿着预置链接在其它目录产生副作用。
        for directory in [lab, root] {
            if let attributes = try? FileManager.default.attributesOfItem(atPath: directory.path) {
                guard attributes[.type] as? FileAttributeType == .typeDirectory,
                      directory.path == directory.resolvingSymlinksInPath().path else {
                    throw StoreError.invalidPath
                }
            } else {
                try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)
            }
        }
        try rejectSymlinks()
    }

    var directoryPath: String {
        return root.path
    }

    func write(_ text: String, filename: String = "draft.txt") throws {
        guard text.utf8.count <= 16_384 else {
            throw StoreError.tooLarge
        }
        let target = try resolvedURL(filename)
        try Data(text.utf8).write(to: target, options: [.atomic, .completeFileProtectionUnlessOpen])
    }

    func read(filename: String = "draft.txt") throws -> String {
        let target = try resolvedURL(filename)
        guard FileManager.default.fileExists(atPath: target.path) else {
            return "暂无草稿，点击写入后重新读取。"
        }
        return try String(contentsOf: target, encoding: .utf8)
    }

    func reset() throws {
        let target = try resolvedURL("draft.txt")
        if FileManager.default.fileExists(atPath: target.path) {
            try FileManager.default.removeItem(at: target)
        }
    }

    /// 入口只接收单层文件名，先拒绝编码、绝对路径、分隔符和遍历，再检查符号链接后的归属。
    func resolvedURL(_ filename: String) throws -> URL {
        try rejectSymlinks()
        guard filename.range(of: "\\A[A-Za-z0-9_-]{1,60}\\.[A-Za-z0-9]{1,8}\\z", options: .regularExpression) != nil else {
            throw StoreError.invalidPath
        }
        let target = root.appendingPathComponent(filename).standardizedFileURL
        guard target.resolvingSymlinksInPath().path.hasPrefix(root.standardizedFileURL.path + "/") else {
            throw StoreError.invalidPath
        }
        return target
    }

    private func rejectSymlinks() throws {
        guard root.standardizedFileURL.path == root.resolvingSymlinksInPath().path else {
            throw StoreError.invalidPath
        }
    }

    enum StoreError: LocalizedError {
        case invalidPath
        case tooLarge

        var errorDescription: String? {
            switch self {
            /// 不接受跨目录或符号链接访问
            case .invalidPath:
                return "已拒绝越界路径：仅允许当前命名空间内的普通文件名。"
            /// 防止桥接参数写入无限增长的数据
            case .tooLarge:
                return "已拒绝写入：草稿最多 16 KB。"
            }
        }
    }
}
