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
/// 2) 尽量线程安全（signal handler 里只建议写极少量信息）
/// 3) 读取展示给 UI（CrashLogDemoVC）
final class CrashLogCenter {
    static let shared = CrashLogCenter()
    // 你要的文件名：jobs_crash.log
    private let fileName = "jobs_crash.log"
    /// 文件写入队列（避免多线程乱序）
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
    // ================================== Write ==================================
    /// 追加写入（推荐：普通崩溃捕获/业务日志使用）
    func append(_ text: String) {
        guard !text.isEmpty else { return }
        ioQueue.async { [weak self] in
            guard let self else { return }
            _ = self.ensureFileExists()

            let url = self.crashLogURL
            let line = text.hasSuffix("\n") ? text : (text + "\n")
            guard let data = line.data(using: .utf8) else { return }

            // 使用 FileHandle 追加写
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
                // 写失败就算了，别让日志系统影响主流程
            }
        }
    }
    /// 给 signal handler / terminate handler 用：尽量“同步+短小”
    /// 注意：严格来说 signal handler 里调用 Swift/ObjC/IO 都不安全。
    /// 这里提供一个“尽可能少做事”的入口：仅把短文本扔进队列追加。
    func writeCrash(_ text: String) {
        append(text)
    }
    // ================================== Read ==================================
    /// 读取整个文件（UI 展示用）
    func readAll() -> String {
        let url = crashLogURL
        guard FileManager.default.fileExists(atPath: url.path) else { return "" }
        do {
            let data = try Data(contentsOf: url)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return "❌ readAll() 失败：\(error)"
        }
    }
    /// 读取最后 N KB（日志很大时更稳）
    func readTail(kilobytes: Int = 256) -> String {
        let url = crashLogURL
        guard FileManager.default.fileExists(atPath: url.path) else { return "" }
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
    /// 清理日志（你要的“清理日志的方法”）
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
