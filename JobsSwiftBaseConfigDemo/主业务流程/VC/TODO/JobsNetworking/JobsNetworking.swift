//
//  JobsNetworking.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 29/1/26.
//

import Foundation
import Alamofire

// MARK: - Public Types
public enum JobsHTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS, TRACE, CONNECT

    var alamofire: Alamofire.HTTPMethod {
        switch self {
        case .GET: return .get
        case .POST: return .post
        case .PUT: return .put
        case .PATCH: return .patch
        case .DELETE: return .delete
        case .HEAD: return .head
        case .OPTIONS: return .options
        case .TRACE: return .trace
        case .CONNECT: return .connect
        }
    }
}

public struct JobsNetworkingCallback {
    public let id: String?
    public let fullURL: String
    public let headers: [String: String]
    public let method: JobsHTTPMethod
    public let body: Any?
    public let data: Data?
    public let requestTime: String
    public let receivedTime: String

    public init(id: String?,
                fullURL: String,
                headers: [String: String],
                method: JobsHTTPMethod,
                body: Any?,
                data: Data?,
                requestTime: String,
                receivedTime: String) {
        self.id = id
        self.fullURL = fullURL
        self.headers = headers
        self.method = method
        self.body = body
        self.data = data
        self.requestTime = requestTime
        self.receivedTime = receivedTime
    }
}

public final class JobsNetworking {

    public var onCallback: ((JobsNetworkingCallback) -> Void)?

    public init() {}

    public func request(_ url: String) -> Builder {
        Builder(owner: self).byURL(url)
    }

    static func formatMS(_ date: Date) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone.current
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return df.string(from: date)
    }

    // MARK: - Builder
    public final class Builder {

        private weak var owner: JobsNetworking?

        private var id: String?
        private var url: String = ""
        private var method: JobsHTTPMethod = .POST
        private var headers: [String: String] = [:]
        private var params: [String: Any]?
        private var rawBody: Data?
        private var timeout: TimeInterval = 30
        private var allowConcurrentThread: Bool = true

        private var uploadItem: UploadItem?
        private var downloadItem: DownloadItem?

        // MARK: - ✅ Resumable Download Task
        private var task: JobsNetworkingTask?

        // MARK: - Progress
        private var progressHandler: ((Double) -> Void)?

        @discardableResult public func onProgress(_ handler: ((Double) -> Void)?) -> Builder {
            self.progressHandler = handler
            return self
        }

        private func emitProgress(_ fraction: Double) {
            guard let progressHandler else { return }
            let v = max(0, min(fraction, 1))
            DispatchQueue.main.async {
                progressHandler(v)
            }
        }

        // MARK: - ✅ 每个请求自己的“结束回调”（用于并发汇总，保证只触发一次）
        private var finishedHandler: (() -> Void)?

        @discardableResult public func onFinished(_ handler: (() -> Void)?) -> Builder {
            self.finishedHandler = handler
            return self
        }

        private func emitFinishedOnce() {
            // 保证只触发一次
            guard let h = finishedHandler else { return }
            finishedHandler = nil
            DispatchQueue.main.async { h() }
        }

        // MARK: - ✅ Builder 保活
        private var selfRetain: Builder?

        private func retainSelf() { selfRetain = self }
        private func releaseSelf() { selfRetain = nil }

        // Threading
        private var workQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)

        // Alamofire
        private var session: Session = {
            let cfg = URLSessionConfiguration.default
            cfg.waitsForConnectivity = true
            return Session(configuration: cfg)
        }()

        init(owner: JobsNetworking) { self.owner = owner }

        // MARK: - Chain APIs

        @discardableResult public func byID(_ id: String?) -> Builder {
            self.id = id
            return self
        }

        @discardableResult public func byURL(_ url: String) -> Builder {
            self.url = url
            return self
        }

        @discardableResult public func byMethod(_ method: JobsHTTPMethod) -> Builder {
            self.method = method
            return self
        }

        @discardableResult public func byHeaders(_ headers: [String: String]) -> Builder {
            headers.forEach { self.headers[$0.key] = $0.value }
            return self
        }

        @discardableResult public func byHeader(_ key: String, _ value: String) -> Builder {
            self.headers[key] = value
            return self
        }

        @discardableResult public func byParams(_ params: [String: Any]?) -> Builder {
            self.params = params
            return self
        }

        @discardableResult public func byRawBody(_ data: Data?) -> Builder {
            self.rawBody = data
            return self
        }

        @discardableResult public func byTimeout(_ seconds: TimeInterval) -> Builder {
            self.timeout = seconds
            return self
        }

        @discardableResult public func byThreadEnabled(_ enabled: Bool) -> Builder {
            self.allowConcurrentThread = enabled
            return self
        }

        @discardableResult public func byWorkQueue(_ queue: DispatchQueue) -> Builder {
            self.workQueue = queue
            return self
        }

        // MARK: - Upload

        public struct UploadItem {
            public enum Payload {
                case data(Data, fileName: String, mimeType: String)
                case fileURL(URL, fileName: String, mimeType: String)
            }
            public let formName: String
            public let payload: Payload
            public let extraForm: [String: String]?
        }

        @discardableResult public func byUpload(formName: String,
                                               payload: UploadItem.Payload,
                                               extraForm: [String: String]? = nil) -> Builder {
            self.uploadItem = UploadItem(formName: formName, payload: payload, extraForm: extraForm)
            return self
        }

        // MARK: - Download

        public struct DownloadItem {
            public let directory: URL
            public let fileName: String
            public init(directory: URL, fileName: String) {
                self.directory = directory
                self.fileName = fileName
            }
        }

        @discardableResult public func byDownload(to directory: URL, fileName: String) -> Builder {
            self.downloadItem = DownloadItem(directory: directory, fileName: fileName)
            return self
        }

        // MARK: - Start (Resumable Download)
        /// ✅ 新增：启动并返回可控任务句柄（用于下载断点续传）
        @discardableResult
        public func startDownloadTask() -> JobsNetworkingTask? {
            // 只对 download 生效；否则退化为普通 start()
            guard downloadItem != nil else {
                start()
                return nil
            }

            retainSelf()

            let requestTime = JobsNetworking.formatMS(Date())
            let fullURL = url
            let outHeaders = headers

            let bodyForCallback: Any? = {
                if let rawBody { return rawBody }
                if let params { return params }
                return nil
            }()

            let execBlock = { [self] in
                let cfg = URLSessionConfiguration.default
                cfg.timeoutIntervalForRequest = self.timeout
                cfg.timeoutIntervalForResource = self.timeout
                cfg.waitsForConnectivity = true
                self.session = Session(configuration: cfg)

                let afHeaders = HTTPHeaders(outHeaders.map { HTTPHeader(name: $0.key, value: $0.value) })

                self.performDownloadTask(fullURL: fullURL,
                                         method: self.method,
                                         headers: afHeaders,
                                         downloadItem: self.downloadItem!,
                                         requestTime: requestTime,
                                         bodyForCallback: bodyForCallback)
            }

            if allowConcurrentThread {
                workQueue.async(execute: execBlock)
            } else {
                execBlock()
            }

            let t = JobsNetworkingTask()
            self.task = t
            return t
        }

        // MARK: - Start
        public func start() {
            // ✅ 关键：保活 builder，避免异步 start 后立刻释放
            retainSelf()

            let requestTime = JobsNetworking.formatMS(Date())
            let fullURL = url
            let outHeaders = headers

            let bodyForCallback: Any? = {
                if let rawBody { return rawBody }
                if let params { return params }
                return nil
            }()

            let execBlock = { [self] in
                let cfg = URLSessionConfiguration.default
                cfg.timeoutIntervalForRequest = self.timeout
                cfg.timeoutIntervalForResource = self.timeout
                cfg.waitsForConnectivity = true
                self.session = Session(configuration: cfg)

                let afHeaders = HTTPHeaders(outHeaders.map { HTTPHeader(name: $0.key, value: $0.value) })

                if let uploadItem = self.uploadItem {
                    self.performUpload(fullURL: fullURL,
                                       method: self.method,
                                       headers: afHeaders,
                                       uploadItem: uploadItem,
                                       requestTime: requestTime,
                                       bodyForCallback: bodyForCallback)
                    return
                }

                if let downloadItem = self.downloadItem {
                    self.performDownload(fullURL: fullURL,
                                         method: self.method,
                                         headers: afHeaders,
                                         downloadItem: downloadItem,
                                         requestTime: requestTime,
                                         bodyForCallback: bodyForCallback)
                    return
                }

                self.performRequest(fullURL: fullURL,
                                    method: self.method,
                                    headers: afHeaders,
                                    requestTime: requestTime,
                                    bodyForCallback: bodyForCallback)
            }

            if allowConcurrentThread {
                workQueue.async(execute: execBlock)
            } else {
                execBlock()
            }
        }

        private func finishAndRelease() {
            // ✅ 顺序：先回调 finished（用于 group.leave），再释放 self
            emitFinishedOnce()
            releaseSelf()
        }

        private func performRequest(fullURL: String,
                                    method: JobsHTTPMethod,
                                    headers: HTTPHeaders,
                                    requestTime: String,
                                    bodyForCallback: Any?) {

            let encoding: ParameterEncoding = {
                switch method {
                case .GET, .HEAD, .DELETE, .OPTIONS, .TRACE, .CONNECT:
                    return URLEncoding.default
                default:
                    return JSONEncoding.default
                }
            }()

            let request: DataRequest
            if let raw = rawBody {
                var urlReq = URLRequest(url: URL(string: fullURL)!)
                urlReq.method = method.alamofire
                urlReq.headers = headers
                urlReq.httpBody = raw
                request = session.request(urlReq)
            } else {
                request = session.request(fullURL,
                                          method: method.alamofire,
                                          parameters: params,
                                          encoding: encoding,
                                          headers: headers)
            }

            request.responseData(queue: .global(qos: .utility)) { [weak self] resp in
                guard let self else { return }
                let receivedTime = JobsNetworking.formatMS(Date())

                let cb = JobsNetworkingCallback(
                    id: self.id,
                    fullURL: fullURL,
                    headers: self.headers,
                    method: method,
                    body: bodyForCallback,
                    data: resp.data,
                    requestTime: requestTime,
                    receivedTime: receivedTime
                )

                DispatchQueue.main.async { [weak self] in
                    self?.owner?.onCallback?(cb)
                    self?.finishAndRelease()
                }
            }
        }

        private func performUpload(fullURL: String,
                                   method: JobsHTTPMethod,
                                   headers: HTTPHeaders,
                                   uploadItem: UploadItem,
                                   requestTime: String,
                                   bodyForCallback: Any?) {

            let req = session.upload(multipartFormData: { form in
                uploadItem.extraForm?.forEach { k, v in
                    if let d = v.data(using: .utf8) { form.append(d, withName: k) }
                }

                switch uploadItem.payload {
                case .data(let data, let fileName, let mimeType):
                    form.append(data, withName: uploadItem.formName, fileName: fileName, mimeType: mimeType)
                case .fileURL(let url, let fileName, let mimeType):
                    form.append(url, withName: uploadItem.formName, fileName: fileName, mimeType: mimeType)
                }
            }, to: fullURL, method: method.alamofire, headers: headers)

            req.uploadProgress(queue: .global(qos: .utility)) { [weak self] p in
                self?.emitProgress(p.fractionCompleted)
            }

            req.responseData(queue: .global(qos: .utility)) { [weak self] resp in
                guard let self else { return }
                let receivedTime = JobsNetworking.formatMS(Date())

                let cb = JobsNetworkingCallback(
                    id: self.id,
                    fullURL: fullURL,
                    headers: self.headers,
                    method: method,
                    body: bodyForCallback,
                    data: resp.data,
                    requestTime: requestTime,
                    receivedTime: receivedTime
                )

                DispatchQueue.main.async { [weak self] in
                    self?.owner?.onCallback?(cb)
                    self?.finishAndRelease()
                }
            }
        }

        private func performDownload(fullURL: String,
                                     method: JobsHTTPMethod,
                                     headers: HTTPHeaders,
                                     downloadItem: DownloadItem,
                                     requestTime: String,
                                     bodyForCallback: Any?) {

            let dst: DownloadRequest.Destination = { _, _ in
                let fileURL = downloadItem.directory.appendingPathComponent(downloadItem.fileName)
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }

            let req = session.download(fullURL, method: method.alamofire, headers: headers, to: dst)

            req.downloadProgress(queue: .global(qos: .utility)) { [weak self] p in
                self?.emitProgress(p.fractionCompleted)
            }

            req.responseData(queue: .global(qos: .utility)) { [weak self] resp in
                guard let self else { return }
                let receivedTime = JobsNetworking.formatMS(Date())

                let cb = JobsNetworkingCallback(
                    id: self.id,
                    fullURL: fullURL,
                    headers: self.headers,
                    method: method,
                    body: bodyForCallback,
                    data: resp.value, // ✅ DownloadResponse 的 Data 用 value
                    requestTime: requestTime,
                    receivedTime: receivedTime
                )

                DispatchQueue.main.async { [weak self] in
                    self?.owner?.onCallback?(cb)
                    self?.finishAndRelease()
                }
            }
        }

        private func performDownloadTask(fullURL: String,
                                         method: JobsHTTPMethod,
                                         headers: HTTPHeaders,
                                         downloadItem: DownloadItem,
                                         requestTime: String,
                                         bodyForCallback: Any?) {

            let dst: DownloadRequest.Destination = { _, _ in
                let fileURL = downloadItem.directory.appendingPathComponent(downloadItem.fileName)
                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
            }

            let req = session.download(fullURL, method: method.alamofire, headers: headers, to: dst)
            task?.downloadRequest = req

            req.downloadProgress(queue: .global(qos: .utility)) { [weak self] p in
                self?.emitProgress(p.fractionCompleted)
            }

            // ⚠️ 这里用 response（而不是 responseData），避免把大文件读进内存
            req.response(queue: .global(qos: .utility)) { [weak self] resp in
                guard let self else { return }
                let receivedTime = JobsNetworking.formatMS(Date())

                // 断点续传关键：拿到 resumeData
                if let rd = resp.resumeData {
                    self.task?.resumeData = rd
                }

                let cb = JobsNetworkingCallback(
                    id: self.id,
                    fullURL: fullURL,
                    headers: self.headers,
                    method: method,
                    body: bodyForCallback,
                    data: nil,
                    requestTime: requestTime,
                    receivedTime: receivedTime
                )

                DispatchQueue.main.async { [weak self] in
                    self?.owner?.onCallback?(cb)
                    self?.finishAndRelease()
                }
            }
        }
    }

    // MARK: - Request Relay (请求接力)
    public func relay(_ first: Builder,
                      then makeNext: @escaping (Data?) -> Builder) {
        let old = self.onCallback
        self.onCallback = { [weak self] cb in
            old?(cb)
            guard let self else { return }
            let next = makeNext(cb.data)
            self.onCallback = old
            next.start()
        }
        first.start()
    }

    // MARK: - Concurrent (✅ 修复：不再覆盖全局 onCallback，避免多 leave 崩溃)
    public func concurrent(_ builders: [Builder],
                           notifyOn queue: DispatchQueue = .main,
                           finished: @escaping () -> Void) {
        let group = DispatchGroup()

        builders.forEach { b in
            group.enter()
            // ✅ 每个 builder 结束时 leave（且 builder 内部保证只触发一次）
            b.onFinished {
                group.leave()
            }
            b.start()
        }

        group.notify(queue: queue) {
            finished()
        }
    }
}
// MARK: - Resumable Download Task Handle
public final class JobsNetworkingTask {

    fileprivate var downloadRequest: DownloadRequest?
    fileprivate var resumeData: Data?

    /// 暂停（产出 resumeData，用于断点续传）
    public func pause(completion: ((Data?) -> Void)? = nil) {
        // 优先走系统 URLSessionDownloadTask 的断点能力：不挑 AF 版本
        if let t = downloadRequest?.task as? URLSessionDownloadTask {
            t.cancel { [weak self] data in
                self?.resumeData = data
                completion?(data)
            }
            return
        }

        // fallback：拿不到 task，就返回已有缓存
        completion?(resumeData)
    }

    /// 继续（优先用传入的 resumeData，否则用内部缓存）
    public func resume(with data: Data? = nil,
                       in session: Session,
                       destination: @escaping DownloadRequest.Destination,
                       progress: ((Double) -> Void)? = nil,
                       completion: @escaping (AFDownloadResponse<URL?>) -> Void) {

        let rd = data ?? resumeData
        guard let rd else {
            completion(AFDownloadResponse(
                request: nil,
                response: nil,
                fileURL: nil,
                resumeData: nil,
                metrics: nil,
                serializationDuration: 0,
                result: .failure(AFError.explicitlyCancelled)
            ))
            return
        }

        let req = session.download(resumingWith: rd, to: destination)
        downloadRequest = req

        req.downloadProgress(queue: DispatchQueue.global(qos: .utility)) { p in
            progress?(p.fractionCompleted)
        }

        req.response(queue: DispatchQueue.global(qos: .utility)) { [weak self] (resp: AFDownloadResponse<URL?>) in
            if let rd2 = resp.resumeData {
                self?.resumeData = rd2
            }
            completion(resp)
        }
    }

    /// 取消（不产出 resumeData）
    public func cancel() {
        downloadRequest?.cancel()
    }
}
