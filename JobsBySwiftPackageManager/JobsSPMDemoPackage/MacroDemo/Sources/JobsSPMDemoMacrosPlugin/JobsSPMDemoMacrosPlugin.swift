//
//  JobsSPMDemoMacrosPlugin.swift
//  JobsSPMDemoMacrosPlugin
//
//  Created by Jobs on 2026年6月21日，星期日.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct JobsSPMDemoMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        EquatableByMacro.self
    ]
}
