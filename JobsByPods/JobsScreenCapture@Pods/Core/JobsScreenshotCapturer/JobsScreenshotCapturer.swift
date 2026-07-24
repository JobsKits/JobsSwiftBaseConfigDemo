//
//  JobsScreenshotCapturer.swift
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

import Photos

public final class JobsScreenshotCapturer {
    public enum CaptureError: LocalizedError {
        case mainThreadRequired
        case invalidBounds
        case renderFailed
        case photoLibraryUnauthorized
        case photoLibrarySaveFailed

        public var errorDescription: String? {
            switch self {
            /// 处理 .mainThreadRequired 分支
            case .mainThreadRequired:
                return "截屏必须在主线程执行。"
            /// 处理 .invalidBounds 分支
            case .invalidBounds:
                return "当前页面尚未完成布局，无法截屏。"
            /// 处理 .renderFailed 分支
            case .renderFailed:
                return "当前页面渲染失败，未生成截图。"
            /// 处理 .photoLibraryUnauthorized 分支
            case .photoLibraryUnauthorized:
                return "没有相册写入权限，无法保存截图。"
            /// 处理 .photoLibrarySaveFailed 分支
            case .photoLibrarySaveFailed:
                return "截图已生成，但保存到相册失败。"
            }
        }
    }

    public init() {}

    public func capture(
        _ view: UIView,
        afterScreenUpdates: Bool = true
    ) -> Result<UIImage, CaptureError> {
        guard Thread.isMainThread else { return .failure(.mainThreadRequired) }
        guard view.bounds.width > 0, view.bounds.height > 0 else {
            return .failure(.invalidBounds)
        }
        view.layoutIfNeeded()
        var didRender = false
        let image = UIGraphicsImageRenderer(bounds: view.bounds).image { _ in
            didRender = view.drawHierarchy(
                in: view.bounds,
                afterScreenUpdates: afterScreenUpdates
            )
        }
        guard didRender else { return .failure(.renderFailed) };return .success(image)
    }

    public func captureAndSave(
        _ view: UIView,
        afterScreenUpdates: Bool = true,
        completion: @escaping (Result<UIImage, Error>) -> Void
    ) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [self] in
                captureAndSave(
                    view,
                    afterScreenUpdates: afterScreenUpdates,
                    completion: completion
                )
            };return
        }
        switch capture(view, afterScreenUpdates: afterScreenUpdates) {
        /// 处理 .success 分支
        case let .success(image):
            saveToPhotoLibrary(image) { result in
                switch result {
                /// 处理 .success 分支
                case .success:
                    completion(.success(image))
                /// 处理 .failure 分支
                case let .failure(error):
                    completion(.failure(error))
                }
            }
        /// 处理 .failure 分支
        case let .failure(error):
            finish(completion, with: .failure(error))
        }
    }

    private func saveToPhotoLibrary(
        _ image: UIImage,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        requestPhotoLibraryAuthorization { [self] status in
            guard self.canAddToPhotoLibrary(status) else {
                self.finish(completion, with: .failure(CaptureError.photoLibraryUnauthorized))
                return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }) { saved, error in
                if saved {
                    self.finish(completion, with: .success(()))
                } else {
                    self.finish(
                        completion,
                        with: .failure(error ?? CaptureError.photoLibrarySaveFailed)
                    )
                }
            }
        }
    }

    private func requestPhotoLibraryAuthorization(
        _ completion: @escaping (PHAuthorizationStatus) -> Void
    ) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .addOnly, handler: completion)
        } else {
            PHPhotoLibrary.requestAuthorization(completion)
        }
    }

    private func canAddToPhotoLibrary(_ status: PHAuthorizationStatus) -> Bool {
        if #available(iOS 14.0, *) {
            return status == .authorized || status == .limited
        };return status == .authorized
    }

    private func finish<T>(
        _ completion: @escaping (Result<T, Error>) -> Void,
        with result: Result<T, Error>
    ) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
