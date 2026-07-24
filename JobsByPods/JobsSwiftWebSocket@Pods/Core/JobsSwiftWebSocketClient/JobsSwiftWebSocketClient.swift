//
//  JobsSwiftWebSocketClient.swift
//  JobsSwiftWebSocket
//
//  Created by Jobs on 2026年7月24日，星期五.
//  Copyright © 2026 Jobs. All rights reserved.
//

import Foundation

/// 轻量 WebSocket 客户端：统一连接生命周期、收包循环、心跳、退避重连和主线程回调。
public final class JobsSwiftWebSocketClient: NSObject {
    public enum State: Equatable {
        /// 尚未发起连接
        case idle
        /// 正在握手
        case connecting
        /// 已建立双向连接
        case connected
        /// 等待第 attempt 次重连
        case reconnecting(attempt: Int, delay: TimeInterval)
        /// 已主动断开
        case disconnected
        /// 连接失败或重连次数耗尽
        case failed(String)
    }

    public var reconnectEnabled = true
    public var heartbeatInterval: TimeInterval = 30
    public var reconnectBaseDelay: TimeInterval = 1
    public var maximumReconnectDelay: TimeInterval = 16
    public var maximumReconnectAttempts = 5
    public var onStateChange: ((State) -> Void)?
    public var onTextMessage: ((String) -> Void)?
    public var onDataMessage: ((Data) -> Void)?
    public private(set) var state: State = .idle

    private let workQueue = DispatchQueue(
        label: "com.jobs.swift-websocket.client"
    )
    private var activeState: State = .idle
    private var endpoint: URL?
    private var session: URLSession?
    private var task: URLSessionWebSocketTask?
    private var heartbeatTimer: DispatchSourceTimer?
    private var reconnectWorkItem: DispatchWorkItem?
    private var reconnectAttempt = 0
    private var manuallyDisconnected = false

    public override init() {
        super.init()
    }

    public func connect(to url: URL) {
        workQueue.async { [weak self] in
            guard let self else { return }
            endpoint = url
            manuallyDisconnected = false
            reconnectAttempt = 0
            cancelReconnect()
            invalidateCurrentConnection()
            startConnection(to: url)
        }
    }

    public func disconnect() {
        workQueue.async { [weak self] in
            guard let self else { return }
            manuallyDisconnected = true
            endpoint = nil
            reconnectAttempt = 0
            cancelReconnect()
            invalidateCurrentConnection()
            publish(.disconnected)
        }
    }

    public func send(
        text: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        send(.string(text), completion: completion)
    }

    public func send(
        data: Data,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        send(.data(data), completion: completion)
    }

    private func send(
        _ message: URLSessionWebSocketTask.Message,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        workQueue.async { [weak self] in
            guard
                let self,
                let task,
                activeState == .connected
            else {
                let error = NSError(
                    domain: "JobsSwiftWebSocket",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "WebSocket 尚未连接"]
                )
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            task.send(message) { [weak self, weak task] error in
                DispatchQueue.main.async {
                    if let error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
                guard let error else { return }
                self?.workQueue.async {
                    guard
                        let self,
                        let task,
                        self.task === task
                    else { return }
                    self.handleConnectionEnd(error: error)
                }
            }
        }
    }

    private func startConnection(to url: URL) {
        publish(.connecting)
        let session = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: nil
        )
        let task = session.webSocketTask(with: url)
        self.session = session
        self.task = task
        task.resume()
    }

    private func receiveNextMessage(from task: URLSessionWebSocketTask) {
        task.receive { [weak self, weak task] result in
            guard let self, let task else { return }
            workQueue.async {
                guard self.task === task else { return }
                switch result {
                /// 收到服务端消息后继续下一轮监听
                case .success(let message):
                    self.publish(message)
                    self.receiveNextMessage(from: task)
                /// 收包失败时统一进入断线处理
                case .failure(let error):
                    self.handleConnectionEnd(error: error)
                }
            }
        }
    }

    private func publish(_ message: URLSessionWebSocketTask.Message) {
        switch message {
        /// 文本帧
        case .string(let text):
            DispatchQueue.main.async { [weak self] in
                self?.onTextMessage?(text)
            }
        /// 二进制帧
        case .data(let data):
            DispatchQueue.main.async { [weak self] in
                self?.onDataMessage?(data)
            }
        /// 兼容系统未来新增的消息类型
        @unknown default:
            break
        }
    }

    private func handleConnectionEnd(error: Error?) {
        invalidateCurrentConnection()
        guard !manuallyDisconnected, endpoint != nil else {
            publish(.disconnected)
            return
        }
        guard reconnectEnabled else {
            if let error {
                publish(.failed(error.localizedDescription))
            } else {
                publish(.disconnected)
            }
            return
        }
        scheduleReconnect(lastError: error)
    }

    private func scheduleReconnect(lastError: Error?) {
        guard
            reconnectAttempt < maximumReconnectAttempts,
            let endpoint
        else {
            let message = lastError?.localizedDescription ?? "WebSocket 重连次数已耗尽"
            publish(.failed(message))
            return
        }
        reconnectAttempt += 1
        let delay = min(
            reconnectBaseDelay * pow(2, Double(reconnectAttempt - 1)),
            maximumReconnectDelay
        )
        publish(.reconnecting(attempt: reconnectAttempt, delay: delay))
        let workItem = DispatchWorkItem { [weak self] in
            guard
                let self,
                !manuallyDisconnected,
                self.endpoint == endpoint
            else { return }
            startConnection(to: endpoint)
        }
        reconnectWorkItem = workItem
        workQueue.asyncAfter(
            deadline: .now() + max(0, delay),
            execute: workItem
        )
    }

    private func startHeartbeat() {
        stopHeartbeat()
        guard heartbeatInterval > 0 else { return }
        let timer = DispatchSource.makeTimerSource(queue: workQueue)
        timer.schedule(
            deadline: .now() + heartbeatInterval,
            repeating: heartbeatInterval
        )
        timer.setEventHandler { [weak self] in
            guard
                let self,
                let task,
                activeState == .connected
            else { return }
            task.sendPing { [weak self, weak task] error in
                guard let error else { return }
                self?.workQueue.async {
                    guard
                        let self,
                        let task,
                        self.task === task
                    else { return }
                    self.handleConnectionEnd(error: error)
                }
            }
        }
        heartbeatTimer = timer
        timer.resume()
    }

    private func stopHeartbeat() {
        heartbeatTimer?.setEventHandler {}
        heartbeatTimer?.cancel()
        heartbeatTimer = nil
    }

    private func cancelReconnect() {
        reconnectWorkItem?.cancel()
        reconnectWorkItem = nil
    }

    private func invalidateCurrentConnection() {
        stopHeartbeat()
        let task = self.task
        self.task = nil
        task?.cancel(with: .goingAway, reason: nil)
        session?.invalidateAndCancel()
        session = nil
    }

    private func publish(_ state: State) {
        guard activeState != state else { return }
        activeState = state
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.state = state
            self.onStateChange?(state)
        }
    }

    deinit {
        reconnectWorkItem?.cancel()
        heartbeatTimer?.cancel()
        task?.cancel(with: .goingAway, reason: nil)
        session?.invalidateAndCancel()
    }
}

extension JobsSwiftWebSocketClient: URLSessionWebSocketDelegate {
    public func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        workQueue.async { [weak self, weak webSocketTask] in
            guard
                let self,
                let webSocketTask,
                task === webSocketTask
            else { return }
            reconnectAttempt = 0
            publish(.connected)
            startHeartbeat()
            receiveNextMessage(from: webSocketTask)
        }
    }

    public func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
        reason: Data?
    ) {
        workQueue.async { [weak self, weak webSocketTask] in
            guard
                let self,
                let webSocketTask,
                task === webSocketTask
            else { return }
            handleConnectionEnd(error: nil)
        }
    }

    public func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        didCompleteWithError error: Error?
    ) {
        guard let webSocketTask = task as? URLSessionWebSocketTask else { return }
        workQueue.async { [weak self, weak webSocketTask] in
            guard
                let self,
                let webSocketTask,
                self.task === webSocketTask,
                let error
            else { return }
            handleConnectionEnd(error: error)
        }
    }
}
