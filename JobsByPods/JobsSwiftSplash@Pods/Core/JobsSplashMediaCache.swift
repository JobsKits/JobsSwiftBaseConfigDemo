//
//  JobsSplashMediaCache.swift
//  JobsSwiftSplash
//
//  Created by Jobs on 2026年6月24日，星期三.
//

import Foundation
import ImageIO
import AVFoundation

public final class JobsSplashMediaCache {

    public static let shared = JobsSplashMediaCache()

    private let fileManager = FileManager.default
    private let fileLock = NSRecursiveLock()
    private var diskBudget = 512 * 1024 * 1024
    private var maximumRetryDelay: TimeInterval = 300
    private var preloadFailureObserver: ((URL, Error, TimeInterval) -> Void)?
    private let directoryURL: URL
    private let pendingVideoURLsKey = "JobsSwiftSplash.pendingVideoURLs"
    private let stateQueue = DispatchQueue(label: "com.jobs.splash.video-preload")
    private var videoTasks: [URL: URLSessionDownloadTask] = [:]
    private var checkingVideoURLs: Set<URL> = []
    private var videoCompletions: [URL: [(URL) -> Void]] = [:]
    private var videoRetryAttempts: [URL: Int] = [:]
    private var scheduledVideoRetries: Set<URL> = []
    private lazy var wiFiVideoSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        configuration.waitsForConnectivity = true
        configuration.networkServiceType = .background
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 7 * 24 * 60 * 60
        return URLSession(configuration: configuration)
    }()

    private init() {
        let cachesURL = fileManager.urls(for: .cachesDirectory,
                                         in: .userDomainMask) [0]
        directoryURL = cachesURL.appendingPathComponent("JobsSwiftSplash",
                                                        isDirectory: true)
        try? fileManager.createDirectory(at: directoryURL,
                                         withIntermediateDirectories: true)
        let pendingURLs = UserDefaults.standard
            .stringArray(forKey: pendingVideoURLsKey)?
            .compactMap(URL.init(string:)) ?? []
        stateQueue.async { [weak self] in
            guard let self else {
                return
            }
            pendingURLs.forEach {
                self.checkOrStartVideoPreload($0)
            }
        }
    }

    func cachedFileURL(for remoteURL: URL) -> URL? {
        fileLock.lock()
        defer {
            fileLock.unlock()
        }
        let fileURL = localFileURL(for: remoteURL)
        guard fileManager.fileExists(atPath: fileURL.path),
              let values = try? fileURL.resourceValues(forKeys: [.fileSizeKey]),
              (values.fileSize ?? 0) > 0 else {
            try? fileManager.removeItem(at: fileURL)
            return nil
        }
        return fileURL
    }

    /// 下载待办独立于页面，Wi-Fi恢复和后续启动都可继续；不清除失败待办。
    public func resumePendingVideoPreloads() {
        stateQueue.async { [weak self] in
            guard let self else {
                return
            }
            let urls = UserDefaults.standard.stringArray(forKey: self.pendingVideoURLsKey) ?? []
            for value in urls {
                guard let url = URL(string: value), self.videoTasks[url] == nil,
                      !self.scheduledVideoRetries.contains(url) else {
                    continue
                }
                self.checkOrStartVideoPreload(url)
            }
        }
    }

    public func configureCache(maxDiskBytes: Int = 512 * 1024 * 1024,
                               maximumRetryDelay: TimeInterval = 300,
                               onPreloadFailure: ((URL, Error, TimeInterval) -> Void)? = nil) {
        fileLock.lock()
        diskBudget = max(0,
                         maxDiskBytes)
        fileLock.unlock()
        stateQueue.async { [weak self] in
            self?.maximumRetryDelay = maximumRetryDelay.isFinite ? max(5,
                                                                       maximumRetryDelay) : 300
            self?.preloadFailureObserver = onPreloadFailure
        }
    }

    func invalidateCachedFile(for remoteURL: URL) {
        fileLock.lock()
        defer {
            fileLock.unlock()
        }
        try? fileManager.removeItem(at: localFileURL(for: remoteURL))
    }

    private struct VideoFileVersion: Equatable {

        let identifier: NSObject?
        let size: Int?
        let modificationDate: Date?
    }

    private func videoFileVersion(at url: URL) -> VideoFileVersion? {
        guard let values = try? url.resourceValues(forKeys: [.fileResourceIdentifierKey,
                                                            .fileSizeKey,
                                                            .contentModificationDateKey]) else {
            return nil
        }
        return VideoFileVersion(identifier: values.fileResourceIdentifier as? NSObject,
                                size: values.fileSize,
                                modificationDate: values.contentModificationDate)
    }

    func cachedVideoFileURL(for remoteURL: URL,
                            completion: @escaping (URL?) -> Void) {
        fileLock.lock()
        guard let url = cachedFileURL(for: remoteURL),
              let version = videoFileVersion(at: url) else {
            fileLock.unlock()
            completion(nil)
            return
        }
        fileLock.unlock()
        validateVideo(at: url) { [weak self] playable in
            guard let self else {
                completion(nil)
                return
            }
            self.fileLock.lock()
            // 异步检查期间缓存可能被替换；不能删除或返回另一个版本的文件。
            let unchanged = self.videoFileVersion(at: url) == version
            if unchanged && !playable {
                try? self.fileManager.removeItem(at: url)
            }
            self.fileLock.unlock()
            completion(unchanged && playable ? url : nil)
        }
    }

    private func validateVideo(at url: URL,
                               completion: @escaping (Bool) -> Void) {
        if #available(iOS 16.0, *) {
            Task {
                let playable = (try? await AVURLAsset(url: url).load(.isPlayable)) == true
                completion(playable)
            }
        } else {
            completion(legacyVideoIsPlayable(at: url))
        }
    }

    @available(iOS, introduced: 4.0, deprecated: 16.0)
    private func legacyVideoIsPlayable(at url: URL) -> Bool {
        return AVURLAsset(url: url).isPlayable
    }

    private func isDecodableImage(_ url: URL) -> Bool {
        guard let source = CGImageSourceCreateWithURL(url as CFURL,
                                                      nil),
              CGImageSourceGetCount(source) > 0,
              CGImageSourceGetStatus(source) == .statusComplete else {
            return false
        }
        return true
    }

    @discardableResult
    func download(_ remoteURL: URL,
                  completion: @escaping (Result<URL, Error>) -> Void) -> URLSessionDownloadTask? {
        if let cachedURL = cachedFileURL(for: remoteURL) {
            if isDecodableImage(cachedURL) {
                DispatchQueue.main.async {
                    completion(.success(cachedURL))
                }
                return nil
            }
            invalidateCachedFile(for: remoteURL)
        }
        let request = URLRequest(url: remoteURL,
                                 cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: 15)
        let task = URLSession.shared.downloadTask(with: request) { [weak self] temporaryURL, response, error in
            guard let self else {
                return
            }
            if let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            guard let temporaryURL else {
                let error = NSError(domain: "JobsSwiftSplash.Download",
                                    code: -1,
                                    userInfo: [NSLocalizedDescriptionKey: "Remote media download returned no file."])
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            if let response = response as? HTTPURLResponse, !(200 ... 299).contains(response.statusCode) {
                DispatchQueue.main.async {
                    completion(.failure(self.downloadError(code: response.statusCode,
                                                           description: "Remote image HTTP status rejected.")))
                }
                return
            }
            guard self.isDecodableImage(temporaryURL) else {
                DispatchQueue.main.async {
                    completion(.failure(self.downloadError(code: -3,
                                                           description: "Remote image is not decodable.")))
                }
                return
            }
            let result = self.persistDownloadedFile(temporaryURL,
                                                    for: remoteURL)
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
        return task
    }

    func preloadVideo(_ remoteURL: URL,
                      completion: ((URL) -> Void)? = nil) {
        stateQueue.async { [weak self] in
            guard let self else {
                return
            }
            self.addPendingVideoURL(remoteURL)
            if let completion {
                self.videoCompletions[remoteURL,
                                      default: []].append(completion)
            }
            self.checkOrStartVideoPreload(remoteURL)
        }
    }

    private func checkOrStartVideoPreload(_ remoteURL: URL) {
        guard videoTasks[remoteURL] == nil,
              !scheduledVideoRetries.contains(remoteURL),
              checkingVideoURLs.insert(remoteURL).inserted else {
            return
        }
        cachedVideoFileURL(for: remoteURL) { [weak self] cachedURL in
            guard let self else {
                return
            }
            self.stateQueue.async {
                self.checkingVideoURLs.remove(remoteURL)
                if let cachedURL {
                    self.handleVideoDownloadResult(.success(cachedURL),
                                                    for: remoteURL)
                } else {
                    self.startVideoDownload(remoteURL)
                }
            }
        }
    }

    private func startVideoDownload(_ remoteURL: URL) {
        guard videoTasks[remoteURL] == nil else {
            return
        }
        let task = wiFiVideoSession.downloadTask(with: remoteURL) { [weak self] temporaryURL, response, error in
            guard let self else {
                return
            }
            let stagedResult: Result<URL, Error>
            if let error {
                stagedResult = .failure(error)
            } else if let response = response as? HTTPURLResponse,
                      !(200 ... 299).contains(response.statusCode) {
                stagedResult = .failure(self.downloadError(code: response.statusCode,
                                                           description: "Remote video returned HTTP \(response.statusCode)."))
            } else if let temporaryURL {
                // URLSession 回调结束即回收下载临时文件，必须先取得独立副本再异步校验。
                stagedResult = self.retainDownloadedVideo(temporaryURL,
                                                          for: remoteURL)
            } else {
                stagedResult = .failure(self.downloadError(code: -1,
                                                           description: "Remote video download returned no file."))
            }
            switch stagedResult {
            case let .success(stagedURL):
                self.validateVideo(at: stagedURL) { [weak self] playable in
                    defer {
                        try? FileManager.default.removeItem(at: stagedURL)
                    }
                    guard let self else {
                        return
                    }
                    let result: Result<URL, Error> = playable
                        ? self.persistDownloadedFile(stagedURL, for: remoteURL)
                        : .failure(self.downloadError(code: -1,
                                                      description: "Remote video is not playable."))
                    self.stateQueue.async {
                        self.handleVideoDownloadResult(result,
                                                       for: remoteURL)
                    }
                }
            case let .failure(error):
                self.stateQueue.async {
                    self.handleVideoDownloadResult(.failure(error),
                                                   for: remoteURL)
                }
            }
        }
        videoTasks[remoteURL] = task
        task.resume()
    }

    private func retainDownloadedVideo(_ temporaryURL: URL,
                                       for remoteURL: URL) -> Result<URL, Error> {
        do {
            let values = try temporaryURL.resourceValues(forKeys: [.fileSizeKey])
            fileLock.lock()
            let budget = diskBudget
            fileLock.unlock()
            guard let size = values.fileSize, size > 0, size <= budget else {
                return .failure(downloadError(code: -2,
                                              description: "Remote video is empty or exceeds the disk budget."))
            }
            let fileExtension = remoteURL.pathExtension.isEmpty ? "data" : remoteURL.pathExtension
            let retainedURL = fileManager.temporaryDirectory
                .appendingPathComponent("JobsSplashVideo-\(UUID().uuidString)")
                .appendingPathExtension(fileExtension)
            try fileManager.copyItem(at: temporaryURL,
                                     to: retainedURL)
            return .success(retainedURL)
        } catch {
            return .failure(error)
        }
    }

    private func persistDownloadedFile(_ temporaryURL: URL,
                                       for remoteURL: URL) -> Result<URL, Error> {
        fileLock.lock()
        defer {
            fileLock.unlock()
        }
        do {
            let values = try temporaryURL.resourceValues(forKeys: [.fileSizeKey])
            guard (values.fileSize ?? 0) > 0 else {
                return .failure(downloadError(code: -2,
                                              description: "Remote media returned an empty file."))
            }
            guard (values.fileSize ?? 0) <= diskBudget else {
                return .failure(downloadError(code: -4,
                                              description: "Remote media exceeds the configured disk budget."))
            }
            let destinationURL = localFileURL(for: remoteURL)
            let stagingURL = directoryURL.appendingPathComponent(UUID().uuidString).appendingPathExtension("tmp")
            defer {
                try? fileManager.removeItem(at: stagingURL)
            }
            try fileManager.copyItem(at: temporaryURL,
                                     to: stagingURL)
            if fileManager.fileExists(atPath: destinationURL.path) {
                _ = try fileManager.replaceItemAt(destinationURL,
                                                  withItemAt: stagingURL)
            } else {
                try fileManager.moveItem(at: stagingURL,
                                         to: destinationURL)
            }
            trimCache(preserving: destinationURL)
            return .success(destinationURL)
        } catch {
            return .failure(error)
        }
    }

    private func trimCache(preserving current: URL) {
        guard let files = try? fileManager.contentsOfDirectory(at: directoryURL,
                                                               includingPropertiesForKeys: [.fileSizeKey, .contentModificationDateKey]) else {
            return
        }
        let entries = files.filter {
            $0.pathExtension != "tmp"
        }
            .compactMap { url -> (URL, Int, Date)? in
                guard let values = try? url.resourceValues(forKeys: [.fileSizeKey, .contentModificationDateKey]) else {
                    return nil
                }
                return (url, values.fileSize ?? 0, values.contentModificationDate ?? .distantPast)
            }
        var total = entries.reduce(Int64(0)) {
            $0 + Int64($1.1)
        }
        for (url, size, _) in entries.sorted(by: {
            $0.2 < $1.2
        }) where url != current {
            guard total > Int64(diskBudget) else {
                break
            }
            if (try? fileManager.removeItem(at: url)) != nil {
                total -= Int64(size)
            }
        }
    }

    private func handleVideoDownloadResult(_ result: Result<URL, Error>,
                                           for remoteURL: URL) {
        videoTasks[remoteURL] = nil
        switch result {
        /// 缓存成功后清理待办，并通知仍然存活的开屏界面
        case let .success(localURL):
            videoRetryAttempts[remoteURL] = nil
            scheduledVideoRetries.remove(remoteURL)
            removePendingVideoURL(remoteURL)
            let completions = videoCompletions.removeValue(forKey: remoteURL) ?? []
            DispatchQueue.main.async {
                completions.forEach {
                    $0(localURL)
                }
            }
        /// 下载失败后保留待办，使用退避间隔继续等待 Wi-Fi 重试
        case .failure(let error):
            let attempt = min(64,
                              videoRetryAttempts[remoteURL] ?? 0) + 1
            videoRetryAttempts[remoteURL] = attempt
            scheduledVideoRetries.insert(remoteURL)
            let delay = retryDelay(for: attempt)
            if let observer = preloadFailureObserver {
                DispatchQueue.main.async {
                    observer(remoteURL,
                             error,
                             delay)
                }
            }
            stateQueue.asyncAfter(deadline: .now() + delay) { [weak self] in
                guard let self else {
                    return
                }
                self.scheduledVideoRetries.remove(remoteURL)
                self.checkOrStartVideoPreload(remoteURL)
            }
        }
    }

    private func retryDelay(for attempt: Int) -> TimeInterval {
        let exponent = min(max(0,
                               attempt - 1),
                           6)
        return min(maximumRetryDelay,
                   5 * TimeInterval(1 << exponent))
    }

    private func addPendingVideoURL(_ remoteURL: URL) {
        var pendingURLs = Set(
            UserDefaults.standard.stringArray(forKey: pendingVideoURLsKey) ?? []
        )
        pendingURLs.insert(remoteURL.absoluteString)
        UserDefaults.standard.set(pendingURLs.sorted(),
                                  forKey: pendingVideoURLsKey)
    }

    private func removePendingVideoURL(_ remoteURL: URL) {
        var pendingURLs = Set(
            UserDefaults.standard.stringArray(forKey: pendingVideoURLsKey) ?? []
        )
        pendingURLs.remove(remoteURL.absoluteString)
        UserDefaults.standard.set(pendingURLs.sorted(),
                                  forKey: pendingVideoURLsKey)
    }

    private func downloadError(code: Int,
                               description: String) -> NSError {
        NSError(domain: "JobsSwiftSplash.VideoPreload",
                code: code,
                userInfo: [NSLocalizedDescriptionKey: description])
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
        }
        return String(hash,
                      radix: 16)
    }
}
