//
//  JobsMicroAppLabRoute.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import UIKit

enum JobsMicroAppLabRoute {

    /// 仅 Debug 验证使用：-JobsMicroAppDemo microapp/session/mpaas/sandbox/pwa，不改变正常 App 入口。
    static func debugLaunchController() -> UIViewController? {
        #if DEBUG
        let arguments = ProcessInfo.processInfo.arguments
        guard let index = arguments.firstIndex(of: "-JobsMicroAppDemo"),
              arguments.indices.contains(index + 1) else {
            return nil
        }
        switch arguments[index + 1] {
        /// 进入白名单 Bridge 页面
        case "microapp":
            return JobsMicroApplicationDemoVC()
        /// 进入双账号会话页面
        case "session":
            return JobsMultiSessionDemoVC()
        /// 进入平台适配页面
        case "mpaas":
            return JobsMPaaSDemoVC()
        /// 进入沙箱读写页面
        case "sandbox":
            return JobsSandboxDemoVC()
        /// 进入离线资源页面
        case "pwa":
            return JobsPWADemoVC()
        /// 未识别参数沿用原入口
        default:
            return nil
        }
        #else
        return nil
        #endif
    }
}
