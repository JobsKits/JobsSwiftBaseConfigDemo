//
//  JobsSplashMediaCache.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年6月24日，星期三.
//

import Foundation

final class JobsSplashMediaCache {
    static let shared = JobsSplashMediaCache()

    private let fileManager = FileManager.default
    private let directoryURL: URL

    private init() {
        let cachesURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        directoryURL = cachesURL.appendingPathComponent("JobsSwiftSplash", isDirectory: true)
        try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
    }

    func cachedFileURL(for remoteURL: URL) -> URL? {
        let fileURL = localFileURL(for: remoteURL)
        return fileManager.fileExists(atPath: fileURL.path) ? fileURL : nil
    }

    @discardableResult
    func download(
        _ remoteURL: URL,
        completion: @escaping (Result<URL, Error>) -> Void
    ) -> URLSessionDownloadTask? {
        if let cachedURL = cachedFileURL(for: remoteURL) {
            completion(.success(cachedURL))
            return nil
        }
        let task = URLSession.shared.downloadTask(with: remoteURL) { [weak self] temporaryURL, _, error in
            guard let self else { return }
            if let error {
                DispatchQueue.main.async { completion(.failure(error)) };return
            }
            guard let temporaryURL else {
                let error = NSError(
                    domain: "JobsSwiftSplash.Download",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Remote media download returned no file."]
                )
                DispatchQueue.main.async { completion(.failure(error)) };return
            }
            let destinationURL = self.localFileURL(for: remoteURL)
            do {
                if self.fileManager.fileExists(atPath: destinationURL.path) {
                    try self.fileManager.removeItem(at: destinationURL)
                }
                try self.fileManager.moveItem(at: temporaryURL, to: destinationURL)
                DispatchQueue.main.async { completion(.success(destinationURL)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }
        task.resume()
        return task
    }

    private func localFileURL(for remoteURL: URL) -> URL {
        let fileExtension = remoteURL.pathExtension.isEmpty ? "data" : remoteURL.pathExtension
        return directoryURL
            .appendingPathComponent(stableHash(remoteURL.absoluteString))
            .appendingPathExtension(fileExtension)
    }

    private func stableHash(_ value: String) -> String {
        var hash: UInt64 = 14_695_981_039_346_656_037
        for byte in value.utf8 {
            hash ^= UInt64(byte)
            hash &*= 1_099_511_628_211
        };return String(hash, radix: 16)
    }
}
