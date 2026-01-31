import Foundation

/// Download request wrapper used by the demo (absolute url + destination file url).
public struct JobsDownloadRequest: Sendable {
    public var absoluteURL: URL
    public var destinationURL: URL
    public var headers: [String: String]
    public var timeout: TimeInterval?
    public var trace: JobsTrace

    public init(
        absoluteURL: URL,
        destinationURL: URL,
        headers: [String: String] = [:],
        timeout: TimeInterval? = nil,
        trace: JobsTrace = JobsTrace()
    ) {
        self.absoluteURL = absoluteURL
        self.destinationURL = destinationURL
        self.headers = headers
        self.timeout = timeout
        self.trace = trace
    }
}
