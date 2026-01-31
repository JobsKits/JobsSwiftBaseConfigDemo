import Foundation
import Alamofire

protocol HTTPClient: Sendable {
    func perform(_ req: JobsPreparedRequest) async throws -> (Data, HTTPURLResponse)

    func download(
        absoluteURL: URL,
        headers: HTTPHeaders,
        destinationURL: URL,
        trace: JobsTrace,
        timeout: TimeInterval?
    ) async throws -> (URL, HTTPURLResponse)

    func uploadMultipart(
        url: URL,
        method: HTTPMethod,
        headers: HTTPHeaders,
        form: [String: AnySendable],
        parts: [JobsMultipartPart],
        trace: JobsTrace,
        timeout: TimeInterval?
    ) async throws -> (Data, HTTPURLResponse)

    func cancel(requestId: String)
}

final class AlamofireClient: HTTPClient {
    private let session: Session
    private let lock = NSLock()
    private var requests: [String: Request] = [:]

    init(config: JobsRequestConfig) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = config.timeout
        self.session = Session(configuration: configuration)
    }

    func perform(_ req: JobsPreparedRequest) async throws -> (Data, HTTPURLResponse) {
        let requestId = req.trace.requestId

        let af: DataRequest = session.request(
            req.url,
            method: Alamofire.HTTPMethod(rawValue: req.method.rawValue),
            parameters: req.parameters,
            encoding: req.encoding,
            headers: req.headers
        )

        store(requestId: requestId, request: af)

        do {
            defer { remove(requestId: requestId) }

            let data = try await af.serializingData().value
            guard let response = af.response else {
                throw JobsError.transport(underlying: URLError(.badServerResponse))
            }
            return (data, response)

        } catch is CancellationError {
            throw JobsError.cancelled

        } catch {
            if let afError = error as? AFError, afError.isExplicitlyCancelledError {
                throw JobsError.cancelled
            }
            throw JobsError.transport(underlying: error)
        }
    }


    func download(
        absoluteURL: URL,
        headers: HTTPHeaders,
        destinationURL: URL,
        trace: JobsTrace,
        timeout: TimeInterval?
    ) async throws -> (URL, HTTPURLResponse) {
        let requestId = trace.requestId

        let destination: DownloadRequest.Destination = { _, _ in
            (destinationURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        let download = session.download(
            absoluteURL,
            method: .get,
            headers: headers,
            requestModifier: timeout.map { t in
                { (req: inout URLRequest) in
                    req.timeoutInterval = t
                }
            },
            to: destination
        )

        store(requestId: requestId, request: download)

        do {
            defer { remove(requestId: requestId) }

            let fileURL = try await download.serializingDownloadedFileURL().value
            guard let response = download.response else {
                throw JobsError.transport(underlying: URLError(.badServerResponse))
            }
            return (fileURL, response)

        } catch is CancellationError {
            throw JobsError.cancelled

        } catch {
            if let afError = error as? AFError, afError.isExplicitlyCancelledError {
                throw JobsError.cancelled
            }
            throw JobsError.transport(underlying: error)
        }
    }

    func uploadMultipart(
        url: URL,
        method: HTTPMethod,
        headers: HTTPHeaders,
        form: [String: AnySendable],
        parts: [JobsMultipartPart],
        trace: JobsTrace,
        timeout: TimeInterval?
    ) async throws -> (Data, HTTPURLResponse) {
        let requestId = trace.requestId

        let upload = session.upload(
            multipartFormData: { mf in
                // form fields
                for (k, v) in form {
                    let s = v.stringValueForNetwork()
                    if let data = s.data(using: .utf8) {
                        mf.append(data, withName: k)
                    }
                }
                // files
                for p in parts {
                    mf.append(
                        p.data,
                        withName: p.name,
                        fileName: p.fileName,
                        mimeType: p.mimeType
                    )
                }
            },
            to: url,
            method: Alamofire.HTTPMethod(rawValue: method.rawValue),
            headers: headers,
            // Per-request timeout override (Alamofire doesn't expose Session's configuration on Request).
            requestModifier: timeout.map { t in
                { (req: inout URLRequest) in
                    req.timeoutInterval = t
                }
            }
        )


        store(requestId: requestId, request: upload)

        do {
            defer { remove(requestId: requestId) }

            let data = try await upload.serializingData().value
            guard let response = upload.response else {
                throw JobsError.transport(underlying: URLError(.badServerResponse))
            }
            return (data, response)

        } catch is CancellationError {
            throw JobsError.cancelled

        } catch {
            if let afError = error as? AFError, afError.isExplicitlyCancelledError {
                throw JobsError.cancelled
            }
            throw JobsError.transport(underlying: error)
        }
    }

    func cancel(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId]?.cancel()
        requests[requestId] = nil
    }

    private func store(requestId: String, request: Request) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = request
    }

    private func remove(requestId: String) {
        lock.lock(); defer { lock.unlock() }
        requests[requestId] = nil
    }
}

// MARK: - AnySendable -> String helper
private extension AnySendable {
    func stringValueForNetwork() -> String {
        // 你白皮书里 AnySendable 是通用容器，这里做最保守的 string 化：
        if let s = self.value as? String { return s }
        if let n = self.value as? NSNumber { return n.stringValue }
        if let b = self.value as? Bool { return b ? "true" : "false" }
        if let i = self.value as? Int { return String(i) }
        if let d = self.value as? Double { return String(d) }
        return String(describing: self.value)
    }
}
