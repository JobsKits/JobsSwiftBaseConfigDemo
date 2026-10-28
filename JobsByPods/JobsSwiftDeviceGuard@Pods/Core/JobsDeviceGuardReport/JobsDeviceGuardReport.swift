//
//  JobsDeviceGuardReport.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation

public struct JobsDeviceGuardReport: Sendable {

    public enum Verdict: String,
                         Sendable {

        case noIndicators
        case suspicious
        case jailbroken
        case indeterminate
        case unsupported
    }

    public let verdict: Verdict
    public let platform: String
    public let checks: [JobsDeviceGuardCheck]
    public let evaluatedAt: Date
    public let minimumDetectedCategories: Int

    public var detectedCategories: Set<JobsDeviceGuardCategory> {
        Set(checks.filter {
            $0.state == .detected
        }
            .map(\.category))
    }

    public var isJailbroken: Bool {
        verdict == .jailbroken
    }

    /// 保守门禁示例；宿主可以依报告实现自己的产品策略。
    public var shouldRestrict: Bool {
        verdict != .noIndicators
    }

    public var hasUnavailableChecks: Bool {
        checks.contains {
            $0.state == .unavailable || !$0.diagnostics.isEmpty
        }
    }

    init(platform: String,
         supported: Bool,
         checks: [JobsDeviceGuardCheck],
         minimumDetectedCategories: Int,
         evaluatedAt: Date = Date()) {
        self.platform = platform
        self.checks = checks
        self.evaluatedAt = evaluatedAt
        let threshold = min(3,
                            max(2,
                                minimumDetectedCategories))
        self.minimumDetectedCategories = threshold
        let detected = Set(checks.filter {
            $0.state == .detected
        }
            .map(\.category))
        if !supported {
            verdict = .unsupported
        } else if detected.count >= threshold {
            verdict = .jailbroken
        } else if !detected.isEmpty {
            verdict = .suspicious
        } else if checks.contains(where: {
            $0.state == .unavailable
        }) ||
            !checks.contains(where: {
            $0.state == .passed
        }) {
            verdict = .indeterminate
        } else {
            verdict = .noIndicators
        }
    }
}
