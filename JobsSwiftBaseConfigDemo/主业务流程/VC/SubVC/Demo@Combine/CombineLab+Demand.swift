//
//  CombineLab+Demand.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Combine

extension CombineLab {
    static let advanced: [CombineLesson] = [
        .init(group: "十、背压与自定义", title: "Subscriber / Demand / 热流丢值", explanation: "需求量是增量，不是总量；receive 返回的需求会加到剩余额度。Passthrough 在需求为零时丢值，不负责缓存。", expected: "首次请求 1 得到 1；2 被丢弃；补充需求后得到 3") { lab in
            let source = PassthroughSubject<Int, Never>()
            let subscriber = CombineDemandSubscriber { [weak lab] in lab?.log($0) }
            lab.retained.append(subscriber)
            source.subscribe(subscriber)
            source.send(1)
            source.send(2)
            subscriber.request(.max(1))
            source.send(3)
            source.send(completion: .finished)
        },
        .init(group: "十、背压与自定义", title: "buffer / prefetch / whenFull", explanation: "buffer 用有限容量吸收上下游速率差；keepFull 主动补充上游需求，dropOldest 淘汰最老值。byRequest、dropNewest 和 customError 是其它策略。", expected: "先得到 1；缓冲溢出丢掉 2；补需求后得到 3、4") { lab in
            let source = PassthroughSubject<Int, Never>()
            let subscriber = CombineDemandSubscriber { [weak lab] in lab?.log($0) }
            lab.retained.append(subscriber)
            source.buffer(size: 2, prefetch: .keepFull, whenFull: .dropOldest).subscribe(subscriber)
            (1...4).forEach { source.send($0) }
            subscriber.request(.max(2))
            source.send(completion: .finished)
        },
        .init(group: "十、背压与自定义", title: "buffer 丢最新 / 溢出报错", explanation: "byRequest 的上游请求行为不能凭名字推断成零缓存；观察真实 demand。customError 在满缓冲时失败。", expected: "dropNewest 保留 2、3；customError 最终 failure") { lab in
            for fails in [false, true] {
                let source = PassthroughSubject<Int, CombineLabError>()
                let subscriber = CombineDemandSubscriberOf<CombineLabError> { [weak lab] in lab?.log("\(fails ? "error" : "newest") \($0)") }
                lab.retained.append(subscriber)
                let policy: Publishers.BufferingStrategy<CombineLabError> = fails ? .customError { .invalid } : .dropNewest
                source.buffer(size: 2, prefetch: .byRequest, whenFull: policy).subscribe(subscriber)
                (1...4).forEach { source.send($0) }
                subscriber.request(.max(3))
                source.send(completion: .finished)
            }
        },
        .init(group: "十、背压与自定义", title: "自定义 Publisher / Subscription", explanation: "每位订阅者拥有独立 Subscription，按 demand 发值；终止后清空下游，防止循环引用。实现支持同步重入 request 与 cancel。", expected: "初始 1；补需求后 2、3 并 finished；取消后无新值") { lab in
            let subscriber = CombineDemandSubscriber { [weak lab] in lab?.log($0) }
            lab.retained.append(subscriber)
            CombineCountPublisher(end: 3).subscribe(subscriber)
            subscriber.request(.max(2))
            subscriber.cancel()
            subscriber.request(.unlimited)
        },
        .init(group: "十、背压与自定义", title: "自定义操作符", explanation: "组合现有操作符并 eraseToAnyPublisher，保留 Failure；不必每次都手写订阅协议。", expected: "0、4、6") { $0.watch("doubled", [-1, 2, 3].publisher.labClampedAndDoubled()) },
        .init(group: "十、背压与自定义", title: "AsyncPublisher / AsyncThrowingPublisher", explanation: "values 把 Publisher 接为 AsyncSequence，Task 取消会取消迭代订阅；它不是无界队列，热流可能在迭代处理间隙丢值。这里用按需 Sequence，避免发送早于订阅。", expected: "async 1、2、3；throwing 捕获 invalid") { lab in
            if #available(iOS 15.0, macOS 12.0, *) {
                let task = Task { @MainActor [weak lab] in
                    for await value in [1, 2, 3].publisher.values {
                        guard !Task.isCancelled else { return }
                        lab?.log("async \(value)")
                    }
                    do {
                        for try await value in Fail<Int, CombineLabError>(error: .invalid).values {
                            lab?.log("unexpected \(value)")
                        }
                    } catch { lab?.log("throwing 捕获 \(error)") }
                }
                lab.tasks.append(task)
            } else { lab.log("values 需要 iOS 15 / macOS 12") }
        },
        .init(group: "十、背压与自定义", title: "Task → Future：取消桥接", explanation: "Future 不会自动取消内部 Task；用 handleEvents(receiveCancel:) 把取消向底层工作传播。每次订阅由 Deferred 创建独立状态。", expected: "立即取消任务，不出现 99，也不会发 completion") { lab in
            let publisher = Deferred {
                let bridge = CombineTaskBridge()
                return Future<Int, Never> { promise in
                    bridge.start(promise)
                }.handleEvents(receiveCancel: {
                    bridge.cancel()
                    lab.log("已向 Task 传播取消")
                })
            }
            let token = publisher.sink { lab.log("不应收到 \($0)") }
            token.cancel()
        }
    ]
}

/// Sink 默认 unlimited；这个订阅者故意只请求一个，便于观察暂停与续订。
final class CombineDemandSubscriberOf<Failure: Error>: Subscriber, Cancellable {
    typealias Input = Int
    private var subscription: Subscription?
    private let output: (String) -> Void

    init(output: @escaping (String) -> Void) { self.output = output }

    func receive(subscription: Subscription) {
        guard self.subscription == nil else { subscription.cancel(); return }
        self.subscription = subscription
        subscription.request(.max(1))
    }

    func receive(_ input: Int) -> Subscribers.Demand {
        output("demand value: \(input)")
        return .none // 本次不自动追加需求，由页面脚本显式 request。
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        subscription = nil
        output("demand completion: \(completion)")
    }

    func request(_ demand: Subscribers.Demand) { subscription?.request(demand) }
    func cancel() { subscription?.cancel(); subscription = nil }
    deinit { subscription?.cancel() }
}

typealias CombineDemandSubscriber = CombineDemandSubscriberOf<Never>

struct CombineCountPublisher: Publisher {
    typealias Output = Int
    typealias Failure = Never
    let end: Int

    func receive<S: Subscriber>(subscriber: S) where S.Input == Int, S.Failure == Never {
        subscriber.receive(subscription: CountSubscription(downstream: subscriber, end: end))
    }

    /// 演示同步有限源；锁串行化并发请求，draining 阻止下游同步 request 造成递归发送。
    private final class CountSubscription<S: Subscriber>: Subscription where S.Input == Int, S.Failure == Never {
        private let lock = NSRecursiveLock()
        private var downstream: S?
        private var next = 1
        private let end: Int
        private var demand: Subscribers.Demand = .none
        private var draining = false

        init(downstream: S, end: Int) { self.downstream = downstream; self.end = end }

        func request(_ more: Subscribers.Demand) {
            lock.lock()
            defer { lock.unlock() }
            guard more > .none, downstream != nil else { return }
            demand += more
            guard !draining else { return }
            draining = true
            defer { draining = false }
            while demand > .none, next <= end, let target = downstream {
                demand -= .max(1)
                let value = next
                next += 1
                demand += target.receive(value)
            }
            if next > end, let target = downstream {
                downstream = nil
                target.receive(completion: .finished)
            }
        }

        func cancel() {
            lock.lock()
            defer { lock.unlock() }
            downstream = nil
            demand = .none
        }
    }
}

extension Publisher where Output == Int {
    func labClampedAndDoubled() -> AnyPublisher<Int, Failure> {
        map { Swift.max(0, $0) * 2 }.eraseToAnyPublisher()
    }
}

/// 仅用于教学桥接：锁保证取消与 Task 赋值没有窗口竞态。
private final class CombineTaskBridge: @unchecked Sendable {
    private let lock = NSLock()
    private var task: Task<Void, Never>?
    private var cancelled = false

    func start(_ promise: @escaping Future<Int, Never>.Promise) {
        lock.lock()
        defer { lock.unlock() }
        guard !cancelled else { return }
        task = Task {
            do { try await Task.sleep(nanoseconds: 200_000_000) } catch { return }
            guard !Task.isCancelled else { return }
            promise(.success(99))
        }
    }

    func cancel() {
        lock.lock()
        defer { lock.unlock() }
        cancelled = true
        task?.cancel()
        task = nil
    }
}
