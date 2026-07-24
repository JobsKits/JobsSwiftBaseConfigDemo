//
//  PhotoFilterPhotoLibrarySaver.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Photos

enum PhotoFilterPhotoLibrarySaveError: LocalizedError {
    case unauthorized
    case failed

    var errorDescription: String? {
        switch self {
        /// 处理 .unauthorized 分支
        case .unauthorized: return "没有相册写入权限，无法保存滤镜照片。"
        /// 处理 .failed 分支
        case .failed: return "滤镜照片生成成功，但保存到相册失败。"
        }
    }
}

enum PhotoFilterPhotoLibrarySaver {
    static func save(
        _ image: UIImage,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        requestAuthorization { status in
            guard canAddToPhotoLibrary(status) else {
                finish(completion, with: .failure(PhotoFilterPhotoLibrarySaveError.unauthorized))
                return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }) { saved, error in
                if saved {
                    finish(completion, with: .success(()))
                } else {
                    finish(
                        completion,
                        with: .failure(error ?? PhotoFilterPhotoLibrarySaveError.failed)
                    )
                }
            }
        }
    }

    private static func requestAuthorization(
        _ completion: @escaping (PHAuthorizationStatus) -> Void
    ) {
        if #available(iOS 14.0, *) {
            PHPhotoLibrary.requestAuthorization(for: .addOnly, handler: completion)
        } else {
            PHPhotoLibrary.requestAuthorization(completion)
        }
    }

    private static func canAddToPhotoLibrary(_ status: PHAuthorizationStatus) -> Bool {
        if #available(iOS 14.0, *) {
            return status == .authorized || status == .limited
        };return status == .authorized
    }

    private static func finish<T>(
        _ completion: @escaping (Result<T, Error>) -> Void,
        with result: Result<T, Error>
    ) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
