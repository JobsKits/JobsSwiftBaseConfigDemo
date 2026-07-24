// swift-tools-version: 6.0

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "JobsSPMDemoMacroPackage",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(name: "JobsSPMDemoMacros", targets: ["JobsSPMDemoMacros"]),
        .executable(name: "JobsSPMDemoClient", targets: ["JobsSPMDemoClient"])
    ],
    dependencies: [
        .package(path: ".."),
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            exact: "603.0.2"
        )
    ],
    targets: [
        .target(
            name: "JobsSPMDemoMacros",
            dependencies: ["JobsSPMDemoMacrosPlugin"]
        ),
        .macro(
            name: "JobsSPMDemoMacrosPlugin",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .executableTarget(
            name: "JobsSPMDemoClient",
            dependencies: [
                .product(name: "JobsSPMDemoKit", package: "JobsSPMDemoPackage"),
                "JobsSPMDemoMacros"
            ]
        ),
        .testTarget(
            name: "JobsSPMDemoMacroTests",
            dependencies: ["JobsSPMDemoMacros"]
        )
    ]
)
