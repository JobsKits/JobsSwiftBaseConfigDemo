//
//  AlamofireClient.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire

final class AlamofireClient: HTTPClient {

    private let session: Session
    private let lock = NSLock()
    private var requests: [String: Request] = [:]

    init(config: JobsRequestConfig) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = config.timeout
        self.session = Session(configuration: configuration)
    }

    func perform(
        _ req: JobsPreparedRequest,
        completion: @escaping (Swift.Result<(Data, HTTPURLResponse), JobsError>) -> Void
    ) {
        let requestId = req.trace.requestId

        let r = session.request(
            req.url,
            method: req.method.afMethod,
            parameters: req.parameters,
            encoding: req.encoding,
            headers: req.headers,
            requestModifier: req.timeout.map { timeout in
                { (urlRequest: inout URLRequest) in
                    urlRequest.timeoutInterval = timeout
                }
            }
        )

        store(requestId: requestId, request: r)

        r.responseData { [weak self] (resp: AFDataResponse<Data>) in
            self?.remove(requestId: requestId)

            if let err = resp.error {
                completion(.failure(Self.mapError(err)))
                return
            }

            guard let data = resp.data, let http = resp.response else {
                completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                return
            }

            completion(.success((data, http)))
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

        let destination: DownloadRequest.Destination = { _, _ in
            (destinationURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        let r = session.download(
            absoluteURL,
            method: .get,
            headers: headers,
            requestModifier: timeout.map { t in { (req: inout URLRequest) in req.timeoutInterval = t } },
            to: destination
        )

        store(requestId: requestId, request: r)

        r.response { [weak self] resp in
            self?.remove(requestId: requestId)

            if let err = resp.error {
                completion(.failure(Self.mapError(err)))
                return
            }

            guard let fileURL = resp.fileURL, let http = resp.response else {
                completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                return
            }

            completion(.success((fileURL, http)))
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

        let r = session.upload(
            multipartFormData: { mf in
                for (k, v) in form {
                    let s = v.stringValueForNetwork()
                    if let data = s.data(using: .utf8) {
                        mf.append(data, withName: k)
                    }
                }
                for p in parts {
                    mf.append(p.data, withName: p.name, fileName: p.fileName, mimeType: p.mimeType)
                }
            },
            to: url,
            method: method.afMethod,
            headers: headers,
            requestModifier: timeout.map { t in { (req: inout URLRequest) in req.timeoutInterval = t } }
        )

        store(requestId: requestId, request: r)

        r.responseData { [weak self] (resp: AFDataResponse<Data>) in
            self?.remove(requestId: requestId)

            if let err = resp.error {
                completion(.failure(Self.mapError(err)))
                return
            }

            guard let data = resp.data, let http = resp.response else {
                completion(.failure(.transport(underlying: URLError(.badServerResponse))))
                return
            }

            completion(.success((data, http)))
        }
    }

    func cancel(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId]?.cancel()
        requests[requestId] = nil
    }

    private func store(requestId: String, request: Request) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = request
    }

    private func remove(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = nil
    }

    private static func mapError(_ error: AFError) -> JobsError {
        if error.isExplicitlyCancelledError { return .cancelled }
        return .transport(underlying: error)
    }
}

private extension HTTPMethod {
    var afMethod: Alamofire.HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .patch: return .patch
        case .delete: return .delete
        case .head: return .head
        }
    }
}
