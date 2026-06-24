//
//  JobsSwiftTimer.swift
//  JobsSwiftTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import QuartzCore // CADisplayLink
import os.lock
// MARK: - JobsUnfairLock
final class JobsUnfairLock {
    private var lock = os_unfair_lock_s()

    @inline(__always)
    func jobs_withLock<T>(_ block: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) };return try block()
    }
}
// MARK: - JobsSwiftTimer
///
/// ✅ 更“狠”的规则（最终版）
/// - 非 GCD 内核（foundation/runLoop/displayLink）强制：只能主线程 + RunLoop.main
/// - RunLoop/DisplayLink 生命周期操作必须主线程
/// - 回调类型统一为 @Sendable
/// - stop 后 late event：generation token 防穿透
/// - ✅ 修复：GCD suspend/cancel 平衡（不会炸）
/// - ✅ 修复：one-shot 在非 main queue 上 stop 的主线程路由（不会炸）
public final class JobsTimer: JobsSwiftTimerProtocol {
    // MARK: - State
    private enum State: Equatable {
        case idle
        case running
        case paused
        case stopped
    }
    // MARK: - Public
    public var isRunning: Bool {
        stateLock.jobs_withLock { state == .running }
    }
    // MARK: - Private
    private let kind: JobsTimerKind
    private let config: JobsSwiftTimerConfig

    private let stateLock = JobsUnfairLock()
    private var state: State = .idle
    /// generation token：状态变更递增，用于防止残留回调穿透
    private var generation: UInt64 = 0

    private var tickBlock: JobsTimerCallback
    private var finishBlock: JobsTimerCallback?
    // Underlying engines
    private var gcdTimer: DispatchSourceTimer?
    private var gcdIsSuspended: Bool = false

    private var foundationTimer: Timer?
    private var displayLink: CADisplayLink?
    private var rlTimer: CFRunLoopTimer?

    #if canImport(UIKit)
    private var appState: JobsAppStateManager?
    #endif
    // MARK: - Thread constraints
    @inline(__always)
    private func requireMainThreadForRunLoopAPI(_ reason: String) {
        precondition(
            Thread.isMainThread,
            "JobsTimer: \(reason) must be called on main thread (RunLoop/DisplayLink are thread-affine)."
        )
    }

    @inline(__always)
    private func requireMainRunLoopForNonGCD() {
        precondition(
            config.runLoop == .main,
            "JobsTimer: kind=\(kind) currently only supports RunLoop.main (RunLoop APIs are thread-affine)."
        )
    }
    // MARK: - Init
    public init(
        kind: JobsTimerKind,
        config: JobsSwiftTimerConfig,
        handler: @escaping JobsTimerCallback
    ) {
        self.kind = kind
        self.config = config
        self.tickBlock = handler

        if kind != .gcd {
            requireMainRunLoopForNonGCD()
            precondition(Thread.isMainThread, "JobsTimer: init(kind=\(kind)) must be called on main thread.")
        }

        setupAppStateIfNeeded()
    }

    deinit {
        stop()
        teardownAppState()
    }
    // MARK: - JobsSwiftTimerProtocol
    /// 启动计时器
    @discardableResult
    public func start() -> Self {
        if kind != .gcd { requireMainThreadForRunLoopAPI("start") }

        let token = stateLock.jobs_withLock { () -> UInt64? in
            switch state {
            case .running:
                return nil
            case .paused, .idle:
                generation &+= 1
                state = .running
                return generation
            case .stopped:
                return nil
            }
        }
        guard let token else { return self }

        switch kind {
        case .gcd:
            startGCD(token: token)
        case .foundation:
            startFoundationTimer(token: token)
        case .displayLink:
            startDisplayLink(token: token)
        case .runLoop:
            startRunLoopTimer(token: token)
        };return self
    }
    /// 暂停计时器
    @discardableResult
    public func pause() -> Self{
        if kind != .gcd { requireMainThreadForRunLoopAPI("pause") }

        let shouldPause = stateLock.jobs_withLock { () -> Bool in
            guard state == .running else { return false }
            state = .paused
            generation &+= 1
            return true
        }
        guard shouldPause else { return self}

        switch kind {
        case .gcd:
            pauseGCD()
        case .foundation:
            foundationTimer?.invalidate()
            foundationTimer = nil
        case .displayLink:
            displayLink?.invalidate()
            displayLink = nil
        case .runLoop:
            if let t = rlTimer {
                CFRunLoopTimerInvalidate(t)
                rlTimer = nil
            }
        };return self
    }
    /// 恢复计时器
    @discardableResult
    public func resume() -> Self{
        if kind != .gcd { requireMainThreadForRunLoopAPI("resume") }

        let token = stateLock.jobs_withLock { () -> UInt64? in
            guard state == .paused else { return nil }
            state = .running
            generation &+= 1
            return generation
        }
        guard let token else { return self}

        switch kind {
        case .gcd:
            resumeGCD()
        case .foundation:
            startFoundationTimer(token: token)
        case .displayLink:
            startDisplayLink(token: token)
        case .runLoop:
            startRunLoopTimer(token: token)
        };return self
    }
    /// 停止计时器（销毁@有回调）
    @discardableResult
    public func fireOnce() -> Self {
        // 非 GCD：RunLoop/DisplayLink/Foundation 的 invalidate 必须主线程做
        if kind != .gcd, !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                _ = self?.fireOnce()
            };return self
        }

        let (shouldStop, finish) = stateLock.jobs_withLock { () -> (Bool, JobsTimerCallback?) in
            guard state != .stopped else { return (false, nil) }
            state = .stopped
            generation &+= 1
            return (true, finishBlock)
        }
        guard shouldStop else { return self }
        // 真正销毁底层 timer
        stopInternal()
        // “有回调”：补一次 finish
        if let finish {
            config.queue.async { finish() }
        };return self
    }
    /// 停止计时器（销毁@无回调）
    @discardableResult
    public func stop() -> Self{
        if kind != .gcd {
            // 外部 stop 强制主线程；内部（比如 one-shot）会走 routeStopIfNeeded
            requireMainThreadForRunLoopAPI("stop")
        }

        let shouldStop = stateLock.jobs_withLock { () -> Bool in
            guard state != .stopped else { return false }
            state = .stopped
            generation &+= 1
            return true
        }
        guard shouldStop else { return self}
        stopInternal()
        return self
    }
    /// 注册回调（每 tick 执行一次）
    @discardableResult
    public func onTick(_ block: @escaping JobsTimerCallback) -> Self {
        stateLock.jobs_withLock { tickBlock = block };return self
    }
    /// 注册完成回调（用于一次性定时器或倒计时）
    @discardableResult
    public func onFinish(_ block: @escaping JobsTimerCallback) -> Self {
        stateLock.jobs_withLock { finishBlock = block };return self
    }
    // MARK: - Stop internals
    private func stopInternal() {
        switch kind {
        case .gcd:
            stopGCDSafely()
        case .foundation:
            foundationTimer?.invalidate()
            foundationTimer = nil
        case .displayLink:
            displayLink?.invalidate()
            displayLink = nil
        case .runLoop:
            if let t = rlTimer {
                CFRunLoopTimerInvalidate(t)
                rlTimer = nil
            }
        }
    }

    private func routeStopIfNeededFromCallback() {
        
        if kind == .gcd {
            // GCD：不要求主线程
            stateLock.jobs_withLock {
                if state != .stopped {
                    state = .stopped
                    generation &+= 1
                }
            }
            stopInternal()
            return
        }
        // 非 GCD：必须主线程 stop
        if Thread.isMainThread {
            stop()
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.stop()
            }
        }
    }
    // MARK: - Dispatch
    private func fireTickIfValid(token: UInt64) {
        let snapshot = stateLock.jobs_withLock { () -> (shouldFire: Bool,
                                                        tick: JobsTimerCallback,
                                                        finish: JobsTimerCallback?,
                                                        repeats: Bool) in
            guard state == .running, token == generation else {
                return (false, {}, nil, config.repeats)
            };return (true, tickBlock, finishBlock, config.repeats)
        }

        guard snapshot.shouldFire else { return }

        // tick 在 config.queue 执行
        config.queue.async {
            snapshot.tick()
        }

        if !snapshot.repeats {
            // one-shot：触发一次后结束（注意：非 GCD stop 必须回主线程）
            routeStopIfNeededFromCallback()

            if let finish = snapshot.finish {
                config.queue.async { finish() }
            }
        }
    }
    // MARK: - GCD Timer
    private func startGCD(token: UInt64) {
        // 重建更干净：避免 resume/suspend 计数错乱
        stopGCDSafely()

        let t = DispatchSource.makeTimerSource(queue: config.queue)
        t.schedule(
            deadline: .now() + config.interval,
            repeating: config.interval,
            leeway: .milliseconds(Int(config.tolerance * 1000.0))
        )
        t.setEventHandler { [weak self] in
            self?.fireTickIfValid(token: token)
        }
        gcdTimer = t
        gcdIsSuspended = false
        t.resume()
    }

    private func pauseGCD() {
        guard let t = gcdTimer else { return }
        // 防重复 suspend
        if !gcdIsSuspended {
            gcdIsSuspended = true
            t.suspend()
        }
    }

    private func resumeGCD() {
        guard let t = gcdTimer else { return }
        if gcdIsSuspended {
            gcdIsSuspended = false
            t.resume()
        }
    }

    private func stopGCDSafely() {
        guard let t = gcdTimer else { return }

        // ✅ 关键：cancel 前必须平衡 suspend
        if gcdIsSuspended {
            gcdIsSuspended = false
            t.resume()
        }

        t.setEventHandler {}
        t.cancel()

        gcdTimer = nil
    }
    // MARK: - Foundation Timer（依赖 RunLoop）
    private func startFoundationTimer(token: UInt64) {
        requireMainThreadForRunLoopAPI("startFoundationTimer")
        requireMainRunLoopForNonGCD()

        let t = Timer(timeInterval: config.interval, repeats: config.repeats) { [weak self] _ in
            self?.fireTickIfValid(token: token)
        }
        t.tolerance = config.tolerance
        config.runLoop.add(t, forMode: config.runLoopMode)
        foundationTimer = t
    }
    // MARK: - CADisplayLink（主线程）
    private func startDisplayLink(token: UInt64) {
        requireMainThreadForRunLoopAPI("startDisplayLink")
        requireMainRunLoopForNonGCD()

        let proxy = DisplayLinkProxy { [weak self] in
            self?.fireTickIfValid(token: token)
        }

        let link = CADisplayLink(target: proxy, selector: #selector(DisplayLinkProxy.tick))
        link.add(to: config.runLoop, forMode: config.runLoopMode)
        displayLink = link
    }

    private final class DisplayLinkProxy: NSObject {
        private let onTick: JobsTimerCallback
        init(onTick: @escaping JobsTimerCallback) {
            self.onTick = onTick
        }
        @objc func tick() { onTick() }
    }
    // MARK: - CFRunLoopTimer（依赖 RunLoop）
    private func startRunLoopTimer(token: UInt64) {
        requireMainThreadForRunLoopAPI("startRunLoopTimer")
        requireMainRunLoopForNonGCD()

        let context = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        var ctx = CFRunLoopTimerContext(
            version: 0,
            info: context,
            retain: nil,
            release: nil,
            copyDescription: nil
        )

        let nextFire = CFAbsoluteTimeGetCurrent() + config.interval
        let interval = config.repeats ? config.interval : 0

        let timer = CFRunLoopTimerCreate(
            kCFAllocatorDefault,
            nextFire,
            interval,
            0,
            0,
            { (_, info) in
                guard let info else { return }
                let timerObj = Unmanaged<JobsTimer>.fromOpaque(info).takeUnretainedValue()
                let token = timerObj.stateLock.jobs_withLock { timerObj.generation }
                timerObj.fireTickIfValid(token: token)
            },
            &ctx
        )

        let cfRunLoop = config.runLoop.getCFRunLoop()
        let cfMode: CFRunLoopMode = (config.runLoopMode == .common)
            ? .commonModes
            : CFRunLoopMode(config.runLoopMode.rawValue as CFString)

        CFRunLoopAddTimer(cfRunLoop, timer, cfMode)

        stateLock.jobs_withLock { rlTimer = timer }

        #if canImport(UIKit)
        appState?.syncWithCurrentAppStateIfNeeded()
        #endif

        _ = context
    }
    // MARK: - App State (UIKit)
    private func setupAppStateIfNeeded() {
        #if canImport(UIKit)
        guard config.autoManageAppState else { return }

        appState = JobsAppStateManager(
            pauseInBackground: config.pauseInBackground,
            action: { [weak self] action in
                guard let self else { return }
                switch action {
                case .pause: self.pause()
                case .resume: self.resume()
                case .stop: self.stop()
                }
            }
        )
        #endif
    }

    private func teardownAppState() {
        #if canImport(UIKit)
        appState = nil
        #endif
    }
}

private enum JobsAppStateAction {
    case pause
    case resume
    case stop
}

private final class JobsAppStateManager {
    private let pauseInBackground: Bool
    private let action: @Sendable (JobsAppStateAction) -> Void

    init(
        pauseInBackground: Bool,
        action: @escaping @Sendable (JobsAppStateAction) -> Void
    ) {
        self.pauseInBackground = pauseInBackground
        self.action = action
        register()
    }

    deinit { unregister() }

    func syncWithCurrentAppStateIfNeeded() {
        #if canImport(UIKit)
        let state = UIApplication.shared.applicationState
        if state == .background || state == .inactive {
            if pauseInBackground { action(.pause) }
        }
        #endif
    }

    private func register() {
        #if canImport(UIKit)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
        #endif
    }

    private func unregister() {
        #if canImport(UIKit)
        NotificationCenter.default.removeObserver(self)
        #endif
    }

    @objc private func onDidEnterBackground() {
        if pauseInBackground { action(.pause) }
    }

    @objc private func onWillEnterForeground() {
        if pauseInBackground { action(.resume) }
    }
}
