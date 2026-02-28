//
//  UIImagePickerController.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026/1/28.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import ObjectiveC
// MARK: - DSL
extension UIImagePickerController {
    // delegate
    @discardableResult
    public func byDelegate(_ delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)?) -> Self {
        self.delegate = delegate
        return self
    }
    // sourceType
    @discardableResult
    public func bySourceType(_ sourceType: UIImagePickerController.SourceType) -> Self {
        self.sourceType = sourceType
        return self
    }
    // mediaTypes
    @discardableResult
    public func byMediaTypes(_ mediaTypes: [String]) -> Self {
        self.mediaTypes = mediaTypes
        return self
    }
    // allowsEditing
    @discardableResult
    public func byAllowsEditing(_ allowsEditing: Bool) -> Self {
        self.allowsEditing = allowsEditing
        return self
    }
    // imageExportPreset (iOS 11+, deprecated in SDK snippet)
    @available(iOS 11.0, *)
    @discardableResult
    public func byImageExportPreset(_ preset: UIImagePickerController.ImageURLExportPreset) -> Self {
        self.imageExportPreset = preset
        return self
    }
    // videoMaximumDuration
    @available(iOS 3.1, *)
    @discardableResult
    public func byVideoMaximumDuration(_ duration: TimeInterval) -> Self {
        self.videoMaximumDuration = duration
        return self
    }
    // videoQuality
    @available(iOS 3.1, *)
    @discardableResult
    public func byVideoQuality(_ quality: UIImagePickerController.QualityType) -> Self {
        self.videoQuality = quality
        return self
    }
    // videoExportPreset (iOS 11+, deprecated in SDK snippet)
    @available(iOS 11.0, *)
    @discardableResult
    public func byVideoExportPreset(_ preset: String) -> Self {
        self.videoExportPreset = preset
        return self
    }
    // showsCameraControls
    @available(iOS 3.1, *)
    @discardableResult
    public func byShowsCameraControls(_ shows: Bool) -> Self {
        self.showsCameraControls = shows
        return self
    }
    // cameraOverlayView
    @available(iOS 3.1, *)
    @discardableResult
    public func byCameraOverlayView(_ overlayView: UIView?) -> Self {
        self.cameraOverlayView = overlayView
        return self
    }
    // cameraViewTransform
    @available(iOS 3.1, *)
    @discardableResult
    public func byCameraViewTransform(_ transform: CGAffineTransform) -> Self {
        self.cameraViewTransform = transform
        return self
    }
    // cameraCaptureMode
    @available(iOS 4.0, *)
    @discardableResult
    public func byCameraCaptureMode(_ mode: UIImagePickerController.CameraCaptureMode) -> Self {
        self.cameraCaptureMode = mode
        return self
    }
    // cameraDevice
    @available(iOS 4.0, *)
    @discardableResult
    public func byCameraDevice(_ device: UIImagePickerController.CameraDevice) -> Self {
        self.cameraDevice = device
        return self
    }
    // cameraFlashMode
    @available(iOS 4.0, *)
    @discardableResult
    public func byCameraFlashMode(_ mode: UIImagePickerController.CameraFlashMode) -> Self {
        self.cameraFlashMode = mode
        return self
    }
    // 兜底：复杂配置用它（不算属性，但很实用，不会破坏“只覆盖属性”的目标）
    @discardableResult
    public func byConfig(_ block: (UIImagePickerController) -> Void) -> Self {
        block(self)
        return self
    }
}

extension UIImagePickerController {
    /// 只负责 UIImagePickerControllerDelegate 回调（nav 的闭包能力在 UINavigationController+Blocks.swift 里）
    /// 但 proxy 必须同时 conform UIImagePickerControllerDelegate & UINavigationControllerDelegate
    /// 因为 UIImagePickerController.delegate 的类型就是这两个协议的组合
    @discardableResult
    public func byTarget(_ target: AnyObject) -> Self {
        let p = jobs_imagePickerBlocksProxy()!
        p.target = target
        delegate = p
        return self
    }

    @discardableResult
    public func didFinishPickingMediaWithInfo(_ block: @escaping (AnyObject,
                                                                  UIImagePickerController,
                                                                  [UIImagePickerController.InfoKey: Any]) -> Void) -> Self {
        jobs_imagePickerBlocksProxy()?.didFinishPickingMediaWithInfo = block
        return self
    }

    @discardableResult
    public func didCancel(_ block: @escaping (AnyObject, UIImagePickerController) -> Void) -> Self {
        jobs_imagePickerBlocksProxy()?.didCancel = block
        return self
    }
}
// MARK: - Proxy
private final class JobsImagePickerBlocksProxy: NSObject,
                                                UIImagePickerControllerDelegate,
                                                UINavigationControllerDelegate {
    weak var target: AnyObject?
    var didFinishPickingMediaWithInfo: ((AnyObject,
                                         UIImagePickerController,
                                         [UIImagePickerController.InfoKey: Any]) -> Void)?
    
    var didCancel: ((AnyObject, UIImagePickerController) -> Void)?
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let t = target else { return }
        didFinishPickingMediaWithInfo?(t, picker, info)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        guard let t = target else { return }
        didCancel?(t, picker)
    }
    // 不在这里提供 UINavigationControllerDelegate 的闭包 API
    // 如需 willShow/didShow/转场动画，请对 picker 自己（它是 UINavigationController 子类）调用：
    // picker.byNavTarget(self) ... （见 UINavigationController+Blocks.swift）
}
// MARK: - Associated
private enum JobsImagePickerBlocksAssociatedKeys {
    static var proxyKey: UInt8 = 0
}

extension UIImagePickerController {

    private func jobs_imagePickerBlocksProxy(createIfNeeded: Bool = true) -> JobsImagePickerBlocksProxy? {
        if let p = objc_getAssociatedObject(self, &JobsImagePickerBlocksAssociatedKeys.proxyKey) as? JobsImagePickerBlocksProxy {
            return p
        }
        guard createIfNeeded else { return nil }
        let p = JobsImagePickerBlocksProxy()
        objc_setAssociatedObject(
            self,
            &JobsImagePickerBlocksAssociatedKeys.proxyKey,
            p,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        );return p
    }
}
