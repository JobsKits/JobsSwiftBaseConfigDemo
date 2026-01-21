//
//  JobsTimerProtocol.swift
//  Pods
//
//  Created by Jobs on 21/1/26.
//
// MARK: - 统一协议
public protocol JobsTimerProtocol: AnyObject {
    var isRunning: Bool { get }
    func start()
    func pause()
    func resume()
    func stop()

    @discardableResult
    func onTick(_ block: @escaping JobsTimerCallback) -> Self

    @discardableResult
    func onFinish(_ block: @escaping JobsTimerCallback) -> Self
}
// MARK: - 标识协议（建议用于 Manager ID 管理）
public protocol JobsTimerIdentifiable {
    var identifier: String? { get }
}
