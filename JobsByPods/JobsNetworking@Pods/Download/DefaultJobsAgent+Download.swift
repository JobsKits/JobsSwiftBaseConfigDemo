//
//  DefaultJobsAgent+Download.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import DatadogInternal
import Alamofire

extension DefaultJobsAgent: JobsDownloadCapable {

    @discardableResult
    public func download(
        _ request: JobsDownloadRequest,
        completion: @escaping (Swift.Result<URL, JobsError>) -> Void
    ) -> JobsRequestToken {

        let token = JobsRequestToken()
        let reqId = request.trace.requestId
        token.setCancel { [weak self] in self?.client.cancel(requestId: reqId) }

        // header injection
        var headers: [String: String] = [:]
                headers.merge(request.headers) { _, new in new }
        headers.merge(headerHook.headers(for: request.asJobsRequest())) { _, new in new }

        var afHeaders: Alamofire.HTTPHeaders = [:]
        headers.forEach { afHeaders[$0.key] = $0.value }

        client.download(
            absoluteURL: request.absoluteURL,
            headers: afHeaders,
            destinationURL: request.destinationURL,
            trace: request.trace,
            timeout: request.timeout
        ) { result in
            switch result {
            case .success(let (url, http)):
                if !(200...299).contains(http.statusCode) {
                    completion(.failure(.http(statusCode: http.statusCode, data: nil)))
                } else {
                    completion(.success(url))
                }
            case .failure(let e):
                completion(.failure(e))
            }
        };return token
    }
}

private extension JobsDownloadRequest {
    func asJobsRequest() -> JobsRequest {
        JobsRequest(
            path: absoluteURL.absoluteString,
            method: .get,
            query: nil,
            body: nil,
            headers: headers,
            timeout: timeout,
            encoding: .urlQuery,
            cachePolicy: .none, trace: trace
        )
    }
}
