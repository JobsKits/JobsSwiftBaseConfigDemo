//
//  JobsRequestToken.swift
//  JobsNetworking
//
//  Created by Jobs on 31/1/26.
//

import Foundation

public final class JobsRequestToken {
    private let lock = NSLock()
    private var isCancelled = false
    private var cancelImpl: (() -> Void)?

    public init(cancelImpl: (() -> Void)? = nil) {
        self.cancelImpl = cancelImpl
    }

    public func setCancel(_ impl: @escaping () -> Void) {
        lock.lock(); defer { lock.unlock() }
        cancelImpl = impl
    }

    public func cancel() {
        lock.lock()
        if isCancelled { lock.unlock(); return }
        isCancelled = true
        let impl = cancelImpl
        lock.unlock()
        impl?()
    }

    deinit { cancel() }
}
