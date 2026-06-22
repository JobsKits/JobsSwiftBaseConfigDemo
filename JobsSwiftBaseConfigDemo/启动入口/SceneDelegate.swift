//
//  SceneDelegate.swift
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

import AVFoundation
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsSwiftTools
import JobsSwiftSplash
import JobsSwiftOpen
import LiveChat

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        print("✅ SceneDelegate willConnect")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        LiveChat.windowScene = windowScene
        let homeViewController = JobsSideDrawerVC(
                menuVC: JobsMeCenterVC().jobsNav.jobsNavContainer,
                mainVC: RootListVC().jobsNav.jobsNavContainer,
                menuWidth: JobsSideDrawerVC.defaultMenuWidth // 右移距离
            )
        self.window = UIWindow(windowScene: windowScene)
            .byRootViewController(homeViewController)
            .byMakeKeyAndVisible()
        guard JobsSplashPreferences.isEnabledForNextLaunch else { return }

        let openConfiguration = JobsOpenConfiguration()
            .byURL(URL(string: "http://www.baidu.com")!)
            .byMode(.inApp)
            .byTitle("开屏详情")
            .byAnimated(true)
            .byCompletion { success in
                print("开屏链接打开结果：\(success)")
            }

        JobsSplashPresenter.show(
            over: homeViewController,
            configuration: JobsSplashConfiguration(
                content: .localImage(name: "米老鼠")
    //            content: .localGIF(name: "本地 GIF 资源名")
    //            content: .remoteImage(URL(string: "https://example.com/splash.jpg")!)
    //            content: .localVideo(name: "本地视频资源名", fileExtension: "mp4")
    //            content: .remoteVideo(URL(string: "https://example.com/splash.mp4")!)
            )
                .byCountdownSeconds(5)
                .byLanguage(.system)
    //            .byLanguage(.code("zh-Hans"))
                .bySkipButtonVisible(true)
    //            .bySkipButtonFrame(CGRect(x: 20, y: 60, width: 80, height: 36))
                .bySkipButtonInsets(UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16))
                .byContentMode(.scaleAspectFill)
                .byVideoGravity(.resizeAspectFill)
                .byTapAction(.open(openConfiguration))
    //            .byTapAction(.custom { splashVC in
    //                print("点击开屏：\(splashVC)")
    //            })
                .byShakeAction(.open(openConfiguration))
    //            .byShakeAction(.none)
                .bySkip { splashVC in
                    print("开屏已结束：\(splashVC)")
                }
        )
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
