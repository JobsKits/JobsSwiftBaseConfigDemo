//
//  JobsDownload+Async.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsDownloadCapable {
    func download(_ request: JobsDownloadRequest) async throws -> URL {
        var token: JobsRequestToken?

        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { cont in
                token = download(request) { result in
                    switch result {
                    case .success(let value):
                        cont.resume(returning: value)
                    case .failure(let error):
                        cont.resume(throwing: error)
                    }
                    token = nil
                }
            }
        } onCancel: {
            token?.cancel()
            token = nil
        }
    }
}
#endif
