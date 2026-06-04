//
//  Package.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "MyMacros",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "MyMacros", targets: ["MyMacros"]),
        .executable(name: "MyMacrosClient", targets: ["MyMacrosClient"]),
    ],
    dependencies: [
        // ✅ 本地管理 swift-syntax（和 MyMacros 同级目录）
        .package(path: "../swift-syntax")
        // 网络管理 swift-syntax 有些时候可能拉不下来
        //.package(url: "https://github.com/swiftlang/swift-syntax", exact: "509.0.2")
    ],
    targets: [
        .target(
            name: "MyMacros",
            dependencies: ["MyMacrosMacros"]
        ),
        .macro(
            name: "MyMacrosMacros",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        .executableTarget(
            name: "MyMacrosClient",
            dependencies: ["MyMacros"]
        ),
        .testTarget(
            name: "MyMacrosTests",
            dependencies: ["MyMacros"],
            path: "Tests/MyMacrosTests"
        ),
    ]
)
