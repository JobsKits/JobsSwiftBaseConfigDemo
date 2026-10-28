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
import ImageIO
import JobsByUIKit
import JobsSwiftDSL
import JobsBy3rdTools
import JobsSwiftTools
import JobsSwiftSplash
import JobsSwiftOpen
import LiveChat
import JobsViewPush

#if canImport(Flutter)
import Flutter
#endif

class SceneDelegate: UIResponder,
                     UIWindowSceneDelegate {

    var window: UIWindow?

    #if canImport(Flutter)
    /// 每个 Scene 独立持有转发器，FlutterViewController 入窗后自动关联其引擎。
    lazy var sceneLifeCycleDelegate: FlutterPluginSceneLifeCycleDelegate = {
        #if DEBUG
        debugDidCreateFlutterSceneDelegate = true
        #endif
        return FlutterPluginSceneLifeCycleDelegate()
    }()
    #endif

    #if DEBUG
    private(set) var debugDidCreateFlutterSceneDelegate = false
    #endif

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            if let blockedViewController = JobsDeviceLaunchGate.shared.makeBlockedViewController() {
                window = UIWindow.jobsMake(scene: windowScene,
                                           root: blockedViewController)
                print("[JobsDeviceLaunchGate] Scene已展示拦截页：\(session.persistentIdentifier)")
            }
            return
        }
        print("✅ SceneDelegate willConnect")
        let restorationActivity = JobsSceneCoordinator.demoActivity(from: connectionOptions,
                                                                    session: session)
        let opensSceneDemo = restorationActivity != nil
        let learningDemo = JobsMicroAppLabRoute.debugLaunchController()
        let homeViewController: UIViewController
        if let learningDemo {
            homeViewController = learningDemo.jobsNav.jobsNavContainer
        } else if let restorationActivity {
            homeViewController = JobsSceneDelegateDemoVC(restorationActivity: restorationActivity)
                .jobsNav
                .jobsNavContainer
        } else {
            homeViewController = RootListPreferences.makeAppRootViewController()
        }
        window = UIWindow.jobsMake(scene: windowScene,
                                   root: homeViewController)
        #if canImport(Flutter)
        sceneLifeCycleDelegate.scene(scene,
                                     willConnectTo: session,
                                     options: connectionOptions)
        #endif
        JobsSceneCoordinator.record("willConnect：创建独立 UIWindow",
                                    for: session)
        guard !opensSceneDemo, learningDemo == nil else {
            return
        }
        JobsSplashMediaCache.shared.resumePendingVideoPreloads()
        guard JobsSplashPreferences.isEnabledForNextLaunch else {
            return
        }
        let openConfiguration = JobsOpenConfiguration()
            .byURL(URL(string: "http://www.baidu.com")!)
            .byMode(.inApp)
            .byTitle("开屏详情".tr)
            .byAnimated(true)
            .byCompletion { success in
                print("开屏链接打开结果：\(success)")
            }
        JobsSplashPresenter.show(over: homeViewController,
                                 configuration: JobsSplashConfiguration(
                content: splashContentForNextLaunch()
            )
                                     .byCountdownSeconds(5)
                                     .byLanguage(.system)
            //            .byLanguage(.code("zh-Hans"))
            .bySkipButtonVisible(true)
            //            .bySkipButtonFrame(CGRect(x: 20, y: 60, width: 80, height: 36))
            .bySkipButtonInsets(UIEdgeInsets(top: 12,
                                             left: 16,
                                             bottom: 12,
                                             right: 16))
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
            })
    }

    private func splashContentForNextLaunch() -> JobsSplashContent {
        switch JobsSplashPreferences.contentTypeForNextLaunch {
        /// 使用本地静态图片开屏
        case .localImage:
            return .localImage(name: "米老鼠")
        /// 使用现有图片资源生成本地 GIF 开屏
        case .localGIF:
            guard let fileURL = generatedLocalSplashGIFURL() else {
                print("⚠️ 本地 GIF 生成失败，开屏回退到本地图片")
                return .localImage(name: "米老鼠")
            }
            return .localGIF(fileURL: fileURL)
        /// 使用远程图片开屏
        case .remoteImage:
            guard let url = URL(string: "https://picsum.photos/1242/2688.jpg") else {
                return .localImage(name: "米老鼠")
            }
            return .remoteImage(url)
        /// 使用 App Bundle 内的视频开屏
        case .localVideo:
            return .localVideo(name: "welcome_video",
                               fileExtension: "mp4")
        /// 使用远程视频开屏
        case .remoteVideo:
            guard let url = URL(
                string: "https://raw.githubusercontent.com/JobsKits/JobsSwiftBaseConfigDemo/main/JobsSwiftBaseConfigDemo/Resources/%E8%A7%86%E9%A2%91/welcome_video.mp4"
            ) else {
                return .localVideo(name: "welcome_video",
                                   fileExtension: "mp4")
            }
            return .remoteVideo(url,
                                fallbackName: "welcome_video",
                                fallbackFileExtension: "mp4")
        }
    }

    private func generatedLocalSplashGIFURL() -> URL? {
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("JobsSplashLocalGIF.gif")
        if FileManager.default.fileExists(atPath: fileURL.path) {
            return fileURL
        }
        let frames = ["米老鼠".img, "唐老鸭".img, "迪斯尼".img].compactMap(\.cgImage)
        guard frames.count > 1,
              let destination = CGImageDestinationCreateWithURL(fileURL as CFURL,
                                                                "com.compuserve.gif" as CFString,
                                                                frames.count,
                                                                nil) else {
            return nil
        }
        let gifProperties = [
            kCGImagePropertyGIFDictionary: [
                    kCGImagePropertyGIFLoopCount: 0
                ]
        ] as CFDictionary
        let frameProperties = [
            kCGImagePropertyGIFDictionary: [
                    kCGImagePropertyGIFDelayTime: 0.8
                ]
        ] as CFDictionary
        CGImageDestinationSetProperties(destination,
                                        gifProperties)
        frames.forEach {
            CGImageDestinationAddImage(destination,
                                       $0,
                                       frameProperties)
        }
        guard CGImageDestinationFinalize(destination) else {
            try? FileManager.default.removeItem(at: fileURL)
            return nil
        }
        return fileURL
    }
    // ================================== CrashLog: Safe Exit Marker ==================================
    func sceneDidDisconnect(_ scene: UIScene) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            window = nil
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.sceneDidDisconnect(scene)
        #endif
        JobsSceneCoordinator.record("didDisconnect：Scene 与会话暂时断开",
                                    for: scene.session)
        if LiveChat.windowScene === scene {
            LiveChat.windowScene = nil
        }
        markSafeExitIfAllScenesAreBackground(excluding: scene)
        window = nil
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.sceneDidBecomeActive(scene)
        #endif
        LiveChat.windowScene = scene as? UIWindowScene
        JobsSceneCoordinator.record("didBecomeActive：开始接收用户事件",
                                    for: scene.session)
        // 回到前台，标记“正在运行中”
        CrashLogCenter.shared.markAppLaunched()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.sceneWillResignActive(scene)
        #endif
        JobsSceneCoordinator.record("willResignActive：即将暂停交互",
                                    for: scene.session)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.sceneWillEnterForeground(scene)
        #endif
        CrashLogCenter.shared.markAppLaunched()
        JobsSceneCoordinator.record("willEnterForeground：即将进入前台",
                                    for: scene.session)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.sceneDidEnterBackground(scene)
        #endif
        JobsSceneCoordinator.record("didEnterBackground：当前 Scene 进入后台",
                                    for: scene.session)
        markSafeExitIfAllScenesAreBackground(excluding: scene)
    }

    func scene(_ scene: UIScene,
               openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.scene(scene,
                                     openURLContexts: URLContexts)
        #endif
    }

    func scene(_ scene: UIScene,
               continue userActivity: NSUserActivity) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        if JobsSceneCoordinator.isDemoActivity(userActivity) {
            if let demoViewController = sceneDemoViewController() {
                demoViewController.restoreSceneInteractionState(with: userActivity)
            } else {
                window?.byRootViewController(
                    JobsSceneDelegateDemoVC(restorationActivity: userActivity)
                        .jobsNav
                        .jobsNavContainer
                )
            }
            JobsSceneCoordinator.record("continueUserActivity：接收 Scene Demo 活动",
                                        for: scene.session)
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.scene(scene,
                                     continue: userActivity)
        #endif
    }

    func windowScene(_ windowScene: UIWindowScene,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            completionHandler(false)
            return
        }
        #if canImport(Flutter)
        sceneLifeCycleDelegate.windowScene(windowScene,
                                           performActionFor: shortcutItem,
                                           completionHandler: completionHandler)
        #else
        completionHandler(false)
        #endif
    }

    private func markSafeExitIfAllScenesAreBackground(excluding scene: UIScene) {
        let hasForegroundScene = UIApplication.shared.connectedScenes.contains {
            $0 !== scene && ($0.activationState == .foregroundActive || $0.activationState == .foregroundInactive)
        }
        guard !hasForegroundScene else {
            return
        }
        CrashLogCenter.shared.markSafeExitPoint()
    }

    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return nil
        }
        guard let demoViewController = sceneDemoViewController() else {
            return scene.userActivity.flatMap {
                JobsSceneCoordinator.isDemoActivity($0) ? $0 : nil
            }
        }
        return demoViewController.sceneRestorationActivity()
    }

    func scene(_ scene: UIScene,
               restoreInteractionStateWith stateRestorationActivity: NSUserActivity) {
        guard JobsDeviceLaunchGate.shared.allowsBusinessInitialization else {
            return
        }
        guard JobsSceneCoordinator.isDemoActivity(stateRestorationActivity) else {
            return
        }
        sceneDemoViewController()?.restoreSceneInteractionState(with: stateRestorationActivity)
        JobsSceneCoordinator.record("restoreInteractionState：恢复 Scene 独立计数",
                                    for: scene.session)
    }

    private func sceneDemoViewController() -> JobsSceneDelegateDemoVC? {
        var currentViewController = window?.rootViewController
        var keepsFinding = true
        while let viewController = currentViewController, keepsFinding {
            if let presentedViewController = viewController.presentedViewController {
                currentViewController = presentedViewController
            } else if let navigationController = viewController as? UINavigationController {
                currentViewController = navigationController.visibleViewController
            } else if let tabBarController = viewController as? UITabBarController {
                currentViewController = tabBarController.selectedViewController
            } else {
                keepsFinding = false
            }
        }
        return currentViewController as? JobsSceneDelegateDemoVC
    }
}

#if canImport(Flutter)
extension SceneDelegate: FlutterSceneLifeCycleProvider {}
#endif
