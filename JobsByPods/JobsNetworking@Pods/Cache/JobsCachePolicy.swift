import Foundation

public enum JobsCachePolicy: Sendable {
    /// 不使用缓存
    case none
    /// 仅缓存（命中则直接返回；不发网络）
    case cacheOnly(ttl: TimeInterval)
    /// 先 memory/disk 缓存，没命中再走网络并写入缓存
    case cacheThenNetwork(ttl: TimeInterval)
    /// 先返回缓存（若命中），同时再发网络更新（通过 onUpdate 回调通知）
    case memoryThenNetwork(ttl: TimeInterval)
}
