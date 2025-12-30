//
//  CrashLogCenter.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 12/30/25.
//

import Foundation
// ================================== CrashLogCenter ==================================
/// 负责写入/读取/清理 app sandbox Documents 下的 jobs_crash.log
/// 设计目标：
/// 1) 真机脱离 Xcode 也能保留日志
/// 2) 尽量线程安全（读取/写入统一走串行队列）
/// 3) UI 可展示：路径 + 文件信息 + 内容
///
/// ⚠️ 注意：严格来说 signal handler 里调用 Swift/ObjC/File IO 都不安全。
/// 这里提供的 writeCrash/appendSync 仅用于“尽量少做事”的兜底方案；真正的 signal 安全写入需要 C 层 open/write/fsync。
final class CrashLogCenter {
    static let shared = CrashLogCenter()
    // 你要的文件名：jobs_crash.log
    private let fileName = "jobs_crash.log"
    /// 文件读写队列（避免多线程乱序 & 读写冲突）
    private let ioQueue = DispatchQueue(label: "com.jobs.crashlog.center.io", qos: .utility)
    private init() {}
    // ================================== Path ==================================
    /// Documents/jobs_crash.log
    var crashLogURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent(fileName)
    }
    /// 给 UI 打印用：完整路径提示
    func logPathHint() -> String {
        crashLogURL.path
    }
    // ================================== Ensure File ==================================
    /// 确保文件存在（不存在就创建空文件）
    @discardableResult
    func ensureFileExists() -> Bool {
        let url = crashLogURL
        if FileManager.default.fileExists(atPath: url.path) { return true }
        do {
            try Data().write(to: url, options: .atomic)
            return true
        } catch {
            return false
        }
    }
    // ================================== File Info ==================================
    /// 给 UI Header 用：文件是否存在/大小/修改时间
    /// - Returns: (exists, sizeBytes, mtime, path)
    func fileInfo() -> (exists: Bool, sizeBytes: Int, mtime: Date?, path: String) {
        let url = crashLogURL
        let path = url.path
        guard FileManager.default.fileExists(atPath: path) else {
            return (false, 0, nil, path)
        }
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: path)
            let size = (attr[.size] as? NSNumber)?.intValue ?? 0
            let mtime = attr[.modificationDate] as? Date
            return (true, size, mtime, path)
        } catch {
            // 读不到属性也不影响主流程
            return (true, 0, nil, path)
        }
    }
    // ================================== Write ==================================
    /// 追加写入（推荐：普通业务日志 / 非崩溃路径）
    /// - Important: 异步写，避免阻塞主线程
    func append(_ text: String) {
        guard !text.isEmpty else { return }
        ioQueue.async { [weak self] in
            self?._appendUnlocked(text)
        }
    }
    /// 同步追加写入（用于你“要立刻落盘能看到内容”的场景）
    /// - Important: 不要在主线程频繁调用；少量关键日志可用
    func appendSync(_ text: String) {
        guard !text.isEmpty else { return }
        ioQueue.sync { [weak self] in
            self?._appendUnlocked(text)
        }
    }
    /// 给 terminate / crash 兜底用：尽量“短小 + 立即落盘”
    /// - Note: 这不是严格 signal-safe，只是尽量提高“崩溃前写进去”的概率
    func writeCrash(_ text: String) {
        // 关键场景：直接 sync，尽量写进去
        appendSync(text)
    }
    /// 实际写入（必须在 ioQueue 内调用）
    private func _appendUnlocked(_ text: String) {
        _ = ensureFileExists()

        let url = crashLogURL
        let line = text.hasSuffix("\n") ? text : (text + "\n")
        guard let data = line.data(using: .utf8) else { return }

        do {
            let fh = try FileHandle(forWritingTo: url)
            defer {
                if #available(iOS 13.0, *) {
                    try? fh.close()
                } else {
                    fh.closeFile()
                }
            }

            if #available(iOS 13.4, *) {
                try fh.seekToEnd()
                try fh.write(contentsOf: data)
            } else {
                fh.seekToEndOfFile()
                fh.write(data)
            }
        } catch {
            // 写失败就算了：日志系统不能影响主流程
        }
    }
    // ================================== Read ==================================
    /// 读取整个文件（UI 展示用）
    func readAll() -> String {
        _ = ensureFileExists()
        let url = crashLogURL
        do {
            let data = try Data(contentsOf: url)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return "❌ readAll() 失败：\(error)"
        }
    }
    /// 读取最后 N KB（日志很大时更稳）
    func readTail(kilobytes: Int = 256) -> String {
        _ = ensureFileExists()

        let url = crashLogURL
        let maxBytes = max(1, kilobytes) * 1024

        do {
            let attr = try FileManager.default.attributesOfItem(atPath: url.path)
            let fileSize = (attr[.size] as? NSNumber)?.intValue ?? 0
            let offset = max(0, fileSize - maxBytes)

            let fh = try FileHandle(forReadingFrom: url)
            defer {
                if #available(iOS 13.0, *) {
                    try? fh.close()
                } else {
                    fh.closeFile()
                }
            }

            if #available(iOS 13.4, *) {
                try fh.seek(toOffset: UInt64(offset))
                let data = try fh.readToEnd() ?? Data()
                return String(data: data, encoding: .utf8) ?? ""
            } else {
                fh.seek(toFileOffset: UInt64(offset))
                let data = fh.readDataToEndOfFile()
                return String(data: data, encoding: .utf8) ?? ""
            }
        } catch {
            return "❌ readTail() 失败：\(error)"
        }
    }
    // ================================== Clear ==================================
    /// 清理日志
    /// - Returns: (ok, message)
    @discardableResult
    func clear() -> (Bool, String) {
        let url = crashLogURL
        do {
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            // 重新创建空文件，避免后续写入失败
            _ = ensureFileExists()
            return (true, "✅ 已清理：\(fileName)\n\(url.path)")
        } catch {
            return (false, "❌ 清理失败：\(error)\n\(url.path)")
        }
    }
    // ================================== Debug Helper ==================================
    /// 给 CrashCatcher.installOnce() 打印用
    func installedBanner() -> String {
        """
        log: \(logPathHint())

        ====== CrashCatcher Installed ======
        time: \(Date())
        log: \(logPathHint())
        """
    }
}
