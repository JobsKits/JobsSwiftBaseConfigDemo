//
//  MosaicPhotoAlbumSaver.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import Photos

enum MosaicPhotoAlbumSaveError: LocalizedError {
    case unauthorized
    case failed

    var errorDescription: String? {
        switch self {
        case .unauthorized: return "没有相册写入权限"
        case .failed: return "未知原因保存失败"
        }
    }
}

enum MosaicPhotoAlbumSaver {
    static func save(_ image: UIImage,
                     completion: @escaping (Result<Void, Error>) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized || status == .limited else {
                DispatchQueue.main.async {
                    completion(.failure(MosaicPhotoAlbumSaveError.unauthorized))
                };return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }, completionHandler: { saved, error in
                DispatchQueue.main.async {
                    if saved {
                        completion(.success(()))
                    } else {
                        completion(.failure(error ?? MosaicPhotoAlbumSaveError.failed))
                    }
                }
            })
        }
    }
}
