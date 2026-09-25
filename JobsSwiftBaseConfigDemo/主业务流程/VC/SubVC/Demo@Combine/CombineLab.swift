//
//  CombineLab.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Combine

/// 教学层保留 Combine 原生链，方便直接对应 Apple 文档；UI 使用项目 Jobs DSL。
/// Output 是值类型，Failure 必须遵守 Error；Never 表示这条流不可能失败。
struct CombineLesson {
    let group: String
    let title: String
    let explanation: String
    let expected: String
    let run: (CombineLab) -> Void
}

/// 每次点击创建独立实验上下文；取消、重复运行和离开页面都释放同一组资源。
final class CombineLab {
    var bag = Set<AnyCancellable>()
    var tasks: [Task<Void, Never>] = []
    var retained: [AnyObject] = []
    var onLog: ((String) -> Void)?
    private(set) var events: [String] = []
    private(set) var stopped = false

    func log(_ text: String) {
        /// receive(on:) 之前的日志也可能来自后台；统一串行到主线程再修改状态和 UI。
        guard Thread.isMainThread else {
            DispatchQueue.main.async { [weak self] in self?.log(text) }
            return
        }
        guard !stopped else { return }
        events.append(text)
        onLog?(text)
    }

    /// sink 会请求 unlimited；演示手动背压时不能用这个 helper。
    func watch<P: Publisher>(_ name: String, _ publisher: P) {
        publisher.sink(receiveCompletion: { [weak self] completion in
            self?.log("\(name) completion: \(completion)")
        }, receiveValue: { [weak self] value in
            self?.log("\(name) value: \(value)")
        }).store(in: &bag)
    }

    func stop() {
        /// cancel 不等于 finished；订阅取消后不会补发 completion。
        bag.forEach { $0.cancel() }
        bag.removeAll()
        tasks.forEach { $0.cancel() }
        tasks.removeAll()
        retained.removeAll()
        stopped = true
        onLog = nil
    }

    deinit {
        bag.forEach { $0.cancel() }
        tasks.forEach { $0.cancel() }
    }

    static var lessons: [CombineLesson] {
        sources + transformations + selection + aggregation + combinations + failures + timing + sharing + integration + advanced
    }
}

enum CombineLabError: Error { case invalid, timeout }

/// @Published 在 willSet 阶段发出新值，回调中应使用收到的参数，不能假设属性已更新。
final class CombineLabModel: ObservableObject {
    @Published var count = 0
    var assigned = 0
}
