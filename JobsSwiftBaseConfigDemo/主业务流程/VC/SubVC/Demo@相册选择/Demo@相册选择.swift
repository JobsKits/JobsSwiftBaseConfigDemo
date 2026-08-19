//
//  Demo@相册选择.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import AVFoundation
import Photos
import PhotosUI   // 视频选择（PHPicker）
import JobsInheritance
import JobsByUIKit
import JobsSwiftDSL
import JobsToast
import JobsSwiftBaseDefines
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftTools
import SnapKit
import GKNavigationBarSwift

@MainActor
final class PhotoAlbumDemoVC: BaseVC {
    private enum SourceMode { case none, cameraPhoto, albumImages, cameraVideo, albumVideos }
    private var mode: SourceMode = .none
    private var images: [UIImage] = []
    private var videoURL: URL?              // 单个视频（拍摄 / 单选）
    private var albumVideoURLs: [URL] = []  // 多个视频（相册多选）
    private var pickerHold: AnyObject?      // 持有 PHPicker/UIImagePicker 的代理，防释放
    private var legacyVideoPickerController: UIImagePickerController?
    private let gridColumns: CGFloat = 3
    private let gridSpacing: CGFloat = 8
    private let gridInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    private var imageMaxSelection = 7       // 自定义“多选图片”上限（0 表示不限制）
    private var videoMaxSelection = 8       // 自定义“多选视频”上限（0 表示不限制）

    private func albumImageButtonTitle() -> String {
        imageMaxSelection == 0 ? "打开相册选照片（不限制）" : "打开相册选照片（最多\(imageMaxSelection)张）"
    }

    private func albumVideoButtonTitle() -> String {
        videoMaxSelection == 0 ? "打开相册选视频（不限制）" : "打开相册选视频（最多\(videoMaxSelection)个）"
    }
    // MARK: - Buttons
    private lazy var cameraBtn: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("调用相机照相 + 滤镜".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("camera.fill".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBackgroundColor(JobsCor.systemBlue)
            .onTap { [weak self] _ in
                guard let self else { return }
                #if targetEnvironment(simulator)
                "模拟器无法使用相机".tr.toast; return
                #else
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    "此设备不支持相机".tr.toast; return
                }
                pickFromCamera(allowsEditing: false) { [weak self] img in
                    guard let self else { return }
                    "已拍照 1 张".tr.toast
                    mode = .cameraPhoto
                    images = [img]; videoURL = nil; albumVideoURLs.removeAll()
                    reloadPreviewAndScrollMode()
                    showPhotoFilter(img)
                }
                #endif
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.gk_navigationBar.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(48)
            }
    }()

    private lazy var albumBtn: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle(albumImageButtonTitle(), for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("photo.on.rectangle".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBackgroundColor(JobsCor.systemGreen)
            .onTap { [weak self] _ in
                guard let self else { return }
                pickFromPhotoLibrary(maxSelection: imageMaxSelection, imagesOnly: true) { [weak self] imgs in
                    guard let self else { return }
                    (imgs.isEmpty
                     ? "未选择图片"
                     : "已选择 \(imgs.count) 张，点击照片进入滤镜工作台").toast
                    mode = .albumImages
                    images = imgs; videoURL = nil; albumVideoURLs.removeAll()
                    reloadPreviewAndScrollMode()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.cameraBtn.snp.bottom).offset(16)
                make.left.right.height.equalTo(self.cameraBtn)
            }
    }()

    private lazy var recordBtn: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("录制视频".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("video.fill".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBackgroundColor(JobsCor.systemPink)
            .onTap { [weak self] _ in
                guard let self else { return }
                #if targetEnvironment(simulator)
                    "模拟器无法录制视频".tr.toast; return
                #else
                MediaPickerService.recordVideo(from: self, maxDuration: 30, quality: .typeHigh) { [weak self] url in
                    guard let self else { return }
                    "已录制 1 段视频".tr.toast
                    self.showCameraVideo(url)
                }
                #endif
           }
           .byAddTo(view) { [unowned self] make in
               make.top.equalTo(self.albumBtn.snp.bottom).offset(16)
               make.left.right.height.equalTo(self.cameraBtn)
           }
    }()
    // 相册单选视频
    private lazy var pickOneVideoBtn: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle("选择一个视频".tr, for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("film".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBackgroundColor(JobsCor.systemIndigo)
            .onTap { [weak self] _ in
                guard let self else { return }
                pickVideosFromLibrary(maxSelection: 1) { [weak self] urls in
                    guard let self, let u = urls.first else { return }
                    "已选择 1 个视频".tr.toast
                    self.showCameraVideo(u)
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.recordBtn.snp.bottom).offset(16)
                make.left.right.height.equalTo(self.cameraBtn)
            }
    }()
    // 相册多选视频（上限可自定义）
    private lazy var pickMultiVideoBtn: UIButton = { [unowned self] in
        UIButton.sys()
            .byTitle(albumVideoButtonTitle(), for: .normal)
            .byTitleFont(JobsFont.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(JobsCor.white, for: .normal)
            .byImage("film.stack".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBackgroundColor(JobsCor.systemTeal)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.pickVideosFromLibrary(maxSelection: self.videoMaxSelection) { [weak self] urls in
                    guard let self else { return }
                    if urls.isEmpty { "未选择视频".tr.toast; return }
                    "已选择 \(urls.count) 个视频".toast
                    mode = .albumVideos
                    images.removeAll(); videoURL = nil; albumVideoURLs = urls
                    reloadPreviewAndScrollMode()
                }
            }
            .byAddTo(view) { [unowned self] make in
                make.top.equalTo(self.pickOneVideoBtn.snp.bottom).offset(16)
                make.left.right.height.equalTo(self.cameraBtn)
            }
    }()
    // MARK: - Preview
    private lazy var previewContainer: UIView = { [unowned self] in
        UIView.jobsMake { _ in }.byBackgroundColor(JobsCor.secondarySystemBackground)
            .byCornerRadius(12)
            .byAddTo(view) { [unowned self] v, make in
                make.top.equalTo(self.pickMultiVideoBtn.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(v.snp.width)
            }
    }()

    private lazy var collectionView: UICollectionView = { [unowned self] in
        UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.jobsMake { _ in }.byScrollDirection(.vertical).byMinimumInteritemSpacing(gridSpacing).byMinimumLineSpacing(gridSpacing))
            .byBackgroundColor(JobsCor.clear)
            .byScrollEnabled(NO)
            .byShowsVerticalScrollIndicator(NO)
            .byDataSource(self)
            .byDelegate(self)
            .byRegisterCell(UICollectionViewCell.self)
            .byRegisterCell(ImageCell.self)
            .byRegisterCell(VideoCell.self)
            .byRegisterCell(VideoThumbCell.self)
            .byAddTo(self.previewContainer) { [unowned self] make in
                make.edges.equalToSuperview().inset(gridInsets)
            }
    }()

    private lazy var filterHintLabel: UILabel = {
        UILabel.jobsMake { _ in }
            .byText("点击照片进入滤镜工作台".tr)
            .byFont(JobsFont.systemFont(ofSize: 13, weight: .semibold))
            .byTextColor(JobsCor.white)
            .byTextAlignment(.center)
            .byBackgroundColor(JobsCor.black)
            .byCornerRadius(10)
            .byClipsToBounds(true)
            .byAddTo(previewContainer) { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(12)
                make.height.equalTo(28)
                make.width.greaterThanOrEqualTo(190)
            }
    }()

    override func loadView() {
        super.loadView()
        mode = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.byBackgroundColor(JobsCor.systemBackground)
        jobsSetupGKNav(title: "相机 / 相册 / 录制 / 滤镜".tr)
        cameraBtn.byVisible(YES)
        albumBtn.byVisible(YES)
        recordBtn.byVisible(YES)
        pickOneVideoBtn.byVisible(YES)
        pickMultiVideoBtn.byVisible(YES)
        previewContainer.byVisible(YES)
        collectionView.byVisible(YES)
        filterHintLabel.byVisible(NO)
        reloadPreviewAndScrollMode()
    }

    private func showCameraVideo(_ url: URL) {
        mode = .cameraVideo
        images.removeAll(); videoURL = url; albumVideoURLs.removeAll()
        reloadPreviewAndScrollMode()
    }

    private func reloadPreviewAndScrollMode() {
        collectionView.setContentOffset(.zero, animated: false)
        collectionView.collectionViewLayout.invalidateLayout()
        applyScrollPolicy()
        collectionView.reloadData()
        refreshFilterHint()
    }

    private func refreshFilterHint() {
        let shouldShow = (mode == .cameraPhoto || mode == .albumImages) && !images.isEmpty
        filterHintLabel.byVisible(shouldShow)
    }

    private func showPhotoFilter(_ image: UIImage) {
        PhotoFilterDemoVC(sourceImage: image).byPush(self)
    }
    /// 滚动策略
    private func applyScrollPolicy() {
        switch mode {
        /// 合并处理 .cameraPhoto、.cameraVideo、.none 分支
        case .cameraPhoto, .cameraVideo, .none:
            collectionView
                .byScrollEnabled(false)
                .byShowsVerticalScrollIndicator(false)
        /// 处理 .albumImages 分支
        case .albumImages:
            let disable = images.count <= 9
            collectionView
                .byScrollEnabled(!disable)
                .byShowsVerticalScrollIndicator(!disable)
        /// 处理 .albumVideos 分支
        case .albumVideos:
            let disable = albumVideoURLs.count <= 9
            collectionView
                .byScrollEnabled(!disable)
                .byShowsVerticalScrollIndicator(!disable)
        }
        collectionView.byAlwaysBounceVertical(collectionView.isScrollEnabled)
    }
}
// MARK: - UICollectionViewDataSource
extension PhotoAlbumDemoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mode {
        /// 处理 .cameraPhoto 分支
        case .cameraPhoto: return images.isEmpty ? 0 : 1
        /// 处理 .albumImages 分支
        case .albumImages: return images.count
        /// 处理 .cameraVideo 分支
        case .cameraVideo: return videoURL == nil ? 0 : 1
        /// 处理 .albumVideos 分支
        case .albumVideos: return albumVideoURLs.count
        /// 空态
        case .none:        return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch mode {
        /// 合并处理 .cameraPhoto、.albumImages 分支
        case .cameraPhoto, .albumImages:
            let img = (mode == .cameraPhoto) ? images[0] : images[indexPath.item]
            return collectionView
                .byDequeueCell(ImageCell.self, for: indexPath)
                .byData(img)
        /// 处理 .cameraVideo 分支
        case .cameraVideo:
            return collectionView
                .byDequeueCell(VideoCell.self, for: indexPath)
                .byData(videoURL)
        /// 处理 .albumVideos 分支
        case .albumVideos:
            return collectionView
                .byDequeueCell(VideoThumbCell.self, for: indexPath)
                .byData(albumVideoURLs[indexPath.item])
        /// 处理 .none 分支
        case .none:
            return collectionView
                .byDequeueCell(ImageCell.self, for: indexPath)
                .byData("暂无内容@黑底蓝字".img)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoAlbumDemoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mode {
        /// 处理 .cameraPhoto 分支
        case .cameraPhoto:
            guard let image = images.first else { return }
            showPhotoFilter(image)
        /// 处理 .albumImages 分支
        case .albumImages:
            guard images.indices.contains(indexPath.item) else { return }
            showPhotoFilter(images[indexPath.item])
        /// 视频与空态不进入照片滤镜
        case .cameraVideo, .albumVideos, .none:
            break
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        switch mode {
        /// 合并处理 .cameraPhoto、.cameraVideo、.none 分支
        case .cameraPhoto, .cameraVideo, .none:
            let w = width - gridInsets.left - gridInsets.right
            return CGSize(width: w, height: w) // 单格
        /// 合并处理 .albumImages、.albumVideos 分支
        case .albumImages, .albumVideos:
            let totalSpacing = gridInsets.left + gridInsets.right + gridSpacing * (gridColumns - 1)
            let side = floor((width - totalSpacing) / gridColumns)
            return CGSize(width: side, height: side)
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets { gridInsets }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch mode {
        /// 合并处理 .cameraPhoto、.cameraVideo、.none 分支
        case .cameraPhoto, .cameraVideo, .none: return 0
        /// 合并处理 .albumImages、.albumVideos 分支
        case .albumImages, .albumVideos:       return gridSpacing
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch mode {
        /// 合并处理 .cameraPhoto、.cameraVideo、.none 分支
        case .cameraPhoto, .cameraVideo, .none: return 0
        /// 合并处理 .albumImages、.albumVideos 分支
        case .albumImages, .albumVideos:        return gridSpacing
        }
    }
}
// MARK: - 相册选择视频（单/多）
// 放在 VC 内，复用 PermissionCenter；也可抽到 MediaPickerService
private extension PhotoAlbumDemoVC {
    func pickVideosFromLibrary(maxSelection: Int, jobsByVoidBlock: @escaping ([URL]) -> Void) {
        PermissionCenter.ensure(.photoLibraryReadWrite, from: self) { [weak self] in
            guard let self else { return }
            if #available(iOS 14, *) {
                var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
                config
                    .bySelectionLimit(maxSelection <= 0 ? 0 : maxSelection) // 0 = 不限制
                    .byFilter(.videos)
                let proxy = PHPickerVideoProxy { [weak self] urls in
                    jobsByVoidBlock(urls); self?.pickerHold = nil
                }
                let picker = PHPickerViewController(configuration: config)
                picker.byDelegate(proxy)
                self.pickerHold = proxy
                self.present(picker, animated: true)
            } else {
                // iOS 13 及以下仅支持单选
                if maxSelection != 1 {
                    onMainAsync(self) { vc in "多选视频仅支持 iOS 14 及以上".tr.toast }
                }
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
                let proxy = LegacyVideoLibraryProxy { [weak self] url in
                    jobsByVoidBlock(url.map { [$0] } ?? []); self?.pickerHold = nil
                }
                legacyVideoPickerController = UIImagePickerController.jobsMake { _ in }
                legacyVideoPickerController?.sourceType = .photoLibrary
                legacyVideoPickerController?.mediaTypes = [UTType.movie.identifier]
                legacyVideoPickerController?.byDelegate(proxy)
                self.pickerHold = proxy
                if let legacyVideoPickerController {
                    self.present(legacyVideoPickerController, animated: true)
                }
            }
        }
    }
}
@available(iOS 14, *)
private final class PHPickerVideoProxy: NSObject, PHPickerViewControllerDelegate {
    let jobsByVoidBlock: ([URL]) -> Void
    init(jobsByVoidBlock: @escaping ([URL]) -> Void) { self.jobsByVoidBlock = jobsByVoidBlock }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard !results.isEmpty else { jobsByVoidBlock([]); return }
        let group = DispatchGroup()
        var urls: [URL] = []
        for r in results {
            let provider = r.itemProvider
            let typeId = UTType.movie.identifier  // "public.movie"
            if provider.hasItemConformingToTypeIdentifier(typeId) {
                group.enter()
                provider.loadFileRepresentation(forTypeIdentifier: typeId) { tmpURL, _ in
                    defer { group.leave() }
                    guard let tmpURL else { return }
                    // 复制到我们的临时目录，避免系统回收
                    let dst = FileManager.default.temporaryDirectory
                        .appendingPathComponent("picked-\(UUID().uuidString).mov")
                    do {
                        try FileManager.default.copyItem(at: tmpURL, to: dst)
                        urls.append(dst)
                    } catch {
                        // 忽略复制失败个案
                    }
                }
            }
        }
        group.notify(queue: .main) { [jobsByVoidBlock] in jobsByVoidBlock(urls) }
    }
}

private final class LegacyVideoLibraryProxy: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let jobsByVoidBlock: (URL?) -> Void
    init(jobsByVoidBlock: @escaping (URL?) -> Void) { self.jobsByVoidBlock = jobsByVoidBlock }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let url = info[.mediaURL] as? URL
        jobsByVoidBlock(url)
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        jobsByVoidBlock(nil)
        picker.dismiss(animated: true)
    }
}
