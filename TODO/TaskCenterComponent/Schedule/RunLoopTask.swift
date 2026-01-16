import Foundation

extension Plan {

    /// Schedules a task with this plan.
    ///
    /// When time is up, the task will be executed on current thread. It behaves
    /// like a `Timer`, so you need to make sure that the current thread has a
    /// available runloop.
    ///
    /// Since this method relies on run loop, it is remove recommended to use
    /// `do(queue: _, onElapse: _)`.
    ///
    /// - Parameters:
    ///   - mode: The mode to which the action should be added.
    ///   - action: A block to be executed when time is up.
    /// - Returns: The task just created.
    public func `do`(
        mode: RunLoop.Mode = RunLoop.Mode.common,
        action: @escaping (STTask) -> Void
    ) -> STTask {
        return RunLoopTask(plan: self, mode: mode, action: action)
    }

    /// Schedules a task with this plan.
    ///
    /// When time is up, the task will be executed on current thread. It behaves
    /// like a `Timer`, so you need to make sure that the current thread has a
    /// available runloop.
    ///
    /// Since this method relies on run loop, it is remove recommended to use
    /// `do(queue: _, onElapse: _)`.
    ///
    /// - Parameters:
    ///   - mode: The mode to which the action should be added.
    ///   - action: A block to be executed when time is up.
    /// - Returns: The task just created.
    public func `do`(
        mode: RunLoop.Mode =  RunLoop.Mode.common,
        action: @escaping () -> Void
    ) -> STTask {
        return self.do(mode: mode) { _ in
            action()
        }
    }
}

private final class RunLoopTask: STTask {

    class InternalRunLoopTask: NSObject {
        lazy var thread: Thread = { [weak self] in
            let thread = Thread.init(target: self, selector: #selector(threadAction), object: nil)
            thread.name = "runloop.task.thread"
            return thread
        }()

        private var mode: RunLoop.Mode
        var action: ((STTask) -> Void)!
        weak var _task: STTask?

        private override init() {
            self.mode = RunLoop.Mode.common
            super.init()
        }

        convenience init(mode: RunLoop.Mode, action: @escaping (STTask) -> Void) {
            self.init()
            self.mode = mode
            self.action = action
            self.thread.start()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        @objc private func threadAction() {
            RunLoop.current.add(NSMachPort(), forMode: mode)// add(timer, forMode: mode)
            RunLoop.current.run()
        }

        func notifyExeAction(for task: STTask) {
            self._task = task
            self.perform(#selector(exeAction), on: self.thread, with: nil, waitUntilDone: false)
        }

        @objc private func exeAction() {
           debugPrint(Thread.current.name ?? "none")
            guard let task = self._task else {return}
            self.action(task)
        }
    }

    let _runLoopTask: InternalRunLoopTask

    init(
        plan: Plan,
        mode: RunLoop.Mode,
        action: @escaping (STTask) -> Void
        ) {
        self._runLoopTask = InternalRunLoopTask(mode: mode, action: action)
        super.init(plan: plan, queue: DispatchQueue.init(label: "swift.taskcenter.timer.queue")) { (task) in
            guard let task = task as? RunLoopTask else { return }
            task._runLoopTask.notifyExeAction(for: task)
        }
//        _runLoopTask.notifyExeAction(for: self)
    }
}
