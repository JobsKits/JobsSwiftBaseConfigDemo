import Foundation

public protocol JobsAgent: Sendable {
    var config: JobsRequestConfig { get }
    var headerHook: JobsHeaderHook { get }

    @discardableResult
    func send<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type,
        completion: @escaping (Result<T, JobsError>) -> Void
    ) -> JobsRequestToken

    @discardableResult
    func observe<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type,
        onEvent: @escaping (Result<(T, JobsResponseSource), JobsError>) -> Void,
        completion: @escaping (Result<T, JobsError>) -> Void
    ) -> JobsRequestToken
}
