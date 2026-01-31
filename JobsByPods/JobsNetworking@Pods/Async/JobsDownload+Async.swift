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
        try await withCheckedThrowingContinuation { cont in
            _ = download(request) { result in
                switch result {
                case .success(let v): cont.resume(returning: v)
                case .failure(let e): cont.resume(throwing: e)
                }
            }
        }
    }
}
#endif
