//
//  JobsDeviceGuardCheck.swift
//  JobsSwiftDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

import Foundation

public struct JobsDeviceGuardCheck: Sendable {

    public enum State: String,
                       Sendable {

        case passed
        case detected
        case skipped
        case unavailable
    }

    public let category: JobsDeviceGuardCategory
    public let state: State
    public let evidence: [String]
    public let diagnostics: [String]

    public init(category: JobsDeviceGuardCategory,
                state: State,
                evidence: [String] = [],
                diagnostics: [String] = []) {
        self.category = category
        self.state = state
        self.evidence = evidence
        self.diagnostics = diagnostics
    }
}
