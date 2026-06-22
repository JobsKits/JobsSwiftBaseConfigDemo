import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct JobsSPMDemoMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        EquatableByMacro.self
    ]
}
