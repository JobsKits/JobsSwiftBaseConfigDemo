//
//  WebKitRuntimeProbe.swift
//  SimulatorRuntime
//
//  Created by Jobs on 2026年10月17日，星期六.
//

import WebKit

/// 在 CI 正式构建前访问 WKPDFConfiguration.rect，真实链接 Swift WebKit overlay，提前检查模拟器运行时是否缺库。
/// 由 build_simulator_app.yml 编译成模拟器命令行探针，再通过 simctl spawn 在所选模拟器运行。
/// 这是工具链环境检查，不是页面功能测试；本文件含顶层执行代码，不加入主 App 或 XCTest target。
let configuration = WKPDFConfiguration()
print("WebKitRuntimeProbe passed: \(String(describing: configuration.rect))")
