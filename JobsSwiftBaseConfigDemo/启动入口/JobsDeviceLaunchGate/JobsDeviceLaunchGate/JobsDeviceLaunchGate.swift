//
//  JobsDeviceLaunchGate.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import UIKit
import JobsSwiftDeviceGuard

/// 宿主进程的启动决策；检测 Pod 继续只负责提供信号。
@MainActor
final class JobsDeviceLaunchGate {

    typealias Policy = @MainActor (JobsDeviceGuardReport) -> Bool
    typealias BlockedViewControllerFactory = @MainActor (JobsDeviceLaunchDecision) -> UIViewController

    static let shared = JobsDeviceLaunchGate(inspection: {
        JobsDeviceGuard.inspect(configuration: .init()
            .bySandboxWriteProbe(false))
    },
                                             policy: startupPolicy,
                                             blockedViewControllerFactory: { decision in
        JobsDeviceBlockedVC(decision: decision)
    })

    private let inspection: () -> JobsDeviceGuardReport
    private var policy: Policy
    private var blockedViewControllerFactory: BlockedViewControllerFactory
    private(set) var decision: JobsDeviceLaunchDecision?

    /// 尚未完成启动检测时，任何业务回调都不能先行进入。
    var allowsBusinessInitialization: Bool {
        decision.map {
            !$0.isDeviceBlocked
        } ?? false
    }

    var isDeviceBlocked: Bool {
        !allowsBusinessInitialization
    }

    private init(inspection: @escaping () -> JobsDeviceGuardReport,
                 policy: @escaping Policy,
                 blockedViewControllerFactory: @escaping BlockedViewControllerFactory) {
        self.inspection = inspection
        self.policy = policy
        self.blockedViewControllerFactory = blockedViewControllerFactory
    }

    /// 只允许启动决策产生前配置；policy 同步纯判定，不重入 evaluateAtLaunch。
    /// 工厂为每个 Scene 返回独立且未挂载的控制器。
    @discardableResult
    func configureBeforeLaunch(policy: Policy? = nil,
                               blockedViewControllerFactory: BlockedViewControllerFactory? = nil) -> Bool {
        guard decision == nil else {
            return false
        }
        if let policy {
            self.policy = policy
        }
        if let blockedViewControllerFactory {
            self.blockedViewControllerFactory = blockedViewControllerFactory
        }
        return true
    }

    /// 同步只读检查一次；后续 Scene 与回调共用冻结的报告和策略结果。
    @discardableResult
    func evaluateAtLaunch() -> JobsDeviceLaunchDecision {
        if let decision {
            return decision
        }
        let report = inspection()
        let snapshot = JobsDeviceLaunchDecision(report: report,
                                                isDeviceBlocked: policy(report))
        decision = snapshot
        return snapshot
    }

    func makeBlockedViewController() -> UIViewController? {
        guard let decision, decision.isDeviceBlocked else {
            return nil
        }
        let controller = blockedViewControllerFactory(decision)
        guard controller.parent == nil,
              controller.presentingViewController == nil,
              controller.viewIfLoaded?.window == nil else {
            return JobsDeviceBlockedVC(decision: decision)
        }
        return controller
    }

    private static var startupPolicy: Policy {
        #if DEBUG && JOBS_DEVICE_GUARD_FORCE_BLOCK_TESTING
        // 仅隔离验证构建使用；Release 没有环境变量或强制放行入口。
        return { _ in
            true
        }
        #else
        return { report in
            report.isJailbroken
        }
        #endif
    }

    #if DEBUG
    /// 只创建独立测试实例，不替换 shared，也不开放进程决策重置。
    static func makeForTesting(inspection: @escaping () -> JobsDeviceGuardReport,
                               policy: @escaping Policy = {
        $0.isJailbroken
    },
                               blockedViewControllerFactory: @escaping BlockedViewControllerFactory = {
        JobsDeviceBlockedVC(decision: $0)
    }) -> JobsDeviceLaunchGate {
        JobsDeviceLaunchGate(inspection: inspection,
                             policy: policy,
                             blockedViewControllerFactory: blockedViewControllerFactory)
    }
    #endif
}
