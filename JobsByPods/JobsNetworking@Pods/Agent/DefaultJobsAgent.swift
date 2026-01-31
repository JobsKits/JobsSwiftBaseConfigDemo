//
//  DefaultJobsAgent.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation
import Alamofire
// MARK: - APIResponse marker (keep existing behavior)
public protocol JobsAPIResponseType {}
extension APIResponse: JobsAPIResponseType {}

public final class DefaultJobsAgent: JobsAgent {

    public let config: JobsRequestConfig
    public let headerHook: JobsHeaderHook

    // Exposed for capability extensions (Download/Upload) in other files
    let client: HTTPClient

    private let memoryCache: JobsCacheStore
    private let diskCache: JobsCacheStore

    public init(
        config: JobsRequestConfig,
        headerHook: JobsHeaderHook = EmptyHeaderHook(),
        memoryCache: JobsCacheStore = JobsMemoryCache(),
        diskCache: JobsCacheStore = JobsDiskCache()
    ) {
        self.config = config
        self.headerHook = headerHook
        self.client = AlamofireClient(config: config)
        self.memoryCache = memoryCache
        self.diskCache = diskCache
    }
    // MARK: - Core (iOS 12): Closure API
    @discardableResult
    public func send<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) -> JobsRequestToken {

        let token = JobsRequestToken()
        let reqId = request.trace.requestId
        token.setCancel { [weak self] in self?.client.cancel(requestId: reqId) }

        doSend(request,
               type: type,
               token: token,
               attempt: 0,
               completion: completion)
        return token
    }

    private func doSend<T: Decodable>(
        _ request: JobsRequest,
        type: T.Type,
        token: JobsRequestToken,
        attempt: Int,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) {
        do {
            let prepared = try prepareRequest(request)
            // Cache decision
            let policy = request.cachePolicy
            if case .none = policy {
                // Network only
                client.perform(prepared) { [weak self] result in
                    guard let self else { return }
                    completion(self.mapNetworkResult(result, request: request, type: type, cacheTTL: nil))
                }
                return
            } else {
                handleCache(policy: policy,
                            request: request,
                            prepared: prepared,
                            type: type,
                            attempt: attempt,
                            completion: completion)
                return
            }
        } catch let e as JobsError {
            completion(.failure(e))
        } catch {
            completion(.failure(.unknown(underlying: error)))
        }
    }

    private func handleCache<T: Decodable>(
        policy: JobsCachePolicy,
        request: JobsRequest,
        prepared: JobsPreparedRequest,
        type: T.Type,
        attempt: Int,
        completion: @escaping (Swift.Result<T, JobsError>) -> Void
    ) {
        let cacheKey = JobsCacheKey.make(
            method: request.method,
            url: prepared.url,
            params: (request.query ?? request.body),
            version: config.version,
            userScope: config.userScope
        )

        func decodeCached(_ cached: JobsCachedValue) -> Swift.Result<T, JobsError> {
            do { return .success(try decodeResponse(data: cached.data, type: type, request: request, response: nil)) }
            catch let e as JobsError { return .failure(e) }
            catch { return .failure(.decode(underlying: error, data: nil)) }
        }

        func fetchNetwork(writeTTL: TimeInterval?) {
            client.perform(prepared) { [weak self] result in
                guard let self else { return }
                let mapped = self.mapNetworkResult(result, request: request, type: type, cacheTTL: writeTTL.map { ($0, cacheKey) })
                completion(mapped)
            }
        }
        switch policy {
        case .none:
            fetchNetwork(writeTTL: nil)

        case .cacheOnly(let ttl):
            if let v = memoryCache.get(key: cacheKey) { completion(decodeCached(v)); return }
            if let v = diskCache.get(key: cacheKey) { completion(decodeCached(v)); return }
            completion(.failure(.cacheMiss))
            _ = ttl

        case .cacheThenNetwork(let ttl):
            if let v = memoryCache.get(key: cacheKey) { completion(decodeCached(v)); return }
            if let v = diskCache.get(key: cacheKey) { completion(decodeCached(v)); return }
            fetchNetwork(writeTTL: ttl)

        case .memoryThenNetwork(let ttl):
            if let v = memoryCache.get(key: cacheKey) {
                completion(decodeCached(v))
                // refresh in background and callback again with latest
                fetchNetwork(writeTTL: ttl)
                return
            }
            if let v = diskCache.get(key: cacheKey) {
                completion(decodeCached(v))
                fetchNetwork(writeTTL: ttl)
                return
            }
            fetchNetwork(writeTTL: ttl)
        }
    }

    private func mapNetworkResult<T: Decodable>(
        _ result: Swift.Result<(Data, HTTPURLResponse), JobsError>,
        request: JobsRequest,
        type: T.Type,
        cacheTTL: (ttl: TimeInterval, key: JobsCacheKey)?
    ) -> Swift.Result<T, JobsError> {
        switch result {
        case .failure(let e):
            return .failure(e)

        case .success(let (data, http)):
            do {
                // http status check
                if !(200...299).contains(http.statusCode) {
                    return .failure(.server(statusCode: http.statusCode, data: data))
                }

                let decoded: T = try decodeResponse(data: data,
                                                    type: type,
                                                    request: request,
                                                    response: http)

                if let cacheTTL {
                    let expiry = Date().addingTimeInterval(cacheTTL.ttl)
                    let cached = JobsCachedValue(data: data, expiry: expiry)
                    memoryCache.set(key: cacheTTL.key, value: cached)
                    diskCache.set(key: cacheTTL.key, value: cached)
                }

                return .success(decoded)
            } catch let e as JobsError {
                return .failure(e)
            } catch {
                return .failure(.decode(underlying: error, data: nil))
            }
        }
    }
    // MARK: - Request prepare
    private func prepareRequest(_ request: JobsRequest) throws -> JobsPreparedRequest {
        let base = config.baseURL
        let url = URL(string: request.path, relativeTo: base)?.absoluteURL ?? base.appendingPathComponent(request.path)

        let rule = JobsEncodingRule.encoding(for: request)
        try JobsEncodingRule.validateNoImplicitMix(request, encoding: rule)

        var headers: [String: String] = [:]
        headers["Accept"] = "application/json"
                headers.merge(request.headers) { _, new in new }

        let hooked = headerHook.headers(for: request)
        headers.merge(hooked) { _, new in new }

        var afHeaders: Alamofire.HTTPHeaders = [:]
        headers.forEach { afHeaders[$0.key] = $0.value }

        var encoding: ParameterEncoding = URLEncoding.default
        var parameters: Parameters? = nil

        switch rule {
        case .urlQuery:
            encoding = URLEncoding(destination: .queryString)
            parameters = request.query?.toParameters()
        case .jsonBody:
            encoding = JSONEncoding.default
            parameters = request.body?.toParameters()
        case .formURLEncoded:
            encoding = URLEncoding(destination: .httpBody)
            parameters = request.body?.toParameters()
        case .multipart:
            throw JobsError.unknown(underlying: NSError(domain: "JobsNetworking", code: -10001, userInfo: [NSLocalizedDescriptionKey: "multipart encoding is not supported by DefaultJobsAgent.prepareRequest yet"]))
        case .rawData:
            throw JobsError.unknown(underlying: NSError(domain: "JobsNetworking", code: -10002, userInfo: [NSLocalizedDescriptionKey: "rawData encoding is not supported by DefaultJobsAgent.prepareRequest yet"]))
        };return JobsPreparedRequest(
            url: url,
            method: request.method,
            parameters: parameters,
            encoding: encoding,
            headers: afHeaders,
            timeout: request.timeout,
            trace: request.trace
        )
    }
    // MARK: - Decode
    func decodeResponse<T: Decodable>(
        data: Data,
        type: T.Type,
        request: JobsRequest,
        response: HTTPURLResponse?
    ) throws -> T {
        if T.self == Data.self, let v = data as? T { return v }
        let decoder = config.decoder
        if T.self is JobsAPIResponseType.Type {
            do { return try decoder.decode(T.self, from: data) }
            catch { throw JobsError.decode(underlying: error, data: data) }
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw JobsError.decode(underlying: error, data: data)
        }
    }
}
// MARK: - Helpers
private extension Dictionary where Key == String, Value == AnySendable {
    func toParameters() -> Parameters {
        var out: Parameters = [:]
        for (k, v) in self {
            out[k] = v.value ?? NSNull()
        };return out
    }
}
