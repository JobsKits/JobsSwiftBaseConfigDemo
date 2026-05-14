//
//  YTKNetworkConfig.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif
import YTKNetwork
/// Demo 用：如果项目里已经在 AppDelegate 配过，就不用这个
func setupYTKNetworkBaseURL() {
    /// 使用公共测试 API： https://httpbin.org
    /// - GET /ip         => 返回 IP
    /// - GET /headers    => 返回请求头
    /// - POST /post      => 回显 JSON/MultiPart
    YTKNetworkConfig.shared().baseUrl = "https://httpbin.org"
}
