#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsUploadCapable {
    func upload<T: Decodable>(
        _ request: JobsUploadRequest,
        as type: T.Type
    ) async throws -> T {
        var token: JobsRequestToken?
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                token = upload(request, as: type) { result in
                    switch result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        continuation.resume(throwing: error)
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
