#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsDownloadCapable {
    func download(_ request: JobsDownloadRequest) async throws -> URL {
        var token: JobsRequestToken?
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                token = download(request) { result in
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
