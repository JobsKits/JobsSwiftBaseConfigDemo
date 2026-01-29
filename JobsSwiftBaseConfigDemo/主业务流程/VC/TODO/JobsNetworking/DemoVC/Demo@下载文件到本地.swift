//
//  DownloadFileVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import SnapKit
import GKNavigationBarSwift
import JobsByUIKit
import JobsSwiftBaseDefines
import JobsProgressBar
import JobsInheritance
import Alamofire

/// 下载文件到本地 + 打开
final class DownloadFileVC: BaseVC {

    private let net = JobsNetworking()

    /// 下载后的本地文件 URL（用于打开）
    private var downloadedFileURL: URL?

    /// ✅ 断点续传：下载任务句柄
    private var downloadTask: JobsNetworkingTask?

    /// ✅ 断点续传：持久化 resumeData（杀进程/重启也能续）
    private var resumeDataURL: URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("jobs_download.resumeData")
    }

    private let downloadingFileName = "jobs_dummy.pdf"
    private let downloadingURL = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"

    /// 系统“打开方式”控制器（必须强引用）
    private var docController: UIDocumentInteractionController?

    private lazy var btn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("开始下载（可断点续传）", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemBlue)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.startDownload()
            }
            .byAddTo(view) { [unowned self] make in
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(48)
                if view.jobs_hasVisibleTopBar() {
                    make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview().offset(10)
                }
            }
    }()

    private lazy var pauseBtn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("暂停（生成断点）", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemOrange)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.pauseDownload()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.btn.snp.bottom).offset(12)
                make.left.equalToSuperview().inset(16)
                make.height.equalTo(48)
                make.right.equalTo(self.view.snp.centerX).offset(-6)
            }
    }()

    private lazy var resumeBtn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("继续（断点续传）", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemGreen)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.resumeDownload()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.btn.snp.bottom).offset(12)
                make.right.equalToSuperview().inset(16)
                make.height.equalTo(48)
                make.left.equalTo(self.view.snp.centerX).offset(6)
            }
    }()

    /// 下载进度条
    private lazy var progressBar: JobsProgressBar = {
        JobsProgressBar()
            .byDirection(.leftToRight)
            .byValueMode(.countUp)
            .byAutoHideLabel(false)
            .byTrackThickness(10)
            .byCornerRadius(5)
            .byProgress(0, animated: false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.pauseBtn.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                make.height.equalTo(22)
            }
    }()

    private lazy var textView: UITextView = {
        UITextView()
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.progressBar.snp.bottom).offset(12)
                make.left.right.bottom.equalToSuperview().inset(12)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "下载文件")

        btn.byVisible(YES)
        pauseBtn.byVisible(YES)
        resumeBtn.byVisible(YES)
        progressBar.byVisible(YES)
        textView.byVisible(YES)

        net.onCallback = { [weak self] cb in
            guard let self else { return }

            self.append("""
            ✅ Download Callback
            id: \(cb.id ?? "nil")
            url: \(cb.fullURL)
            requestTime: \(cb.requestTime)
            receivedTime: \(cb.receivedTime)

            """)

            guard let fileURL = self.downloadedFileURL else {
                self.append("❌ downloadedFileURL 为 nil（逻辑错误）\n")
                return
            }

            // ⚠️ 少数情况下落盘与回调存在极小时间差，这里做一次轻微延迟校验更稳
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
                guard let self else { return }

                if FileManager.default.fileExists(atPath: fileURL.path) {
                    self.append("✅ 文件已落盘：\(fileURL.lastPathComponent)\n")
                    self.openFile(fileURL)
                } else {
                    self.append("❌ 文件不存在，无法打开\n")
                    self.append("👉 说明下载失败（常见原因：URL 被墙/被拦/返回 403/网络不可达）。\n")
                    self.append("👉 你可以换一个下载 URL 或者我给你在 JobsNetworking 里把 error 也回调出来。\n")
                }
            }
        }
    }

    private func startDownload() {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        downloadedFileURL = docs.appendingPathComponent(downloadingFileName)

        progressBar.setProgress(0, animated: false)
        append("🟦 开始下载...\n")
        append("📁 目标：\(downloadedFileURL!.path)\n\n")

        if FileManager.default.fileExists(atPath: resumeDataURL.path) {
            append("🟨 检测到断点文件：\(resumeDataURL.lastPathComponent)\n")
            append("👉 你可以直接点【继续】演示断点续传\n\n")
        }

        downloadTask = net.request(downloadingURL)
            .byID("download_pdf_resumable")
            .byMethod(.GET)
            .onProgress { [weak self] p in
                self?.progressBar.setProgress(CGFloat(p), animated: true, duration: 0.08)
            }
            .byDownload(to: docs, fileName: downloadingFileName)
            .startDownloadTask()
    }

    private func pauseDownload() {
        append("⏸️ 请求暂停...\n")
        downloadTask?.pause { [weak self] rd in
            guard let self else { return }
            guard let rd else {
                self.append("❌ 没拿到 resumeData（可能已完成 / 或当前请求不支持）\n\n")
                return
            }
            do {
                try rd.write(to: self.resumeDataURL, options: .atomic)
                self.append("✅ 已写入断点：\(self.resumeDataURL.lastPathComponent)（\(rd.count) bytes）\n\n")
            } catch {
                self.append("❌ 写入断点失败：\(error)\n\n")
            }
        }
    }

    private func resumeDownload() {
        append("▶️ 断点续传...\n")

        guard FileManager.default.fileExists(atPath: resumeDataURL.path) else {
            append("❌ 没有断点文件，请先开始下载再暂停\n\n")
            return
        }

        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        downloadedFileURL = docs.appendingPathComponent(downloadingFileName)

        do {
            let rd = try Data(contentsOf: resumeDataURL)

            let cfg = URLSessionConfiguration.default
            cfg.waitsForConnectivity = true
            let session = Alamofire.Session(configuration: cfg)

            let dst: Alamofire.DownloadRequest.Destination = { _, _ in
                let fileURL = docs.appendingPathComponent(self.downloadingFileName)
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }

            if downloadTask == nil { downloadTask = JobsNetworkingTask() }

            downloadTask?.resume(with: rd,
                                 in: session,
                                 destination: dst,
                                 progress: { [weak self] p in
                                     self?.progressBar.setProgress(CGFloat(p), animated: true, duration: 0.08)
                                 },
                                 completion: { [weak self] resp in
                                     guard let self else { return }
                                     DispatchQueue.main.async {
                                         if let url = resp.fileURL, FileManager.default.fileExists(atPath: url.path) {
                                             self.append("✅ 续传完成：\(url.lastPathComponent)\n")
                                             try? FileManager.default.removeItem(at: self.resumeDataURL)
                                             self.append("🧹 已清理断点文件\n\n")
                                             self.openFile(url)
                                         } else if let rd2 = resp.resumeData {
                                             try? rd2.write(to: self.resumeDataURL, options: .atomic)
                                             self.append("⚠️ 续传未完成，已更新断点（\(rd2.count) bytes）\n\n")
                                         } else {
                                             self.append("❌ 续传失败：\(String(describing: resp.error))\n\n")
                                         }
                                     }
                                 })

        } catch {
            append("❌ 读取断点失败：\(error)\n\n")
        }
    }

    private func openFile(_ url: URL) {
        append("📤 弹出打开方式...\n")

        let c = UIDocumentInteractionController(url: url)
        c.delegate = self
        self.docController = c // ✅ 必须强持有，否则弹窗会立刻消失/不弹

        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let ok = c.presentOptionsMenu(from: self.view.bounds, in: self.view, animated: true)
            if !ok {
                self.append("❌ 没有可用的打开方式（设备上无支持 App）\n")
            }
        }
    }

    private func append(_ s: String) {
        textView.text = (textView.text ?? "") + s
        let range = NSRange(location: max(0, textView.text.count - 1), length: 1)
        textView.scrollRangeToVisible(range)
    }
}

extension DownloadFileVC: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        self
    }
}
