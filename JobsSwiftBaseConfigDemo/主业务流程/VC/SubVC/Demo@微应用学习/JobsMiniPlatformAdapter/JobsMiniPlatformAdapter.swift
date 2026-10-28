//
//  JobsMiniPlatformAdapter.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import Foundation

/// mPaaS = mobile Platform as a Service，把容器、鉴权、网关、发布等通用能力集中供多个业务接入。
/// 宿主依赖能力协议，替换商业 SDK 时只更换适配器；界面不直接依赖厂商全局单例。
protocol JobsMiniPlatformAdapter: AnyObject {

    var currentUser: String? { get }
    func login()
    func logout()
    func packageDescription() throws -> String
    func validateOpen(appID: String) throws
}
