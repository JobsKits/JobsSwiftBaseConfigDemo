import Foundation

public struct Period: Sendable, Equatable, Comparable {
    public let timeInterval: TimeInterval

    public init(_ timeInterval: TimeInterval) {
        self.timeInterval = max(0, timeInterval)
    }

    public static func < (lhs: Period, rhs: Period) -> Bool {
        lhs.timeInterval < rhs.timeInterval
    }

    public var isNegative: Bool { timeInterval < 0 }
}

public extension Int {
    var milliseconds: Period { Period(Double(self) / 1000.0) }
    var seconds: Period { Period(Double(self)) }
}

public extension Double {
    var milliseconds: Period { Period(self / 1000.0) }
    var seconds: Period { Period(self) }
}

public extension Date {
    func adding(_ period: Period) -> Date {
        addingTimeInterval(period.timeInterval)
    }
}
