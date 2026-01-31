import Foundation

public struct JobsTrace: Sendable {
    public let requestId: String
    public let traceId: String

    public init(requestId: String = UUID().uuidString, traceId: String = UUID().uuidString) {
        self.requestId = requestId
        self.traceId = traceId
    }
}
