import Foundation
import Alamofire

extension DefaultJobsAgent {

    /// Download to a local file URL.
    /// - Note: This API uses an absolute URL and still applies `headerHook`.
    public nonisolated func download(_ request: JobsDownloadRequest) async throws -> URL {
        try Task.checkCancellation()

        // Build a lightweight JobsRequest so the existing headerHook can be reused.
        // Under Swift 6 default isolation (MainActor), JobsRequest's initializer may
        // be MainActor-isolated; construct it on MainActor to avoid warnings.
        let hookReq = await MainActor.run {
            JobsRequest(
                path: request.absoluteURL.absoluteString,
                method: .get,
                headers: request.headers,
                timeout: request.timeout,
                trace: request.trace
            )
        }

        var merged: [String: String] = [:]
        // Hook first, then explicit headers override.
        for (k, v) in await headerHook.headers(for: hookReq) { merged[k] = v }
        for (k, v) in request.headers { merged[k] = v }

        let httpHeaders = HTTPHeaders(merged.map { HTTPHeader(name: $0.key, value: $0.value) })

        let (fileURL, httpResp) = try await client.download(
            absoluteURL: request.absoluteURL,
            headers: httpHeaders,
            destinationURL: request.destinationURL,
            trace: request.trace,
            timeout: request.timeout
        )

        let status = httpResp.statusCode
        guard (200...299).contains(status) else {
            throw JobsError.server(statusCode: status, data: nil)
        }
        return fileURL
    }
}
