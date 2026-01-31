import Foundation
import Alamofire

// MARK: - APIResponse marker (fix: avoid APIResponse<Never>)
public protocol JobsAPIResponseType {}

/// 如果你的 APIResponse 已经在别处定义了，这个 extension 直接放这里即可。
/// 目的：用 “是否为 APIResponse 自身” 来分支，而不是 APIResponse<Never>.self
extension APIResponse: JobsAPIResponseType {}

public final class DefaultJobsAgent: JobsAgent {

    /// ⚠️ Swift 6 + Default Actor(MainActor) 场景下：
    /// - 协议 requirement 是 nonisolated
    /// - 但实现若落到 MainActor，会触发 `T.Type` 非 Sendable 警告/错误
    ///
    /// 解决：将对外 API 明确 nonisolated，并将只读依赖标注为 nonisolated(unsafe)
    /// 这些依赖本身是 immutable 引用；真正的并发安全由内部 actor/锁/AF 线程安全保证。
    public let config: JobsRequestConfig
    public let headerHook: JobsHeaderHook

    // NOTE: This is intentionally not `private` because additional capability
    // extensions (e.g. Download) live in other files.
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

    // MARK: - Async API

    /// ✅ 关键：nonisolated，避免实现被 Default Actor/MainActor 绑定
    public nonisolated func send<T: Decodable>(_ request: JobsRequest, as type: T.Type) async throws -> T {
        try Task.checkCancellation()

        let start = Date()
        let prepared = try await prepare(request)

        let cacheKey = await JobsCacheKey.make(
            method: request.method,
            url: prepared.url,
            params: request.method == .get ? request.query : (request.body ?? request.query),
            version: config.version,
            userScope: config.userScope
        )

        // MARK: cache flow
        switch request.cachePolicy {
        case .none:
            break

        case .cacheOnly:
            if let cached = await getCache(cacheKey) {
                await config.logger.log(.info, "cache hit (only)", meta: meta(request, start: start, cache: "hit"))
                return try decodeResponse(data: cached.data, type: type, request: request, response: nil)
            }
            throw JobsError.server(statusCode: 504, data: nil)

        case .cacheThenNetwork:
            if let cached = await getCache(cacheKey) {
                await config.logger.log(.info, "cache hit", meta: meta(request, start: start, cache: "hit"))
                return try decodeResponse(data: cached.data, type: type, request: request, response: nil)
            }

        case .memoryThenNetwork:
            if let cached = await memoryCache.get(key: cacheKey) {
                await config.logger.log(.info, "memory cache hit (then network)", meta: meta(request, start: start, cache: "hit"))

                // ✅ 不阻塞触发刷新：用 Task{}，不要 detached（@Sendable/actor/sendable 坑多）
                Task(priority: .utility) { [weak self] in
                    guard let self else { return }
                    do {
                        let _: T = try await self.refreshNetwork(prepared: prepared, request: request, cacheKey: cacheKey)
                    } catch {
                        // 已返回缓存，后台刷新失败不影响主流程
                    }
                }

                return try decodeResponse(data: cached.data, type: type, request: request, response: nil)
            }
        }

        // MARK: network
        return try await refreshNetwork(prepared: prepared, request: request, cacheKey: cacheKey)
    }

    // MARK: - Network refresh

    private nonisolated func refreshNetwork<T: Decodable>(
        prepared: JobsPreparedRequest,
        request: JobsRequest,
        cacheKey: JobsCacheKey
    ) async throws -> T {
        let start = Date()
        let retry = request.retryPolicy ?? config.defaultRetryPolicy
        var attempt = 0

        while true {
            do {
                let (data, httpResp) = try await client.perform(prepared)

                let status = httpResp.statusCode
                guard (200...299).contains(status) else {
                    throw JobsError.server(statusCode: status, data: data)
                }

                // cache write
                if case .none = request.cachePolicy {
                    // no cache
                } else {
                    if let ttl = ttl(from: request.cachePolicy), ttl > 0 {
                        let expiry = Date().addingTimeInterval(ttl)
                        let cached = await JobsCachedValue(data: data, expiry: expiry, meta: ["source": "network"])
                        await memoryCache.set(key: cacheKey, value: cached)
                        await diskCache.set(key: cacheKey, value: cached)
                    }
                }

                await config.logger.log(.info, "network success", meta: meta(request, start: start, cache: "miss"))
                return try decodeResponse(data: data, type: T.self, request: request, response: httpResp)

            } catch is CancellationError {
                throw JobsError.cancelled

            } catch let afError as AFError {
                if afError.isExplicitlyCancelledError {
                    throw JobsError.cancelled
                }
                let je = JobsError.transport(underlying: afError)
                if attempt >= retry.maxRetries { throw je }
                attempt += 1
                let delay = backoffDelay(policy: retry, attempt: attempt)
                try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                continue

            } catch let je as JobsError {
                // 业务错误永不自动重试；取消也不重试
                if je.isBusiness || je.isCancellable { throw je }

                if attempt >= retry.maxRetries { throw je }
                attempt += 1
                let delay = backoffDelay(policy: retry, attempt: attempt)
                try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                continue

            } catch {
                let je = JobsError.transport(underlying: error)
                if attempt >= retry.maxRetries { throw je }
                attempt += 1
                let delay = backoffDelay(policy: retry, attempt: attempt)
                try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                continue
            }
        }
    }

    // MARK: - Closure API

    @discardableResult
    public nonisolated func send<T: Decodable>(
        _ request: JobsRequest,
        as type: T.Type,
        completion: @escaping @Sendable (Result<T, JobsError>) -> Void
    ) -> JobsRequestToken {
        let token = JobsRequestToken()
        let reqId = request.trace.requestId

        let task = Task {
            do {
                let value: T = try await send(request, as: type)
                completion(.success(value))
            } catch let e as JobsError {
                completion(.failure(e))
            } catch is CancellationError {
                completion(.failure(.cancelled))
            } catch {
                completion(.failure(.transport(underlying: error)))
            }
        }

        token.setCancel { [weak self] in
            task.cancel()
            self?.client.cancel(requestId: reqId)
        }
        return token
    }

    // MARK: - Prepare

    private nonisolated func prepare(_ request: JobsRequest) async throws -> JobsPreparedRequest {
        let base = config.baseURL
        let url = URL(string: request.path, relativeTo: base)?.absoluteURL ?? base.appendingPathComponent(request.path)

        let rule = await JobsEncodingRule.encoding(for: request)
        try await JobsEncodingRule.validateNoImplicitMix(request, encoding: rule)

        // header injection
        var headers: [String: String] = [:]
        headers["Accept"] = "application/json"

        switch rule {
        case .urlQuery:
            break
        case .jsonBody:
            headers["Content-Type"] = "application/json"
        case .formURLEncoded:
            headers["Content-Type"] = "application/x-www-form-urlencoded; charset=utf-8"
        case .multipart:
            break // boundary 交给 Alamofire
        case .rawData:
            headers["Content-Type"] = "application/octet-stream"
        }

        let hookHeaders = await headerHook.headers(for: request)
        headers.merge(hookHeaders) { _, new in new }
        headers.merge(request.headers) { _, new in new }

        let afHeaders = HTTPHeaders(headers.map { HTTPHeader(name: $0.key, value: $0.value) })

        var params: Parameters?
        var encoding: ParameterEncoding = URLEncoding.default

        switch rule {
        case .urlQuery:
            params = await request.query?.toAFParameters()
            encoding = URLEncoding(destination: .queryString)
        case .jsonBody:
            params = await request.body?.toAFParameters()
            encoding = JSONEncoding.default
        case .formURLEncoded:
            params = await request.body?.toAFParameters()
            encoding = URLEncoding(destination: .httpBody)
        case .multipart:
            params = await request.body?.toAFParameters()
            encoding = URLEncoding(destination: .httpBody)
        case .rawData:
            params = await request.body?.toAFParameters()
            encoding = JSONEncoding.default
        }

        return JobsPreparedRequest(
            url: url,
            method: request.method,
            parameters: params,
            encoding: encoding,
            headers: afHeaders,
            timeout: request.timeout,
            trace: request.trace
        )
    }

    // MARK: - Cache helpers

    private nonisolated func getCache(_ key: JobsCacheKey) async -> JobsCachedValue? {
        if let mem = await memoryCache.get(key: key) { return mem }
        if let disk = await diskCache.get(key: key) {
            await memoryCache.set(key: key, value: disk)
            return disk
        }
        return nil
    }

    private nonisolated func ttl(from policy: JobsCachePolicy) -> TimeInterval? {
        switch policy {
        case .none: return nil
        case .cacheOnly(let ttl): return ttl
        case .cacheThenNetwork(let ttl): return ttl
        case .memoryThenNetwork(let ttl): return ttl
        }
    }

    private nonisolated func backoffDelay(policy: JobsRetryPolicy, attempt: Int) -> TimeInterval {
        let base = policy.initialDelay * pow(policy.multiplier, Double(max(0, attempt - 1)))
        let jitter = Double.random(in: policy.jitter)
        return base * jitter
    }

    // MARK: - Decode (fix: remove APIResponse<Never> usage)

    private nonisolated func decodeResponse<T: Decodable>(
        data: Data,
        type: T.Type,
        request: JobsRequest,
        response: HTTPURLResponse?
    ) throws -> T {
        // Raw Data passthrough
        if T.self == Data.self, let v = data as? T { return v }

        let decoder = config.decoder

        // 如果调用方目标类型本身就是 APIResponse<Payload>，则直接 decode T
        if T.self is JobsAPIResponseType.Type {
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw JobsError.decode(underlying: error, data: data)
            }
        }

        // 先尝试业务包装解包：APIResponse<T>
        if let wrapped = try? decoder.decode(APIResponse<T>.self, from: data) {
            if wrapped.code == 0, let payload = wrapped.data {
                return payload
            } else {
                throw JobsError.business(code: wrapped.code, message: wrapped.msg ?? "Business Error", data: data)
            }
        }

        // 否则按普通 Decodable 解
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw JobsError.decode(underlying: error, data: data)
        }
    }

    // MARK: - Meta

    private nonisolated func meta(_ request: JobsRequest, start: Date, cache: String) -> [String: String] {
        let cost = Date().timeIntervalSince(start)
        return [
            "requestId": request.trace.requestId,
            "traceId": request.trace.traceId,
            "method": request.method.rawValue,
            "path": request.path,
            "costMs": String(Int(cost * 1000)),
            "cache": cache
        ]
    }
}
 
import Foundation
import Alamofire

// MARK: - Upload
public extension DefaultJobsAgent {

    func upload<T: Decodable>(_ request: JobsUploadRequest, as type: T.Type) async throws -> T {
        try Task.checkCancellation()

        let base = config.baseURL
        let url = URL(string: request.path, relativeTo: base)?.absoluteURL ?? base.appendingPathComponent(request.path)

        // headers: Accept + hook + request.headers
        var headers: [String: String] = ["Accept": "application/json"]
        let hookHeaders = await headerHook.headers(for: JobsRequest(path: request.path, method: request.method, trace: request.trace))
        headers.merge(hookHeaders) { _, n in n }
        headers.merge(request.headers) { _, n in n }

        // 注意：multipart 的 Content-Type 让 Alamofire 自动带 boundary，不要手动写
        let afHeaders = HTTPHeaders(headers.map { HTTPHeader(name: $0.key, value: $0.value) })

        // files -> parts
        var parts: [JobsMultipartPart] = []
        parts.reserveCapacity(request.files.count)
        for f in request.files {
            switch f {
            case let .file(url, name, fileName, mimeType):
                let data = try Data(contentsOf: url)
                parts.append(JobsMultipartPart(name: name, fileName: fileName, mimeType: mimeType, data: data))
            case let .data(data, name, fileName, mimeType):
                parts.append(JobsMultipartPart(name: name, fileName: fileName, mimeType: mimeType, data: data))
            }
        }

        let (data, resp) = try await client.uploadMultipart(
            url: url,
            method: request.method,
            headers: afHeaders,
            form: request.form,
            parts: parts,
            trace: request.trace,
            timeout: request.timeout
        )

        let status = resp.statusCode
        guard (200...299).contains(status) else {
            throw JobsError.server(statusCode: status, data: data)
        }

        return try decodeResponse(data: data, type: type, request: JobsRequest(path: request.path, method: request.method, trace: request.trace), response: resp)
    }
}
