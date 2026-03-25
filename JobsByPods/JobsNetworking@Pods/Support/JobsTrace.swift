import Foundation

public struct JobsTrace: Sendable {
    public var requestId: String
    public var traceId: String
    public var spanId: String

    public init(
        requestId: String = UUID().uuidString,
        traceId: String = UUID().uuidString,
        spanId: String = UUID().uuidString
    ) {
        self.requestId = requestId
        self.traceId = traceId
        self.spanId = spanId
    }
}
