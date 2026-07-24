// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "JobsSPMDemoPackage",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15)
    ],
    products: [
        .library(name: "JobsSPMDemoKit", targets: ["JobsSPMDemoKit"])
    ],
    targets: [
        .target(
            name: "JobsSPMDemoKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "JobsSPMDemoKitTests",
            dependencies: ["JobsSPMDemoKit"]
        )
    ]
)
