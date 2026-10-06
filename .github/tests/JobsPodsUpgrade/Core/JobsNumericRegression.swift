//
//  JobsNumericRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation
import ObjectiveC

private var formatterCaptureKey: UInt8 = 0

private final class NumericReleaseCapture {
    let onRelease: () -> Void
    init(_ onRelease: @escaping () -> Void) {
        self.onRelease = onRelease
    }
    deinit {
        onRelease()
    }
}

private final class WeakNumericCapture {
    weak var value: AnyObject?
    init(_ value: AnyObject) {
        self.value = value
    }
}

private final class ReentrantReporter: SafeCodableReporting {
    func report(_ event: SafeCodableEvent) {}
    deinit {
        _ = SafeCodableReportCenter.shared
    }
}

private final class ClockResults: @unchecked Sendable {
    private let lock = NSLock()
    private var stale: UInt64?
    private var current: UInt64?
    func record(_ value: UInt64?, staleSample: Bool) {
        lock.lock()
        if staleSample {
            stale = value
        } else {
            current = value
        }
        lock.unlock()
    }
    var rejectsRollback: Bool {
        lock.lock()
        defer { lock.unlock() }
        return current != nil && stale == nil
    }
}

private final class ProbeDefaults: UserDefaults {
    var stored: Int = 0
    override func object(forKey defaultName: String) -> Any? { stored }
}

private struct TimestampFields: Decodable {
    @SafeCodable var numeric: Date
    @SafeCodable var text: Date
    @SafeCodable var seconds: Date
}

@main
struct JobsNumericRegression {
    static func main() throws {
        verifyStorageAndClockReentry()
        let decoder = JSONDecoder()
        for value in ["1e100", "-1e100", "9223372036854775808", "-9223372036854775809"] {
            let result = try decoder.decode(SafeCodable<Int>.self, from: Data(value.utf8))
            precondition(result.wrappedValue == 0, "out-of-range Int must default: \(value)")
        }
        let fraction = try decoder.decode(SafeCodable<Int>.self, from: Data("12.9".utf8))
        precondition(fraction.wrappedValue == 12)
        for boundary in [Int.min, Int.max] {
            let result = try decoder.decode(SafeCodable<Int>.self, from: Data(String(boundary).utf8))
            precondition(result.wrappedValue == boundary)
        }
        for strategy in [
            JSONDecoder.DateDecodingStrategy.deferredToDate, .iso8601, .secondsSince1970, .millisecondsSince1970,
        ] {
            decoder.dateDecodingStrategy = strategy
            for unit in [SafeCodableTimestampUnit.seconds, .milliseconds, .automatic] {
                decoder.userInfo[.safeCodableTimestampUnits] = ["": unit]
                let number = unit == .seconds ? "1700000000" : "1700000000000"
                let numeric = try decoder.decode(SafeCodable<Date>.self, from: Data(number.utf8))
                let string = try decoder.decode(SafeCodable<Date>.self, from: Data("\"\(number)\"".utf8))
                precondition(numeric.wrappedValue == string.wrappedValue)
                precondition(numeric.wrappedValue.timeIntervalSince1970 == 1_700_000_000)
            }
        }
        decoder.userInfo.removeAll()
        var config = SafeCodableConfig()
        config.timestampUnit = .seconds
        decoder.userInfo[.safeCodableConfig] = config
        decoder.userInfo[.safeCodableTimestampUnits] = [
            "numeric": SafeCodableTimestampUnit.milliseconds, "text": .milliseconds,
        ]
        let fields = try decoder.decode(
            TimestampFields.self,
            from: Data(#"{"numeric":1700000000000,"text":"1700000000000","seconds":1700000000}"#.utf8))
        precondition(fields.numeric == fields.text && fields.text == fields.seconds)
        precondition(fields.numeric.timeIntervalSince1970 == 1_700_000_000)
        decoder.userInfo.removeAll()
        decoder.dateDecodingStrategy = .secondsSince1970
        let native = try decoder.decode(SafeCodable<Date>.self, from: Data("1700000000".utf8))
        precondition(native.wrappedValue.timeIntervalSince1970 == 1_700_000_000)
        let defaults = ProbeDefaults()
        for value in [-1, 0, Int(UInt32.max), Int(UInt32.max) + 1, Int.max] {
            defaults.stored = value
            precondition(defaults.uint32(forKey: "probe") == UInt32(exactly: value))
        }
        var escaped: [Int].Builder?
        let result: [Int] = .build { builder in
            escaped = builder
            builder.addBy(1).addBy(2)
        }
        escaped?.addBy(3)
        precondition(result == [1, 2], "escaped Builder must not mutate returned value")
        precondition(UInt64.max.byMinuteSecondCN.contains("时"))
        precondition(Int8.max.byMinuteSecondCN == "2分07秒")
        precondition(Int64.min.byMinuteSecondCN == "0秒")
        precondition(SnowflakeSwift(validatingPublishMillisecond: 1000, IDCID: 32, machineID: 0) == nil)
        precondition(SnowflakeSwift(publishMillisecond: 1000, IDCID: 32, machineID: 0).nextID() == nil)
        var now: UInt64 = 1000
        let fixed = SnowflakeSwift(publishMillisecond: 1000, IDCID: 31, machineID: 31, clock: { now })
        var ids = Set<UInt64>()
        for _ in 0..<4096 { precondition(ids.insert(fixed.nextID()!).inserted) }
        precondition(fixed.nextID() == nil, "sequence exhaustion must return without busy wait")
        now = 999
        precondition(fixed.nextID() == nil)
        now = 1001
        let resumed = fixed.nextID()!
        precondition(fixed.IDC(id: resumed) == 31 && fixed.machine(id: resumed) == 31)
        let concurrent = SnowflakeSwift(IDCID: 1, machineID: 2)
        let lock = NSLock()
        var accepted = Set<UInt64>()
        var duplicate = false
        DispatchQueue.concurrentPerform(iterations: 20_000) { _ in
            guard let id = concurrent.nextID() else { return }
            lock.lock()
            if !accepted.insert(id).inserted { duplicate = true }
            lock.unlock()
        }
        precondition(!duplicate && !accepted.isEmpty)
        print("Jobs numeric/date/builder/Snowflake regression checks passed (\(accepted.count) concurrent IDs)")
    }

    private static func installReporter() -> WeakNumericCapture {
        let reporter = ReentrantReporter()
        SafeCodableReportCenter.shared = reporter
        return WeakNumericCapture(reporter)
    }

    private static func installFormatterCapture() -> WeakNumericCapture {
        let owner = NumericReleaseCapture { _ = SafeCodableConfig.shared }
        let formatter = DateFormatter()
        objc_setAssociatedObject(formatter, &formatterCaptureKey, owner, .OBJC_ASSOCIATION_RETAIN)
        var config = SafeCodableConfig()
        config.customDateFormatters = [formatter]
        SafeCodableConfig.shared = config
        return WeakNumericCapture(owner)
    }

    private static func verifyStorageAndClockReentry() {
        let savedConfig = SafeCodableConfig.shared
        let savedReporter = SafeCodableReportCenter.shared
        let reporter = installReporter()
        SafeCodableReportCenter.shared = savedReporter
        precondition(reporter.value == nil)
        let formatter = installFormatterCapture()
        SafeCodableConfig.shared = savedConfig
        precondition(formatter.value == nil)

        weak var generator: SnowflakeSwift?
        var didReenter = false
        var innerID: UInt64?
        let reentrant = SnowflakeSwift(publishMillisecond: 1000, IDCID: 0, machineID: 0, clock: {
            if !didReenter {
                didReenter = true
                innerID = generator?.nextID()
            }
            return 1000
        })
        generator = reentrant
        let outerID = reentrant.nextID()
        precondition(innerID != nil && outerID != nil && innerID != outerID)

        let clockLock = NSLock()
        var calls = 0
        let firstEntered = DispatchSemaphore(value: 0)
        let releaseFirst = DispatchSemaphore(value: 0)
        let firstFinished = DispatchSemaphore(value: 0)
        let secondFinished = DispatchSemaphore(value: 0)
        let results = ClockResults()
        let reversed = SnowflakeSwift(publishMillisecond: 1000, IDCID: 0, machineID: 0, clock: {
            clockLock.lock()
            let index = calls
            calls += 1
            clockLock.unlock()
            if index == 0 {
                firstEntered.signal()
                precondition(releaseFirst.wait(timeout: .now() + 3) == .success)
                return 1000
            }
            return 1001
        })
        DispatchQueue.global().async {
            results.record(reversed.nextID(), staleSample: true)
            firstFinished.signal()
        }
        precondition(firstEntered.wait(timeout: .now() + 3) == .success)
        DispatchQueue.global().async {
            results.record(reversed.nextID(), staleSample: false)
            secondFinished.signal()
        }
        precondition(secondFinished.wait(timeout: .now() + 3) == .success)
        releaseFirst.signal()
        precondition(firstFinished.wait(timeout: .now() + 3) == .success)
        precondition(results.rejectsRollback, "late locking of an older clock sample must reject rollback")
    }
}
