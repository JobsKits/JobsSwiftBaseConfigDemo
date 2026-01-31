import Foundation

public struct JobsRetryPolicy: Sendable {
    public var maxRetries: Int
    public var initialDelay: TimeInterval
    public var multiplier: Double
    public var jitter: ClosedRange<Double>

    public init(maxRetries: Int, initialDelay: TimeInterval, multiplier: Double, jitter: ClosedRange<Double> = 0.8...1.2) {
        self.maxRetries = maxRetries
        self.initialDelay = initialDelay
        self.multiplier = multiplier
        self.jitter = jitter
    }

    public static let `default` = JobsRetryPolicy(maxRetries: 2, initialDelay: 0.3, multiplier: 2.0)
}
