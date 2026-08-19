//
//  JobsOCParityPostDraftDemoVC.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import AVFoundation
import JobsByUIKit
import JobsInheritance
import JobsSwiftBaseDefines
import JobsSwiftTools
import JobsToast
import GKNavigationBarSwift
import PhotosUI
import SnapKit
import UniformTypeIdentifiers

final class JobsPostDraftDemoVC: BaseVC {

    private struct Draft: Codable, Equatable {
        let text: String
        let images: [String]
        let videoPath: String?
    }

    private let draftKey = "JobsPostDraftDemoVC.Draft"
    private let maximumTextCount = 10
    private let maximumImageCount = 9
    private var images: [UIImage] = []
    private var videoURL: URL?
    private var imageButtons: [UIButton] = []
    private var gridHeightConstraint: Constraint?
    private var snapshot = Draft(text: "", images: [], videoPath: nil)
    private var previousInteractivePopEnabled = true

    private lazy var backButton: UIButton = {
        UIButton.sys()
            .byImage("chevron.left".sysImg, for: .normal)
            .byTintColor(JobsCor.label)
            .byBackgroundColor(JobsCor.clear, for: .normal)
            .onTap { [weak self] _ in
                self?.handleBack()
            }
    }()

    private lazy var publishButton: UIButton = {
        UIButton.sys()
            .byTitle("发布".tr, for: .normal)
            .byTitleFont(JobsFont.boldSystemFont(ofSize: 14))
            .byTitleColor(JobsCor.white, for: .normal)
            .byBackgroundColor(JobsCor.systemBlue, for: .normal)
            .byCornerRadius(16)
            .onTap { [weak self] _ in
                self?.publish()
            }
    }()

    private lazy var scrollView: UIScrollView = {
        UIScrollView.jobsMake { _ in }
            .byAlwaysBounceVertical(YES)
            .byShowsVerticalScrollIndicator(false)
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(gk_navigationBar.snp.bottom)
                make.left.right.bottom.equalToSuperview()
            }
    }()

    private lazy var contentView: UIView = {
        UIView.jobsMake { _ in }
            .byAddTo(scrollView) { [unowned self] make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
            }
    }()

    private lazy var postTextView: UITextView = {
        UITextView.jobsMake { _ in }
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.label)
            .byDelegate(self)
            .byBackgroundColor(JobsCor.systemBackground)
            .byTextContainerInset(UIEdgeInsets(top: 12, left: 12, bottom: 24, right: 12))
            .byAddTo(contentView) { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(101)
            }
    }()

    private lazy var placeholderLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("撩骚内容，写在这里哦~".tr)
            .byFont(JobsFont.systemFont(ofSize: 16))
            .byTextColor(JobsCor.placeholderText)
            .byAddTo(postTextView) { make in
                make.top.equalToSuperview().offset(12)
                make.left.equalToSuperview().offset(16)
            }
    }()

    private lazy var countLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("0/\(maximumTextCount)")
            .byFont(JobsFont.systemFont(ofSize: 11))
            .byTextColor(JobsCor.secondaryLabel)
            .byAddTo(postTextView) { make in
                make.right.bottom.equalToSuperview().inset(8)
            }
    }()

    private lazy var tipsLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText(
                "1、内容不允许出现纯数字，英文字母；\n"
                + "2、图片/视频(图片最多9张/仅上传一段视频，大小不超100M)。"
            )
            .byFont(JobsFont.systemFont(ofSize: 12))
            .byTextColor(JobsCor.secondaryLabel)
            .byNumberOfLines(0)
            .byBackgroundColor(JobsCor.secondarySystemBackground)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(postTextView.snp.bottom)
                make.left.right.equalToSuperview()
                make.height.equalTo(68)
            }
    }()

    private lazy var mediaGridView: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.systemBackground)
            .byAddTo(contentView) { [unowned self] make in
                make.top.equalTo(tipsLabel.snp.bottom).offset(12)
                make.left.right.equalToSuperview().inset(16)
                gridHeightConstraint = make.height.equalTo(1).constraint
                make.bottom.equalTo(contentView.snp.bottom).inset(24)
            }
    }()

    private lazy var addImageButton: UIButton = {
        UIButton.sys()
            .byImage("plus".sysImg, for: .normal)
            .byTintColor(JobsCor.secondaryLabel)
            .byBackgroundColor(JobsCor.systemGray6, for: .normal)
            .byCornerRadius(8)
            .byBorderWidth(1)
            .byBorderColor(JobsCor.separator)
            .onTap { [weak self] _ in
                self?.chooseMedia()
            }
    }()

    private lazy var deleteZoneLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("拖到这里删除".tr)
            .byFont(JobsFont.boldSystemFont(ofSize: 16))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.systemRed.withAlphaComponent(0.92))
            .byCornerRadius(12)
            .byVisible(NO)
            .byAddTo(view) { make in
                make.left.right.equalToSuperview().inset(36)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(18)
                make.height.equalTo(58)
            }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(
            title: "图文发帖编辑与草稿存取".tr,
            leftButton: backButton,
            rightButtons: [publishButton]
        )
        scrollView.byVisible(YES)
        contentView.byVisible(YES)
        postTextView.byVisible(YES)
        placeholderLabel.byVisible(YES)
        countLabel.byVisible(YES)
        tipsLabel.byVisible(YES)
        mediaGridView.byVisible(YES)
        addImageButton.byVisible(YES)
        deleteZoneLabel.byVisible(NO)
        loadDraft()
        reloadMediaGrid()
        refreshState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        previousInteractivePopEnabled = navigationController?
            .interactivePopGestureRecognizer?
            .isEnabled ?? true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?
            .interactivePopGestureRecognizer?
            .isEnabled = previousInteractivePopEnabled
    }

    private func chooseImages() {
        guard videoURL == nil else {
            "图片和视频不能同时选择".toast
            return
        }
        let availableCount = maximumImageCount - images.count
        guard availableCount > 0 else {
            "最多选择 \(maximumImageCount) 张图片".toast
            return
        }
        pickFromPhotoLibrary(maxSelection: availableCount, imagesOnly: true) { [weak self] selectedImages in
            guard let self else { return }
            images.append(contentsOf: selectedImages.prefix(availableCount))
            reloadMediaGrid()
            refreshState()
        }
    }

    private func chooseMedia() {
        let alertController = UIAlertController(
            title: "选择媒体".tr,
            message: "最多 9 张图片，或仅选择 1 段不超过 100M 的视频".tr,
            preferredStyle: .actionSheet
        )
        alertController.addAction(UIAlertAction(title: "选择图片".tr, style: .default) { [weak self] _ in
            self?.chooseImages()
        })
        alertController.addAction(UIAlertAction(title: "选择视频".tr, style: .default) { [weak self] _ in
            self?.chooseVideo()
        })
        alertController.addAction(UIAlertAction(title: "取消".tr, style: .cancel))
        alertController.byPresent(self, anchor: .view(addImageButton))
    }

    private func chooseVideo() {
        guard images.isEmpty else {
            "图片和视频不能同时选择，请先删除已选图片".toast
            return
        }
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration
            .bySelectionLimit(1)
            .byFilter(.videos)
        PHPickerViewController(configuration: configuration)
            .byDelegate(self)
            .byPresent(self)
    }

    private func reloadMediaGrid() {
        imageButtons.forEach { $0.removeFromSuperview() }
        if let videoURL {
            let videoButton = makeMediaButton(
                image: makeVideoThumbnail(videoURL) ?? "video.fill".sysImg,
                tag: -1
            )
            videoButton
                .byTitle("▶︎", for: .normal)
                .byTitleFont(JobsFont.boldSystemFont(ofSize: 34))
                .byTitleColor(JobsCor.white, for: .normal)
            imageButtons = [videoButton]
        } else {
            imageButtons = images.enumerated().map { index, image in
                makeMediaButton(image: image, tag: index)
            }
        }
        imageButtons.forEach(mediaGridView.addSubview)
        let showsAddButton = videoURL == nil && images.count < maximumImageCount
        if showsAddButton {
            mediaGridView.addSubview(addImageButton)
        } else {
            addImageButton.removeFromSuperview()
        }
        let side = (UIScreen.main.bounds.width - 48 - 16) / 3
        let allViews: [UIView] = imageButtons + (showsAddButton ? [addImageButton] : [])
        allViews.enumerated().forEach { index, cellView in
            let row = index / 3
            let column = index % 3
            cellView.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(CGFloat(row) * (side + 8))
                make.left.equalToSuperview().offset(CGFloat(column) * (side + 8))
                make.width.height.equalTo(side)
            }
        }
        let rowCount = max(1, Int(ceil(Double(allViews.count) / 3.0)))
        gridHeightConstraint?.update(offset: CGFloat(rowCount) * side + CGFloat(rowCount - 1) * 8)
    }

    private func handleImagePan(_ gesture: UIGestureRecognizer) {
        guard let pan = gesture as? UIPanGestureRecognizer,
              let button = pan.view as? UIButton else { return }
        let translation = pan.translation(in: view)
        switch pan.state {
        /// 显示删除区并将当前图片提到最上层
        case .began:
            deleteZoneLabel.byVisible(YES)
            view.bringSubviewToFront(deleteZoneLabel)
            mediaGridView.bringSubviewToFront(button)
        /// 图片跟随手指拖动
        case .changed:
            button.byTransform(CGAffineTransform(translationX: translation.x, y: translation.y))
        /// 进入删除区则删除，否则回到原位
        case .ended:
            let buttonFrame = button.convert(button.bounds, to: view)
            if buttonFrame.intersects(deleteZoneLabel.frame) {
                if button.tag == -1 {
                    videoURL = nil
                } else if images.indices.contains(button.tag) {
                    images.remove(at: button.tag)
                }
                reloadMediaGrid()
                refreshState()
            } else {
                restoreImageButton(button)
            }
            deleteZoneLabel.byVisible(NO)
        /// 取消或失败时恢复原位
        case .cancelled, .failed:
            restoreImageButton(button)
            deleteZoneLabel.byVisible(NO)
        /// 未匹配已知分支时不处理
        default:
            break
        }
    }

    private func restoreImageButton(_ button: UIButton) {
        UIView.jobsAnimateWithSpring(
            0.30,
            dampingRatio: 0.80,
            initialVelocity: 0.7,
            options: [.beginFromCurrentState],
            animations: {
                button.byTransform(.identity)
            }
        )
    }

    private func makeMediaButton(image: UIImage?, tag: Int) -> UIButton {
        UIButton.sys()
            .byTag(tag)
            .byImage(image, for: .normal)
            .byImageViewContentMode(.scaleAspectFill)
            .byBackgroundColor(JobsCor.systemGray6, for: .normal)
            .byCornerRadius(8)
            .byClipsToBounds()
            .addPanAction { [weak self] gesture in
                self?.handleImagePan(gesture)
            }
    }

    private func makeVideoThumbnail(_ url: URL) -> UIImage? {
        let generator = AVAssetImageGenerator(asset: AVAsset(url: url))
        generator.appliesPreferredTrackTransform = true
        guard let cgImage = try? generator.copyCGImage(
            at: CMTime(seconds: 0.2, preferredTimescale: 600),
            actualTime: nil
        ) else { return nil };return UIImage(cgImage: cgImage)
    }

    private func refreshState() {
        let textCount = postTextView.text.count
        placeholderLabel.byVisible(textCount == 0)
        countLabel.byText("\(textCount)/\(maximumTextCount)")
        let canPublish = textCount > 0 || !images.isEmpty || videoURL != nil
        publishButton
            .byEnabled(canPublish)
            .byBackgroundColor(
                canPublish ? JobsCor.systemBlue : JobsCor.systemGray3,
                for: .normal
            )
    }

    private func loadDraft() {
        guard let data = UserDefaults.standard.data(forKey: draftKey),
              let draft = try? JSONDecoder.make { _ in }.decode(Draft.self, from: data) else {
            snapshot = currentDraft()
            return
        }
        postTextView.byText(draft.text)
        images = draft.images.compactMap { encoded in
            Data(base64Encoded: encoded).flatMap(UIImage.init(data:))
        }
        if let videoPath = draft.videoPath,
           FileManager.default.fileExists(atPath: videoPath) {
            videoURL = URL(fileURLWithPath: videoPath)
        }
        snapshot = currentDraft()
    }

    private func currentDraft() -> Draft {
        Draft(
            text: postTextView.text ?? "",
            images: images.compactMap { image in
                (image.pngData() ?? image.jpegData(compressionQuality: 0.88))?.base64EncodedString()
            },
            videoPath: videoURL?.path
        )
    }

    private func saveDraft() {
        let draft = currentDraft()
        if let data = try? JSONEncoder.make { _ in }.encode(draft) {
            UserDefaults.standard.set(data, forKey: draftKey)
            snapshot = draft
        }
    }

    private func clearDraft() {
        UserDefaults.standard.removeObject(forKey: draftKey)
    }

    private func publish() {
        guard publishButton.isEnabled else { return }
        let content = postTextView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        let isPureASCIIAlphaNumeric = !content.isEmpty && content.unicodeScalars.allSatisfy { scalar in
            let value = scalar.value
            return (48...57).contains(value)
                || (65...90).contains(value)
                || (97...122).contains(value)
        }
        guard !isPureASCIIAlphaNumeric else {
            "内容不允许为纯数字或英文字母".toast
            return
        }
        clearDraft()
        snapshot = currentDraft()
        let mediaDescription = videoURL == nil ? "\(images.count) 张图片" : "1 段视频"
        "发布成功：\(postTextView.text.count) 个字，\(mediaDescription)".toast
    }

    private func handleBack() {
        guard currentDraft() != snapshot else {
            navigationController?.popViewController(animated: YES)
            return
        }
        let alertController = UIAlertController(
            title: "提示".tr,
            message: "是否将当前内容保存为草稿？".tr,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "不保存".tr, style: .destructive) { [weak self] _ in
            self?.clearDraft()
            self?.navigationController?.popViewController(animated: YES)
        })
        alertController.addAction(UIAlertAction(title: "保存".tr, style: .default) { [weak self] _ in
            self?.saveDraft()
            self?.navigationController?.popViewController(animated: YES)
        })
        alertController.byPresent(self)
    }
}

extension JobsPostDraftDemoVC: UITextViewDelegate {

    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String
    ) -> Bool {
        guard let current = textView.text,
              let swiftRange = Range(range, in: current) else { return false };return current
            .replacingCharacters(in: swiftRange, with: text)
            .count <= maximumTextCount
    }

    func textViewDidChange(_ textView: UITextView) {
        refreshState()
    }
}

extension JobsPostDraftDemoVC: PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: YES)
        guard let provider = results.first?.itemProvider,
              provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) else { return }
        provider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { [weak self] temporaryURL, _ in
            guard let self, let temporaryURL else { return }
            let fileSize = (try? temporaryURL.resourceValues(forKeys: [.fileSizeKey]).fileSize) ?? 0
            guard fileSize <= 100 * 1024 * 1024 else {
                DispatchQueue.main.async {
                    "视频大小不能超过 100M".toast
                };return
            }
            do {
                let directory = try FileManager.default.url(
                    for: .applicationSupportDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: true
                ).appendingPathComponent("JobsPostDraftDemo", isDirectory: true)
                try FileManager.default.createDirectory(
                    at: directory,
                    withIntermediateDirectories: true
                )
                let destination = directory.appendingPathComponent("\(UUID().uuidString).mov")
                try FileManager.default.copyItem(at: temporaryURL, to: destination)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    videoURL = destination
                    reloadMediaGrid()
                    refreshState()
                }
            } catch {
                DispatchQueue.main.async {
                    "视频保存失败：\(error.localizedDescription)".toast
                }
            }
        }
    }
}
