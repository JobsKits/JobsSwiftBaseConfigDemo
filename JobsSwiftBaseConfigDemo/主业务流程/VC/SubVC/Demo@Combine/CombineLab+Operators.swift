//
//  CombineLab+Operators.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Combine

extension CombineLab {
    /// 一个条目对应一种可观察行为；解释同时出现在源码与页面中。
    static let sources: [CombineLesson] = [
        .init(group: "一、发布与订阅", title: "Just / sink", explanation: "订阅后发一个值再 finished；保存 AnyCancellable 才能维持异步订阅。", expected: "42 → finished") { $0.watch("Just", Just(42)) },
        .init(group: "一、发布与订阅", title: "Sequence.publisher", explanation: "数组按需求同步发送元素，数组自身不会变成热事件源。", expected: "1、2、3 → finished") { $0.watch("Sequence", [1, 2, 3].publisher) },
        .init(group: "一、发布与订阅", title: "Result.publisher / Fail", explanation: "Result 可发布成功值或失败；Fail 直接终止，失败之后不再有值。", expected: "成功 7；另一条流 failure(invalid)") {
            $0.watch("Result", Result<Int, CombineLabError>.success(7).publisher)
            $0.watch("Fail", Fail<Int, CombineLabError>(error: .invalid))
        },
        .init(group: "一、发布与订阅", title: "Empty / 永不完成", explanation: "Empty 可立即完成，也可既不发值也不完成；后者必须有取消入口。", expected: "empty finished；never 直到取消都没有输出") {
            $0.watch("empty", Empty<Int, Never>())
            $0.watch("never", Empty<Int, Never>(completeImmediately: false))
        },
        .init(group: "一、发布与订阅", title: "Future / Deferred", explanation: "Future 创建时立即执行并缓存结果；Deferred 每次订阅才重新创建上游。", expected: "Future 工作一次、两次得到 1；Deferred 得到 1 和 2") { lab in
            var eager = 0
            let future = Future<Int, Never> { promise in
                eager += 1
                lab.log("Future 已开始工作，尚未订阅")
                promise(.success(eager))
            }
            lab.watch("Future A", future)
            lab.watch("Future B", future)
            var lazy = 0
            let deferred = Deferred { () -> Just<Int> in
                lazy += 1
                return Just(lazy)
            }
            lab.watch("Deferred A", deferred)
            lab.watch("Deferred B", deferred)
        },
        .init(group: "一、发布与订阅", title: "PassthroughSubject / CurrentValueSubject", explanation: "Passthrough 不回放历史；CurrentValue 保存并向新订阅者发送当前值。完成是不可逆的。", expected: "直通只收到 2；当前值收到 1、2；完成后 3 被忽略") { lab in
            let pass = PassthroughSubject<Int, Never>()
            let current = CurrentValueSubject<Int, Never>(0)
            pass.send(1)
            current.send(1)
            lab.watch("pass", pass)
            lab.watch("current", current)
            pass.send(2)
            current.send(2)
            pass.send(completion: .finished)
            current.send(completion: .finished)
            pass.send(3)
        },
        .init(group: "一、发布与订阅", title: "AnyPublisher / AnySubscriber / AnyCancellable", explanation: "类型擦除隐藏复杂泛型但不改变执行时机；取消是幂等终止动作。", expected: "擦除后收到 8；取消后的 9 不到达") { lab in
            let source = PassthroughSubject<Int, Never>()
            let publisher = source.eraseToAnyPublisher()
            let sink = Subscribers.Sink<Int, Never>(receiveCompletion: { lab.log("sink \($0)") }, receiveValue: { lab.log("erased \($0)") })
            publisher.subscribe(AnySubscriber(sink))
            let token = AnyCancellable(sink)
            source.send(8)
            token.cancel()
            token.cancel()
            source.send(9)
        }
    ]

    static let transformations: [CombineLesson] = [
        .init(group: "二、转换", title: "map / keyPath", explanation: "逐个转换值，输入输出类型可以不同；keyPath 重载用于取字段。", expected: "2、4、6；字段 Jobs") {
            $0.watch("map", [1, 2, 3].publisher.map { $0 * 2 })
            $0.watch("keyPath", Just(Person(name: "Jobs", age: 18)).map(\.name))
        },
        .init(group: "二、转换", title: "compactMap", explanation: "转换并丢弃 nil；失败转换不会终止流。", expected: "1、3") { $0.watch("compactMap", ["1", "x", "3"].publisher.compactMap(Int.init)) },
        .init(group: "二、转换", title: "scan / reduce", explanation: "scan 发每一步累计值；reduce 等 finished 才发最后结果，无限流不会得到 reduce 结果。", expected: "scan 1、3、6；reduce 6") {
            $0.watch("scan", [1, 2, 3].publisher.scan(0, +))
            $0.watch("reduce", [1, 2, 3].publisher.reduce(0, +))
        },
        .init(group: "二、转换", title: "flatMap(maxPublishers:)", explanation: "把值转成内层流，再合并内层输出；max(1) 限制同时订阅数，不会取消旧流。", expected: "A1、A2、B1、B2") {
            $0.watch("flatMap", ["A", "B"].publisher.flatMap(maxPublishers: .max(1)) { ["\($0)1", "\($0)2"].publisher })
        },
        .init(group: "二、转换", title: "switchToLatest", explanation: "外层发来新 Publisher 时取消旧订阅，适合搜索请求；旧值不会回流。", expected: "A1、B1；A2 被忽略") { lab in
            let outer = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
            let a = PassthroughSubject<String, Never>()
            let b = PassthroughSubject<String, Never>()
            lab.watch("latest", outer.switchToLatest())
            outer.send(a)
            a.send("A1")
            outer.send(b)
            a.send("A2")
            b.send("B1")
            b.send(completion: .finished)
            outer.send(completion: .finished)
        },
        .init(group: "二、转换", title: "replaceNil", explanation: "把 Optional.none 替换成默认值，与 compactMap 丢弃 nil 不同。", expected: "1、0、3") { $0.watch("replaceNil", [1, nil, 3].publisher.replaceNil(with: 0)) }
    ]

    static let selection: [CombineLesson] = [
        .init(group: "三、筛选与截取", title: "filter / removeDuplicates", explanation: "filter 保留符合条件的值；removeDuplicates 只比较相邻值，并非全局去重。", expected: "filter 2、4；去重 1、2、1") {
            $0.watch("filter", (1...4).publisher.filter { $0.isMultiple(of: 2) })
            $0.watch("distinct", [1, 1, 2, 2, 1].publisher.removeDuplicates())
        },
        .init(group: "三、筛选与截取", title: "first / last / where", explanation: "first 匹配即完成；last 必须等待上游完成。", expected: "first 1；last 4；firstWhere 3；lastWhere 2") {
            $0.watch("first", (1...4).publisher.first())
            $0.watch("last", (1...4).publisher.last())
            $0.watch("firstWhere", (1...4).publisher.first { $0 > 2 })
            $0.watch("lastWhere", (1...4).publisher.last { $0 < 3 })
        },
        .init(group: "三、筛选与截取", title: "dropFirst / drop(while:) / prefix", explanation: "drop(while:) 第一次遇到 false 后不再筛选；prefix 到数量或条件边界就取消上游。", expected: "drop 3、4；dropWhile 3、1；prefix 1、2；prefixWhile 1、2") {
            $0.watch("drop", (1...4).publisher.dropFirst(2))
            $0.watch("dropWhile", [1, 2, 3, 1].publisher.drop { $0 < 3 })
            $0.watch("prefix", (1...4).publisher.prefix(2))
            $0.watch("prefixWhile", [1, 2, 3, 1].publisher.prefix { $0 < 3 })
        },
        .init(group: "三、筛选与截取", title: "output(at:) / output(in:)", explanation: "下标从 0 开始；范围按上游元素位置截取。", expected: "at 20；in 20、30") {
            $0.watch("at", [10, 20, 30, 40].publisher.output(at: 1))
            $0.watch("in", [10, 20, 30, 40].publisher.output(in: 1..<3))
        },
        .init(group: "三、筛选与截取", title: "drop / prefix(untilOutputFrom:)", explanation: "由另一个流的值打开或关闭闸门；只发送 completion 不等于发出值。", expected: "prefix 收到 1；drop 收到 2") { lab in
            let source = PassthroughSubject<Int, Never>()
            let gate = PassthroughSubject<Void, Never>()
            lab.watch("dropGate", source.drop(untilOutputFrom: gate))
            lab.watch("prefixGate", source.prefix(untilOutputFrom: gate))
            source.send(1)
            gate.send(())
            source.send(2)
            source.send(completion: .finished)
        },
        .init(group: "三、筛选与截取", title: "ignoreOutput / replaceEmpty", explanation: "ignoreOutput 保留终止信号；replaceEmpty 只在正常完成且没有值时发默认值，不处理 failure。", expected: "ignore 只有 finished；empty 发 99") {
            $0.watch("ignore", [1, 2].publisher.ignoreOutput())
            $0.watch("empty", Empty<Int, Never>().replaceEmpty(with: 99))
        }
    ]

    static let aggregation: [CombineLesson] = [
        .init(group: "四、聚合与判断", title: "collect / collect(count)", explanation: "collect 等完成收集全部，可能无限占用内存；count 按批输出，结束时冲刷尾批。", expected: "全部 [1,2,3]；分批 [1,2]、[3]") {
            $0.watch("collect", [1, 2, 3].publisher.collect())
            $0.watch("batch", [1, 2, 3].publisher.collect(2))
        },
        .init(group: "四、聚合与判断", title: "count / min / max", explanation: "有限流完成时输出计数和极值；by 重载支持自定义比较。", expected: "count 3；min 1；max 3；minBy 1；maxBy 3") {
            $0.watch("count", [3, 1, 2].publisher.count())
            $0.watch("min", [3, 1, 2].publisher.min())
            $0.watch("max", [3, 1, 2].publisher.max())
            $0.watch("minBy", [3, 1, 2].publisher.min(by: <))
            $0.watch("maxBy", [3, 1, 2].publisher.max(by: <))
        },
        .init(group: "四、聚合与判断", title: "contains / allSatisfy", explanation: "contains 匹配即可短路；allSatisfy 遇到 false 即可结束，否则等完成。", expected: "true、true、false") {
            $0.watch("contains", [1, 2, 3].publisher.contains(2))
            $0.watch("containsWhere", [1, 2, 3].publisher.contains { $0 > 2 })
            $0.watch("allSatisfy", [1, 2, 3].publisher.allSatisfy { $0 < 3 })
        }
    ]

    static let combinations: [CombineLesson] = [
        .init(group: "五、多流组合", title: "append / prepend", explanation: "prepend 先发前缀；append 必须等原流正常完成才订阅后缀，失败不会继续。", expected: "0、1、2、3、4") { $0.watch("concat", [1, 2].publisher.prepend(0).append([3, 4].publisher)) },
        .init(group: "五、多流组合", title: "merge / MergeMany", explanation: "输出类型与错误类型必须一致；merge 保留到达顺序，多流之间没有固定排序。", expected: "merge 1、2；many 3、4、5") {
            $0.watch("merge", Just(1).merge(with: Just(2)))
            $0.watch("many", Publishers.MergeMany([Just(3), Just(4), Just(5)]))
        },
        .init(group: "五、多流组合", title: "combineLatest / zip", explanation: "combineLatest 等两侧都有值后用各自最新值；zip 按序号一对一配对。", expected: "latest (2,A)、(3,A)、(3,B)；zip (1,A)、(2,B)") { lab in
            let n = PassthroughSubject<Int, Never>()
            let s = PassthroughSubject<String, Never>()
            lab.watch("latest", n.combineLatest(s))
            lab.watch("zip", n.zip(s))
            n.send(1)
            n.send(2)
            s.send("A")
            n.send(3)
            s.send("B")
            n.send(completion: .finished)
            s.send(completion: .finished)
        },
        .init(group: "五、多流组合", title: "combineLatest / zip 多路与 transform", explanation: "三路、四路重载同样按最新值或序号组合；transform 可直接把元组转换成业务结果。", expected: "three 6；four 10；zipThree 6；zipFour 10") {
            $0.watch("three", Just(1).combineLatest(Just(2), Just(3)) { $0 + $1 + $2 })
            $0.watch("four", Just(1).combineLatest(Just(2), Just(3), Just(4)) { $0 + $1 + $2 + $3 })
            $0.watch("zipThree", Just(1).zip(Just(2), Just(3)) { $0 + $1 + $2 })
            $0.watch("zipFour", Just(1).zip(Just(2), Just(3), Just(4)) { $0 + $1 + $2 + $3 })
        }
    ]

    struct Person: Codable { let name: String; let age: Int }
}
