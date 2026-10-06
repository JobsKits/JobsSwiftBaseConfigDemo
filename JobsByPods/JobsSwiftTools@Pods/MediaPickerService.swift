//
//  MediaPickerService.swift
//  JobsSwiftTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Photos
import PhotosUI
import AVFoundation
import ObjectiveC
import JobsByUIKit
import JobsSwiftDSL
import JobsByPhotosUI
import JobsSwiftBaseDefines

#if canImport(UniformTypeIdentifiers)
import UniformTypeIdentifiers // iOS 14+
#endif

public enum MediaPickerError: Error {
    case noPresenter
    case permissionDenied
    case unavailable
    case presenterBusy
    case timedOut
    case cancelled
    case decodingFailed
    case decodedMemoryBudgetExceeded
}

@MainActor
public final class MediaPickerService: NSObject {
    // ---------- 一键：相机 ----------
    public static func pickFromCamera(from presenter: UIViewController,
                                      allowsEditing: Bool = false,
                                      onFailure: ((MediaPickerError) -> Void)? = nil,
                                      onImage: @escaping (UIImage) -> Void) {
        PermissionCenter.ensure(.camera, from: presenter, onDenied: { onFailure?(.permissionDenied) }) {
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                onMainAsync {
                    "此设备不支持相机".toast
                    onFailure?(.unavailable)
                };return
            }
            onMainAsync {
                guard canPresent(from: presenter) else {
                    onFailure?(.presenterBusy)
                    return
                }
                let proxy = CameraProxy(allowsEditing: allowsEditing, jobsByVoidBlock: onImage)
                proxy.onFailure = onFailure
                attachProxy(proxy, to: presenter)
                presenter.present(UIImagePickerController.jobsMake { _ in }
                    .bySourceType(.camera)
                    .byAllowsEditing(allowsEditing)
                    .byDelegate(proxy), animated: true)
            }
        }
    }
    // ---------- 一键：系统相册（多选，默认 9） ----------
    public static func pickFromPhotoLibrary(from presenter: UIViewController,
                                            maxSelection: Int = 9,
                                            imagesOnly: Bool = true,
                                            loadTimeout: TimeInterval = 30,
                                            onFailure: ((MediaPickerError) -> Void)? = nil,
                                            onImages: @escaping ([UIImage]) -> Void) {
        let presentPicker = {
            onMainAsync {
                guard canPresent(from: presenter) else {
                    onFailure?(.presenterBusy)
                    return
                }
                if #available(iOS 14, *) {
                    var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
                    config
                        .bySelectionLimit(maxSelection <= 0 ? 0 : maxSelection) // 0=不限制
                        .byFilter(imagesOnly ? .images : .any(of: [.images, .livePhotos, .videos]))
                    let proxy = PHPickerProxy(timeout: loadTimeout, jobsByVoidBlock: onImages)
                    proxy.onFailure = onFailure
                    attachProxy(proxy, to: presenter)
                    presenter.present(PHPickerViewController(configuration: config).byDelegate(proxy), animated: true)
                } else {
                    guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                        onFailure?(.unavailable)
                        return
                    }
                    let proxy = LegacyLibraryProxy { img in
                        onImages(img.map { [$0] } ?? [])
                    }
                    proxy.onFailure = onFailure
                    attachProxy(proxy, to: presenter)
                    presenter.present(UIImagePickerController.jobsMake { _ in }
                        .bySourceType(.photoLibrary)
                        .byAllowsEditing(false)
                        .byDelegate(proxy), animated: true)
                }
            }
        }
        if #available(iOS 14, *) {
            presentPicker()
        } else {
            PermissionCenter.ensure(.photoLibraryReadWrite, from: presenter,
                                    onDenied: { onFailure?(.permissionDenied) }, onAuthorized: presentPicker)
        }
    }
    // ---------- 一键：录制视频 ----------
    public static func recordVideo(from presenter: UIViewController,
                                   maxDuration: TimeInterval = 30,
                                   quality: UIImagePickerController.QualityType = .typeHigh,
                                   onFailure: ((MediaPickerError) -> Void)? = nil,
                                   onVideoURL: @escaping (URL) -> Void) {
        // 依次确认相机 + 麦克风
        PermissionCenter.ensure(.camera, from: presenter, onDenied: { onFailure?(.permissionDenied) }) {
            PermissionCenter.ensure(.microphone, from: presenter, onDenied: { onFailure?(.permissionDenied) }) {
                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                    "此设备不支持相机".toast
                    onFailure?(.unavailable)
                    return
                }
                // 1) 能力检查：是否支持录视频 UTI
                let movieUTI: String = {
                    if #available(iOS 14.0, *) { return UTType.movie.identifier } // "public.movie"
                    else { return "public.movie" }
                }()
                let supported = UIImagePickerController.availableMediaTypes(for: .camera) ?? []
                guard supported.contains(movieUTI) else {
                    "此设备不支持视频录制".toast
                    onFailure?(.unavailable)
                    return
                }
                // 2) 能力检查：哪个摄像头支持 video
                let chooseDevice: UIImagePickerController.CameraDevice? = {
                    func supportsVideo(_ device: UIImagePickerController.CameraDevice) -> Bool {
                        guard UIImagePickerController.isCameraDeviceAvailable(device),
                              let modes = UIImagePickerController.availableCaptureModes(for: device) else {
                            return false
                        }
                        // modes: [NSNumber]，对比 CameraCaptureMode.video 的 rawValue
                        return modes.contains { $0.intValue == UIImagePickerController.CameraCaptureMode.video.rawValue }
                        // 或者：
                        // return modes.compactMap { UIImagePickerController.CameraCaptureMode(rawValue: $0.intValue) }
                        //            .contains(.video)
                    }
                    if supportsVideo(.rear)  { return .rear }
                    if supportsVideo(.front) { return .front };return nil
                }()
                guard let device = chooseDevice else {
                    onMainAsync {
                        "未检测到可用摄像头用于录制".toast
                        onFailure?(.unavailable)
                    };return
                }
                // 3) 顺序很重要：先 mediaTypes，后 cameraCaptureMode
                onMainAsync {
                    guard canPresent(from: presenter) else {
                        onFailure?(.presenterBusy)
                        return
                    }
                    let proxy = VideoCameraProxy { url in onVideoURL(url) }
                    proxy.onFailure = onFailure
                    let picker = UIImagePickerController.jobsMake { _ in }
                        .bySourceType(.camera)
                        .byCameraDevice(device)
                        .byVideoQuality(quality)
                        .byVideoMaximumDuration(maxDuration.isFinite && maxDuration > 0 ? min(maxDuration, 3_600) : 30)
                        .byDelegate(proxy)
                    if #available(iOS 14.0, *) {
                        picker.byMediaTypes([UTType.movie.identifier]) // ✅ 先设类型
                    } else {
                        picker.byMediaTypes(["public.movie"])
                    }
                    picker.byCameraCaptureMode(.video)
                    attachProxy(proxy, to: presenter)
                    presenter.present(picker, animated: true)
                }
            }
        }
    }
}
// ================================== 代理们 ==================================
// 相机拍照
private final class CameraProxy: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MediaSessionProxy {
    var isFinished = false
    weak var host: UIViewController?
    var onFailure: ((MediaPickerError) -> Void)?
    let allowsEditing: Bool
    let jobsByVoidBlock: (UIImage) -> Void

    init(allowsEditing: Bool, jobsByVoidBlock: @escaping (UIImage)->Void) {
        self.allowsEditing = allowsEditing
        self.jobsByVoidBlock = jobsByVoidBlock
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let key: UIImagePickerController.InfoKey = allowsEditing ? .editedImage : .originalImage
        guard finishProxy(self) else { return }
        if let img = info[key] as? UIImage {
            jobsByVoidBlock(img)
        } else {
            onFailure?(.decodingFailed)
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        guard finishProxy(self) else { return }
        picker.dismiss(animated: true)
        onFailure?(.cancelled)
    }
}
// iOS 14+ 相册多选
@available(iOS 14, *)
private final class PHPickerProxy: NSObject, PHPickerViewControllerDelegate, MediaSessionProxy {
    var isFinished = false
    weak var host: UIViewController?
    var onFailure: ((MediaPickerError) -> Void)?
    private var selectionReceived = false
    private var decodedImages: [UIImage] = []
    private var decodedBytes = 0
    private var progress: Progress?
    private var timeoutWork: DispatchWorkItem?
    private let timeout: TimeInterval
    let jobsByVoidBlock: ([UIImage]) -> Void

    init(timeout: TimeInterval, jobsByVoidBlock: @escaping ([UIImage]) -> Void) {
        self.timeout = timeout.isFinite && timeout > 0 ? min(timeout, 300) : 30
        self.jobsByVoidBlock = jobsByVoidBlock
    }

    deinit {
        progress?.cancel()
        timeoutWork?.cancel()
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        guard !selectionReceived, !isFinished else { return }
        selectionReceived = true
        picker.dismiss(animated: true)
        guard !results.isEmpty else {
            guard finishProxy(self) else { return }
            jobsByVoidBlock([])
            return
        }
        let work = DispatchWorkItem { [weak self] in self?.fail(.timedOut) }
        timeoutWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout, execute: work)
        loadNext(results, index: 0)
    }

    private func fail(_ error: MediaPickerError) {
        guard finishProxy(self) else { return }
        progress?.cancel()
        progress = nil
        timeoutWork?.cancel()
        timeoutWork = nil
        decodedImages.removeAll()
        onFailure?(error)
    }

    private func loadNext(_ results: [PHPickerResult], index: Int) {
        guard !isFinished else { return }
        guard index < results.count else {
            guard finishProxy(self) else { return }
            timeoutWork?.cancel()
            timeoutWork = nil
            progress = nil
            let images = decodedImages
            decodedImages.removeAll()
            jobsByVoidBlock(images)
            return
        }
        let provider = results[index].itemProvider
        guard provider.canLoadObject(ofClass: UIImage.self) else {
            fail(.decodingFailed)
            return
        }
        progress = provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            onMainAsync {
                guard let self, !self.isFinished else { return }
                guard let image = object as? UIImage, error == nil else {
                    self.fail(.decodingFailed)
                    return
                }
                let cost = image.cgImage.map { $0.bytesPerRow.multipliedReportingOverflow(by: $0.height) }
                guard let cost, !cost.overflow,
                      cost.partialValue <= 64 * 1024 * 1024 - self.decodedBytes else {
                    self.fail(.decodedMemoryBudgetExceeded)
                    return
                }
                self.decodedBytes += cost.partialValue
                self.decodedImages.append(image)
                self.loadNext(results, index: index + 1)
            }
        }
    }
}
// 老系统相册（单选）
private final class LegacyLibraryProxy: NSObject,
                                        UIImagePickerControllerDelegate,
                                        UINavigationControllerDelegate,
                                        MediaSessionProxy {
    var isFinished = false
    weak var host: UIViewController?
    var onFailure: ((MediaPickerError) -> Void)?
    let jobsByVoidBlock: (UIImage?) -> Void

    init(jobsByVoidBlock: @escaping (UIImage?) -> Void) {
        self.jobsByVoidBlock = jobsByVoidBlock
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard finishProxy(self) else { return }
        let img = info[.originalImage] as? UIImage
        if img == nil {
            onFailure?(.decodingFailed)
        }
        jobsByVoidBlock(img)
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        guard finishProxy(self) else { return }
        picker.dismiss(animated: true)
        onFailure?(.cancelled)
        jobsByVoidBlock(nil)
    }
}
// 录像
private final class VideoCameraProxy: NSObject,
                                      UIImagePickerControllerDelegate,
                                      UINavigationControllerDelegate,
                                      MediaSessionProxy {
    var isFinished = false
    weak var host: UIViewController?
    var onFailure: ((MediaPickerError) -> Void)?
    let jobsByVoidBlock: (URL) -> Void
    init(jobsByVoidBlock: @escaping (URL) -> Void) { self.jobsByVoidBlock = jobsByVoidBlock }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard finishProxy(self) else { return }
        if let url = info[.mediaURL] as? URL {
            jobsByVoidBlock(url)
        } else {
            onFailure?(.decodingFailed)
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        guard finishProxy(self) else { return }
        picker.dismiss(animated: true)
        onFailure?(.cancelled)
    }
}
// ================================== AO：把代理挂到 VC 防止释放 ==================================
@MainActor
private protocol MediaSessionProxy: AnyObject {
    var host: UIViewController? { get set }
    var isFinished: Bool { get set }
}

@MainActor
private func canPresent(from host: UIViewController) -> Bool {
    host.viewIfLoaded?.window != nil && host.presentedViewController == nil &&
        objc_getAssociatedObject(host, &mediaPickerProxy) == nil
}

@MainActor
@discardableResult
private func finishProxy(_ proxy: MediaSessionProxy) -> Bool {
    guard !proxy.isFinished else { return false }
    proxy.isFinished = true
    releaseProxy(proxy)
    return true
}

@MainActor
private func releaseProxy(_ proxy: MediaSessionProxy) {
    guard let host = proxy.host,
          objc_getAssociatedObject(host, &mediaPickerProxy) as AnyObject? === proxy else { return }
    objc_setAssociatedObject(host, &mediaPickerProxy, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    proxy.host = nil
}

private var mediaPickerProxy = UInt8(0)
@MainActor
private func attachProxy(_ proxy: AnyObject, to host: UIViewController) {
    (proxy as? MediaSessionProxy)?.host = host
    objc_setAssociatedObject(host,
                             &mediaPickerProxy,
                             proxy,
                             .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}
// ================================== VC 便利方法 ==================================
public extension NSObject {
    /// 一键：相机拍照
    @MainActor
    func pickFromCamera(allowsEditing: Bool = false,
                        onFailure: ((MediaPickerError) -> Void)? = nil,
                        onImage: @escaping (UIImage) -> Void) {
        guard let presenter = UIApplication.jobsTopMostVC() else {
            onFailure?(.noPresenter)
            return
        }
        MediaPickerService.pickFromCamera(from: presenter,
                                          allowsEditing: allowsEditing,
                                          onFailure: onFailure,
                                          onImage: onImage)
    }
    /// 一键：相册选图（默认最多 9 张；传 0 表示不限制）
    @MainActor
    func pickFromPhotoLibrary(maxSelection: Int = 9,
                              imagesOnly: Bool = true,
                              loadTimeout: TimeInterval = 30,
                              onFailure: ((MediaPickerError) -> Void)? = nil,
                              onImages: @escaping ([UIImage]) -> Void) {
        guard let presenter = UIApplication.jobsTopMostVC() else {
            onFailure?(.noPresenter)
            onImages([])
            return
        }
        MediaPickerService.pickFromPhotoLibrary(from: presenter,
                                                maxSelection: maxSelection,
                                                imagesOnly: imagesOnly,
                                                loadTimeout: loadTimeout,
                                                onFailure: onFailure,
                                                onImages: onImages)
    }
    /// 一键：录制视频
    @MainActor
    func recordVideo(maxDuration: TimeInterval = 30,
                     quality: UIImagePickerController.QualityType = .typeHigh,
                     onFailure: ((MediaPickerError) -> Void)? = nil,
                     onVideoURL: @escaping (URL) -> Void) {
        guard let presenter = UIApplication.jobsTopMostVC() else {
            onFailure?(.noPresenter)
            return
        }
        MediaPickerService.recordVideo(from: presenter,
                                       maxDuration: maxDuration,
                                       quality: quality,
                                       onFailure: onFailure,
                                       onVideoURL: onVideoURL)
    }
}
