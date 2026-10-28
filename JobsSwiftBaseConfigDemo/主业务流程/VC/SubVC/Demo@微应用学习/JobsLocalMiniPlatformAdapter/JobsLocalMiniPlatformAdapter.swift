//
//  JobsLocalMiniPlatformAdapter.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年10月19日，星期一.
//

import Foundation

/// 本地教学适配器：完成注册目录、会话门禁和容器路由；没有连接商业 mPaaS 或它的发布后台。
/// 商业接入顺序：控制台建应用/.config → 官方 CocoaPods mPaaS 基线/TinyApp → 初始化容器 → 发布 appId/包 → 路由。
/// 生产替换点为此协议实现；还需服务端鉴权、离线包签名验证/灰度/回滚、日志脱敏及上架审核。
/// 来源：https://help.aliyun.com/zh/document_detail/106682.html
/// 来源：https://help.aliyun.com/zh/document_detail/170125.html
final class JobsLocalMiniPlatformAdapter: JobsMiniPlatformAdapter {

    private(set) var currentUser: String?
    private let registeredAppID = "jobs.learning.microapp"

    func login() {
        currentUser = "learning-user"
    }

    func logout() {
        currentUser = nil
    }

    func packageDescription() throws -> String {
        guard let url = JobsMicroAppLabBaseVC.resourceURL("microapp.html"),
              FileManager.default.fileExists(atPath: url.path) else {
            throw PlatformError.missingPackage
        }
        let size = try Data(contentsOf: url).count
        return "appId: \(registeredAppID)\n版本: 1.0.0\n入口: microapp.html\n包大小: \(size) bytes\n发布来源: App 内置资源（未接云端发布）"
    }

    func validateOpen(appID: String) throws {
        guard currentUser != nil else {
            throw PlatformError.loginRequired
        }
        guard appID == registeredAppID else {
            throw PlatformError.unregisteredApp
        }
        _ = try packageDescription()
    }

    enum PlatformError: LocalizedError {

        case loginRequired
        case unregisteredApp
        case missingPackage

        var errorDescription: String? {
            switch self {
            /// 容器路由前校验宿主身份
            case .loginRequired:
                return "已拒绝打开：请先登录教学账号。"
            /// 注册目录之外的 appId 不允许路由
            case .unregisteredApp:
                return "已拒绝打开：appId 未注册。"
            /// 资源缺失时不创建空白容器
            case .missingPackage:
                return "离线包缺失，请重新构建主 App。"
            }
        }
    }
}
