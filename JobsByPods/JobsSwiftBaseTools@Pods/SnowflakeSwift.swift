//
//  SnowflakeSwift.swift
//  JobsSwiftBaseTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

import Foundation

public typealias SnowflakeID = UInt64
//The data structure: symbol(1)-time(41)-IDC(5)machine(5)-seq(12)
public struct SnowflakeConfig {
    //占位
    static let symbolBits: UInt32 = 1
    //时间长度
    static let timeBits: UInt32 = 41
    //机房ID
    static let IDCBits: UInt32 = 5
    //机器ID
    static let machineBits: UInt32 = 5
    //同一毫秒内序列所占长度
    static let sequenceBits: UInt32 = 12
}

public final class SnowflakeSwift {
    private let lock = NSLock()
    private let machine: UInt32
    private let IDC: UInt32
    private let publishMillisecond: UInt64
    private let clock: () -> UInt64?
    private var sequence: UInt32 = 0
    private var lastGeneralMillisecond: UInt64?
    public let isValid: Bool

    /// 兼容构造：非法节点不会别名，nextID 返回 nil。epoch 应为所有生成器共享固定值。
    public init(
        publishMillisecond: UInt64 = 1662278876498,
        IDCID: UInt32,
        machineID: UInt32,
        clock: @escaping () -> UInt64? = SnowflakeSwift.systemMilliseconds
    ) {
        self.publishMillisecond = publishMillisecond
        self.IDC = IDCID
        self.machine = machineID
        self.clock = clock
        self.isValid = IDCID < 32 && machineID < 32 && publishMillisecond <= UInt64.max - ((1 << 41) - 1)
    }

    /// 新调用使用可失败构造，在创建处处理非法节点或 epoch。
    public convenience init?(
        validatingPublishMillisecond publishMillisecond: UInt64 = 1662278876498,
        IDCID: UInt32,
        machineID: UInt32,
        clock: @escaping () -> UInt64? = SnowflakeSwift.systemMilliseconds
    ) {
        self.init(publishMillisecond: publishMillisecond, IDCID: IDCID, machineID: machineID, clock: clock)
        guard isValid else {
            return nil
        }
    }

    public static func systemMilliseconds() -> UInt64? {
        let milliseconds = Date().timeIntervalSince1970 * 1000
        return UInt64(exactly: milliseconds.rounded(.down))
    }
}

public extension SnowflakeSwift {
    /// 同实例线程安全。回拨、序列耗尽或时间越界时返回 nil，交由调用方稍后重试。
    func nextID() -> SnowflakeID? {
        guard isValid, let now = clock(), now >= publishMillisecond else {
            return nil
        }
        lock.lock()
        defer {
            lock.unlock()
        }
        let elapsed = now - publishMillisecond
        guard elapsed < (1 << 41) else {
            return nil
        }
        if let last = lastGeneralMillisecond {
            guard now >= last else {
                return nil
            }
            if now == last {
                guard sequence < 4095 else {
                    return nil
                }
                sequence += 1
            } else {
                sequence = 0
            }
        } else {
            sequence = 0
        }
        lastGeneralMillisecond = now
        return (elapsed << 22) | (UInt64(IDC) << 17) | (UInt64(machine) << 12) | UInt64(sequence)
    }

    func time(id: SnowflakeID) -> UInt64 {
        (id >> 22) + publishMillisecond
    }

    func IDC(id: SnowflakeID) -> UInt32 {
        UInt32((id >> 17) & 31)
    }

    func machine(id: SnowflakeID) -> UInt32 {
        UInt32((id >> 12) & 31)
    }
}
