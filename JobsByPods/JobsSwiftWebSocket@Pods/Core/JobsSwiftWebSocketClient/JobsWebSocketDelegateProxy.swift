//
//  JobsWebSocketDelegateProxy.swift
//  JobsSwiftWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

/// URLSession 持有代理，代理只弱引用客户端，避免连接反向延长客户端生命。
final class JobsWebSocketDelegateProxy: NSObject, URLSessionWebSocketDelegate, @unchecked Sendable {
    weak var owner: JobsSwiftWebSocketClient?

    init(owner: JobsSwiftWebSocketClient) {
        self.owner = owner
        super.init()
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        owner?.urlSession(session, webSocketTask: webSocketTask, didOpenWithProtocol: `protocol`)
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask,
                    didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        owner?.urlSession(session, webSocketTask: webSocketTask, didCloseWith: closeCode, reason: reason)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        owner?.urlSession(session, task: task, didCompleteWithError: error)
    }
}
