//
//  TimerFixture.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

/// 为 macOS Foundation 回归提供基于 GCD 的最小计时驱动，供 Task / Worker 状态机测试使用。
/// 由上级目录 run_regressions.rb 与真实计时器配置、枚举和协议一起编译为测试用 JobsSwiftTimer 模块。
/// 不验证生产 JobsTimer 的各内核、RunLoop 或 UI 绑定；不得加入主 App 或替代生产计时器。
public final class JobsTimer: JobsSwiftTimerProtocol {
    private let lock = NSLock()
    private let config: JobsSwiftTimerConfig
    private var handler: JobsTimerCallback
    private var finish: JobsTimerCallback?
    private var source: DispatchSourceTimer?
    public var requiresMainThreadLifecycle: Bool { false }
    public var isRunning: Bool {
        lock.lock()
        defer { lock.unlock() }
        return source != nil
    }
    public init(kind: JobsTimerKind, config: JobsSwiftTimerConfig, handler: @escaping JobsTimerCallback) {
        self.config = config.normalized
        self.handler = handler
    }
    @discardableResult
    public func start() -> Self {
        lock.lock()
        guard source == nil else {
            lock.unlock()
            return self
        }
        let timer = DispatchSource.makeTimerSource(queue: config.queue)
        source = timer
        timer.schedule(deadline: .now() + config.interval, repeating: config.repeats ? config.interval : .infinity)
        timer.setEventHandler { [weak self] in self?.fire() }
        timer.resume()
        lock.unlock()
        return self
    }
    private func fire() {
        lock.lock()
        guard source != nil else {
            lock.unlock()
            return
        }
        let action = handler
        let completion = finish
        lock.unlock()
        if !config.repeats { stop() }
        action()
        if !config.repeats { completion?() }
    }
    @discardableResult
    public func pause() -> Self { stop() }
    @discardableResult
    public func resume() -> Self { start() }
    @discardableResult
    public func stop() -> Self {
        lock.lock()
        let timer = source
        source = nil
        lock.unlock()
        timer?.cancel()
        return self
    }
    @discardableResult
    public func fireOnce() -> Self {
        fire()
        return self
    }
    @discardableResult
    public func onTick(_ block: @escaping JobsTimerCallback) -> Self {
        lock.lock()
        handler = block
        lock.unlock()
        return self
    }
    @discardableResult
    public func onFinish(_ block: @escaping JobsTimerCallback) -> Self {
        lock.lock()
        finish = block
        lock.unlock()
        return self
    }
    deinit { source?.cancel() }
}
