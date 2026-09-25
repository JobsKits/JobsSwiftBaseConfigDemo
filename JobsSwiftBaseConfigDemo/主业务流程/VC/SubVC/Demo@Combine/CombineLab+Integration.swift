//
//  CombineLab+Integration.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年9月25日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation
import Combine

extension CombineLab {
    static let integration: [CombineLesson] = [
        .init(group: "九、系统与业务绑定", title: "@Published / ObservableObject / assign", explanation: "objectWillChange 表示对象即将改变；$count 发初始值和新值。assign(to:on:) 会强持有目标，目标不要反向持有该 token。", expected: "$count 0、2；objectWillChange 时旧属性仍为 0；assigned 2") { lab in
            let model = CombineLabModel()
            lab.retained.append(model)
            lab.watch("$count", model.$count)
            model.objectWillChange.sink { [weak model, weak lab] in
                lab?.log("objectWillChange，旧属性 \(model?.count ?? -1)")
            }.store(in: &lab.bag)
            model.$count.assign(to: \.assigned, on: model).store(in: &lab.bag)
            model.count = 2
            lab.log("assigned \(model.assigned)")
        },
        .init(group: "九、系统与业务绑定", title: "assign(to: &$published)", explanation: "订阅生命周期交给 @Published 存储，不返回 AnyCancellable。不要把同一属性再反馈给自身形成无限循环。", expected: "初始 0，绑定后 5") { lab in
            let model = CombineLabModel()
            lab.retained.append(model)
            lab.watch("count", model.$count)
            Just(5).assign(to: &model.$count)
        },
        .init(group: "九、系统与业务绑定", title: "NotificationCenter.publisher", explanation: "按 name 和 object 过滤通知；取消 token 自动撤销观察。通知默认沿发送线程同步投递。", expected: "收到 payload=7 一次，取消后不再接收") { lab in
            let name = Notification.Name("Jobs.CombineLab.\(UUID().uuidString)")
            let token = NotificationCenter.default.publisher(for: name)
                .compactMap { $0.userInfo?["value"] as? Int }
                .sink { lab.log("payload=\($0)") }
            NotificationCenter.default.post(name: name, object: nil, userInfo: ["value": 7])
            token.cancel()
            NotificationCenter.default.post(name: name, object: nil, userInfo: ["value": 8])
        },
        .init(group: "九、系统与业务绑定", title: "KVO.publisher", explanation: "仅支持 KVO 合规的 NSObject 属性；Swift 属性需要 @objc dynamic，普通 struct 不能使用 KVO。", expected: "初始 0、更新 9") { lab in
            let model = CombineKVOCounter()
            lab.retained.append(model)
            lab.watch("KVO", model.publisher(for: \.value, options: [.initial, .new]))
            model.value = 9
        },
        .init(group: "九、系统与业务绑定", title: "encode / decode", explanation: "编码和解码都可能失败；网络 JSON 先检查 HTTP 状态，再 decode，避免把服务器错误误报为解析错误。", expected: "Person(name: Jobs, age: 18)；坏 JSON failure") { lab in
            lab.watch("roundTrip", Just(Person(name: "Jobs", age: 18))
                .encode(encoder: JSONEncoder()).decode(type: Person.self, decoder: JSONDecoder()))
            lab.watch("badJSON", Just(Data("not json".utf8)).decode(type: Person.self, decoder: JSONDecoder()))
        },
        .init(group: "九、系统与业务绑定", title: "URLSession.dataTaskPublisher", explanation: "实际经过 URLSession 的 Publisher，以局部 URLProtocol 返回固定 HTTP 响应，无外网依赖。HTTP 4xx/5xx 本身不是传输错误，必须主动检查。", expected: "200 解码 Jobs；503 被检查并回退 cache") { lab in
            let session = CombineStubProtocol.makeSession()
            lab.retained.append(session)
            /// session 生命周期与实验绑定；取消订阅会取消 task，清理时还会关闭 session。
            AnyCancellable { session.invalidateAndCancel() }.store(in: &lab.bag)
            for code in [200, 503] {
                guard let url = URL(string: "https://combine-demo.invalid/\(code)") else { continue }
                lab.watch("HTTP \(code)", session.dataTaskPublisher(for: url)
                    .tryMap { data, response in
                        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
                            throw CombineLabError.invalid
                        };return data
                    }
                    .decode(type: Person.self, decoder: JSONDecoder())
                    .catch { _ in Just(Person(name: "cache", age: 0)) }
                    .receive(on: DispatchQueue.main))
            }
        },
        .init(group: "九、系统与业务绑定", title: "表单校验 combineLatest", explanation: "两个 CurrentValueSubject 表示当前输入，用 combineLatest 派生按钮是否可用，再 removeDuplicates 避免重复刷新。", expected: "可提交 false → true → false") { lab in
            let account = CurrentValueSubject<String, Never>("")
            let password = CurrentValueSubject<String, Never>("")
            lab.watch("可提交", account.combineLatest(password)
                .map { !$0.0.isEmpty && $0.1.count >= 6 }.removeDuplicates())
            account.send("Jobs")
            password.send("123456")
            account.send("")
        },
        .init(group: "九、系统与业务绑定", title: "搜索 debounce + switchToLatest", explanation: "模拟快速输入，去重、防抖后创建请求；新请求取消旧请求。catch 放在内层，使一次请求失败不终止整个输入流。", expected: "只得到结果 Combine；输入 C、Co 被防抖合并") { lab in
            let query = PassthroughSubject<String, Never>()
            lab.retained.append(query)
            lab.watch("搜索", query.removeDuplicates()
                .debounce(for: .milliseconds(100), scheduler: DispatchQueue.main)
                .map { text in
                    Just("结果 \(text)")
                        .delay(for: .milliseconds(100), scheduler: DispatchQueue.main)
                        .setFailureType(to: CombineLabError.self)
                        .catch { _ in Just("查询失败，可继续输入") }
                }.switchToLatest())
            query.send("C")
            query.send("Co")
            query.send("Combine")
        }
    ]
}

final class CombineKVOCounter: NSObject {
    @objc dynamic var value = 0
}

/// 仅在本次 session 注册，绝不全局 registerClass 干扰 App 其它请求。
final class CombineStubProtocol: URLProtocol {
    static func makeSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [CombineStubProtocol.self]
        return URLSession(configuration: configuration)
    }

    override class func canInit(with request: URLRequest) -> Bool {
        request.url?.host == "combine-demo.invalid"
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        guard let url = request.url,
              let response = HTTPURLResponse(url: url, statusCode: Int(url.lastPathComponent) ?? 200,
                                             httpVersion: "HTTP/1.1", headerFields: ["Content-Type": "application/json"]) else {
            client?.urlProtocol(self, didFailWithError: CombineLabError.invalid)
            return
        }
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: Data(#"{"name":"Jobs","age":18}"#.utf8))
        client?.urlProtocolDidFinishLoading(self)
    }

    /// 数据同步交付，没有额外后台工作；真实异步实现必须在此撤销任务。
    override func stopLoading() {}
}
