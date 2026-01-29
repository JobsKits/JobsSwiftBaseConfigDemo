//
//  UploadFileVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 29/1/26.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import PhotosUI
import UniformTypeIdentifiers
import GKNavigationBarSwift
import SnapKit
import JobsByUIKit
import JobsToast
import JobsSwiftBaseDefines
import JobsProgressBar
import JobsInheritance
/// 上传文件（图片/视频，相机/相册）
/// 上传目标用 httpbin 的 /post（会在返回里体现 files / form）
final class UploadFileVC: BaseVC {

    private let net = JobsNetworking()

    // ===================== UI =====================

    private lazy var pickImageBtn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("选照片并上传（httpbin）", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemGreen)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.pickOneImageFromLibrary()
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

    private lazy var pickVideoBtn: UIButton = { [unowned self] in
        UIButton(type: .system)
            .byTitle("选视频并上传（httpbin）", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byBackgroundColor(.systemIndigo)
            .byCornerRadius(12)
            .onTap { [weak self] _ in
                self?.pickOneVideoFromLibrary()
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.pickImageBtn.snp.bottom).offset(12)
                make.left.right.height.equalTo(self.pickImageBtn)
            }
    }()

    /// ✅ 新增：上传进度条
    private lazy var progressBar: JobsProgressBar = {
        JobsProgressBar()
            .byDirection(.leftToRight)
            .byValueMode(.countUp)
            .byAutoHideLabel(false)
            .byTrackThickness(10)
            .byCornerRadius(5)
            .byProgress(0, animated: false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.pickVideoBtn.snp.bottom).offset(12)
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

    // ===================== Life Cycle =====================

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "上传文件")

        pickImageBtn.byVisible(YES)
        pickVideoBtn.byVisible(YES)
        progressBar.byVisible(YES)
        textView.byVisible(YES)

        net.onCallback = { [weak self] cb in
            guard let self else { return }
            self.append("""
            ✅ Upload Callback
            id: \(cb.id ?? "nil")
            method: \(cb.method.rawValue)
            url: \(cb.fullURL)
            requestTime: \(cb.requestTime)
            receivedTime: \(cb.receivedTime)
            dataSize: \(cb.data?.count ?? 0)

            """)
        }
    }

    // ===================== Picker =====================

    private func pickOneImageFromLibrary() {
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration(photoLibrary: .shared())
            config.selectionLimit = 1
            config.filter = .images
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true)
        } else {
            "iOS 14 以下请使用 UIImagePickerController".toast
        }
    }

    private func pickOneVideoFromLibrary() {
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration(photoLibrary: .shared())
            config.selectionLimit = 1
            config.filter = .videos
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true)
        } else {
            "iOS 14 以下请使用 UIImagePickerController".toast
        }
    }

    // ===================== Upload =====================

    private func uploadImage(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.85) else { return }

        progressBar.setProgress(0, animated: false)
        append("🟦 开始上传图片...\n")

        net.request("https://httpbin.org/post")
            .byID("upload_image")
            .byMethod(.POST)
            .onProgress { [weak self] p in
                self?.progressBar.setProgress(CGFloat(p), animated: true, duration: 0.08)
            }
            .byUpload(
                formName: "file",
                payload: .data(data, fileName: "jobs.jpg", mimeType: "image/jpeg"),
                extraForm: ["biz": "JobsNetworking", "type": "image"]
            )
            .start()
    }

    private func uploadVideoFile(_ url: URL) {
        progressBar.setProgress(0, animated: false)
        append("🟦 开始上传视频...\n")

        net.request("https://httpbin.org/post")
            .byID("upload_video")
            .byMethod(.POST)
            .onProgress { [weak self] p in
                self?.progressBar.setProgress(CGFloat(p), animated: true, duration: 0.08)
            }
            .byUpload(
                formName: "file",
                payload: .fileURL(url, fileName: "jobs.mov", mimeType: "video/quicktime"),
                extraForm: ["biz": "JobsNetworking", "type": "video"]
            )
            .start()
    }

    // ===================== Utils =====================

    private func append(_ s: String) {
        textView.text = (textView.text ?? "") + s
        let range = NSRange(location: max(0, textView.text.count - 1), length: 1)
        textView.scrollRangeToVisible(range)
    }
}

@available(iOS 14, *)
extension UploadFileVC: PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let r = results.first else { return }

        if r.itemProvider.canLoadObject(ofClass: UIImage.self) {
            r.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] obj, _ in
                guard let self, let img = obj as? UIImage else { return }
                DispatchQueue.main.async {
                    self.uploadImage(img)
                }
            }
            return
        }

        let typeId = UTType.movie.identifier
        if r.itemProvider.hasItemConformingToTypeIdentifier(typeId) {
            r.itemProvider.loadFileRepresentation(forTypeIdentifier: typeId) { [weak self] tmpURL, _ in
                guard let self, let tmpURL else { return }

                let dst = FileManager.default.temporaryDirectory
                    .appendingPathComponent("picked-\(UUID().uuidString).mov")

                do {
                    if FileManager.default.fileExists(atPath: dst.path) {
                        try FileManager.default.removeItem(at: dst)
                    }
                    try FileManager.default.copyItem(at: tmpURL, to: dst)

                    DispatchQueue.main.async {
                        self.uploadVideoFile(dst)
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.append("❌ copy video failed: \(error)\n")
                    }
                }
            }
        }
    }
}
