// swift-tools-version: 6.0

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "JobsSPMDemoPackage",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15)
    ],
    products: [
        .library(name: "JobsSPMDemoKit", targets: ["JobsSPMDemoKit"]),
        .library(name: "JobsSPMDemoMacros", targets: ["JobsSPMDemoMacros"]),
        .executable(name: "JobsSPMDemoClient", targets: ["JobsSPMDemoClient"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/swiftlang/swift-syntax.git",
            exact: "603.0.2"
        )
    ],
    targets: [
        .target(
            name: "JobsSPMDemoKit",
            resources: [.process("Resources")]
        ),
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
            dependencies: ["JobsSPMDemoKit", "JobsSPMDemoMacros"]
        ),
        .testTarget(
            name: "JobsSPMDemoTests",
            dependencies: ["JobsSPMDemoKit", "JobsSPMDemoMacros"]
        )
    ]
)
