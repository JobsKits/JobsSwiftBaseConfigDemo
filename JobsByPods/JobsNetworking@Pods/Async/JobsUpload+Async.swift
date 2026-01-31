//
//  JobsUpload+Async.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsUploadCapable {
    func upload<T: Decodable>(_ request: JobsRequest,
                              files: [JobsUploadFile],
                              as type: T.Type) async throws -> T {
        try await withCheckedThrowingContinuation { cont in
            _ = upload(request, files: files, as: type) { result in
                switch result {
                case .success(let v): cont.resume(returning: v)
                case .failure(let e): cont.resume(throwing: e)
                }
            }
        }
    }
}
#endif
