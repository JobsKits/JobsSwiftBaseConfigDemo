//
//  UIWindow.swift
//  JobsByUIKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import JobsSwiftBaseDefines

extension UIWindow {

    /// 优先查询真实窗口；现代系统尚无 Scene 时明确返回空。
    public static var wd: UIWindow? {
        if let real = UIApplication.jobsKeyWindow() {
            return real
        }
        if #available(iOS 26.0, tvOS 26.0, *) {
            return nil
        } else {
            return legacyWindow().byWindowLevel(.alert + 1)
        }
    }
    /// 实例访问也保持一致
    public var wd: UIWindow {
        self
    }
    // ================================== 跨版本入口：iOS 12+ 可编译 ==================================
    @discardableResult
    public static func jobsMake(root: UIViewController? = nil,
                                level: UIWindow.Level = .normal,
                                makeKeyVisible: Bool = true) -> UIWindow? {
        // iOS 13+ 走 scene 路径；iOS 12- 走 frame 路径
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes.compactMap {
                $0 as? UIWindowScene
            }
            let scene = scenes.first {
                $0.activationState == .foregroundActive
            } ?? scenes.first
            if let scene {
                return jobsMake(scene: scene,
                                 root: root,
                                 level: level,
                                 makeKeyVisible: makeKeyVisible)
            }
        }
        if #available(iOS 26.0, tvOS 26.0, *) {
            return nil
        } else {
            return legacyWindow()
                .byRootViewController(root)
                .byWindowLevel(level)
                ._makeIfNeeded(makeKeyVisible)
        }
    }

    /// 显式 Scene 入口保证成功构造，不跨窗口猜测业务归属。
    @available(iOS 13.0, tvOS 13.0, *)
    @discardableResult
    public static func jobsMake(scene: UIWindowScene,
                                root: UIViewController? = nil,
                                level: UIWindow.Level = .normal,
                                makeKeyVisible: Bool = true) -> UIWindow {
        return UIWindow(windowScene: scene)
            .byRootViewController(root)
            .byWindowLevel(level)
            ._makeIfNeeded(makeKeyVisible)
    }

    @available(iOS, introduced: 2.0, deprecated: 26.0)
    @available(tvOS, introduced: 9.0, deprecated: 26.0)
    private static func legacyWindow() -> UIWindow {
        return UIWindow(frame: JobsDisplay.bounds())
    }
    // 顶层 VC（跨 UINavigationController / UITabBarController / presented 链）
    public static func jobsTopMost(from base: UIViewController?) -> UIViewController? {
        guard let base else {
            return nil
        }
        if let nav = base as? UINavigationController {
            return jobsTopMost(from: nav.visibleViewController ?? nav.topViewController)
        }
        if let tab = base as? UITabBarController {
            return jobsTopMost(from: tab.selectedViewController)
        }
        if let presented = base.presentedViewController {
            return jobsTopMost(from: presented)
        }
        return base
    }
    // 私有小工具：是否 makeKeyAndVisible
    @discardableResult
    private func _makeIfNeeded(_ flag: Bool) -> Self {
        if flag {
            self.makeKeyAndVisible()
        }
        return self
    }
}
