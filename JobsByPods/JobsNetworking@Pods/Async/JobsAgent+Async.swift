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
        try await withCheckedThrowingContinuation { cont in
            send(request, as: type) { result in
                switch result {
                case .success(let v): cont.resume(returning: v)
                case .failure(let e): cont.resume(throwing: e)
                }
            }
        }
    }
}
#endif
