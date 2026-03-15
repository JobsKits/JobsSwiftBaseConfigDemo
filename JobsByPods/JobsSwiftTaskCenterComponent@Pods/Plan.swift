import Foundation

public struct Plan: Sequence, Sendable {
    public typealias Element = Period
    private let builder: @Sendable () -> AnyIterator<Period>

    public init(builder: @escaping @Sendable () -> AnyIterator<Period>) {
        self.builder = builder
    }

    public func makeIterator() -> AnyIterator<Period> {
        builder()
    }

    public static func make(_ builder: @escaping @Sendable () -> AnyIterator<Period>) -> Plan {
        Plan(builder: builder)
    }

    public static func every(
        _ interval: Period,
        initialDelay: Period = .zero,
        repeatCount: Int? = nil,
        fireImmediately: Bool = false
    ) -> Plan {
        Plan.make {
            var emitted = 0
            var hasEmittedImmediate = !fireImmediately
            var shouldEmitInitialDelay = !initialDelay.isZero
            return AnyIterator {
                if let repeatCount, emitted >= repeatCount { return nil }
                emitted += 1

                if fireImmediately && !hasEmittedImmediate {
                    hasEmittedImmediate = true
                    return .zero
                }

                if shouldEmitInitialDelay {
                    shouldEmitInitialDelay = false
                    return initialDelay
                }

                return interval
            }
        }
    }

    public static func after(_ delay: Period) -> Plan {
        Plan.make {
            var fired = false
            return AnyIterator {
                guard !fired else { return nil }
                fired = true
                return delay
            }
        }
    }

    public func concat(_ other: Plan) -> Plan {
        Plan.make {
            var lhs = self.makeIterator()
            var rhs = other.makeIterator()
            var useRHS = false
            return AnyIterator {
                if !useRHS, let next = lhs.next() { return next }
                useRHS = true
                return rhs.next()
            }
        }
    }

    @discardableResult
    public func `do`(action: @escaping @Sendable () -> Void) -> STTask {
        STTask(plan: self, queue: .main) { _ in action() }
    }

    @discardableResult
    public func `do`(queue: DispatchQueue, action: @escaping @Sendable () -> Void) -> STTask {
        STTask(plan: self, queue: queue) { _ in action() }
    }

    @discardableResult
    public func `do`(mode: RunLoop.Mode, action: @escaping @Sendable () -> Void) -> STTask {
        STTask(plan: self, queue: .main, runLoopMode: mode) { _ in action() }
    }
}
