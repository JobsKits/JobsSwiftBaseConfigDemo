import Foundation

public protocol JobsDownloadCapable: JobsAgent {
    @discardableResult
    func download(
        _ request: JobsDownloadRequest,
        completion: @escaping (Result<URL, JobsError>) -> Void
    ) -> JobsRequestToken
}
