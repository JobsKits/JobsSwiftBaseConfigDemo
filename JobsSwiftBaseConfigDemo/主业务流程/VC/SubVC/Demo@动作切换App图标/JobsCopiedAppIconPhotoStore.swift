//
//  JobsCopiedAppIconPhotoStore.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年7月22日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsByUIKit

@MainActor
final class JobsCopiedAppIconPhotoStore {
    enum StoreError: LocalizedError {
        case imageEncodingFailed

        var errorDescription: String? {
            switch self {
            /// 图片无法转成持久化数据
            case .imageEncodingFailed:
                return "无法生成照片副本，请换一张照片重试。".tr
            }
        }
    }

    static let shared = JobsCopiedAppIconPhotoStore()

    private static let selectedPhotoIDKey = "com.jobs.demo.motionAppIcon.selectedCopiedPhotoID"
    private static let directoryName = "JobsMotionAppIconCopiedPhotos"
    private static let indexFileName = "photos.json"
    private static let copiedPhotoPixelLength: CGFloat = 1024
    private let fileManager = FileManager.default
    private let directoryURL: URL
    private let indexURL: URL
    private var storedPhotos: [JobsCopiedAppIconPhoto]

    var photos: [JobsCopiedAppIconPhoto] {
        storedPhotos
    }

    var selectedPhoto: JobsCopiedAppIconPhoto? {
        guard let selectedPhotoID else { return nil };return storedPhotos.first {
            $0.id == selectedPhotoID
        }
    }

    var selectedPhotoID: UUID? {
        get {
            guard let value = UserDefaults.standard.string(forKey: Self.selectedPhotoIDKey) else {
                return nil
            };return UUID(uuidString: value)
        }
        set {
            UserDefaults.standard.set(newValue?.uuidString, forKey: Self.selectedPhotoIDKey)
        }
    }

    private init() {
        let applicationSupportURL = fileManager.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first ?? URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        directoryURL = applicationSupportURL.appendingPathComponent(Self.directoryName, isDirectory: true)
        indexURL = directoryURL.appendingPathComponent(Self.indexFileName)
        storedPhotos = []
        do {
            try ensureDirectoryExists()
            storedPhotos = try loadIndex().filter {
                fileManager.fileExists(atPath: fileURL(for: $0).path)
            }
        } catch {
            print("⚠️ JobsMotionAppIcon 照片副本索引读取失败：\(error.localizedDescription)")
        }
        if let selectedPhotoID,
           !storedPhotos.contains(where: { $0.id == selectedPhotoID }) {
            self.selectedPhotoID = storedPhotos.first?.id
        }
    }

    @discardableResult
    func copy(_ image: UIImage) throws -> JobsCopiedAppIconPhoto {
        guard let squareImage = image.squareCropped(
            maximumPixelLength: Self.copiedPhotoPixelLength
        ),
              let data = squareImage.jpegData(compressionQuality: 0.9) else {
            throw StoreError.imageEncodingFailed
        }
        try ensureDirectoryExists()
        let id = UUID()
        let fileName = "\(id.uuidString).jpg"
        let photo = JobsCopiedAppIconPhoto(
            id: id,
            fileName: fileName,
            createdAt: Date(),
            pixelWidth: squareImage.cgImage?.width ?? Int(squareImage.size.width * squareImage.scale),
            pixelHeight: squareImage.cgImage?.height ?? Int(squareImage.size.height * squareImage.scale)
        )
        let photoURL = fileURL(for: photo)
        try data.write(to: photoURL, options: .atomic)
        let updatedPhotos = [photo] + storedPhotos
        do {
            try writeIndex(updatedPhotos)
        } catch {
            try? fileManager.removeItem(at: photoURL)
            throw error
        }
        storedPhotos = updatedPhotos
        selectedPhotoID = photo.id
        return photo
    }

    func image(for photo: JobsCopiedAppIconPhoto) -> UIImage? {
        UIImage(contentsOfFile: fileURL(for: photo).path)
    }

    func select(_ photo: JobsCopiedAppIconPhoto) {
        guard storedPhotos.contains(photo) else { return }
        selectedPhotoID = photo.id
    }

    func delete(photoIDs: Set<UUID>) throws {
        guard !photoIDs.isEmpty else { return }
        let removedPhotos = storedPhotos.filter { photoIDs.contains($0.id) }
        let remainingPhotos = storedPhotos.filter { !photoIDs.contains($0.id) }
        try writeIndex(remainingPhotos)
        removedPhotos.forEach {
            try? fileManager.removeItem(at: fileURL(for: $0))
        }
        storedPhotos = remainingPhotos
        if let selectedPhotoID, photoIDs.contains(selectedPhotoID) {
            self.selectedPhotoID = remainingPhotos.first?.id
        }
    }

    func deleteAll() throws {
        try delete(photoIDs: Set(storedPhotos.map(\.id)))
    }
}

private extension JobsCopiedAppIconPhotoStore {
    func ensureDirectoryExists() throws {
        try fileManager.createDirectory(
            at: directoryURL,
            withIntermediateDirectories: true
        )
    }

    func fileURL(for photo: JobsCopiedAppIconPhoto) -> URL {
        directoryURL.appendingPathComponent(photo.fileName)
    }

    func loadIndex() throws -> [JobsCopiedAppIconPhoto] {
        guard fileManager.fileExists(atPath: indexURL.path) else { return [] };return try JSONDecoder().decode(
            [JobsCopiedAppIconPhoto].self,
            from: Data(contentsOf: indexURL)
        )
    }

    func writeIndex(_ photos: [JobsCopiedAppIconPhoto]) throws {
        try JSONEncoder().encode(photos).write(to: indexURL, options: .atomic)
    }
}
