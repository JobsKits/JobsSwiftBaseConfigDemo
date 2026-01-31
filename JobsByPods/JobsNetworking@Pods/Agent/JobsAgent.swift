import Foundation

public protocol JobsAgent: Sendable {
    var config: JobsRequestConfig { get }
    var headerHook: JobsHeaderHook { get }

    /// 推荐主路径：async/await
    func send<T: Decodable>(_ request: JobsRequest, as type: T.Type) async throws -> T

    /// 兼容入口：closure API
    @discardableResult
    func send<T: Decodable>(_ request: JobsRequest, as type: T.Type, completion: @escaping @Sendable (Result<T, JobsError>) -> Void) -> JobsRequestToken
}

/// 取消语义载体
public final class JobsRequestToken: @unchecked Sendable {
    private let lock = NSLock()
    private var isCancelled = false
    private var cancelImpl: (() -> Void)?

    // If your project/module is built with `-default-isolation MainActor`, this type becomes
    // implicitly MainActor-isolated. Mark the members we call from nonisolated contexts as
    // `nonisolated` to avoid "Call to main actor-isolated ..." warnings/errors.
    public nonisolated init(cancelImpl: (() -> Void)? = nil) {
        self.cancelImpl = cancelImpl
    }

    public nonisolated func setCancel(_ impl: @escaping () -> Void) {
        lock.lock(); defer { lock.unlock() }
        cancelImpl = impl
    }

    public nonisolated func cancel() {
        lock.lock()
        let impl = cancelImpl
        if isCancelled { lock.unlock(); return }
        isCancelled = true
        lock.unlock()
        impl?()
    }

    deinit { cancel() }
}
