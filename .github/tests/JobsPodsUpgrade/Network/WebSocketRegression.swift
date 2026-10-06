//
//  WebSocketRegression.swift
//  JobsPodsUpgrade
//
//  Created by Jobs on 2026年10月5日，星期一.
//

import Foundation

@main
struct WebSocketRegression {
    static func main() async throws {
        let base = CommandLine.arguments[1]
        var client: JobsSwiftWebSocketClient? = JobsSwiftWebSocketClient()
        weak var weakClient = client
        client?.heartbeatInterval = 0.03
        client?.pongTimeout = 0.2
        client?.connect(to: URL(string: base + "pong")!)
        try await wait { client?.state == .connected }
        let received: String = await withCheckedContinuation { continuation in
            client?.onTextMessage = { text in continuation.resume(returning: text) }
            client?.send(text: "Jobs echo") { result in
                if case .failure(let error) = result { preconditionFailure(error.localizedDescription) }
            }
        }
        precondition(received == "Jobs echo")
        client = nil
        try await wait { weakClient == nil }

        let silent = JobsSwiftWebSocketClient()
        silent.reconnectEnabled = false
        silent.heartbeatInterval = 0.03
        silent.pongTimeout = 0.06
        silent.connect(to: URL(string: base + "nopong")!)
        try await wait {
            if case .failed(let message) = silent.state { return message.contains("pong") }
            return false
        }
        silent.disconnect()

        var reconnecting: JobsSwiftWebSocketClient? = JobsSwiftWebSocketClient()
        weak var weakReconnecting = reconnecting
        reconnecting?.connect(to: URL(string: base + "close")!)
        try await wait {
            if case .reconnecting = reconnecting?.state { return true }
            return false
        }
        reconnecting = nil
        try await wait { weakReconnecting == nil }
        print("WebSocketRegression: real loopback echo/pong, active owner release, missing pong deadline, reconnect owner release passed")
    }

    static func wait(_ predicate: () -> Bool) async throws {
        let deadline = ProcessInfo.processInfo.systemUptime + 5
        while !predicate() {
            precondition(ProcessInfo.processInfo.systemUptime < deadline, "WebSocket condition timed out")
            try await Task.sleep(nanoseconds: 10_000_000)
        }
    }
}
