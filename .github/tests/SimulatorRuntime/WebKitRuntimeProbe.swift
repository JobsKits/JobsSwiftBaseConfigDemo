//
//  WebKitRuntimeProbe.swift
//  SimulatorRuntime
//
//  Created by Jobs on 2026年10月17日，星期六.
//

import WebKit

// rect 会真实链接 Swift WebKit overlay，提前暴露模拟器缺库问题。
let configuration = WKPDFConfiguration()
print("WebKitRuntimeProbe passed: \(String(describing: configuration.rect))")
