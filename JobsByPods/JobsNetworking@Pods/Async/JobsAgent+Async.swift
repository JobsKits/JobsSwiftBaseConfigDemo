#if canImport(_Concurrency)
import Foundation

@available(iOS 13.0, *)
public extension JobsAgent {
    func send<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type
    ) async throws -> T {
        var token: JobsRequestToken?
        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                token = send(request, as: type) { result in
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

    func observe<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type
    ) -> AsyncThrowingStream<(T, JobsResponseSource), Error> {
        AsyncThrowingStream { continuation in
            let token = observe(request, as: type, onEvent: { result in
                switch result {
                case .success(let tuple):
                    continuation.yield(tuple)
                case .failure(let error):
                    continuation.finish(throwing: error)
                }
            }, completion: { result in
                if case .failure(let error) = result {
                    continuation.finish(throwing: error)
                } else {
                    continuation.finish()
                }
            })

            continuation.onTermination = { _ in
                token.cancel()
            }
        }
    }
}
#endif
