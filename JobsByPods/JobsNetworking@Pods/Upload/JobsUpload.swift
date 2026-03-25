import Foundation

public protocol JobsUploadCapable: JobsAgent {
    @discardableResult
    func upload<T: Decodable>(
        _ request: JobsUploadRequest,
        as type: T.Type,
        completion: @escaping (Result<T, JobsError>) -> Void
    ) -> JobsRequestToken
}
