//
//  PhotoAlbumDemoVC.swift
//  JobsSwiftBaseConfigDemo
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import AVFoundation
import Photos
import PhotosUI   // 视频选择（PHPicker）
import SnapKit
import GKNavigationBarSwift
import Inheritance
import JobsByUIKit
import JobsToast
import JobsSwiftBaseDefines
import JobsBy3rdTools
import JobsTextTools
import JobsSwiftTools
@MainActor
final class PhotoAlbumDemoVC: BaseVC {
    private enum SourceMode { case none, cameraPhoto, albumImages, cameraVideo, albumVideos }
    private var mode: SourceMode = .none
    private var images: [UIImage] = []
    private var videoURL: URL?              // 单个视频（拍摄 / 单选）
    private var albumVideoURLs: [URL] = []  // 多个视频（相册多选）
    private var pickerHold: AnyObject?      // 持有 PHPicker/UIImagePicker 的代理，防释放
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
        UIButton(type: .system)
            .byTitle("调用相机照相", for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byImage("camera.fill".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBgColor(.systemBlue)
            .onTap { [weak self] _ in
                guard let self else { return }
                #if targetEnvironment(simulator)
                "模拟器无法使用相机".toast; return
                #else
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    "此设备不支持相机".toast; return
                }
                pickFromCamera(allowsEditing: false) { [weak self] img in
                    guard let self else { return }
                    "已拍照 1 张".toast
                    mode = .cameraPhoto
                    images = [img]; videoURL = nil; albumVideoURLs.removeAll()
                    reloadPreviewAndScrollMode()
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
        UIButton(type: .system)
            .byTitle(albumImageButtonTitle(), for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byImage("photo.on.rectangle".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBgColor(.systemGreen)
            .onTap { [weak self] _ in
                guard let self else { return }
                pickFromPhotoLibrary(maxSelection: imageMaxSelection, imagesOnly: true) { [weak self] imgs in
                    guard let self else { return }
                    (imgs.isEmpty ? "未选择图片" : "已选择 \(imgs.count) 张").toast
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
        UIButton(type: .system)
            .byTitle("录制视频".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byImage("video.fill".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBgColor(.systemPink)
            .onTap { [weak self] _ in
                guard let self else { return }
                #if targetEnvironment(simulator)
                    "模拟器无法录制视频".toast; return
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
        UIButton(type: .system)
            .byTitle("选择一个视频".tr, for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byImage("film".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBgColor(.systemIndigo)
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
        UIButton(type: .system)
            .byTitle(albumVideoButtonTitle(), for: .normal)
            .byTitleFont(.systemFont(ofSize: 16, weight: .medium))
            .byTitleColor(.white, for: .normal)
            .byImage("film.stack".sysImg, for: .normal)
            .byContentEdgeInsets(.init(top: 12, left: 16, bottom: 12, right: 16))
            .byCornerRadius(12)
            .byBgColor(.systemTeal)
            .onTap { [weak self] _ in
                guard let self else { return }
                self.pickVideosFromLibrary(maxSelection: self.videoMaxSelection) { [weak self] urls in
                    guard let self else { return }
                    if urls.isEmpty { "未选择视频".toast; return }
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
        UIView().byBgColor(.secondarySystemBackground)
            .byCornerRadius(12)
            .byAddTo(view) { [unowned self] v, make in
                make.top.equalTo(self.pickMultiVideoBtn.snp.bottom).offset(16)
                make.left.right.equalToSuperview().inset(24)
                make.height.equalTo(v.snp.width)
            }
    }()

    private lazy var collectionView: UICollectionView = { [unowned self] in
        UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().byScrollDirection(.vertical).byMinimumInteritemSpacing(gridSpacing).byMinimumLineSpacing(gridSpacing))
            .byBgColor(.clear)
            .byScrollEnabled(NO)
            .byShowsVerticalScrollIndicator(NO)
            .byDataSource(self)
            .byDelegate(self)
            .registerCell(UICollectionViewCell.self)
            .registerCell(ImageCell.self)
            .registerCell(VideoCell.self)
            .registerCell(VideoThumbCell.self)
            .byAddTo(self.previewContainer) { [unowned self] make in
                make.edges.equalToSuperview().inset(gridInsets)
            }
    }()

    override func loadView() {
        super.loadView()
        mode = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        jobsSetupGKNav(title: "鉴权后：相机 / 相册 / 录制 / 选视频")

        cameraBtn.byVisible(YES)
        albumBtn.byVisible(YES)
        recordBtn.byVisible(YES)
        pickOneVideoBtn.byVisible(YES)
        pickMultiVideoBtn.byVisible(YES)
        previewContainer.byVisible(YES)
        collectionView.byVisible(YES)

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
    }
    /// 滚动策略
    private func applyScrollPolicy() {
        switch mode {
        case .cameraPhoto, .cameraVideo, .none:
            collectionView.isScrollEnabled = false
            collectionView.showsVerticalScrollIndicator = false
        case .albumImages:
            let disable = images.count <= 9
            collectionView.isScrollEnabled = !disable
            collectionView.showsVerticalScrollIndicator = !disable
        case .albumVideos:
            let disable = albumVideoURLs.count <= 9
            collectionView.isScrollEnabled = !disable
            collectionView.showsVerticalScrollIndicator = !disable
        }
        collectionView.alwaysBounceVertical = collectionView.isScrollEnabled
    }
}
// MARK: - UICollectionViewDataSource
extension PhotoAlbumDemoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch mode {
        case .cameraPhoto: return images.isEmpty ? 0 : 1
        case .albumImages: return images.count
        case .cameraVideo: return videoURL == nil ? 0 : 1
        case .albumVideos: return albumVideoURLs.count
        case .none:        return 1 // 空态
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch mode {
        case .cameraPhoto, .albumImages:
            let img = (mode == .cameraPhoto) ? images[0] : images[indexPath.item]
            return collectionView
                .dequeueCell(ImageCell.self, for: indexPath)
                .byData(img)

        case .cameraVideo:
            return collectionView
                .dequeueCell(VideoCell.self, for: indexPath)
                .byData(videoURL)

        case .albumVideos:
            return collectionView
                .dequeueCell(VideoThumbCell.self, for: indexPath)
                .byData(albumVideoURLs[indexPath.item])

        case .none:
            return collectionView
                .dequeueCell(ImageCell.self, for: indexPath)
                .byData("暂无内容@黑底蓝字".img)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoAlbumDemoVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        switch mode {
        case .cameraPhoto, .cameraVideo, .none:
            let w = width - gridInsets.left - gridInsets.right
            return CGSize(width: w, height: w) // 单格
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
        case .cameraPhoto, .cameraVideo, .none: return 0
        case .albumImages, .albumVideos:       return gridSpacing
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch mode {
        case .cameraPhoto, .cameraVideo, .none: return 0
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
                config.selectionLimit = maxSelection <= 0 ? 0 : maxSelection  // 0 = 不限制
                config.filter = .videos
                let proxy = PHPickerVideoProxy { [weak self] urls in
                    jobsByVoidBlock(urls); self?.pickerHold = nil
                }
                let picker = PHPickerViewController(configuration: config)
                picker.delegate = proxy
                self.pickerHold = proxy
                self.present(picker, animated: true)
            } else {
                // iOS 13 及以下仅支持单选
                if maxSelection != 1 {
                    Task { @MainActor in "多选视频仅支持 iOS 14 及以上".toast }
                }
                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
                let proxy = LegacyVideoLibraryProxy { [weak self] url in
                    jobsByVoidBlock(url.map { [$0] } ?? []); self?.pickerHold = nil
                }
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.mediaTypes = [UTType.movie.identifier]
                picker.delegate = proxy
                self.pickerHold = proxy
                self.present(picker, animated: true)
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
