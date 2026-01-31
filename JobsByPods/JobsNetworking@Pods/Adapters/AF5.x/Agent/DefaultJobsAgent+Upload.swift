//
//  DefaultJobsAgent+Upload.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire
// 让 DefaultJobsAgent 具备 Upload 能力（AF5）
extension DefaultJobsAgent: JobsUploadCapable {
    @discardableResult
    public func upload<T: Decodable>(
        _ request: JobsRequest,
        files: [JobsUploadFile],
        as type: T.Type,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) -> JobsRequestToken {
        // 这个版本是协议要求的占位实现：
        // 你当前 Demo 不走这个入口（Demo 用 JobsUploadRequest），所以先不实现也行。
        // 如果你未来需要这个入口，我可以再给你补齐转换逻辑。
        completion(.failure(.unknown(underlying: NSError(domain: "JobsNetworking", code: -1, userInfo: [
            NSLocalizedDescriptionKey: "upload(_:files:as:) not implemented. Use upload(_:as:) with JobsUploadRequest."
        ]))));return JobsRequestToken()
    }
}
// MARK: - JobsUploadRequest 便捷 API（Demo 用的就是这个）
public extension DefaultJobsAgent {
    /// iOS 12 closure API
    @discardableResult
    func upload<T: Decodable>(
        _ request: JobsUploadRequest,
        as type: T.Type,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) -> JobsRequestToken {
        let token = JobsRequestToken()
        let reqId = request.trace.requestId
        token.setCancel { [weak self] in self?.client.cancel(requestId: reqId) }
        // 1) 组装 URL（与 prepareRequest 同风格）
        let base = config.baseURL
        let url = URL(string: request.path, relativeTo: base)?.absoluteURL
            ?? base.appendingPathComponent(request.path)
        // 2) 组装 headers：Accept + request.headers + hook headers
        var headersDict: [String: String] = [:]
        headersDict["Accept"] = "application/json"
        headersDict.merge(request.headers) { _, new in new }
        // 用 JobsRequest 触发 headerHook（复用你现有设计）
        let hookReq = JobsRequest(
            path: request.path,
            method: request.method,
            headers: request.headers,
            timeout: request.timeout,
            trace: request.trace
        )
        headersDict.merge(headerHook.headers(for: hookReq)) { _, new in new }
        // 转成 AF5 HTTPHeaders
        var afHeaders: Alamofire.HTTPHeaders = [:]
        headersDict.forEach { afHeaders[$0.key] = $0.value }
        // 3) files → parts
        do {
            let parts = try request.files.map { spec -> JobsMultipartPart in
                switch spec {
                case let .file(url, name, fileName, mimeType):
                    let data = try Data(contentsOf: url)
                    return JobsMultipartPart(name: name,
                                             fileName: fileName,
                                             mimeType: mimeType,
                                             data: data)
                case let .data(data, name, fileName, mimeType):
                    return JobsMultipartPart(name: name,
                                             fileName: fileName,
                                             mimeType: mimeType,
                                             data: data)
                }
            }
            // 4) 发起 multipart
            client.uploadMultipart(
                url: url,
                method: request.method,
                headers: afHeaders,
                form: request.form,
                parts: parts,
                trace: request.trace,
                timeout: request.timeout
            ) { [weak self] result in
                guard let self else { return }

                switch result {
                case .failure(let e):
                    completion(.failure(e))

                case .success(let (data, http)):
                    // HTTP 状态码兜底
                    guard (200...299).contains(http.statusCode) else {
                        completion(.failure(.http(statusCode: http.statusCode, data: data)))
                        return
                    }

                    do {
                        // 复用 DefaultJobsAgent 自带 decodeResponse
                        let decoded: T = try self.decodeResponse(
                            data: data,
                            type: type,
                            request: hookReq,
                            response: http
                        )
                        completion(.success(decoded))
                    } catch let e as JobsError {
                        completion(.failure(e))
                    } catch {
                        completion(.failure(.unknown(underlying: error)))
                    }
                }
            };return token
        } catch {
            completion(.failure(.unknown(underlying: error)))
            return token
        }
    }
}
#if canImport(_Concurrency)
@available(iOS 13.0, *)
public extension DefaultJobsAgent {
    /// iOS 13 async/await API（Demo 用 try await 的话就走这个）
    func upload<T: Decodable>(_ request: JobsUploadRequest,
                              as type: T.Type) async throws -> T {
        try await withCheckedThrowingContinuation { cont in
            _ = upload(request, as: type) { result in
                switch result {
                case .success(let v): cont.resume(returning: v)
                case .failure(let e): cont.resume(throwing: e)
                }
            }
        }
    }
}
#endif
