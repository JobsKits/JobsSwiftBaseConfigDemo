//
//  AlamofireClient.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire

final class AlamofireClient: HTTPClient {

    private let session: SessionManager
    private let lock = NSLock()
    private var requests: [String: Request] = [:]

    init(config: JobsRequestConfig) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = config.timeout
        self.session = SessionManager(configuration: configuration)
    }

    func perform(
        _ req: JobsPreparedRequest,
        completion: @escaping (Swift.Result<(Data, HTTPURLResponse), JobsError>) -> Void
    ) {
        let requestId = req.trace.requestId

        let r = session.request(
            req.url,
            // AF4: Bridge module-local HTTPMethod (JobsNetworking.HTTPMethod) to Alamofire.HTTPMethod.
            method: Alamofire.HTTPMethod(rawValue: req.method.rawValue) ?? .get,
            parameters: req.parameters,
            encoding: req.encoding,
            headers: req.headers
        )
        store(requestId: requestId, request: r)
        r.responseData { [weak self] (resp: DataResponse<Data>) in
            self?.remove(requestId: requestId)
            if let err = resp.error {
                completion(.failure(Self.mapError(err)))
                return
            }
            guard let data = resp.data, let http = resp.response else {
                completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                return
            };completion(.success((data, http)))
        }
    }

    func download(
        absoluteURL: URL,
        headers: HTTPHeaders,
        destinationURL: URL,
        trace: JobsTrace,
        timeout: TimeInterval?,
        completion: @escaping (Swift.Result<(URL, HTTPURLResponse), JobsError>) -> Void
    ) {
        let requestId = trace.requestId
        // AF4: DownloadRequest.DownloadFileDestination
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            return (destinationURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        var urlRequest = URLRequest(url: absoluteURL)
        urlRequest.httpMethod = "GET"
        // AF4: `HTTPHeaders` is a typealias of `[String: String]`.
        for (name, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: name)
        }
        if let t = timeout { urlRequest.timeoutInterval = t }
        let r = session.download(urlRequest, to: destination)
        store(requestId: requestId, request: r)
        r.response { [weak self] resp in
            self?.remove(requestId: requestId)
            if let err = resp.error {
                completion(.failure(Self.mapError(err)))
                return
            }
            guard let fileURL = resp.destinationURL, let http = resp.response else {
                completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                return
            };completion(.success((fileURL, http)))
        }
    }

    func uploadMultipart(
        url: URL,
        method: HTTPMethod,
        headers: HTTPHeaders,
        form: [String: AnySendable],
        parts: [JobsMultipartPart],
        trace: JobsTrace,
        timeout: TimeInterval?,
        completion: @escaping (Swift.Result<(Data, HTTPURLResponse), JobsError>) -> Void
    ) {
        let requestId = trace.requestId
        session.upload(
            multipartFormData: { mf in
                for (k, v) in form {
                    let s = v.stringValueForNetwork()
                    if let data = s.data(using: .utf8) {
                        mf.append(data, withName: k)
                    }
                }
                for p in parts {
                    mf.append(p.data,
                              withName: p.name,
                              fileName: p.fileName, mimeType: p.mimeType)
                }
            },
            to: url,
            // Bridge module-local HTTPMethod -> Alamofire.HTTPMethod.
            method: Alamofire.HTTPMethod(rawValue: method.rawValue) ?? .post,
            headers: headers
        ) { [weak self] result in
            switch result {
            case .success(let upload, _, _):
                self?.store(requestId: requestId, request: upload)
                upload.responseData { [weak self] (resp: DataResponse<Data>) in
                    self?.remove(requestId: requestId)
                    if let err = resp.error {
                        completion(.failure(Self.mapError(err)))
                        return
                    }
                    guard let data = resp.data, let http = resp.response else {
                        completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                        return
                    };completion(.success((data, http)))
                }
            case .failure(let err):
                completion(.failure(Self.mapError(err)))
            }
        }
    }

    func cancel(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId]?.cancel()
        requests[requestId] = nil
    }
    // MARK: - Private
    private func store(requestId: String, request: Request) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = request
    }

    private func remove(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = nil
    }

    private static func mapError(_ error: Error) -> JobsError {
        let ns = error as NSError
        if ns.domain == NSURLErrorDomain && ns.code == NSURLErrorCancelled {
            return .cancelled
        };return .transport(underlying: error)
    }
}
