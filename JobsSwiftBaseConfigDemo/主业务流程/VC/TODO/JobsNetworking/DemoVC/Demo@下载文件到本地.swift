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

/// 下载文件到本地 + 打开
final class DownloadFileVC: BaseVC {

    private let net = JobsNetworking()

    /// 下载后的本地文件 URL（用于打开）
    private var downloadedFileURL: URL?

    /// 系统“打开方式”控制器（必须强引用）
    private var docController: UIDocumentInteractionController?

    private lazy var btn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("开始下载 PDF 到 Documents 并打开", for: .normal)
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
                make.top.equalTo(self.btn.snp.bottom).offset(12)
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

        // ✅ 换成稳定、可预览的 PDF（下载成功后“打开”效果立刻可见）
        let fileName = "jobs_dummy.pdf"
        let url = "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"

        downloadedFileURL = docs.appendingPathComponent(fileName)

        progressBar.setProgress(0, animated: false)
        append("🟦 开始下载...\n")
        append("📁 目标：\(downloadedFileURL!.path)\n\n")

        net.request(url)
            .byID("download_pdf")
            .byMethod(.GET)
            .onProgress { [weak self] p in
                self?.progressBar.setProgress(CGFloat(p), animated: true, duration: 0.08)
            }
            .byDownload(to: docs, fileName: fileName)
            .start()
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
