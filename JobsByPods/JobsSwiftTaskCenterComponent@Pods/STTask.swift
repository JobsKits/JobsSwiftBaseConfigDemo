import Foundation
import JobsSwiftTimer

public final class STTask {
    public typealias Action = @Sendable (STTask) -> Void

    private let lock = NSLock()
    private let queue: DispatchQueue
    private let runLoopMode: RunLoop.Mode?
    private var iterator: AnyIterator<Period>
    private var actions: [UUID: Action] = [:]
    private var timer: JobsSwiftTimerProtocol?
    private var state: State = .idle
    private var generation: UInt64 = 0

    public private(set) var executionCount: Int = 0
    public private(set) var estimatedNextExecutionDate: Date?

    private enum State {
        case idle
        case running
        case suspended
        case cancelled
        case finished
    }

    public init(
        plan: Plan,
        queue: DispatchQueue? = nil,
        runLoopMode: RunLoop.Mode? = nil,
        action: @escaping Action
    ) {
        self.iterator = plan.makeIterator()
        self.queue = queue ?? .main
        self.runLoopMode = runLoopMode
        let token = UUID()
        self.actions[token] = action
        scheduleInitialIfNeeded()
    }

    deinit {
        cancel()
    }

    @discardableResult
    public func addAction(_ action: @escaping Action) -> UUID {
        let id = UUID()
        lock.lock()
        actions[id] = action
        lock.unlock()
        return id
    }

    public func removeAction(_ id: UUID) {
        lock.lock()
        actions.removeValue(forKey: id)
        lock.unlock()
    }

    public func suspend() {
        lock.lock()
        guard state == .running else {
            lock.unlock()
            return
        }
        state = .suspended
        let timer = self.timer
        lock.unlock()
        timer?.pause()
    }

    public func resume() {
        lock.lock()
        switch state {
        case .suspended:
            state = .running
            let timer = self.timer
            lock.unlock()
            timer?.resume()
        case .idle:
            lock.unlock()
            scheduleInitialIfNeeded()
        default:
            lock.unlock()
        }
    }

    public func cancel() {
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        state = .cancelled
        let timer = self.timer
        self.timer = nil
        estimatedNextExecutionDate = nil
        lock.unlock()
        timer?.stop()
    }

    public func executeNow() {
        let snapshot: [Action]
        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        executionCount += 1
        snapshot = Array(actions.values)
        lock.unlock()
        snapshot.forEach { $0(self) }
    }

    private func scheduleInitialIfNeeded() {
        lock.lock()
        guard state == .idle else {
            lock.unlock()
            return
        }
        let next = iterator.next()
        guard let next, !next.isNegative else {
            state = .finished
            lock.unlock()
            return
        }
        state = .running
        generation &+= 1
        let generation = self.generation
        estimatedNextExecutionDate = Date().adding(next)
        lock.unlock()
        installTimer(after: next, generation: generation)
    }

    private func scheduleNextExecution() {
        lock.lock()
        guard state == .running else {
            lock.unlock()
            return
        }
        let next = iterator.next()
        guard let next, !next.isNegative else {
            state = .finished
            let oldTimer = timer
            timer = nil
            estimatedNextExecutionDate = nil
            lock.unlock()
            oldTimer?.stop()
            return
        }
        generation &+= 1
        let generation = self.generation
        estimatedNextExecutionDate = Date().adding(next)
        let oldTimer = timer
        timer = nil
        lock.unlock()

        oldTimer?.stop()
        installTimer(after: next, generation: generation)
    }

    private func installTimer(after interval: Period, generation: UInt64) {
        let config = JobsSwiftTimerConfig(
            interval: interval.timeInterval,
            repeats: false,
            queue: queue,
            runLoop: .main,
            runLoopMode: runLoopMode ?? .common,
            pauseInBackground: false,
            autoManageAppState: false
        )

        let kind: JobsTimerKind = runLoopMode == nil ? .gcd : .runLoop
        let oneShot = JobsTimer(kind: kind, config: config) { [weak self] in
            self?.handleTimerFired(generation: generation)
        }

        lock.lock()
        guard state != .cancelled else {
            lock.unlock()
            return
        }
        timer = oneShot
        lock.unlock()

        if kind == .gcd {
            oneShot.start()
        } else if Thread.isMainThread {
            oneShot.start()
        } else {
            DispatchQueue.main.async {
                oneShot.start()
            }
        }
    }

    private func handleTimerFired(generation: UInt64) {
        let shouldContinue: Bool
        lock.lock()
        shouldContinue = state == .running && self.generation == generation
        lock.unlock()
        guard shouldContinue else { return }
        scheduleNextExecution()
        executeNow()
    }
}
