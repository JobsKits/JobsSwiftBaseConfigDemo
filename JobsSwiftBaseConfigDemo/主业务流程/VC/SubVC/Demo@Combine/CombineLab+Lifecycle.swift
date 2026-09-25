//
//  CombineLab+Lifecycle.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Combine

extension CombineLab {
    static let failures: [CombineLesson] = [
        .init(group: "六、错误与诊断", title: "tryMap / mapError / catch", explanation: "try 操作符把 Failure 扩为 Error；mapError 统一错误；catch 替换失败的整条上游，原流不会恢复。", expected: "10、-1 → finished；不会有 30") {
            $0.watch("recover", [1, 2, 3].publisher.tryMap { value in
                guard value != 2 else { throw CombineLabError.invalid };return value * 10
            }.mapError { _ in CombineLabError.invalid }.catch { _ in Just(-1) })
        },
        .init(group: "六、错误与诊断", title: "retry / Deferred", explanation: "retry(2) 表示首次失败后最多重订阅两次；Deferred 让每次订阅真的重新工作，缓存失败的 Future 不会重新执行。", expected: "尝试 1、2、3，第三次成功 100") { lab in
            var attempt = 0
            let request = Deferred { () -> AnyPublisher<Int, CombineLabError> in
                attempt += 1
                lab.log("尝试 \(attempt)")
                if attempt < 3 { return Fail(error: .invalid).eraseToAnyPublisher() };return Just(100).setFailureType(to: CombineLabError.self).eraseToAnyPublisher()
            }
            lab.watch("retry", request.retry(2))
        },
        .init(group: "六、错误与诊断", title: "replaceError / setFailureType / tryCatch", explanation: "replaceError 发兜底值后完成；setFailureType 只给 Never 流指定错误类型，不会凭空产生错误。", expected: "replace 0；typed 7；tryCatch 9") {
            $0.watch("replace", Fail<Int, CombineLabError>(error: .invalid).replaceError(with: 0))
            $0.watch("typed", Just(7).setFailureType(to: CombineLabError.self))
            $0.watch("tryCatch", Fail<Int, CombineLabError>(error: .invalid).tryCatch { _ in Just(9) })
        },
        .init(group: "六、错误与诊断", title: "try 系列：筛选与累计", explanation: "带 try 的谓词一旦抛错就 failure；这里只触发部分失败，其余演示正常路径。", expected: "tryFilter 发 1 后失败；其余按谓词或累计算法输出") {
            $0.watch("tryFilter", [1, 2, 3].publisher.tryFilter { if $0 == 2 { throw CombineLabError.invalid };return true })
            $0.watch("tryCompactMap", ["1", "x"].publisher.tryCompactMap { Int($0) })
            $0.watch("tryScan", [1, 2, 3].publisher.tryScan(0, +))
            $0.watch("tryReduce", [1, 2, 3].publisher.tryReduce(0, +))
            $0.watch("tryRemoveDuplicates", [1, 1, 2].publisher.tryRemoveDuplicates(by: ==))
            $0.watch("tryDrop", [1, 2, 3].publisher.tryDrop { $0 < 2 })
            $0.watch("tryPrefix", [1, 2, 3].publisher.tryPrefix { $0 < 3 })
        },
        .init(group: "六、错误与诊断", title: "try 系列：查询与比较", explanation: "first、last、contains、allSatisfy、min、max 都有可抛错闭包版本；成功路径语义与普通版本一致。", expected: "2、2、true、true、1、3") {
            $0.watch("tryFirst", (1...3).publisher.tryFirst { $0 > 1 })
            $0.watch("tryLast", (1...3).publisher.tryLast { $0 < 3 })
            $0.watch("tryContains", (1...3).publisher.tryContains { $0 == 2 })
            $0.watch("tryAllSatisfy", (1...3).publisher.tryAllSatisfy { $0 > 0 })
            $0.watch("tryMin", (1...3).publisher.tryMin(by: <))
            $0.watch("tryMax", (1...3).publisher.tryMax(by: <))
        },
        .init(group: "六、错误与诊断", title: "handleEvents / print / breakpoint / assertNoFailure", explanation: "handleEvents 观察副作用但不改变值；print 输出完整协议事件到 Xcode 控制台。断点谓词为 false，避免点击即触发 SIGTRAP；assertNoFailure 仅用于已保证不失败的流。", expected: "订阅、需求、值、取消；控制台还有 print 轨迹") { lab in
            let source = PassthroughSubject<Int, Never>()
            let token = source.handleEvents(
                receiveSubscription: { _ in lab.log("收到 subscription") },
                receiveOutput: { lab.log("旁路 \($0)") },
                receiveCompletion: { lab.log("终止 \($0)") },
                receiveCancel: { lab.log("上游收到 cancel") },
                receiveRequest: { lab.log("请求 \($0)") }
            ).print("Combine 调试").breakpoint(receiveOutput: { _ in false }).sink { lab.log("sink \($0)") }
            source.send(1)
            token.cancel()
            lab.watch("assert", Just(2).assertNoFailure())
            /// breakpointOnError 在真实 failure 时触发调试陷阱，因此使用不会失败的上游演示其接线。
            lab.watch("breakpointOnError", Just(3).setFailureType(to: CombineLabError.self).breakpointOnError())
        }
    ]

    static let timing: [CombineLesson] = [
        .init(group: "七、时间与线程", title: "delay / debounce / throttle", explanation: "delay 延迟每个事件；debounce 等静默窗口；throttle 按窗口取首值或末值。示例保留 Subject 不立即完成，避免 completion 冲掉待发防抖值。", expected: "delay 最终 1、2、3；debounce 仅 3；throttle 取决于窗口边界") { lab in
            let source = PassthroughSubject<Int, Never>()
            lab.retained.append(source)
            lab.watch("delay", source.delay(for: .milliseconds(150), scheduler: DispatchQueue.main))
            lab.watch("debounce", source.debounce(for: .milliseconds(150), scheduler: DispatchQueue.main))
            lab.watch("throttleFirst", source.throttle(for: .milliseconds(150), scheduler: DispatchQueue.main, latest: false))
            lab.watch("throttleLatest", source.throttle(for: .milliseconds(150), scheduler: DispatchQueue.main, latest: true))
            for value in 1...3 {
                Just(value).delay(for: .milliseconds(value * 30), scheduler: DispatchQueue.main)
                    .sink { source.send($0) }.store(in: &lab.bag)
            }
        },
        .init(group: "七、时间与线程", title: "timeout", explanation: "指定时间内没有新值就超时；customError 将超时转换成 Failure，可在下游 catch。", expected: "约 0.2 秒后 failure(timeout)") {
            $0.watch("timeout", Empty<Int, CombineLabError>(completeImmediately: false)
                .timeout(.milliseconds(200), scheduler: DispatchQueue.main, customError: { .timeout }))
        },
        .init(group: "七、时间与线程", title: "Timer / autoconnect / measureInterval", explanation: "Timer.publish 是可连接流；autoconnect 自动连接，prefix 限制为三次并取消定时器。measureInterval 输出 scheduler 的时间单位。", expected: "三次约 0.1 秒的间隔 → finished") {
            $0.watch("interval", Timer.publish(every: 0.1, on: .main, in: .common).autoconnect().prefix(3).measureInterval(using: RunLoop.main))
        },
        .init(group: "七、时间与线程", title: "collect(byTime / byTimeOrCount)", explanation: "时间窗口和数量阈值负责冲刷批次；结束时可能产生尾批，空窗口行为应结合实际调度观察。", expected: "timeOrCount 每两项一批；time 按 0.15 秒窗口输出") { lab in
            let clock = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect().prefix(5)
            lab.watch("time", clock.collect(.byTime(RunLoop.main, .milliseconds(150))))
            lab.watch("timeOrCount", clock.collect(.byTimeOrCount(RunLoop.main, .seconds(1), 2)))
        },
        .init(group: "七、时间与线程", title: "subscribe(on:) / receive(on:)", explanation: "subscribe(on:) 调度订阅、请求与取消；receive(on:) 只切换下游事件。不要把后台回调直接当成 MainActor 隔离保证。", expected: "上游 main=false；UI 下游 main=true") { lab in
            Deferred { () -> Just<Int> in
                lab.log("上游 main=\(Thread.isMainThread)")
                return Just(1)
            }.subscribe(on: DispatchQueue.global(qos: .userInitiated))
                .receive(on: DispatchQueue.main)
                .sink { lab.log("UI 下游 main=\(Thread.isMainThread)，值 \($0)") }
                .store(in: &lab.bag)
        }
    ]

    static let sharing: [CombineLesson] = [
        .init(group: "八、共享与连接", title: "share：共享不回放", explanation: "多个同时存在的订阅者共享同一次上游订阅；share 不缓存历史值。同步冷流的迟到订阅者甚至只能看到完成。", expected: "上游订阅一次；A 收到 1、2，B 只收到 2") { lab in
            let source = PassthroughSubject<Int, Never>()
            let shared = source.handleEvents(receiveSubscription: { _ in lab.log("上游订阅一次") }).share()
            lab.watch("A", shared)
            source.send(1)
            lab.watch("B", shared)
            source.send(2)
            source.send(completion: .finished)
        },
        .init(group: "八、共享与连接", title: "multicast / connect", explanation: "multicast 用 Subject 扇出；所有消费者准备好后手动 connect，避免同步上游先跑完。连接本身也要保存和取消。", expected: "连接前没有值；A、B 各收到 1、2") { lab in
            let connected = [1, 2].publisher.multicast(subject: PassthroughSubject<Int, Never>())
            lab.watch("A", connected)
            lab.watch("B", connected)
            lab.log("即将 connect")
            connected.connect().store(in: &lab.bag)
        },
        .init(group: "八、共享与连接", title: "makeConnectable / autoconnect", explanation: "makeConnectable 延迟上游启动，手动连接便于组织订阅顺序；autoconnect 适合单消费者自动管理。", expected: "手动连接两位消费者都收到 5；自动连接收到 6") { lab in
            let connected = Just(5).makeConnectable()
            lab.watch("A", connected)
            lab.watch("B", connected)
            connected.connect().store(in: &lab.bag)
            lab.watch("auto", Just(6).makeConnectable().autoconnect())
        }
    ]
}
