//
//  NetworkRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation
import Alamofire

@main
struct NetworkRegression {
    static func main() async throws {
        try cacheAndValues()
        tokenRegistration()
        try await retryReplacement()
        try await cancellationAndIdentity()
        try await parametersAndFiles()
        print("NetworkRegression: cache identity/long keys/stale/LRU, immutable values, cancel/retry/Async, execution identity, query/body, missing multipart and download preservation passed")
    }

    static func check(_ value: @autoclosure () throws -> Bool) rethrows {
        let result = try value()
        precondition(result)
    }

    static func cacheAndValues() throws {
        let url = URL(string: "https://example.test/data")!
        func key(_ query: [String: JobsValue], raw: Data? = nil) -> JobsCacheKey {
            JobsCacheKey.make(method: .post, url: url, query: query, body: nil, version: "v", userScope: "u", rawBody: raw)
        }
        precondition(key(["a": JobsValue("x&b=y")]) != key(["a": JobsValue("x"), "b": JobsValue("y")]))
        precondition(key(["a": JobsValue("1")]) != key(["a": JobsValue(1)]))
        precondition(key(["a": JobsValue(NSNull())]) != key(["a": JobsValue("")]))
        precondition(key([:], raw: Data([1])) != key([:], raw: Data([2])))
        precondition(key(["a": JobsValue(["x": 1, "y": 2])]) == key(["a": JobsValue(["y": 2, "x": 1])]))
        let mutable = NSMutableArray(array: ["before"])
        let value = JobsValue(mutable)
        mutable[0] = "after"
        precondition((value.raw as? [String]) == ["before"])
        precondition(JobsValue(Double.nan).validationError != nil)
        precondition(JobsValue(NSObject()).validationError != nil)
        let longKey = key(["search": JobsValue(String(repeating: "🔒", count: 300))])
        let namespace = "JobsPodsUpgradeTest-\(UUID().uuidString)"
        let disk = JobsDiskCache(namespace: namespace)
        defer { disk.removeAll() }
        let entry = JobsCachedValue(data: Data([1, 2]), expiry: Date().addingTimeInterval(60))
        disk.set(key: longKey, value: entry)
        precondition(JobsDiskCache(namespace: namespace).get(key: longKey)?.data == entry.data)
        let errors = LockedEvents()
        let small = JobsDiskCache(namespace: namespace, maximumByteCount: 1) { error in
            errors.append(error.localizedDescription)
        }
        precondition(small.get(key: longKey) == nil)
        precondition(small.get(key: longKey) == nil && errors.values.count == 1)
        precondition(disk.get(key: longKey) == nil)
        let base = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        let damaged = base.appendingPathComponent(namespace, isDirectory: true)
            .appendingPathComponent(JobsCacheKey.digest(Data(longKey.raw.utf8))).appendingPathExtension("cache")
        try Data("not-json".utf8).write(to: damaged)
        let damagedStore = JobsDiskCache(namespace: namespace) { error in
            errors.append(error.localizedDescription)
        }
        precondition(damagedStore.get(key: longKey) == nil)
        precondition(damagedStore.get(key: longKey) == nil && errors.values.count == 2)
        precondition(!FileManager.default.fileExists(atPath: damaged.path))
        let expired = JobsCachedValue(data: Data([3]), expiry: Date().addingTimeInterval(-1))
        disk.set(key: longKey, value: expired)
        precondition(disk.get(key: longKey) == nil)
        precondition(disk.get(key: longKey, allowExpired: true)?.data == expired.data)
        let memory = JobsMemoryCache(maximumEntryCount: 1, maximumByteCount: 10)
        let first = key(["x": JobsValue(1)])
        let second = key(["x": JobsValue(2)])
        memory.set(key: first, value: entry)
        memory.set(key: second, value: entry)
        precondition(memory.get(key: first) == nil && memory.get(key: second) != nil)
    }

    static func tokenRegistration() {
        let token = JobsRequestToken()
        token.cancel()
        var calls = 0
        token.setCancel { calls += 1 }
        token.cancel()
        precondition(calls == 1)
        let terminal = JobsRequestToken()
        var finishes = 0
        DispatchQueue.concurrentPerform(iterations: 100) { _ in
            terminal.finish { finishes += 1 }
        }
        precondition(finishes == 1)
    }

    static func retryReplacement() async throws {
        let token = JobsRequestToken()
        let events = LockedEvents()
        token.scheduleRetry(after: 0.06) { events.append("old") }
        token.scheduleRetry(after: 0.02) { events.append("replacement") }
        try await Task.sleep(nanoseconds: 100_000_000)
        precondition(events.values == ["replacement"])
        let cancelled = JobsRequestToken()
        cancelled.scheduleRetry(after: 0.02) { events.append("cancelled") }
        cancelled.cancel()
        try await Task.sleep(nanoseconds: 40_000_000)
        precondition(events.values == ["replacement"])
        let completed = JobsRequestToken()
        completed.scheduleRetry(after: 0.02) { events.append("finished") }
        completed.finish { }
        try await Task.sleep(nanoseconds: 40_000_000)
        precondition(events.values == ["replacement"])
    }

    static func agent(_ client: ControlledClient, retry: JobsRetryPolicy = .default) -> JobsDefaultAgent {
        JobsDefaultAgent(config: JobsRequestConfig(baseURL: URL(string: "https://example.test/")!,
            defaultRetryPolicy: retry, logger: JobsLogger(isEnabled: false)),
            memoryCache: JobsMemoryCache(), diskCache: JobsMemoryCache(), client: client)
    }

    static func cancellationAndIdentity() async throws {
        let client = ControlledClient()
        let agent = agent(client)
        let request = JobsRequest(path: "data", method: .get)
        var firstCount = 0
        var secondCount = 0
        let first = agent.send(request, as: Data.self) { result in
            firstCount += 1
            if case .failure(let error) = result { precondition(error.isCancelled) }
            else { preconditionFailure("First must cancel") }
        }
        let second = agent.send(request, as: Data.self) { result in
            secondCount += 1
            if case .success(let data) = result { precondition(data == Data([2])) }
            else { preconditionFailure("Second must succeed") }
        }
        precondition(first.operationID != second.operationID)
        first.cancel()
        client.complete(first.operationID, data: Data([1]))
        client.complete(second.operationID, data: Data([2]))
        second.cancel()
        precondition(firstCount == 1 && secondCount == 1)
        precondition(client.cancelledIDs == [first.operationID])

        let failing = ControlledClient()
        failing.failImmediately = true
        let retryAgent = self.agent(failing, retry: JobsRetryPolicy(maxRetries: 2, initialDelay: 0.15, multiplier: 1, jitter: 1...1))
        var cancellations = 0
        let token = retryAgent.send(request, as: Data.self) { result in
            cancellations += 1
            if case .failure(let error) = result { precondition(error.isCancelled) }
        }
        token.cancel()
        try await Task.sleep(nanoseconds: 300_000_000)
        precondition(failing.performCount == 1 && cancellations == 1)

        let early = ControlledClient()
        let earlyAgent = self.agent(early)
        let task = Task {
            withUnsafeCurrentTask { $0?.cancel() }
            do {
                _ = try await earlyAgent.send(request, as: Data.self)
                preconditionFailure("Pre-cancelled task must fail")
            } catch let error as JobsError { precondition(error.isCancelled) }
        }
        try await task.value
        precondition(early.performCount == 0)
    }

    static func parametersAndFiles() async throws {
        let client = ControlledClient()
        let agent = agent(client)
        let request = JobsRequest(path: "submit?existing=1", method: .post,
            query: ["tenant": JobsValue("中文&=")], body: ["amount": JobsValue(7)])
        let token = agent.send(request, as: Data.self) { _ in }
        let prepared = client.prepared[token.operationID]!
        let items = URLComponents(url: prepared.url, resolvingAgainstBaseURL: false)!.queryItems!
        precondition(items.filter { $0.name == "tenant" }.count == 1)
        precondition(items.first { $0.name == "tenant" }?.value == "中文&=")
        precondition(items.first { $0.name == "existing" }?.value == "1")
        precondition((prepared.parameters?["amount"] as? NSNumber)?.intValue == 7)
        token.cancel()
        var failed = false
        _ = agent.upload(JobsUploadRequest(path: "upload", files: [
            .file(url: URL(fileURLWithPath: "/tmp/JobsMissing-\(UUID().uuidString)"), name: "file", fileName: "x", mimeType: "text/plain"),
            .data(data: Data([1]), name: "another", fileName: "y", mimeType: "text/plain")
        ]), as: Data.self) { result in
            if case .failure = result { failed = true }
        }
        precondition(failed && client.uploadCount == 0)

        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("JobsDownloadTest-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let destination = directory.appendingPathComponent("result")
        try Data("original".utf8).write(to: destination)
        let temporary = directory.appendingPathComponent("temporary")
        try Data("error".utf8).write(to: temporary)
        client.downloadResponse = (temporary, 500)
        let failedDownload: Result<URL, JobsError> = await withCheckedContinuation { continuation in
            agent.download(JobsDownloadRequest(absoluteURL: URL(string: "https://example.test/file")!, destinationURL: destination)) {
                continuation.resume(returning: $0)
            }
        }
        if case .failure = failedDownload { } else { preconditionFailure("500 must fail") }
        try check(try Data(contentsOf: destination) == Data("original".utf8))
        try Data("replacement".utf8).write(to: temporary)
        client.downloadResponse = (temporary, 200)
        let goodDownload: Result<URL, JobsError> = await withCheckedContinuation { continuation in
            agent.download(JobsDownloadRequest(absoluteURL: URL(string: "https://example.test/file")!, destinationURL: destination,
                expectedByteCount: 11)) { continuation.resume(returning: $0) }
        }
        if case .success = goodDownload { } else { preconditionFailure("200 must install") }
        try check(try Data(contentsOf: destination) == Data("replacement".utf8))
    }
}

final class ControlledClient: HTTPClient, @unchecked Sendable {
    var prepared: [String: JobsPreparedRequest] = [:]
    var callbacks: [String: (Result<(Data, HTTPURLResponse), JobsError>) -> Void] = [:]
    var cancelledIDs: [String] = []
    var performCount = 0
    var uploadCount = 0
    var failImmediately = false
    var downloadResponse: (URL, Int)?

    func perform(_ request: JobsPreparedRequest, token: JobsRequestToken,
                 completion: @escaping (Result<(Data, HTTPURLResponse), JobsError>) -> Void) {
        performCount += 1
        prepared[token.operationID] = request
        if failImmediately { completion(.failure(.transport(underlying: "injected"))) }
        else { callbacks[token.operationID] = completion }
    }

    func complete(_ id: String, data: Data) {
        guard let request = prepared[id], let callback = callbacks.removeValue(forKey: id) else { return }
        callback(.success((data, HTTPURLResponse(url: request.url, statusCode: 200, httpVersion: nil, headerFields: nil)!)))
    }

    func cancel(requestId: String) { cancelledIDs.append(requestId) }

    func download(absoluteURL: URL, headers: HTTPHeaders, destinationURL: URL, trace: JobsTrace,
                  timeout: TimeInterval?, token: JobsRequestToken,
                  completion: @escaping (Result<(URL, HTTPURLResponse), JobsError>) -> Void) {
        let response = downloadResponse!
        completion(.success((response.0, HTTPURLResponse(url: absoluteURL, statusCode: response.1, httpVersion: nil, headerFields: nil)!)))
    }

    func uploadMultipart(url: URL, method: HTTPMethod, headers: HTTPHeaders, form: [String: JobsValue],
                         parts: [JobsMultipartPart], trace: JobsTrace, timeout: TimeInterval?, token: JobsRequestToken,
                         completion: @escaping (Result<(Data, HTTPURLResponse), JobsError>) -> Void) {
        uploadCount += 1
    }
}

final class LockedEvents: @unchecked Sendable {
    private let lock = NSLock()
    private var storage: [String] = []
    var values: [String] {
        lock.lock()
        defer { lock.unlock() }
        return storage
    }
    func append(_ value: String) {
        lock.lock()
        storage.append(value)
        lock.unlock()
    }
}
