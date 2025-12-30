//
//  SceneDelegate.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2025/6/4.
//

#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

import LiveChat

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        LiveChat.windowScene = windowScene
        self.window = UIWindow(windowScene: windowScene)
            .byRootViewController(JobsSideDrawerVC(
                menuVC: JobsMeCenterVC().jobsNav.jobsNavContainer,
                mainVC: RootListVC().jobsNav.jobsNavContainer,
                menuWidth: JobsSideDrawerVC.defaultMenuWidth // 右移距离
            ))
            .byMakeKeyAndVisible()
    }
    // ================================== CrashLog: Safe Exit Marker ==================================
    func sceneDidBecomeActive(_ scene: UIScene) {
        // 回到前台，标记“正在运行中”
        CrashLogCenter.shared.markAppLaunched()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 进入后台算安全点
        CrashLogCenter.shared.markSafeExitPoint()
    }
}
