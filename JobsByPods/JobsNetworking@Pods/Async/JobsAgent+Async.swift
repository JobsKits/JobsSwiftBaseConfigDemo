//
//  JobsAgent+Async.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsAgent {
    func send<T: Decodable>(_ request: JobsRequest, as type: T.Type) async throws -> T {
        var token: JobsRequestToken?

        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { cont in
                token = send(request, as: type) { result in
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
