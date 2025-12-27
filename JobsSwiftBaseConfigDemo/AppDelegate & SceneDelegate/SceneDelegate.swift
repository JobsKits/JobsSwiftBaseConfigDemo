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
                menuVC: JobsMeCenterVC(),
                mainVC: RootListVC().jobsNav.jobsNavContainer,
                menuWidth: JobsSideDrawerVC.defaultMenuWidth // 右移距离
            ))
            .byMakeKeyAndVisible()
    }
}
